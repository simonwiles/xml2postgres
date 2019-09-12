#!/usr/bin/env python3

""" xml2postgres.py

    An XML to SQL query parser, designed to convert XML files into psql files that can be
    executed against a PostgreSQL database.

    Inspired by https://github.com/cns-iu/generic_parser
"""

import argparse
import csv
import datetime
import logging
import os
from collections import defaultdict
from pathlib import Path

from lxml import etree


class Parser:
    def __init__(self, args):

        # These dictionaries are populated by Parser.read_config()
        self.table_dict = {}
        self.value_dict = {}
        self.ctr_dict = {}
        self.attrib_dict = {}
        self.attrib_defaults = defaultdict(dict)
        self.file_number_dict = {}
        self.fields = defaultdict(list)

        self.tables = {}
        self.current_output_path = None
        self.master_psql_fh = None
        self.master_win_psql_fh = None

        self.xml_files = Path(args.xml_source)

        if self.xml_files.is_file():
            self.xml_files = [self.xml_files]
        elif self.xml_files.is_dir():
            self.xml_files = self.xml_files.glob(
                f'{"**/" if args.recurse else ""}*.xml'
            )
        else:
            logging.fatal("specified input is invalid")
            exit(1)

        self.output_dir = Path(args.output)

        self.namespace = args.namespace

        # root tag can be empty, but rec and id need to be present
        self.container_tag = args.container_tag
        self.record_tag = f"{self.namespace}{args.record_tag}"
        self.id_tag = f"{self.namespace}{args.identifier}"

        # convert the file number sheet to a dictionary for speedy lookup
        if args.file_number_sheet is not None:
            logging.info(f"Parsing file numbers from {args.file_number_sheet}")
            # convert this into a dictionary
            with open(args.file_number_sheet, "r") as _fh:
                self.file_number_lookup = dict(csv.reader(_fh))
        else:
            self.file_number_lookup = False

        # STEP 2 - Convert the config file into lookup tables
        # write lookup tables for table creation, counters, value and
        #  attribute parsing
        self.read_config(args.config_file)

    def parse(self):
        """ Open file handles for master `.psql` files and begin to process XML files. """

        master_psql_path = self.output_dir.joinpath("load_all.psql")
        master_win_psql_path = self.output_dir.joinpath("load_all_win.psql")

        self.master_psql_fh = open(master_psql_path, "w")
        self.master_psql_fh.write("BEGIN;\n")

        self.master_win_psql_fh = open(master_win_psql_path, "w")
        self.master_win_psql_fh.write('SET client_encoding TO "UTF-8";\n')
        self.master_win_psql_fh.write("BEGIN;\n")

        for filepath in self.xml_files:
            self.parse_file(filepath)

        self.master_psql_fh.write("COMMIT;")
        self.master_psql_fh.close()

        self.master_win_psql_fh.write("COMMIT;")
        self.master_win_psql_fh.close()

        logging.info(
            f"Execute (e.g.): psql -d <db_name> -f [{master_psql_path}|{master_win_psql_path}]"
        )

    def parse_file(self, filepath):

        logging.info(f"Parsing file: {filepath}")

        self.current_output_path = self.output_dir / filepath.stem
        self.current_output_path.mkdir(parents=True, exist_ok=True)
        logging.info(f"Writing files to: {self.current_output_path}")

        logging.info(f"Start time: {datetime.datetime.now()}")

        parser_args = {
            "remove_comments": True,
            "recover": True,
            "events": ("start", "end"),
        }

        if self.container_tag is None:
            # if there is no root tag, process everything
            process = True
            parser_args["tag"] = self.record_tag
        else:
            # we need to split this into a list of tags by "/".
            root_path = [f"{self.namespace}{s}" for s in self.container_tag.split("/")]
            process = False

        parser = etree.iterparse(str(filepath.absolute()), **parser_args)

        path_note = []
        for event, node in parser:
            # Here we keep an eye on our path.
            # If we have a root path defined, then we build a path as we go
            # If we are opening a tag that matches the root path, then we set processing to true
            # If we close a tag that matches the root path, then we set processing to false

            # if there is no root path, then we set process to true earlier and just leave it that way
            if self.container_tag is not None:
                if event == "start":
                    # add the new element to the current path
                    path_note.append(node.tag)
                    # if the path matches the root path, then we have reached
                    #  an area of interest, set processing to true
                    if path_note == root_path:
                        process = True
                elif event == "end":
                    # if the path equals the root path, then we are leaving an
                    #  area of interest, set processing to false
                    if path_note == root_path:
                        process = False
                    # remove the last element from the current path
                    path_note.pop()

            # iteratively parse through the XML, focusing on the tag that
            #  starts a record
            # pass over things outside the processing area. Only process end
            #  tags.
            if event == "end" and process is True:
                if node.tag == self.record_tag:

                    # you've got a record, now parse it
                    path = self.record_tag

                    # get the core table name from the lookup
                    main_table_name = self.table_dict[path]

                    # open a record on the core table
                    main_record = self.get_record(main_table_name)

                    # get the primary key
                    # the head tag may be the identifier, if so, just grab it,
                    #  otherwise, seek it out

                    if self.id_tag != self.record_tag:
                        id_seek = self.id_tag
                        id_node = node.find(id_seek)
                        id_value = id_node.text
                    else:
                        id_value = node.text

                    # set the primary key
                    main_record.add_identifier("id", id_value)

                    self.write_columns(node, path)

                    # process the children
                    for child in node:
                        self.parse_node(child, path, main_record)

                    main_record.close_record()
                    node.clear()

        psql_path = self.current_output_path.joinpath(f"{filepath.stem}.psql")
        with open(psql_path, "w") as _fh:
            _fh.write("BEGIN;\n")

            for table_name, table in self.tables.items():
                _fh.write(f"\\ir {table_name}.sql\n")
                relative_path = self.current_output_path.relative_to(self.output_dir)
                self.master_psql_fh.write(
                    f"\\ir {relative_path.joinpath(table_name)}.sql\n"
                )
                self.master_win_psql_fh.write(
                    f"\\ir {relative_path}/{table_name}.sql\n"
                )
                table.close_file()

            _fh.write("COMMIT;")
            self.tables = {}

        logging.info(f"End time: {datetime.datetime.now()}")
        logging.info(f"Execute (e.g.): psql -d <db_name> -f {psql_path}")

    def write_columns(self, node, path=None, record=None):
        if self.file_number_lookup:
            file_number_name = self.file_number_dict.get(path, False)
            if file_number_name:
                file_number = self.file_number_lookup.get(filepath.name, -1)
                table_name, col_name = file_number_name.split(":", 1)
                self.get_record(table_name, path, record).add_col(col_name, file_number)

        # process attributes
        attrib_seen = set()
        for attrib_name, attrib_value in node.attrib.items():
            attribpath = f"{path}/{attrib_name}"
            if attribpath in self.attrib_dict:
                table_name, col_name = self.attrib_dict[attribpath].split(":")[:2]
                self.get_record(table_name, path, record).add_value(
                    col_name, str(attrib_value)
                )
                attrib_seen.add(attrib_name)

        # process default attribute values
        for attrib_name, attrib_value_all in self.attrib_defaults.get(path, {}).items():
            if attrib_name not in attrib_seen:
                table_name, col_name, attrib_value = attrib_value_all.split(":")[:3]
                self.get_record(table_name, path, record).add_value(
                    col_name, str(attrib_value)
                )

        # process value
        if path in self.value_dict:
            if node.text is not None:
                table_name, col_name = self.value_dict[path].split(":", 1)
                self.get_record(table_name, path, record).add_value(
                    col_name, str(node.text)
                )

    def parse_node(self, node, parent_path, parent_record):
        # recursive node parser
        # given a node in a tree known not to be the record tag, parse it and
        #  its children

        # first, update the path from parent, for use in lookups
        if node.tag.find("}") > -1:
            tag = node.tag.split("}", 1)[1]
        else:
            tag = node.tag

        path = f"{parent_path}/{tag}"

        # see if we need a new table, make sure children inherit the right parent
        # See if this tag requires a new table
        if path in self.table_dict:
            creating_record = True
            table_name = self.table_dict[path]
            record = self.get_record(table_name, path, parent_record)
        else:
            creating_record = False
            record = parent_record

        self.write_columns(node, path, record)

        # process children
        for child in node:
            self.parse_node(child, path, record)

        # if we created a new table for this tag, now it's time to close it.
        if creating_record is True:
            record.close_record()

    def read_config(self, config_file):
        def update_lookup_tables(node, path):

            # This recursive function will go through the config file, reading
            #  each tag and attribute and create the needed lookup tables
            # All tags and attributes are recorded by full path, so name
            #  reusage shouldn't be a problem

            # write the value lookup for the tag
            if node.text is not None:
                if str(node.text).strip() != "":
                    table, field = node.text.split(":")
                    self.fields[table].append(field)
                    self.value_dict[path] = node.text

            # go through the attributes in the config file
            # specialized ones like table and ctr_id go into their own lookups,
            #  the rest go into the attribute lookup
            for attrib_name, attrib_value_all in node.attrib.items():
                attrib_value = ":".join(attrib_value_all.split(":")[:2])

                attrib_path = f"{path}/{attrib_name}"
                if attrib_name == "table":
                    self.table_dict[path] = attrib_value
                elif attrib_name == "ctr_id":
                    table, field = attrib_value.split(":")
                    self.fields[table].append(field)
                    self.ctr_dict[path] = attrib_value
                elif attrib_name == "file_number":
                    table, field = attrib_value.split(":")
                    self.fields[table].append(field)
                    self.file_number_dict[path] = attrib_value
                else:
                    table, field = attrib_value.split(":")
                    self.fields[table].append(field)
                    self.attrib_dict[attrib_path] = attrib_value
                    # Providing a third tuple item specifies the default value
                    #  for that attribute
                    # If the attribute isn't found in the data, use the default
                    #  value instead.
                    if len(attrib_value_all.split(":")) == 3:
                        self.attrib_defaults[path][attrib_name] = attrib_value_all

            # Now recurse for the children of the node
            for child in node:
                update_lookup_tables(child, f"{path}/{child.tag}")

        root = etree.parse(open(config_file)).getroot()
        path = f"{self.namespace}{root.tag}"
        update_lookup_tables(root, path)

    def get_record(self, table_name, table_path=None, parent_table=None):
        table = self.get_or_create_output_file(table_name, table_path, parent_table)
        if table.record_open:
            return table
        table.new_record()
        return table

    def get_or_create_output_file(self, table_name, table_path=None, parent_table=None):
        if table_name in self.tables:
            return self.tables[table_name]

        ctr_id = None
        if table_path is not None:
            _table, ctr_id = self.ctr_dict[table_path].split(":", 1)

        fields = self.fields[table_name]
        output_path = self.current_output_path.joinpath(f"{table_name}.sql")

        table = PostgresCopyFile(table_name, fields, output_path, ctr_id, parent_table)
        self.tables[table_name] = table
        return table


class OutputFile:
    """ This class handles a single output file -- it is intended to be subclassed with specific
         behaviours depending on the kind of file (output format) to be written.
        It has a name, a parent, columns and values.
        We have some specialized columns called identifiers. These start with the
         id, then add in the automated counters.
        The table also maintains a list of counters for its children. This allows the children to
         call back to the parent and ask for the next number in that counter.
    """

    def __init__(self, name, fields, output_path, ctr_id=None, parent_table=None):
        # initialization gets the parent
        # If there is a parent, the table first inherits the parent's identifiers
        # It then asks the parent for the next value in it's own identifier and adds
        #  that to the identifier list.

        self.name = name
        self.ctr_id = ctr_id
        self.parent_table = parent_table

        self.columns = {}
        self.identifiers = {}
        self.counters = defaultdict(int)

        self.record_open = False

        self.fields = ["id"]
        if self.parent_table is not None:
            self.fields.extend(
                [
                    field
                    for field in self.parent_table.identifiers.keys()
                    if field != "id"
                ]
            )
        self.fields.extend(fields)

        self._fh = open(output_path, "w", encoding="UTF-8")
        logging.debug(f"Opened {self._fh.name} for writing...")
        self.write_header()

    def write_header():
        raise NotImplementedError

    def write_footer():
        raise NotImplementedError

    def prep_db_value(self, value):
        raise NotImplementedError

    def write_values(self):
        raise NotImplementedError

    def add_identifier(self, col_name, col_value):
        self.identifiers[col_name] = col_value

    def add_value(self, col_name, col_value):
        # Simply adds a (col_name, col_value) pair to the list to be output
        self.columns[col_name] = col_value

    def new_record(self):
        # counters are unique per parent_id, so reset them here
        self.counters = defaultdict(int)

        if self.parent_table is not None:

            # copy identifiers from parent
            for (
                identifier_name,
                identifier_value,
            ) in self.parent_table.identifiers.items():
                self.add_identifier(identifier_name, identifier_value)

            # if this table needs a counter, add the next one off the rank
            if self.ctr_id is not None:
                self.add_identifier(
                    self.ctr_id, self.parent_table.get_counter(self.ctr_id)
                )

        self.record_open = True

    def get_counter(self, ctr_id):
        # This accepts a counter name and returns the next value for that counter
        # This would be invoked by a Table's children (see in __init__).
        # The parent Table will look for the name in the list of Counters
        #  if found, add 1 and report the [name, number]
        #  else, create a new Counter in the list and report [name, 1]
        self.counters[ctr_id] += 1
        return self.counters[ctr_id]

    def close_record(self):
        self.write_values()
        self.columns = {}
        self.identifiers = {}
        self.record_open = False

    def close_file(self):
        assert not self.columns and not self.identifiers
        self.write_footer()
        self._fh.close()


class PostgresCopyFile(OutputFile):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def write_header(self):
        header = ",".join(self.fields)
        self._fh.write(
            f"\\COPY {self.name} ({header}) FROM STDIN WITH (FORMAT CSV, DELIMITER E'\\t')\n"
        )

    def write_footer(self):
        self._fh.write("\\.\n")

    def prep_db_value(self, value):
        if value is None:
            return ""

        if not isinstance(value, str):
            return str(value)

        value = value.replace('"', '""').replace("\\", "\\\\").replace("\n", "")
        return f'"{value}"'

    def write_values(self):
        values = "\t".join(
            [
                self.prep_db_value(
                    self.identifiers.get(field, False) or self.columns.get(field, None)
                )
                for field in self.fields
            ]
        )
        self._fh.write(f"{values}\n")


class PostgresInsertsFile(OutputFile):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def write_header(self):
        col_list = ",".join([f'"{col_name}"' for col_name in self.fields])
        self._fh.write(f'INSERT INTO "{self.name}" ({col_list}) VALUES')

    def write_footer(self):
        self._fh.seek(self._fh.tell() - 1, os.SEEK_SET)
        self._fh.write(";\n")

    def prep_db_value(self, value):
        if value is None:
            return "NULL"

        if not isinstance(value, str):
            return str(value)

        value = value.replace("'", "''").replace("\\", "\\\\").replace("\n", "")
        return f"'{value}'"

    def write_values(self):
        values = [
            self.identifiers.get(field, False) or self.columns.get(field, None)
            for field in self.fields
        ]
        self._fh.write(
            f'\n\t({",".join([self.prep_db_value(value) for value in values])}),'
        )


def main():
    """ Command-line entry-point. """

    parser = argparse.ArgumentParser(description="Description: {}".format(__file__))

    parser.add_argument(
        "-v", "--verbose", action="store_true", default=False, help="Increase verbosity"
    )
    parser.add_argument(
        "-q", "--quiet", action="store_true", default=False, help="quiet operation"
    )

    # REQUIRED: input file or directory
    parser.add_argument(
        "-x", "--xml-source", action="store", required=True, help="parse a single file"
    )

    # REQUIRED: defines the configuration file mapping from XML to tabular format
    parser.add_argument(
        "-c", "--config-file", action="store", required=True, help="configuration file"
    )

    # REQUIRED: can be either a directory, or if a single-file run, a file name.
    parser.add_argument(
        "-o", "--output", action="store", required=True, help="output file or directory"
    )

    # OPTIONAL: the container tag for a collection of records (ignored for single record files)
    parser.add_argument(
        "--container-tag",
        action="store",
        help="Name of the container tag (tag containing the group of records",
    )

    # REQUIRED: the tag that defines an individual record
    parser.add_argument(
        "--record-tag",
        action="store",
        required=True,
        help="Name of the tag that defines a single record",
    )

    # OPTIONAL: XML namespace (assumes a single namespace for the entire file)
    parser.add_argument(
        "-n", "--namespace", action="store", help="Namespace of the XML file"
    )

    # REQUIRED: tag that contains the unique identifier for the record. If
    #  this is a direct child of the record root, just give the child name,
    #  otherwise, starting at that level, give the path.
    parser.add_argument(
        "-i",
        "--identifier",
        action="store",
        required=True,
        help="Name of the tag whose value contains the unique identifier for the record",
    )

    parser.add_argument(
        "--file-number-sheet",
        action="store",
        help="CSV file with the file name to file number lookup",
    )

    parser.add_argument(
        "-r",
        "--recurse",
        action="store_true",
        help="If true, the parser will search subdirectories for XML files to parse",
    )

    args = parser.parse_args()

    log_level = logging.DEBUG if args.verbose else logging.INFO
    log_level = logging.CRITICAL if args.quiet else log_level
    logging.basicConfig(level=log_level, format="%(message)s")

    parser = Parser(args)
    parser.parse()


if __name__ == "__main__":
    main()
