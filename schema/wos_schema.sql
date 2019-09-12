DROP TABLE IF EXISTS wos_dynamic_identifiers;
DROP TABLE IF EXISTS wos_contributor_email_addr;
DROP TABLE IF EXISTS wos_contributors;
DROP TABLE IF EXISTS wos_chapters;
DROP TABLE IF EXISTS wos_book_desc;
DROP TABLE IF EXISTS wos_book_notes;
DROP TABLE IF EXISTS wos_keywords_plus;
DROP TABLE IF EXISTS wos_reprint_address_dois;
DROP TABLE IF EXISTS wos_reprint_address_names_email_addr;
DROP TABLE IF EXISTS wos_reprint_address_names;
DROP TABLE IF EXISTS wos_reprint_address_email_addr;
DROP TABLE IF EXISTS wos_reprint_address_zip;
DROP TABLE IF EXISTS wos_reprint_address_organizations;
DROP TABLE IF EXISTS wos_reprint_address_suborganizations;
DROP TABLE IF EXISTS wos_reprint_addresses;
DROP TABLE IF EXISTS wos_reviewed_authors;
DROP TABLE IF EXISTS wos_reviewed_languages;
DROP TABLE IF EXISTS wos_abstract_paragraphs;
DROP TABLE IF EXISTS wos_abstracts;
DROP TABLE IF EXISTS wos_keywords;
DROP TABLE IF EXISTS wos_grant_ids;
DROP TABLE IF EXISTS wos_grant_alt_agencies;
DROP TABLE IF EXISTS wos_grants;
DROP TABLE IF EXISTS wos_headings;
DROP TABLE IF EXISTS wos_subheadings;
DROP TABLE IF EXISTS wos_subjects;
DROP TABLE IF EXISTS wos_address_dois;
DROP TABLE IF EXISTS wos_address_names_email_addr;
DROP TABLE IF EXISTS wos_address_names;
DROP TABLE IF EXISTS wos_address_email_addr;
DROP TABLE IF EXISTS wos_address_zip;
DROP TABLE IF EXISTS wos_address_organizations;
DROP TABLE IF EXISTS wos_address_suborganizations;
DROP TABLE IF EXISTS wos_addresses;
DROP TABLE IF EXISTS wos_edition;
DROP TABLE IF EXISTS wos_references;
DROP TABLE IF EXISTS wos_languages;
DROP TABLE IF EXISTS wos_normalized_languages;
DROP TABLE IF EXISTS wos_normalized_doctypes;
DROP TABLE IF EXISTS wos_page;
DROP TABLE IF EXISTS wos_titles;
DROP TABLE IF EXISTS wos_doctypes;
DROP TABLE IF EXISTS wos_conf_info;
DROP TABLE IF EXISTS wos_conf_title;
DROP TABLE IF EXISTS wos_conf_date;
DROP TABLE IF EXISTS wos_conf_location;
DROP TABLE IF EXISTS wos_conf_sponsor;
DROP TABLE IF EXISTS wos_conference;
DROP TABLE IF EXISTS wos_publisher_email_addr;
DROP TABLE IF EXISTS wos_publisher_names_email_addr;
DROP TABLE IF EXISTS wos_publisher_names;
DROP TABLE IF EXISTS wos_publisher_zip;
DROP TABLE IF EXISTS wos_publisher_organizations;
DROP TABLE IF EXISTS wos_publisher_suborganizations;
DROP TABLE IF EXISTS wos_publisher_dois;
DROP TABLE IF EXISTS wos_publisher;
DROP TABLE IF EXISTS wos_summary_names_email_addr;
DROP TABLE IF EXISTS wos_summary_names;
DROP TABLE IF EXISTS wos_summary;
DROP TABLE IF EXISTS wos_master;
DROP SCHEMA IF EXISTS public;

CREATE SCHEMA public;

CREATE TABLE wos_summary (
    id character varying NOT NULL CONSTRAINT wos_summary_pk PRIMARY KEY,
    file_number integer,
    coll_id character varying,
    pubyear character varying,
    season character varying,
    pubmonth character varying,
    pubday character varying,
    coverdate character varying,
    edate character varying,
    vol character varying,
    issue character varying,
    voliss character varying,
    supplement character varying,
    special_issue character varying,
    part_no character varying,
    pubtype character varying,
    medium character varying,
    model character varying,
    indicator character varying,
    inpi character varying,
    is_archive character varying,
    city character varying,
    country character varying,
    has_abstract character varying,
    sortdate character varying,
    title_count character varying,
    name_count character varying,
    doctype_count character varying,
    conference_count character varying,
    language_count character varying,
    normalized_language_count character varying,
    normalized_doctype_count character varying,
    descriptive_ref_count character varying,
    refs_count character varying,
    reference_count character varying,
    address_count character varying,
    headings_count character varying,
    subheadings_count character varying,
    subjects_count character varying,
    fund_ack character varying,
    grants_count character varying,
    grants_complete character varying,
    keyword_count character varying,
    abstract_count character varying,
    item_coll_id character varying,
    item_ids character varying,
    item_ids_avail character varying,
    bib_id character varying,
    bib_pagecount character varying,
    bib_pagecount_type character varying,
    reviewed_language_count character varying,
    reviewed_author_count character varying,
    reviewed_year character varying,
    keywords_plus_count character varying,
    book_chapters character varying,
    book_pages character varying,
    book_notes_count character varying,
    chapterlist_count character varying,
    contributor_count character varying
);

COMMENT ON TABLE wos_summary IS 'Summary Record Data';
COMMENT ON COLUMN wos_summary.id IS 'WoS ID (internal primary key)';
COMMENT ON COLUMN wos_summary.file_number IS 'File number';
COMMENT ON COLUMN wos_summary.coll_id IS 'Collection ID';
COMMENT ON COLUMN wos_summary.pubyear IS 'Publication Year';
COMMENT ON COLUMN wos_summary.season IS 'Publication Season';
COMMENT ON COLUMN wos_summary.pubmonth IS 'Publication Month';
COMMENT ON COLUMN wos_summary.pubday IS 'Publication Day';
COMMENT ON COLUMN wos_summary.coverdate IS 'Concatenation of pubyear and pubmonth';
COMMENT ON COLUMN wos_summary.edate IS 'Undocumented';
COMMENT ON COLUMN wos_summary.vol IS 'Volume';
COMMENT ON COLUMN wos_summary.issue IS 'Issue';
COMMENT ON COLUMN wos_summary.voliss IS 'Volume + issue';
COMMENT ON COLUMN wos_summary.supplement IS 'Journal supplement';
COMMENT ON COLUMN wos_summary.special_issue IS 'Journal special issue';
COMMENT ON COLUMN wos_summary.part_no IS 'Journal part number';
COMMENT ON COLUMN wos_summary.pubtype IS 'Undocumented';
COMMENT ON COLUMN wos_summary.medium IS 'Undocumented';
COMMENT ON COLUMN wos_summary.model IS 'Medline''s Article@PubModel';
COMMENT ON COLUMN wos_summary.indicator IS 'Undocumented';
COMMENT ON COLUMN wos_summary.inpi IS 'Indicator that source of chemical reaction data is INPI (Institut national de la propriete industriellee)';
COMMENT ON COLUMN wos_summary.is_archive IS 'Archive record';
COMMENT ON COLUMN wos_summary.city IS 'City of Publication';
COMMENT ON COLUMN wos_summary.country IS 'Country of Publication';
COMMENT ON COLUMN wos_summary.has_abstract IS 'Undocumented';
COMMENT ON COLUMN wos_summary.sortdate IS 'Undocumented';
COMMENT ON COLUMN wos_summary.title_count IS 'Title count (number of source title variations)';
COMMENT ON COLUMN wos_summary.name_count IS 'Name count';
COMMENT ON COLUMN wos_summary.doctype_count IS 'Document type count';
COMMENT ON COLUMN wos_summary.conference_count IS 'Conference count';
COMMENT ON COLUMN wos_summary.language_count IS 'Language count';
COMMENT ON COLUMN wos_summary.normalized_language_count IS 'Normalized language count';
COMMENT ON COLUMN wos_summary.normalized_doctype_count IS 'Normalized document type count';
COMMENT ON COLUMN wos_summary.descriptive_ref_count IS 'Descriptive reference count. Used for qualitative reference count. e.g. "Many refs".';
COMMENT ON COLUMN wos_summary.refs_count IS 'Reference count';
COMMENT ON COLUMN wos_summary.reference_count IS 'Reference count';
COMMENT ON COLUMN wos_summary.address_count IS 'Address count';
COMMENT ON COLUMN wos_summary.headings_count IS 'Heading count';
COMMENT ON COLUMN wos_summary.subheadings_count IS 'Subheadings count';
COMMENT ON COLUMN wos_summary.subjects_count IS 'Subjects count';
COMMENT ON COLUMN wos_summary.fund_ack IS 'Text of funding acknowledgement';
COMMENT ON COLUMN wos_summary.grants_count is 'Grant count';
COMMENT ON COLUMN wos_summary.grants_complete IS 'Grants complete';
COMMENT ON COLUMN wos_summary.keyword_count IS 'Keyword count';
COMMENT ON COLUMN wos_summary.item_coll_id IS 'Item record collection ID';
COMMENT ON COLUMN wos_summary.item_ids IS 'ISI Document Solution identifier';
COMMENT ON COLUMN wos_summary.item_ids_avail IS 'IDS availability flag';
COMMENT ON COLUMN wos_summary.bib_id IS 'Concatenation of volume, issue, page span, date';
COMMENT ON COLUMN wos_summary.bib_pagecount IS 'Page count of source. tion';
COMMENT ON COLUMN wos_summary.bib_pagecount_type IS 'Undocumented';
COMMENT ON COLUMN wos_summary.reviewed_language_count IS 'Count of langauges of reviewed work';
COMMENT ON COLUMN wos_summary.reviewed_author_count IS 'Count of authors of reviewed work';
COMMENT ON COLUMN wos_summary.reviewed_year IS 'Reviewed work year';
COMMENT ON COLUMN wos_summary.keywords_plus_count IS 'Keywords Plus count';
COMMENT ON COLUMN wos_summary.book_chapters IS 'Book chapter count';
COMMENT ON COLUMN wos_summary.book_pages IS 'Book pages';
COMMENT ON COLUMN wos_summary.book_notes_count IS 'Count of book notes';
COMMENT ON COLUMN wos_summary.chapterlist_count IS 'Listed chapters';
COMMENT ON COLUMN wos_summary.contributor_count IS 'Contributor count';

REVOKE ALL ON TABLE wos_summary FROM PUBLIC;
REVOKE ALL ON TABLE wos_summary FROM postgres;
GRANT ALL ON TABLE wos_summary TO postgres;

CREATE TABLE wos_page (
    id character varying NOT NULL,
    page_id integer NOT NULL,
    page_value character varying,
    page_begin character varying,
    page_end character varying,
    page_count character varying
);

 ALTER TABLE ONLY wos_page
         ADD CONSTRAINT unique_page_summary UNIQUE (id, page_id);
 ALTER TABLE ONLY wos_page
         ADD CONSTRAINT fk_page_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_page IS 'Pagination Data';
COMMENT ON COLUMN wos_page.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_page.page_id IS 'Order of pagination record (internal primary key)';
COMMENT ON COLUMN wos_page.page_value IS 'Pagination. text';
COMMENT ON COLUMN wos_page.page_begin IS 'Starting page number';
COMMENT ON COLUMN wos_page.page_end IS 'Ending page number';
COMMENT ON COLUMN wos_page.page_count IS 'Page count';

REVOKE ALL ON TABLE wos_page FROM PUBLIC;
REVOKE ALL ON TABLE wos_page FROM postgres;
GRANT ALL ON TABLE wos_page TO postgres;

CREATE TABLE wos_titles (
    id character varying NOT NULL,
    title_id integer NOT NULL,
    title character varying,
    title_type character varying,
    lang_id character varying,
    translated character varying,
    non_english character varying
);

 ALTER TABLE ONLY wos_titles
         ADD CONSTRAINT unique_titles_summary UNIQUE (id, title_id);
 ALTER TABLE ONLY wos_titles
         ADD CONSTRAINT fk_titles_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_titles IS 'Title Data';
COMMENT ON COLUMN wos_titles.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_titles.title_id IS 'Order of title record (internal primary key)';
COMMENT ON COLUMN wos_titles.title_type IS 'Title type';
COMMENT ON COLUMN wos_titles.lang_id IS 'Language identifier';
COMMENT ON COLUMN wos_titles.translated IS 'Translated flag (title has been translated into English)';
COMMENT ON COLUMN wos_titles.non_english IS 'Non-English flag (original title not in English)';

REVOKE ALL ON TABLE wos_titles FROM PUBLIC;
REVOKE ALL ON TABLE wos_titles FROM postgres;
GRANT ALL ON TABLE wos_titles TO postgres;

CREATE TABLE wos_summary_names (
    id character varying NOT NULL,
    name_id integer NOT NULL,
    role character varying NOT NULL,
    seq_no character varying,
    addr_no_raw character varying,
    reprint character varying,
    lang_id character varying,
    r_id character varying,
    r_id_tr character varying,
    orcid_id character varying,
    orcid_id_tr character varying,
    dais_id character varying,
    display character varying,
    display_name character varying,
    full_name character varying,
    wos_standard character varying,
    prefix character varying,
    first_name character varying,
    middle_name character varying,
    initials character varying,
    last_name character varying,
    suffix character varying
);
 ALTER TABLE ONLY wos_summary_names
         ADD CONSTRAINT unique_summary_names UNIQUE (id, name_id);
 ALTER TABLE ONLY wos_summary_names
         ADD CONSTRAINT fk_summary_names_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_summary_names IS 'Name Data from Record Summary';
COMMENT ON COLUMN wos_summary_names.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_summary_names.name_id IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_summary_names.role IS 'Role of the person or entity identified by the name';
COMMENT ON COLUMN wos_summary_names.seq_no IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_summary_names.addr_no_raw IS 'Raw address numbers, may be more than one separated by space';
COMMENT ON COLUMN wos_summary_names.reprint IS 'Reprint author flag';
COMMENT ON COLUMN wos_summary_names.lang_id IS 'Language of the name';
COMMENT ON COLUMN wos_summary_names.r_id IS 'ResearcherID identifier';
COMMENT ON COLUMN wos_summary_names.r_id_tr IS 'ResearcherID identifier as captured by TR';
COMMENT ON COLUMN wos_summary_names.orcid_id IS 'ORCID identifier';
COMMENT ON COLUMN wos_summary_names.orcid_id_tr IS 'ORCID identifier as captured by TR';
COMMENT ON COLUMN wos_summary_names.dais_id IS 'Distinct Author Identification System identifier';
COMMENT ON COLUMN wos_summary_names.display IS 'Display flag. Used to indicate whether a name is displayed in full record.';
COMMENT ON COLUMN wos_summary_names.display_name IS 'Name as displayed in record retrieved from database';
COMMENT ON COLUMN wos_summary_names.full_name IS 'Full name';
COMMENT ON COLUMN wos_summary_names.wos_standard IS 'Name in Web of Science standard format';
COMMENT ON COLUMN wos_summary_names.prefix IS 'Name prefix';
COMMENT ON COLUMN wos_summary_names.first_name IS 'First (given) name';
COMMENT ON COLUMN wos_summary_names.middle_name IS 'Middle name';
COMMENT ON COLUMN wos_summary_names.initials IS 'Initials';
COMMENT ON COLUMN wos_summary_names.last_name IS 'Last name (surname)';
COMMENT ON COLUMN wos_summary_names.suffix IS 'Name suffix';

REVOKE ALL ON TABLE wos_summary_names FROM PUBLIC;
REVOKE ALL ON TABLE wos_summary_names FROM postgres;
GRANT ALL ON TABLE wos_summary_names TO postgres;

CREATE TABLE wos_summary_names_email_addr (
    id character varying NOT NULL,
    name_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying NOT NULL,
    lang_id character varying
);
 ALTER TABLE ONLY wos_summary_names_email_addr
         ADD CONSTRAINT unique_summary_names_email_addr UNIQUE (id, name_id, email_id);
 ALTER TABLE ONLY wos_summary_names_email_addr
         ADD CONSTRAINT fk_summary_addr_summary_names FOREIGN KEY (id,name_id) REFERENCES wos_summary_names(id,name_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_summary_names_email_addr IS 'Email Address Data from Record Summary Names';
COMMENT ON COLUMN wos_summary_names_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_summary_names_email_addr.name_id IS 'Sequence number of associated name in list';
COMMENT ON COLUMN wos_summary_names_email_addr.email_id IS 'Sequence number of email address';
COMMENT ON COLUMN wos_summary_names_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_summary_names_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_summary_names_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_summary_names_email_addr FROM postgres;
GRANT ALL ON TABLE wos_summary_names_email_addr TO postgres;

CREATE TABLE wos_doctypes (
    id character varying NOT NULL,
    doctype_id integer NOT NULL,
    doctype character varying,
    code character varying
);
 ALTER TABLE ONLY wos_doctypes
         ADD CONSTRAINT unique_doctypes UNIQUE (id, doctype_id);
 ALTER TABLE ONLY wos_doctypes
         ADD CONSTRAINT fk_doctypes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_doctypes IS 'Summary Document Type Data';
COMMENT ON COLUMN wos_doctypes.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_doctypes.doctype_id IS 'Order of document type record (internal primary key)';
COMMENT ON COLUMN wos_doctypes.doctype IS 'Document type';
COMMENT ON COLUMN wos_doctypes.code IS 'Undocumented';

REVOKE ALL ON TABLE wos_doctypes FROM PUBLIC;
REVOKE ALL ON TABLE wos_doctypes FROM postgres;
GRANT ALL ON TABLE wos_doctypes TO postgres;

CREATE TABLE wos_normalized_doctypes (
    id character varying NOT NULL,
    doctype_id integer NOT NULL,
    doctype character varying,
    code character varying
);
 ALTER TABLE ONLY wos_normalized_doctypes
         ADD CONSTRAINT unique_normalized_doctypes UNIQUE (id, doctype_id);
 ALTER TABLE ONLY wos_normalized_doctypes
         ADD CONSTRAINT fk_normalized_doctypes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_normalized_doctypes IS 'Full Record Metadata Normalized Document Type Data';
COMMENT ON COLUMN wos_normalized_doctypes.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_normalized_doctypes.doctype_id IS 'Order of document type record (internal primary key)';
COMMENT ON COLUMN wos_normalized_doctypes.doctype IS 'Normalized_document type';
COMMENT ON COLUMN wos_normalized_doctypes.code IS 'Undocumented';

REVOKE ALL ON TABLE wos_normalized_doctypes FROM PUBLIC;
REVOKE ALL ON TABLE wos_normalized_doctypes FROM postgres;
GRANT ALL ON TABLE wos_normalized_doctypes TO postgres;

CREATE TABLE wos_languages (
    id character varying NOT NULL,
    language_id integer NOT NULL,
    language character varying,
    language_type character varying,
    status character varying
);
 ALTER TABLE ONLY wos_languages
         ADD CONSTRAINT unique_languages UNIQUE (id, language_id);
 ALTER TABLE ONLY wos_languages
         ADD CONSTRAINT fk_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_languages IS 'Full Record Metadata Language Data';
COMMENT ON COLUMN wos_languages.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_languages.language_id IS 'Order of document type record (internal primary key)';
COMMENT ON COLUMN wos_languages.language IS 'Language';
COMMENT ON COLUMN wos_languages.language_type IS 'Undocumented';
COMMENT ON COLUMN wos_languages.status IS 'Undocumented';

REVOKE ALL ON TABLE wos_languages FROM PUBLIC;
REVOKE ALL ON TABLE wos_languages FROM postgres;
GRANT ALL ON TABLE wos_languages TO postgres;

CREATE TABLE wos_normalized_languages (
    id character varying NOT NULL,
    language_id integer NOT NULL,
    language character varying,
    language_type character varying,
    status character varying
);
 ALTER TABLE ONLY wos_normalized_languages
         ADD CONSTRAINT unique_normalized_languages UNIQUE (id, language_id);
 ALTER TABLE ONLY wos_normalized_languages
         ADD CONSTRAINT fk_normalized_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_normalized_languages IS 'Full Record Metadata Normalized Language Data';
COMMENT ON COLUMN wos_normalized_languages.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_normalized_languages.language_id IS 'Order of document type record (internal primary key)';
COMMENT ON COLUMN wos_normalized_languages.language IS 'Normalized Language';
COMMENT ON COLUMN wos_normalized_languages.language_type IS 'Undocumented';
COMMENT ON COLUMN wos_normalized_languages.status IS 'Undocumented';

REVOKE ALL ON TABLE wos_normalized_languages FROM PUBLIC;
REVOKE ALL ON TABLE wos_normalized_languages FROM postgres;
GRANT ALL ON TABLE wos_normalized_languages TO postgres;

CREATE TABLE wos_conference (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    conf_id character varying,
    conf_info_count character varying,
    conf_title_count character varying,
    conf_date_count character varying,
    conf_location_count character varying,
    sponsor_count character varying,
    conf_type character varying,
    lang_id character varying
);

 ALTER TABLE ONLY wos_conference
         ADD CONSTRAINT unique_conference UNIQUE (id, conf_record_id);
 ALTER TABLE ONLY wos_conference
         ADD CONSTRAINT fk_conference_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conference IS 'Summary Conference Data';
COMMENT ON COLUMN wos_conference.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conference.conf_record_id IS 'Order of conference record (internal primary key)';
COMMENT ON COLUMN wos_conference.conf_id IS 'Conference identifier';
COMMENT ON COLUMN wos_conference.conf_info_count IS 'conf_info count. There may be multiple variations of conference information for one conference.';
COMMENT ON COLUMN wos_conference.conf_title_count IS 'Conference title count';
COMMENT ON COLUMN wos_conference.conf_date_count IS 'Conference date count';
COMMENT ON COLUMN wos_conference.conf_location_count IS 'Conference location count';
COMMENT ON COLUMN wos_conference.sponsor_count IS 'Conference sponsors count';
COMMENT ON COLUMN wos_conference.conf_type IS 'Undocumented';
COMMENT ON COLUMN wos_conference.lang_id IS 'Undocumented';

REVOKE ALL ON TABLE wos_conference FROM PUBLIC;
REVOKE ALL ON TABLE wos_conference FROM postgres;
GRANT ALL ON TABLE wos_conference TO postgres;

CREATE TABLE wos_conf_info (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    info_id integer NOT NULL,
    conf_info character varying,
    lang_id character varying
);

 ALTER TABLE ONLY wos_conf_info
         ADD CONSTRAINT unique_conf_info UNIQUE (id, conf_record_id, info_id);
 ALTER TABLE ONLY wos_conf_info
         ADD CONSTRAINT fk_conf_info_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conf_info IS 'Summary Conference Info Data';
COMMENT ON COLUMN wos_conf_info.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conf_info.conf_record_id IS 'Sequence number of associated conference';
COMMENT ON COLUMN wos_conf_info.info_id IS 'Order of conference info record (internal primary key)';
COMMENT ON COLUMN wos_conf_info.conf_info IS 'Concatenation of conference title, conference date and conference location';
COMMENT ON COLUMN wos_conf_info.lang_id IS 'Undocumented';

REVOKE ALL ON TABLE wos_conf_info FROM PUBLIC;
REVOKE ALL ON TABLE wos_conf_info FROM postgres;
GRANT ALL ON TABLE wos_conf_info TO postgres;

CREATE TABLE wos_conf_title (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    title_id integer NOT NULL,
    conf_title character varying,
    lang_id character varying
);

 ALTER TABLE ONLY wos_conf_title
         ADD CONSTRAINT unique_conf_title UNIQUE (id, conf_record_id, title_id);
 ALTER TABLE ONLY wos_conf_title
         ADD CONSTRAINT fk_conf_title_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conf_title IS 'Summary Conference Title Data';
COMMENT ON COLUMN wos_conf_title.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conf_title.conf_record_id IS 'Sequence number of associated conference';
COMMENT ON COLUMN wos_conf_title.title_id IS 'Order of conference info record (internal primary key)';
COMMENT ON COLUMN wos_conf_title.conf_title IS 'Conference title';
COMMENT ON COLUMN wos_conf_title.lang_id IS 'Language of conference title';

REVOKE ALL ON TABLE wos_conf_title FROM PUBLIC;
REVOKE ALL ON TABLE wos_conf_title FROM postgres;
GRANT ALL ON TABLE wos_conf_title TO postgres;

CREATE TABLE wos_conf_date (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    date_id integer NOT NULL,
    conf_date character varying,
    conf_start character varying,
    conf_end character varying,
    display_date character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_conf_date
         ADD CONSTRAINT unique_conf_date UNIQUE (id, conf_record_id, date_id);
 ALTER TABLE ONLY wos_conf_date
         ADD CONSTRAINT fk_conf_date_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conf_date IS 'Summary Conference Date Data';
COMMENT ON COLUMN wos_conf_date.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conf_date.conf_record_id IS 'Sequence number of associated conference';
COMMENT ON COLUMN wos_conf_date.date_id IS 'Order of conference info record (internal primary key)';
COMMENT ON COLUMN wos_conf_date.conf_date IS 'Conference date';
COMMENT ON COLUMN wos_conf_date.conf_start IS 'Conference start date';
COMMENT ON COLUMN wos_conf_date.conf_end IS 'Conference end date';
COMMENT ON COLUMN wos_conf_date.display_date IS 'Display date from source item';
COMMENT ON COLUMN wos_conf_date.lang_id IS 'Language of conference date';

REVOKE ALL ON TABLE wos_conf_date FROM PUBLIC;
REVOKE ALL ON TABLE wos_conf_date FROM postgres;
GRANT ALL ON TABLE wos_conf_date TO postgres;

CREATE TABLE wos_conf_location (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    location_id integer NOT NULL,
    composite_location character varying,
    composite_lang_id character varying,
    conf_host character varying,
    host_lang_id character varying,
    conf_city character varying,
    city_lang_id character varying,
    conf_state character varying,
    state_lang_id character varying
);
 ALTER TABLE ONLY wos_conf_location
         ADD CONSTRAINT unique_conf_location UNIQUE (id, conf_record_id, location_id);
 ALTER TABLE ONLY wos_conf_location
         ADD CONSTRAINT fk_conf_location_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conf_location IS 'Summary Conference Location Data';
COMMENT ON COLUMN wos_conf_location.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conf_location.conf_record_id IS 'Sequence number of associated conference';
COMMENT ON COLUMN wos_conf_location.location_id IS 'Order of conference info record (internal primary key)';
COMMENT ON COLUMN wos_conf_location.composite_location IS 'Full conference location';
COMMENT ON COLUMN wos_conf_location.composite_lang_id IS 'Language of conference location';
COMMENT ON COLUMN wos_conf_location.conf_host IS 'Conference location host';
COMMENT ON COLUMN wos_conf_location.host_lang_id IS 'Language of conference host data';
COMMENT ON COLUMN wos_conf_location.conf_city IS 'Conference city';
COMMENT ON COLUMN wos_conf_location.city_lang_id IS 'Language of conference city data';
COMMENT ON COLUMN wos_conf_location.conf_state IS 'U.S. State or Canadian province';
COMMENT ON COLUMN wos_conf_location.city_lang_id IS 'Language of conference state data';

REVOKE ALL ON TABLE wos_conf_location FROM PUBLIC;
REVOKE ALL ON TABLE wos_conf_location FROM postgres;
GRANT ALL ON TABLE wos_conf_location TO postgres;

CREATE TABLE wos_conf_sponsor (
    id character varying NOT NULL,
    conf_record_id integer NOT NULL,
    sponsor_id integer NOT NULL,
    sponsor character varying,
    lang_id character varying
);

 ALTER TABLE ONLY wos_conf_sponsor
         ADD CONSTRAINT unique_conf_sponsor UNIQUE (id, conf_record_id, sponsor_id);
 ALTER TABLE ONLY wos_conf_sponsor
         ADD CONSTRAINT fk_conf_sponsor_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_conf_sponsor IS 'Summary Conference Sponsor Data';
COMMENT ON COLUMN wos_conf_sponsor.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_conf_sponsor.conf_record_id IS 'Sequence number of associated conference';
COMMENT ON COLUMN wos_conf_sponsor.sponsor_id IS 'Order of conference info record (internal primary key)';
COMMENT ON COLUMN wos_conf_sponsor.sponsor IS 'Conference sponsor';
COMMENT ON COLUMN wos_conf_sponsor.lang_id IS 'Language of conference sponsor data';

REVOKE ALL ON TABLE wos_conf_sponsor FROM PUBLIC;
REVOKE ALL ON TABLE wos_conf_sponsor FROM postgres;
GRANT ALL ON TABLE wos_conf_sponsor TO postgres;

CREATE TABLE wos_publisher (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    addr_type character varying,
    addr_no character varying,
    full_address character varying,
    full_address_lang_id character varying,
    organization_count character varying,
    suborganization_count character varying,
    email_addr_count character varying,
    url_type character varying,
    url_date_info character varying,
    url_create_date character varying,
    url_revised_date character varying,
    url_cited_date character varying,
    url character varying,
    doi_count character varying,
    laboratory character varying,
    laboratory_lang_id character varying,
    street character varying,
    street_lang_id character varying,
    city character varying,
    city_lang_id character varying,
    province character varying,
    province_lang_id character varying,
    state character varying,
    state_lang_id character varying,
    country character varying,
    country_lang_id character varying,
    post_num character varying,
    post_num_lang_id character varying,
    name_count character varying
);

 ALTER TABLE ONLY wos_publisher
         ADD CONSTRAINT unique_publisher UNIQUE (id, publisher_id);
 ALTER TABLE ONLY wos_publisher
         ADD CONSTRAINT fk_publisher_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher IS 'Summary Publisher Data';
COMMENT ON COLUMN wos_publisher.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher.publisher_id IS 'Order of publisher record (internal primary key)';
COMMENT ON COLUMN wos_publisher.addr_type IS 'Address type';
COMMENT ON COLUMN wos_publisher.addr_no IS 'Address number. Used to link a specific author/publisher to a specific address.';
COMMENT ON COLUMN wos_publisher.full_address IS 'Full address';
COMMENT ON COLUMN wos_publisher.full_address_lang_id IS 'Language of full address data';
COMMENT ON COLUMN wos_publisher.organization_count IS 'Organizations count';
COMMENT ON COLUMN wos_publisher.suborganization_count IS 'Suborganizations count';
COMMENT ON COLUMN wos_publisher.email_addr_count IS 'Email address count';
COMMENT ON COLUMN wos_publisher.url_type IS 'URL type';
COMMENT ON COLUMN wos_publisher.url_date_info IS 'Unstructured URL date information';
COMMENT ON COLUMN wos_publisher.url_create_date IS 'URL create date';
COMMENT ON COLUMN wos_publisher.url_revised_date IS 'Last date the URL was revised';
COMMENT ON COLUMN wos_publisher.url_cited_date IS 'Date the URL was cited';
COMMENT ON COLUMN wos_publisher.url IS 'URL';
COMMENT ON COLUMN wos_publisher.doi_count IS 'Count of URL related DOIs';
COMMENT ON COLUMN wos_publisher.laboratory IS 'Laboratory';
COMMENT ON COLUMN wos_publisher.laboratory_lang_id IS 'Language of laboratory data';
COMMENT ON COLUMN wos_publisher.street IS 'Street address';
COMMENT ON COLUMN wos_publisher.street_lang_id IS 'Language of street address';
COMMENT ON COLUMN wos_publisher.city IS 'City';
COMMENT ON COLUMN wos_publisher.city_lang_id IS 'Language of city data';
COMMENT ON COLUMN wos_publisher.province IS 'Province';
COMMENT ON COLUMN wos_publisher.province_lang_id IS 'Language of province data';
COMMENT ON COLUMN wos_publisher.state IS 'U.S. state or Canadian province';
COMMENT ON COLUMN wos_publisher.state_lang_id IS 'Language of state data';
COMMENT ON COLUMN wos_publisher.country IS 'Country';
COMMENT ON COLUMN wos_publisher.country_lang_id IS 'Language of country data';
COMMENT ON COLUMN wos_publisher.post_num IS 'Postal number';
COMMENT ON COLUMN wos_publisher.post_num_lang_id IS 'Language of postal number';
COMMENT ON COLUMN wos_publisher.name_count IS 'Count of publisher names';

REVOKE ALL ON TABLE wos_publisher FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher FROM postgres;
GRANT ALL ON TABLE wos_publisher TO postgres;

CREATE TABLE wos_publisher_names (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    name_id integer NOT NULL,
    role character varying NOT NULL,
    seq_no character varying,
    reprint character varying,
    lang_id character varying,
    addr_no_raw character varying,
    r_id character varying,
    r_id_tr character varying,
    orcid_id character varying,
    orcid_id_tr character varying,
    dais_id character varying,
    display character varying,
    display_name character varying,
    full_name character varying,
    wos_standard character varying,
    prefix character varying,
    first_name character varying,
    middle_name character varying,
    initials character varying,
    last_name character varying,
    suffix character varying
);
 ALTER TABLE ONLY wos_publisher_names
         ADD CONSTRAINT unique_publisher_names UNIQUE (id, publisher_id, name_id);
 ALTER TABLE ONLY wos_publisher_names
         ADD CONSTRAINT fk_publisher_names_publisher FOREIGN KEY (id, publisher_id) REFERENCES wos_publisher(id, publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_names IS 'Name Data from Publishers';
COMMENT ON COLUMN wos_publisher_names.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_names.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_names.name_id IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_publisher_names.role IS 'Role of the person or entity identified by the name';
COMMENT ON COLUMN wos_publisher_names.reprint IS 'Reprint author flag';
COMMENT ON COLUMN wos_publisher_names.lang_id IS 'Language of the name';
COMMENT ON COLUMN wos_publisher_names.addr_no_raw IS 'Number that links a specific author to a specific address.';
COMMENT ON COLUMN wos_publisher_names.r_id IS 'ResearcherID identifier';
COMMENT ON COLUMN wos_publisher_names.r_id_tr IS 'ResearcherID identifier as captured by TR';
COMMENT ON COLUMN wos_publisher_names.orcid_id IS 'ORCID identifier';
COMMENT ON COLUMN wos_publisher_names.orcid_id_tr IS 'ORCID identifier as captured by TR';
COMMENT ON COLUMN wos_publisher_names.dais_id IS 'Distinct Author Identification System identifier';
COMMENT ON COLUMN wos_publisher_names.display IS 'Display flag. Used to indicate whether a name is displayed in full record.';
COMMENT ON COLUMN wos_publisher_names.display_name IS 'Name as displayed in record retrieved from database';
COMMENT ON COLUMN wos_publisher_names.full_name IS 'Full name';
COMMENT ON COLUMN wos_publisher_names.wos_standard IS 'Name in Web of Science standard format';
COMMENT ON COLUMN wos_publisher_names.prefix IS 'Name prefix';
COMMENT ON COLUMN wos_publisher_names.first_name IS 'First (given) name';
COMMENT ON COLUMN wos_publisher_names.middle_name IS 'Middle name';
COMMENT ON COLUMN wos_publisher_names.initials IS 'Initials';
COMMENT ON COLUMN wos_publisher_names.last_name IS 'Last name (surname)';
COMMENT ON COLUMN wos_publisher_names.suffix IS 'Name suffix';

REVOKE ALL ON TABLE wos_publisher_names FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_names FROM postgres;
GRANT ALL ON TABLE wos_publisher_names TO postgres;

CREATE TABLE wos_publisher_names_email_addr (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    name_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_publisher_names_email_addr
         ADD CONSTRAINT unique_publisher_names_email_addr UNIQUE (id, publisher_id, name_id, email_id);
 ALTER TABLE ONLY wos_publisher_names_email_addr
         ADD CONSTRAINT fk_publisher_names_addr_publisher_names FOREIGN KEY (id,publisher_id,name_id) REFERENCES wos_publisher_names(id,publisher_id,name_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_names_email_addr IS 'Email Address Data from Publisher Names';
COMMENT ON COLUMN wos_publisher_names_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_names_email_addr.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_names_email_addr.name_id IS 'Sequence number of associated name in list';
COMMENT ON COLUMN wos_publisher_names_email_addr.email_id IS 'Email address ID';
COMMENT ON COLUMN wos_publisher_names_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_publisher_names_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_publisher_names_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_names_email_addr FROM postgres;
GRANT ALL ON TABLE wos_publisher_names_email_addr TO postgres;

CREATE TABLE wos_publisher_email_addr (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_publisher_email_addr
         ADD CONSTRAINT unique_publisher_email_addr UNIQUE (id, publisher_id, email_id);
 ALTER TABLE ONLY wos_publisher_email_addr
         ADD CONSTRAINT fk_publisher_addr_publishers FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_email_addr IS 'Email Address Data from Publisher Addresses';
COMMENT ON COLUMN wos_publisher_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_email_addr.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_email_addr.email_id IS 'Email address ID';
COMMENT ON COLUMN wos_publisher_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_publisher_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_publisher_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_email_addr FROM postgres;
GRANT ALL ON TABLE wos_publisher_email_addr TO postgres;

CREATE TABLE wos_publisher_zip (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    zip_id integer NOT NULL,
    zip character varying,
    lang_id character varying,
    location character varying
);
 ALTER TABLE ONLY wos_publisher_zip
         ADD CONSTRAINT unique_publisher_zip UNIQUE (id, publisher_id, zip_id);
 ALTER TABLE ONLY wos_publisher_zip
         ADD CONSTRAINT fk_publisher_zip_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_zip IS 'Zip Code Data from Publishers';
COMMENT ON COLUMN wos_publisher_zip.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_zip.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_zip.zip IS 'Zip code or postal code';
COMMENT ON COLUMN wos_publisher_zip.lang_id IS 'Language of zip code data';
COMMENT ON COLUMN wos_publisher_zip.location IS 'Undocumented';

REVOKE ALL ON TABLE wos_publisher_zip FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_zip FROM postgres;
GRANT ALL ON TABLE wos_publisher_zip TO postgres;

CREATE TABLE wos_publisher_organizations (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    org_id integer NOT NULL,
    organization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_publisher_organizations
         ADD CONSTRAINT unique_publisher_organizations UNIQUE (id, publisher_id, org_id);
 ALTER TABLE ONLY wos_publisher_organizations
         ADD CONSTRAINT fk_publisher_organizations_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_organizations IS 'Organizations Data from Publishers';
COMMENT ON COLUMN wos_publisher_organizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_organizations.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_organizations.organization IS 'Organization';
COMMENT ON COLUMN wos_publisher_organizations.lang_id IS 'Language of organization data';

REVOKE ALL ON TABLE wos_publisher_organizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_organizations FROM postgres;
GRANT ALL ON TABLE wos_publisher_organizations TO postgres;

CREATE TABLE wos_publisher_suborganizations (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    suborg_id integer NOT NULL,
    suborganization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_publisher_suborganizations
         ADD CONSTRAINT unique_publisher_suborganizations UNIQUE (id, publisher_id, suborg_id);
 ALTER TABLE ONLY wos_publisher_suborganizations
         ADD CONSTRAINT fk_publisher_suborganizations_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_suborganizations IS 'Suborganizations Data from Publishers';
COMMENT ON COLUMN wos_publisher_suborganizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_suborganizations.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_suborganizations.suborganization IS 'Suborganization';
COMMENT ON COLUMN wos_publisher_suborganizations.lang_id IS 'Language of suborganization data';

REVOKE ALL ON TABLE wos_publisher_suborganizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_suborganizations FROM postgres;
GRANT ALL ON TABLE wos_publisher_suborganizations TO postgres;

CREATE TABLE wos_publisher_dois (
    id character varying NOT NULL,
    publisher_id integer NOT NULL,
    doi_id integer NOT NULL,
    doi character varying
);
 ALTER TABLE ONLY wos_publisher_dois
         ADD CONSTRAINT unique_publisher_dois UNIQUE (id, publisher_id, doi_id);
 ALTER TABLE ONLY wos_publisher_dois
         ADD CONSTRAINT fk_publisher_doi_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_publisher_dois IS 'DOI Data from Publisher URLs';
COMMENT ON COLUMN wos_publisher_dois.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_publisher_dois.publisher_id IS 'Sequence number of associated publisher';
COMMENT ON COLUMN wos_publisher_dois.doi IS 'DOI';

REVOKE ALL ON TABLE wos_publisher_dois FROM PUBLIC;
REVOKE ALL ON TABLE wos_publisher_dois FROM postgres;
GRANT ALL ON TABLE wos_publisher_dois TO postgres;

CREATE TABLE wos_edition (
    id character varying NOT NULL,
    edition_ctr integer NOT NULL,
    edition character varying
);

 ALTER TABLE ONLY wos_edition
         ADD CONSTRAINT unique_edition UNIQUE (id, edition_ctr);
 ALTER TABLE ONLY wos_edition
     ADD CONSTRAINT fk_edition_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_edition IS 'Web Of Science database editions';
COMMENT ON COLUMN wos_edition.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_edition.edition IS 'Associated Database Edition';
REVOKE ALL ON TABLE wos_edition FROM PUBLIC;
REVOKE ALL ON TABLE wos_edition FROM postgres;
GRANT ALL ON TABLE wos_edition TO postgres;

CREATE TABLE wos_references (
    id character varying NOT NULL,
    ref_ctr integer NOT NULL,
    ref_id character varying,
    cited_author character varying,
    assignee character varying,
    year character varying,
    page character varying,
    volume character varying,
    cited_title character varying,
    cited_work character varying,
    doi character varying,
    art_no character varying,
    patent_no character varying
);

 ALTER TABLE ONLY wos_references
         ADD CONSTRAINT unique_references UNIQUE (id, ref_id);
 ALTER TABLE ONLY wos_references
     ADD CONSTRAINT fk_references_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_references IS 'Reference Details';
COMMENT ON COLUMN wos_references.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_references.ref_ctr IS 'Order of Reference Record';
COMMENT ON COLUMN wos_references.ref_id IS 'Unique WoS Identifier (within a collection)';
COMMENT ON COLUMN wos_references.cited_author IS 'Cited Author';
COMMENT ON COLUMN wos_references.assignee IS 'Assignee';
COMMENT ON COLUMN wos_references.year IS 'Year';
COMMENT ON COLUMN wos_references.page IS 'Page';
COMMENT ON COLUMN wos_references.volume IS 'Volume';
COMMENT ON COLUMN wos_references.cited_title IS 'Cited Title - Cited Title is only available is the cited reference clusters with a source iteam, or if a "full Cited Reference" capture provided one';
COMMENT ON COLUMN wos_references.cited_work IS 'Cited Work';
COMMENT ON COLUMN wos_references.doi IS 'Digital Object Identifier';
COMMENT ON COLUMN wos_references.art_no IS 'Art No (Undocumented)';
COMMENT ON COLUMN wos_references.patent_no IS 'Patent Number';

REVOKE ALL ON TABLE wos_references FROM PUBLIC;
REVOKE ALL ON TABLE wos_references FROM postgres;
GRANT ALL ON TABLE wos_references TO postgres;

CREATE TABLE wos_addresses (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    addr_type character varying,
    addr_no character varying,
    full_address character varying,
    full_address_lang_id character varying,
    organization_count character varying,
    suborganization_count character varying,
    url_type character varying,
    url_date_info character varying,
    url_create_date character varying,
    url_revised_date character varying,
    url_cited_date character varying,
    url character varying,
    laboratory character varying,
    laboratory_lang_id character varying,
    street character varying,
    street_lang_id character varying,
    city character varying,
    city_lang_id character varying,
    province character varying,
    province_lang_id character varying,
    state character varying,
    state_lang_id character varying,
    country character varying,
    country_lang_id character varying,
    post_num character varying,
    post_num_lang_id character varying,
    name_count character varying
);

 ALTER TABLE ONLY wos_addresses
     ADD CONSTRAINT unique_addresses UNIQUE (id, addr_id);
 ALTER TABLE ONLY wos_addresses
     ADD CONSTRAINT fk_addresses_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_addresses is 'Full Record Metadata Address Data';
COMMENT ON COLUMN wos_addresses.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_addresses.addr_id IS 'Order of address record (internal primary key)';
COMMENT ON COLUMN wos_addresses.addr_type IS 'Address type';
COMMENT ON COLUMN wos_addresses.addr_no IS 'Address number. Used to link a specific author/publisher to a specific address.';
COMMENT ON COLUMN wos_addresses.full_address IS 'Full address';
COMMENT ON COLUMN wos_addresses.full_address_lang_id IS 'Language of full address data';
COMMENT ON COLUMN wos_addresses.organization_count IS 'Organizations count';
COMMENT ON COLUMN wos_addresses.suborganization_count IS 'Suborganizations count';
COMMENT ON COLUMN wos_addresses.url_type IS 'URL type';
COMMENT ON COLUMN wos_addresses.url_date_info IS 'Unstructured URL date information';
COMMENT ON COLUMN wos_addresses.url_create_date IS 'URL create date';
COMMENT ON COLUMN wos_addresses.url_revised_date IS 'Last date the URL was revised';
COMMENT ON COLUMN wos_addresses.url_cited_date IS 'Date the URL was cited';
COMMENT ON COLUMN wos_addresses.url IS 'URL';
COMMENT ON COLUMN wos_addresses.laboratory IS 'Laboratory';
COMMENT ON COLUMN wos_addresses.laboratory_lang_id IS 'Language of laboratory data';
COMMENT ON COLUMN wos_addresses.street IS 'Street address';
COMMENT ON COLUMN wos_addresses.street_lang_id IS 'Language of street address';
COMMENT ON COLUMN wos_addresses.city IS 'City';
COMMENT ON COLUMN wos_addresses.city_lang_id IS 'Language of city data';
COMMENT ON COLUMN wos_addresses.province IS 'Province';
COMMENT ON COLUMN wos_addresses.province_lang_id IS 'Language of province data';
COMMENT ON COLUMN wos_addresses.state IS 'U.S. state or Canadian province';
COMMENT ON COLUMN wos_addresses.state_lang_id IS 'Language of state data';
COMMENT ON COLUMN wos_addresses.country IS 'Country';
COMMENT ON COLUMN wos_addresses.country_lang_id IS 'Language of country data';
COMMENT ON COLUMN wos_addresses.post_num IS 'Postal number';
COMMENT ON COLUMN wos_addresses.post_num_lang_id IS 'Language of postal number';
COMMENT ON COLUMN wos_addresses.name_count IS 'Count of related names';

REVOKE ALL ON TABLE wos_addresses FROM PUBLIC;
REVOKE ALL ON TABLE wos_addresses FROM postgres;
GRANT ALL ON TABLE wos_addresses TO postgres;

CREATE TABLE wos_address_names (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    name_id integer NOT NULL,
    addr_no_raw character varying,
    seq_no character varying,
    role character varying,
    reprint character varying,
    lang_id character varying,
    addr_no character varying,
    r_id character varying,
    r_id_tr character varying,
    orcid_id character varying,
    orcid_id_tr character varying,
    dais_id character varying,
    display character varying,
    display_name character varying,
    full_name character varying,
    wos_standard character varying,
    prefix character varying,
    first_name character varying,
    middle_name character varying,
    initials character varying,
    last_name character varying,
    suffix character varying
);
 ALTER TABLE ONLY wos_address_names
         ADD CONSTRAINT unique_address_names UNIQUE (id, addr_id, name_id);
 ALTER TABLE ONLY wos_address_names
         ADD CONSTRAINT fk_address_names_addresses FOREIGN KEY (id, addr_id) REFERENCES wos_addresses(id, addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_names IS 'Name Data from Addresses';
COMMENT ON COLUMN wos_address_names.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_names.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_names.name_id IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_address_names.role IS 'Role of the person or entity identified by the name';
COMMENT ON COLUMN wos_address_names.reprint IS 'Reprint author flag';
COMMENT ON COLUMN wos_address_names.lang_id IS 'Language of the name';
COMMENT ON COLUMN wos_address_names.addr_no IS 'Number that links a specific author to a specific address.';
COMMENT ON COLUMN wos_address_names.r_id IS 'ResearcherID identifier';
COMMENT ON COLUMN wos_address_names.r_id_tr IS 'ResearcherID identifier as captured by TR';
COMMENT ON COLUMN wos_address_names.orcid_id IS 'ORCID identifier';
COMMENT ON COLUMN wos_address_names.orcid_id_tr IS 'ORCID identifier as captured by TR';
COMMENT ON COLUMN wos_address_names.dais_id IS 'Distinct Author Identification System identifier';
COMMENT ON COLUMN wos_address_names.display IS 'Display flag. Used to indicate whether a name is displayed in full record.';
COMMENT ON COLUMN wos_address_names.display_name IS 'Name as displayed in record retrieved from database';
COMMENT ON COLUMN wos_address_names.full_name IS 'Full name';
COMMENT ON COLUMN wos_address_names.wos_standard IS 'Name in Web of Science standard format';
COMMENT ON COLUMN wos_address_names.prefix IS 'Name prefix';
COMMENT ON COLUMN wos_address_names.first_name IS 'First (given) name';
COMMENT ON COLUMN wos_address_names.middle_name IS 'Middle name';
COMMENT ON COLUMN wos_address_names.initials IS 'Initials';
COMMENT ON COLUMN wos_address_names.last_name IS 'Last name (surname)';
COMMENT ON COLUMN wos_address_names.suffix IS 'Name suffix';

REVOKE ALL ON TABLE wos_address_names FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_names FROM postgres;
GRANT ALL ON TABLE wos_address_names TO postgres;

CREATE TABLE wos_address_names_email_addr (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    name_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_address_names_email_addr
         ADD CONSTRAINT unique_address_names_email_addr UNIQUE (id, addr_id, name_id, email_id);
 ALTER TABLE ONLY wos_address_names_email_addr
         ADD CONSTRAINT fk_address_names_email_addr_address_names FOREIGN KEY (id,addr_id, name_id) REFERENCES wos_address_names(id,addr_id, name_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_names_email_addr IS 'Email Address Data from Address Names';
COMMENT ON COLUMN wos_address_names_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_names_email_addr.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_names_email_addr.name_id IS 'Sequence number of associated name';
COMMENT ON COLUMN wos_address_names_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_address_names_email_addr.lang_id IS 'Language ID';

REVOKE ALL ON TABLE wos_address_names_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_names_email_addr FROM postgres;
GRANT ALL ON TABLE wos_address_names_email_addr TO postgres;

CREATE TABLE wos_address_email_addr (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_address_email_addr
         ADD CONSTRAINT unique_address_email_addr UNIQUE (id, addr_id, email_id);
 ALTER TABLE ONLY wos_address_email_addr
         ADD CONSTRAINT fk_address_email_addr_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_email_addr IS 'Email Address Data from Address Names';
COMMENT ON COLUMN wos_address_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_email_addr.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_address_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_address_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_email_addr FROM postgres;
GRANT ALL ON TABLE wos_address_email_addr TO postgres;

CREATE TABLE wos_address_zip (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    zip_id integer NOT NULL,
    zip character varying,
    lang_id character varying,
    location character varying
);
 ALTER TABLE ONLY wos_address_zip
         ADD CONSTRAINT unique_address_zip UNIQUE (id, addr_id, zip_id);
 ALTER TABLE ONLY wos_address_zip
         ADD CONSTRAINT fk_address_zip_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_zip IS 'Zip Code Data from Addresses';
COMMENT ON COLUMN wos_address_zip.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_zip.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_zip.zip IS 'Zip code or postal code';
COMMENT ON COLUMN wos_address_zip.lang_id IS 'Language of zip code data';
COMMENT ON COLUMN wos_address_zip.location IS 'Undocumented';

REVOKE ALL ON TABLE wos_address_zip FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_zip FROM postgres;
GRANT ALL ON TABLE wos_address_zip TO postgres;

CREATE TABLE wos_address_organizations (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    org_id integer NOT NULL,
    organization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_address_organizations
         ADD CONSTRAINT unique_address_organizations UNIQUE (id, addr_id, org_id);
 ALTER TABLE ONLY wos_address_organizations
         ADD CONSTRAINT fk_address_organizations_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_organizations IS 'Organizations Data from Addresses';
COMMENT ON COLUMN wos_address_organizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_organizations.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_organizations.organization IS 'Organization';
COMMENT ON COLUMN wos_address_organizations.lang_id IS 'Language of organization data';

REVOKE ALL ON TABLE wos_address_organizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_organizations FROM postgres;
GRANT ALL ON TABLE wos_address_organizations TO postgres;

CREATE TABLE wos_address_suborganizations (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    suborg_id integer NOT NULL,
    suborganization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_address_suborganizations
         ADD CONSTRAINT unique_address_suborganizations UNIQUE (id, addr_id, suborg_id);
 ALTER TABLE ONLY wos_address_suborganizations
         ADD CONSTRAINT fk_address_suborganizations_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_suborganizations IS 'Suborganizations Data from Addresses';
COMMENT ON COLUMN wos_address_suborganizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_suborganizations.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_suborganizations.suborganization IS 'Suborganization';
COMMENT ON COLUMN wos_address_suborganizations.lang_id IS 'Language of suborganization data';

REVOKE ALL ON TABLE wos_address_suborganizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_suborganizations FROM postgres;
GRANT ALL ON TABLE wos_address_suborganizations TO postgres;

CREATE TABLE wos_address_dois (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    doi_id integer NOT NULL,
    doi character varying
);
 ALTER TABLE ONLY wos_address_dois
         ADD CONSTRAINT unique_address_dois UNIQUE (id, addr_id, doi_id);
 ALTER TABLE ONLY wos_address_dois
         ADD CONSTRAINT fk_address_doi_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_address_dois IS 'DOI Data from Address URLs';
COMMENT ON COLUMN wos_address_dois.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_address_dois.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_address_dois.doi IS 'DOI';

REVOKE ALL ON TABLE wos_address_dois FROM PUBLIC;
REVOKE ALL ON TABLE wos_address_dois FROM postgres;
GRANT ALL ON TABLE wos_address_dois TO postgres;

CREATE TABLE wos_headings (
    id character varying NOT NULL,
    heading_id integer NOT NULL,
    heading character varying
);
 ALTER TABLE ONLY wos_headings
     ADD CONSTRAINT unique_headings UNIQUE (id, heading_id);
 ALTER TABLE ONLY wos_headings
     ADD CONSTRAINT fk_headings_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_headings IS 'High Level Subject Headings';
COMMENT ON COLUMN wos_headings.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_headings.heading_id IS 'Order of heading record (internal primary key)';
COMMENT ON COLUMN wos_headings.heading IS 'High-level subject heading';

REVOKE ALL ON TABLE wos_headings FROM PUBLIC;
REVOKE ALL ON TABLE wos_headings FROM postgres;
GRANT ALL ON TABLE wos_headings TO postgres;

CREATE TABLE wos_subheadings (
    id character varying NOT NULL,
    subheading_id integer NOT NULL,
    subheading character varying
);
 ALTER TABLE ONLY wos_subheadings
         ADD CONSTRAINT unique_subheadings UNIQUE (id, subheading_id);
 ALTER TABLE ONLY wos_subheadings
         ADD CONSTRAINT fk_subheadings_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_subheadings IS 'Subject category subheadings';
COMMENT ON COLUMN wos_subheadings.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_subheadings.subheading_id IS 'Order of subheading record (internal primary key)';
COMMENT ON COLUMN wos_subheadings.subheading IS 'Subject category subheading';

REVOKE ALL ON TABLE wos_subheadings FROM PUBLIC;
REVOKE ALL ON TABLE wos_subheadings FROM postgres;
GRANT ALL ON TABLE wos_subheadings TO postgres;

CREATE TABLE wos_subjects (
    id character varying NOT NULL,
    subject_id integer NOT NULL,
    subject character varying,
    ascatype character varying,
    code character varying,
    edition character varying
);
 ALTER TABLE ONLY wos_subjects
         ADD CONSTRAINT unique_subjects UNIQUE (id, subject_id);
 ALTER TABLE ONLY wos_subjects
         ADD CONSTRAINT fk_subjects_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_subjects IS 'Subject categories';
COMMENT ON COLUMN wos_subjects.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_subjects.subject_id IS 'Order of subjects record (internal primary key)';
COMMENT ON COLUMN wos_subjects.subject IS 'Subject category';
COMMENT ON COLUMN wos_subjects.ascatype IS 'Defines the two collection of subject categories used to classify journals in Web of Knowledge';
COMMENT ON COLUMN wos_subjects.code IS 'Undocumented';
COMMENT ON COLUMN wos_subjects.edition IS 'Undocumented';

REVOKE ALL ON TABLE wos_subjects FROM PUBLIC;
REVOKE ALL ON TABLE wos_subjects FROM postgres;
GRANT ALL ON TABLE wos_subjects TO postgres;

CREATE TABLE wos_grants (
    id character varying NOT NULL,
    grant_id integer NOT NULL,
    grant_info character varying,
    grant_info_lang_id character varying,
    grant_agency character varying,
    grant_agency_lang_id character varying,
    grant_agency_preferred character varying,
    alt_agency_count character varying,
    grant_id_count character varying,
    country character varying,
    acronym character varying,
    investigator character varying
);
 ALTER TABLE ONLY wos_grants
         ADD CONSTRAINT unique_grants UNIQUE (id, grant_id);
 ALTER TABLE ONLY wos_grants
         ADD CONSTRAINT fk_grants_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_grants IS 'Grant data';
COMMENT ON COLUMN wos_grants.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_grants.grant_id IS 'Order of grant record (internal primary key)';
COMMENT ON COLUMN wos_grants.grant_info IS 'Unparsed grant information';
COMMENT ON COLUMN wos_grants.grant_info_lang_id IS 'Language of grant information';
COMMENT ON COLUMN wos_grants.grant_agency IS 'Grant agency';
COMMENT ON COLUMN wos_grants.grant_agency_lang_id IS 'Language of grant agency';
COMMENT ON COLUMN wos_grants.grant_agency_preferred IS 'Preferred agency flag';
COMMENT ON COLUMN wos_grants.alt_agency_count IS 'Alternate agency count';
COMMENT ON COLUMN wos_grants.grant_id_count IS 'Grant ID count';
COMMENT ON COLUMN wos_grants.country IS 'Grant country';
COMMENT ON COLUMN wos_grants.acronym IS 'Grant acronym';
COMMENT ON COLUMN wos_grants.investigator IS 'Principal investigator';

REVOKE ALL ON TABLE wos_grants FROM PUBLIC;
REVOKE ALL ON TABLE wos_grants FROM postgres;
GRANT ALL ON TABLE wos_grants TO postgres;

CREATE TABLE wos_grant_alt_agencies (
    id character varying NOT NULL,
    grant_id integer NOT NULL,
    alt_agency_id integer NOT NULL,
    alt_agency character varying,
    alt_agency_language character varying,
    alt_agency_preferred character varying
);
 ALTER TABLE ONLY wos_grant_alt_agencies
         ADD CONSTRAINT unique_grant_alt_agencies UNIQUE(id, grant_id, alt_agency_id);
 ALTER TABLE ONLY wos_grant_alt_agencies
         ADD CONSTRAINT fk_grant_alt_agencies_grants FOREIGN KEY (id, grant_id) REFERENCES wos_grants(id, grant_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_grant_alt_agencies IS 'Alternate grant agencies';
COMMENT ON COLUMN wos_grant_alt_agencies.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_grant_alt_agencies.grant_id IS 'Order of associated grant record (internal primary key)';
COMMENT ON COLUMN wos_grant_alt_agencies.alt_agency_id IS 'Order of alternate agency record (internal primary key)';
COMMENT ON COLUMN wos_grant_alt_agencies.alt_agency IS 'Alternate grant agency';
COMMENT ON COLUMN wos_grant_alt_agencies.alt_agency_language IS 'Lanugage of grant information';
COMMENT ON COLUMN wos_grant_alt_agencies.alt_agency_preferred IS 'Preferred agency flag';

REVOKE ALL ON TABLE wos_grant_alt_agencies FROM PUBLIC;
REVOKE ALL ON TABLE wos_grant_alt_agencies FROM postgres;
GRANT ALL ON TABLE wos_grant_alt_agencies TO postgres;

CREATE TABLE wos_grant_ids (
    id character varying NOT NULL,
    grant_id integer NOT NULL,
    id_id integer NOT NULL,
    grant_identifier character varying
);
 ALTER TABLE ONLY wos_grant_ids
         ADD CONSTRAINT unique_grant_ids UNIQUE(id, grant_id, id_id);
 ALTER TABLE ONLY wos_grant_ids
         ADD CONSTRAINT fk_grant_ids_grants FOREIGN KEY (id, grant_id) REFERENCES wos_grants(id, grant_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_grant_ids IS 'Alternate grant agencies';
COMMENT ON COLUMN wos_grant_ids.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_grant_ids.grant_id IS 'Order of associated grant record (internal primary key)';
COMMENT ON COLUMN wos_grant_ids.id_id IS 'Order of grant ID record (internal primary key)';
COMMENT ON COLUMN wos_grant_ids.grant_identifier IS 'Grant ID';

REVOKE ALL ON TABLE wos_grant_ids FROM PUBLIC;
REVOKE ALL ON TABLE wos_grant_ids FROM postgres;
GRANT ALL ON TABLE wos_grant_ids TO postgres;

CREATE TABLE wos_keywords (
    id character varying NOT NULL,
    keyword_id integer NOT NULL,
    keyword character varying,
    keyword_lang_id character varying
);
 ALTER TABLE ONLY wos_keywords
         ADD CONSTRAINT unique_keywords UNIQUE (id, keyword_id);
 ALTER TABLE ONLY wos_keywords
         ADD CONSTRAINT fk_keywords_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_keywords IS 'Keywords';
COMMENT ON COLUMN wos_keywords.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_keywords.keyword_id IS 'Order of keyword record (internal primary key)';
COMMENT ON COLUMN wos_keywords.keyword IS 'Keyword';
COMMENT ON COLUMN wos_keywords.keyword_lang_id IS 'Language of keyword';

REVOKE ALL ON TABLE wos_keywords FROM PUBLIC;
REVOKE ALL ON TABLE wos_keywords FROM postgres;
GRANT ALL ON TABLE wos_keywords TO postgres;

CREATE TABLE wos_abstracts (
    id character varying NOT NULL,
    abstract_id integer NOT NULL,
    abstract_lang_id character varying,
    abstract_type character varying,
    provider character varying,
    copyright_information character varying,
    paragraph_count character varying
);
 ALTER TABLE ONLY wos_abstracts
         ADD CONSTRAINT unique_abstracts UNIQUE (id, abstract_id);
 ALTER TABLE ONLY wos_abstracts
         ADD CONSTRAINT fk_abstracts_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_abstracts IS 'Abstracts';
COMMENT ON COLUMN wos_abstracts.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_abstracts.abstract_id IS 'Order of abstract record (internal primary key)';
COMMENT ON COLUMN wos_abstracts.abstract_type IS 'Abstract type';
COMMENT ON COLUMN wos_abstracts.abstract_lang_id IS 'Language of abstract';
COMMENT ON COLUMN wos_abstracts.provider IS 'Abstract provider';
COMMENT ON COLUMN wos_abstracts.paragraph_count IS 'Number of paragraphs in abstract';

REVOKE ALL ON TABLE wos_abstracts FROM PUBLIC;
REVOKE ALL ON TABLE wos_abstracts FROM postgres;
GRANT ALL ON TABLE wos_abstracts TO postgres;

CREATE TABLE wos_abstract_paragraphs (
    id character varying NOT NULL,
    abstract_id integer NOT NULL,
    paragraph_id integer NOT NULL,
    paragraph_label character varying,
    paragraph_text character varying
);
 ALTER TABLE ONLY wos_abstract_paragraphs
         ADD CONSTRAINT unique_abstract_paragraphs UNIQUE(id, abstract_id, paragraph_id);
 ALTER TABLE ONLY wos_abstract_paragraphs
         ADD CONSTRAINT fk_abstract_paragraphs_abstractss FOREIGN KEY (id, abstract_id) REFERENCES wos_abstracts(id, abstract_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_abstract_paragraphs IS 'Abstract Paragraphs';
COMMENT ON COLUMN wos_abstract_paragraphs.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_abstract_paragraphs.abstract_id IS 'Order of associated abstract record (internal primary key)';
COMMENT ON COLUMN wos_abstract_paragraphs.paragraph_id IS 'Order of abstract paragraph record (internal primary key)';
COMMENT ON COLUMN wos_abstract_paragraphs.paragraph_label IS 'Abstract paragraph label';
COMMENT ON COLUMN wos_abstract_paragraphs.paragraph_text IS 'Abstract paragraph text';

REVOKE ALL ON TABLE wos_abstract_paragraphs FROM PUBLIC;
REVOKE ALL ON TABLE wos_abstract_paragraphs FROM postgres;
GRANT ALL ON TABLE wos_abstract_paragraphs TO postgres;

CREATE TABLE wos_reviewed_languages (
    id character varying NOT NULL,
    language_id integer NOT NULL,
    language character varying NOT NULL,
    language_type character varying,
    status character varying
);
 ALTER TABLE ONLY wos_reviewed_languages
         ADD CONSTRAINT unique_reviewed_languages UNIQUE (id, language_id);
 ALTER TABLE ONLY wos_reviewed_languages
         ADD CONSTRAINT fk_reviewed_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reviewed_languages IS 'Item Record Language of Reviewed Work Data';
COMMENT ON COLUMN wos_reviewed_languages.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reviewed_languages.language_id IS 'Order of language record (internal primary key)';
COMMENT ON COLUMN wos_reviewed_languages.language IS 'Language';
COMMENT ON COLUMN wos_reviewed_languages.language_type IS 'Undocumented';
COMMENT ON COLUMN wos_reviewed_languages.status IS 'Undocumented';


REVOKE ALL ON TABLE wos_reviewed_languages FROM PUBLIC;
REVOKE ALL ON TABLE wos_reviewed_languages FROM postgres;
GRANT ALL ON TABLE wos_reviewed_languages TO postgres;

CREATE TABLE wos_reviewed_authors (
    id character varying NOT NULL,
    author_id integer NOT NULL,
    author character varying
);
 ALTER TABLE ONLY wos_reviewed_authors
         ADD CONSTRAINT unique_reviewed_authors UNIQUE (id, author_id);
 ALTER TABLE ONLY wos_reviewed_authors
         ADD CONSTRAINT fk_reviewed_authors_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reviewed_authors IS 'Item Record Authors of Reviewed Work Data';
COMMENT ON COLUMN wos_reviewed_authors.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reviewed_authors.author_id IS 'Order of author record (internal primary key)';
COMMENT ON COLUMN wos_reviewed_authors.author IS 'Reviewed work author';

REVOKE ALL ON TABLE wos_reviewed_authors FROM PUBLIC;
REVOKE ALL ON TABLE wos_reviewed_authors FROM postgres;
GRANT ALL ON TABLE wos_reviewed_authors TO postgres;

CREATE TABLE wos_reprint_addresses (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    addr_type character varying,
    addr_no character varying,
    full_address character varying,
    full_address_lang_id character varying,
    organization_count character varying,
    suborganization_count character varying,
    email_addr_count character varying,
    url_type character varying,
    url_date_info character varying,
    url_create_date character varying,
    url_revised_date character varying,
    url_cited_date character varying,
    url character varying,
    doi_count character varying,
    laboratory character varying,
    laboratory_lang_id character varying,
    street character varying,
    street_lang_id character varying,
    city character varying,
    city_lang_id character varying,
    province character varying,
    province_lang_id character varying,
    state character varying,
    state_lang_id character varying,
    country character varying,
    country_lang_id character varying,
    post_num character varying,
    post_num_lang_id character varying,
    name_count character varying
);

 ALTER TABLE ONLY wos_reprint_addresses
         ADD CONSTRAINT unique_reprint_addresses UNIQUE (id, addr_id);
 ALTER TABLE ONLY wos_reprint_addresses
         ADD CONSTRAINT fk_reprint_addresses_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_addresses is 'Item Record Reprint Address Data';
COMMENT ON COLUMN wos_reprint_addresses.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_addresses.addr_id IS 'Order of reprint_address record (internal primary key)';
COMMENT ON COLUMN wos_reprint_addresses.addr_type IS 'Address type';
COMMENT ON COLUMN wos_reprint_addresses.addr_no IS 'Address number. Used to link a specific author/publisher to a specific address.';
COMMENT ON COLUMN wos_reprint_addresses.full_address IS 'Full address';
COMMENT ON COLUMN wos_reprint_addresses.full_address_lang_id IS 'Language of full address data';
COMMENT ON COLUMN wos_reprint_addresses.organization_count IS 'Organizations count';
COMMENT ON COLUMN wos_reprint_addresses.suborganization_count IS 'Suborganizations count';
COMMENT ON COLUMN wos_reprint_addresses.email_addr_count IS 'Email address count';
COMMENT ON COLUMN wos_reprint_addresses.url_type IS 'URL type';
COMMENT ON COLUMN wos_reprint_addresses.url_date_info IS 'Unstructured URL date information';
COMMENT ON COLUMN wos_reprint_addresses.url_create_date IS 'URL create date';
COMMENT ON COLUMN wos_reprint_addresses.url_revised_date IS 'Last date the URL was revised';
COMMENT ON COLUMN wos_reprint_addresses.url_cited_date IS 'Date the URL was cited';
COMMENT ON COLUMN wos_reprint_addresses.url IS 'URL';
COMMENT ON COLUMN wos_reprint_addresses.doi_count IS 'Count of URL related DOIs';
COMMENT ON COLUMN wos_reprint_addresses.laboratory IS 'Laboratory';
COMMENT ON COLUMN wos_reprint_addresses.laboratory_lang_id IS 'Language of laboratory data';
COMMENT ON COLUMN wos_reprint_addresses.street IS 'Street address';
COMMENT ON COLUMN wos_reprint_addresses.street_lang_id IS 'Language of street address';
COMMENT ON COLUMN wos_reprint_addresses.city IS 'City';
COMMENT ON COLUMN wos_reprint_addresses.city_lang_id IS 'Language of city data';
COMMENT ON COLUMN wos_reprint_addresses.province IS 'Province';
COMMENT ON COLUMN wos_reprint_addresses.province_lang_id IS 'Language of province data';
COMMENT ON COLUMN wos_reprint_addresses.state IS 'U.S. state or Canadian province';
COMMENT ON COLUMN wos_reprint_addresses.state_lang_id IS 'Language of state data';
COMMENT ON COLUMN wos_reprint_addresses.country IS 'Country';
COMMENT ON COLUMN wos_reprint_addresses.country_lang_id IS 'Language of country data';
COMMENT ON COLUMN wos_reprint_addresses.post_num IS 'Postal number';
COMMENT ON COLUMN wos_reprint_addresses.post_num_lang_id IS 'Language of postal number';
COMMENT ON COLUMN wos_reprint_addresses.name_count IS 'Count of related names';

REVOKE ALL ON TABLE wos_reprint_addresses FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_addresses FROM postgres;
GRANT ALL ON TABLE wos_reprint_addresses TO postgres;

CREATE TABLE wos_reprint_address_names (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    name_id integer NOT NULL,
    seq_no character varying,
    addr_no_raw character varying,
    role character varying,
    reprint character varying,
    lang_id character varying,
    addr_no character varying,
    r_id character varying,
    r_id_tr character varying,
    orcid_id character varying,
    orcid_id_tr character varying,
    dais_id character varying,
    display character varying,
    display_name character varying,
    full_name character varying,
    wos_standard character varying,
    prefix character varying,
    first_name character varying,
    middle_name character varying,
    initials character varying,
    last_name character varying,
    suffix character varying
);
 ALTER TABLE ONLY wos_reprint_address_names
         ADD CONSTRAINT unique_reprint_address_names UNIQUE (id, addr_id, name_id);
 ALTER TABLE ONLY wos_reprint_address_names
         ADD CONSTRAINT fk_reprint_address_names_reprint_addresses FOREIGN KEY (id, addr_id) REFERENCES wos_reprint_addresses(id, addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_names IS 'Name Data from Reprint Addresses';
COMMENT ON COLUMN wos_reprint_address_names.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_names.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_names.name_id IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_reprint_address_names.role IS 'Role of the person or entity identified by the name';
COMMENT ON COLUMN wos_reprint_address_names.reprint IS 'Reprint author flag';
COMMENT ON COLUMN wos_reprint_address_names.lang_id IS 'Language of the name';
COMMENT ON COLUMN wos_reprint_address_names.addr_no IS 'Number that links a specific author to a specific address.';
COMMENT ON COLUMN wos_reprint_address_names.r_id IS 'ResearcherID identifier';
COMMENT ON COLUMN wos_reprint_address_names.r_id_tr IS 'ResearcherID identifier as captured by TR';
COMMENT ON COLUMN wos_reprint_address_names.orcid_id IS 'ORCID identifier';
COMMENT ON COLUMN wos_reprint_address_names.orcid_id_tr IS 'ORCID identifier as captured by TR';
COMMENT ON COLUMN wos_reprint_address_names.dais_id IS 'Distinct Author Identification System identifier';
COMMENT ON COLUMN wos_reprint_address_names.display IS 'Display flag. Used to indicate whether a name is displayed in full record.';
COMMENT ON COLUMN wos_reprint_address_names.display_name IS 'Name as displayed in record retrieved from database';
COMMENT ON COLUMN wos_reprint_address_names.full_name IS 'Full name';
COMMENT ON COLUMN wos_reprint_address_names.wos_standard IS 'Name in Web of Science standard format';
COMMENT ON COLUMN wos_reprint_address_names.prefix IS 'Name prefix';
COMMENT ON COLUMN wos_reprint_address_names.first_name IS 'First (given) name';
COMMENT ON COLUMN wos_reprint_address_names.middle_name IS 'Middle name';
COMMENT ON COLUMN wos_reprint_address_names.initials IS 'Initials';
COMMENT ON COLUMN wos_reprint_address_names.last_name IS 'Last name (surname)';
COMMENT ON COLUMN wos_reprint_address_names.suffix IS 'Name suffix';

REVOKE ALL ON TABLE wos_reprint_address_names FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_names FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_names TO postgres;

CREATE TABLE wos_reprint_address_names_email_addr (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    name_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_reprint_address_names_email_addr
         ADD CONSTRAINT unique_reprint_address_names_email_addr UNIQUE (id, addr_id, name_id, email_id);
 ALTER TABLE ONLY wos_reprint_address_names_email_addr
         ADD CONSTRAINT fk_reprint_address_names_email_addr_reprint_address_names FOREIGN KEY (id,addr_id, name_id) REFERENCES wos_reprint_address_names(id,addr_id, name_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_names_email_addr IS 'Email Address Data from Reprint Address Names';
COMMENT ON COLUMN wos_reprint_address_names_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_names_email_addr.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_names_email_addr.name_id IS 'Sequence number of associated name';
COMMENT ON COLUMN wos_reprint_address_names_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_reprint_address_names_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_reprint_address_names_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_names_email_addr FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_names_email_addr TO postgres;

CREATE TABLE wos_reprint_address_email_addr (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_reprint_address_email_addr
         ADD CONSTRAINT unique_reprint_address_email_addr UNIQUE (id, addr_id, email_id);
 ALTER TABLE ONLY wos_reprint_address_email_addr
         ADD CONSTRAINT fk_reprint_address_email_addr_reprint_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_email_addr IS 'Email Address Data from Reprint Address Names';
COMMENT ON COLUMN wos_reprint_address_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_email_addr.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_reprint_address_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_reprint_address_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_email_addr FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_email_addr TO postgres;

CREATE TABLE wos_reprint_address_zip (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    zip_id integer NOT NULL,
    zip character varying,
    lang_id character varying,
    location character varying
);
 ALTER TABLE ONLY wos_reprint_address_zip
         ADD CONSTRAINT unique_reprint_address_zip UNIQUE (id, addr_id, zip_id);
 ALTER TABLE ONLY wos_reprint_address_zip
         ADD CONSTRAINT fk_reprint_address_zip_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_zip IS 'Zip Code Data from Reprint Addresses';
COMMENT ON COLUMN wos_reprint_address_zip.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_zip.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_zip.zip IS 'Zip code or postal code';
COMMENT ON COLUMN wos_reprint_address_zip.lang_id IS 'Language of zip code data';
COMMENT ON COLUMN wos_reprint_address_zip.location IS 'Undocumented';

REVOKE ALL ON TABLE wos_reprint_address_zip FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_zip FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_zip TO postgres;

CREATE TABLE wos_reprint_address_organizations (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    org_id integer NOT NULL,
    organization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_reprint_address_organizations
         ADD CONSTRAINT unique_reprint_address_organizations UNIQUE (id, addr_id, org_id);
 ALTER TABLE ONLY wos_reprint_address_organizations
         ADD CONSTRAINT fk_reprint_address_organizations_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_organizations IS 'Organizations Data from Reprint Addresses';
COMMENT ON COLUMN wos_reprint_address_organizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_organizations.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_organizations.organization IS 'Organization';
COMMENT ON COLUMN wos_reprint_address_organizations.lang_id IS 'Language of organization data';

REVOKE ALL ON TABLE wos_reprint_address_organizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_organizations FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_organizations TO postgres;

CREATE TABLE wos_reprint_address_suborganizations (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    suborg_id integer NOT NULL,
    suborganization character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_reprint_address_suborganizations
         ADD CONSTRAINT unique_reprint_address_suborganizations UNIQUE (id, addr_id, suborg_id);
 ALTER TABLE ONLY wos_reprint_address_suborganizations
         ADD CONSTRAINT fk_reprint_address_suborganizations_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_suborganizations IS 'Suborganizations Data from Reprint Addresses';
COMMENT ON COLUMN wos_reprint_address_suborganizations.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_suborganizations.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_suborganizations.suborganization IS 'Suborganization';
COMMENT ON COLUMN wos_reprint_address_suborganizations.lang_id IS 'Language of suborganization data';

REVOKE ALL ON TABLE wos_reprint_address_suborganizations FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_suborganizations FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_suborganizations TO postgres;

CREATE TABLE wos_reprint_address_dois (
    id character varying NOT NULL,
    addr_id integer NOT NULL,
    doi_id integer NOT NULL,
    doi character varying
);
 ALTER TABLE ONLY wos_reprint_address_dois
         ADD CONSTRAINT unique_reprint_address_dois UNIQUE (id, addr_id, doi_id);
 ALTER TABLE ONLY wos_reprint_address_dois
         ADD CONSTRAINT fk_reprint_address_doi_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_reprint_address_dois IS 'DOI Data from Reprint Address URLs';
COMMENT ON COLUMN wos_reprint_address_dois.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_reprint_address_dois.addr_id IS 'Sequence number of associated address';
COMMENT ON COLUMN wos_reprint_address_dois.doi IS 'DOI';

REVOKE ALL ON TABLE wos_reprint_address_dois FROM PUBLIC;
REVOKE ALL ON TABLE wos_reprint_address_dois FROM postgres;
GRANT ALL ON TABLE wos_reprint_address_dois TO postgres;

CREATE TABLE wos_keywords_plus (
    id character varying NOT NULL,
    keyword_id integer NOT NULL,
    keyword_plus character varying,
    keyword_lang_id character varying
);
 ALTER TABLE ONLY wos_keywords_plus
         ADD CONSTRAINT unique_keywords_plus UNIQUE (id, keyword_id);
 ALTER TABLE ONLY wos_keywords_plus
         ADD CONSTRAINT fk_keywords_plus_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_keywords_plus IS 'Keywords Plus. Keywords generated from the titles of cited references';
COMMENT ON COLUMN wos_keywords_plus.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_keywords_plus.keyword_id IS 'Order of keyword record (internal primary key)';
COMMENT ON COLUMN wos_keywords_plus.keyword_plus IS 'Keyword Plus.';
COMMENT ON COLUMN wos_keywords_plus.keyword_lang_id IS 'Language of keyword';

REVOKE ALL ON TABLE wos_keywords_plus FROM PUBLIC;
REVOKE ALL ON TABLE wos_keywords_plus FROM postgres;
GRANT ALL ON TABLE wos_keywords_plus TO postgres;

CREATE TABLE wos_book_notes (
    id character varying NOT NULL,
    note_id integer NOT NULL,
    book_note character varying
);
 ALTER TABLE ONLY wos_book_notes
         ADD CONSTRAINT unique_book_notes UNIQUE (id, note_id);
 ALTER TABLE ONLY wos_book_notes
         ADD CONSTRAINT fk_book_notes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_book_notes IS 'Book notes';
COMMENT ON COLUMN wos_book_notes.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_book_notes.note_id IS 'Order of book note record (internal primary key)';
COMMENT ON COLUMN wos_book_notes.book_note IS 'Book note';

REVOKE ALL ON TABLE wos_book_notes FROM PUBLIC;
REVOKE ALL ON TABLE wos_book_notes FROM postgres;
GRANT ALL ON TABLE wos_book_notes TO postgres;

CREATE TABLE wos_book_desc (
    id character varying NOT NULL,
    desc_id integer NOT NULL,
    bk_binding character varying,
    bk_publisher character varying,
    amount character varying,
    currency character varying,
    price_desc character varying,
    price_volumes character varying,
    bk_prepay character varying,
    bk_ordering character varying
);
 ALTER TABLE ONLY wos_book_desc
         ADD CONSTRAINT unique_book_desc UNIQUE (id, desc_id);
 ALTER TABLE ONLY wos_book_desc
         ADD CONSTRAINT fk_book_desc_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_book_desc IS 'Book description';
COMMENT ON COLUMN wos_book_desc.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_book_desc.desc_id IS 'Order of book description record (internal primary key)';
COMMENT ON COLUMN wos_book_desc.bk_binding IS 'Book binding';
COMMENT ON COLUMN wos_book_desc.bk_publisher IS 'Book publisher';
COMMENT ON COLUMN wos_book_desc.amount IS 'Book price amount';
COMMENT ON COLUMN wos_book_desc.currency IS 'Currency of book price';
COMMENT ON COLUMN wos_book_desc.price_desc IS 'Book price description';
COMMENT ON COLUMN wos_book_desc.price_volumes IS 'Book price volumes - price of specified number of volumes';
COMMENT ON COLUMN wos_book_desc.bk_prepay IS 'Book prepayment information';
COMMENT ON COLUMN wos_book_desc.bk_ordering IS 'Book ordering information';

REVOKE ALL ON TABLE wos_book_desc FROM PUBLIC;
REVOKE ALL ON TABLE wos_book_desc FROM postgres;
GRANT ALL ON TABLE wos_book_desc TO postgres;

CREATE TABLE wos_chapters (
    id character varying NOT NULL,
    chapter_id integer NOT NULL,
    chapter character varying,
    chapter_uid character varying
);

 ALTER TABLE ONLY wos_chapters
         ADD CONSTRAINT unique_chapters UNIQUE (id, chapter_id);
 ALTER TABLE ONLY wos_chapters
         ADD CONSTRAINT fk_chapters_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_chapters IS 'Chapter List';
COMMENT ON COLUMN wos_chapters.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_chapters.chapter_id IS 'Order of chapter record (internal primary key)';
COMMENT ON COLUMN wos_chapters.chapter IS 'Chapter';
COMMENT ON COLUMN wos_chapters.chapter_uid IS 'UID';

REVOKE ALL ON TABLE wos_chapters FROM PUBLIC;
REVOKE ALL ON TABLE wos_chapters FROM postgres;
GRANT ALL ON TABLE wos_chapters TO postgres;

CREATE TABLE wos_dynamic_identifiers (
    id character varying NOT NULL,
    dynamic_id integer NOT NULL,
    identifier_type character varying,
    identifier_value character varying,
    self_ind character varying
);

 ALTER TABLE ONLY wos_dynamic_identifiers
         ADD CONSTRAINT unique_dynamic_identifiers UNIQUE (id, dynamic_id);
 ALTER TABLE ONLY wos_dynamic_identifiers
         ADD CONSTRAINT fk_dynamic_identifiers_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_dynamic_identifiers IS 'Dynamically-defined Identifier Data';
COMMENT ON COLUMN wos_dynamic_identifiers.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_dynamic_identifiers.dynamic_id IS 'Order of identifier record (internal primary key)';
COMMENT ON COLUMN wos_dynamic_identifiers.identifier_type IS 'Identifier type';
COMMENT ON COLUMN wos_dynamic_identifiers.identifier_value IS 'Identifier value';

REVOKE ALL ON TABLE wos_dynamic_identifiers FROM PUBLIC;
REVOKE ALL ON TABLE wos_dynamic_identifiers FROM postgres;
GRANT ALL ON TABLE wos_dynamic_identifiers TO postgres;


CREATE TABLE wos_contributors (
    id character varying NOT NULL,
    contrib_id integer NOT NULL,
    role character varying,
    reprint character varying,
    lang_id character varying,
    addr_no character varying,
    r_id character varying,
    r_id_tr character varying,
    orcid_id character varying,
    orcid_id_tr character varying,
    dais_id character varying,
    display character varying,
    seq_no character varying,
    display_name character varying,
    full_name character varying,
    wos_standard character varying,
    prefix character varying,
    first_name character varying,
    middle_name character varying,
    initials character varying,
    last_name character varying,
    suffix character varying
);
 ALTER TABLE ONLY wos_contributors
         ADD CONSTRAINT unique_contributors UNIQUE (id, contrib_id);
 ALTER TABLE ONLY wos_contributors
         ADD CONSTRAINT fk_contributors_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

COMMENT ON TABLE wos_contributors IS 'Contributors';
COMMENT ON COLUMN wos_contributors.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_contributors.contrib_id IS 'Sequence number of name in list';
COMMENT ON COLUMN wos_contributors.role IS 'Role of the person or entity identified by the name';
COMMENT ON COLUMN wos_contributors.reprint IS 'Reprint author flag';
COMMENT ON COLUMN wos_contributors.lang_id IS 'Language of the name';
COMMENT ON COLUMN wos_contributors.addr_no IS 'Number that links a specific author to a specific address.';
COMMENT ON COLUMN wos_contributors.r_id IS 'ResearcherID identifier';
COMMENT ON COLUMN wos_contributors.r_id_tr IS 'ResearcherID identifier as captured by TR';
COMMENT ON COLUMN wos_contributors.orcid_id IS 'ORCID identifier';
COMMENT ON COLUMN wos_contributors.orcid_id_tr IS 'ORCID identifier as captured by TR';
COMMENT ON COLUMN wos_contributors.dais_id IS 'Distinct Author Identification System identifier';
COMMENT ON COLUMN wos_contributors.display IS 'Display flag. Used to indicate whether a name is displayed in full record.';
COMMENT ON COLUMN wos_contributors.seq_no IS 'Sequence number.';
COMMENT ON COLUMN wos_contributors.display_name IS 'Name as displayed in record retrieved from database';
COMMENT ON COLUMN wos_contributors.full_name IS 'Full name';
COMMENT ON COLUMN wos_contributors.wos_standard IS 'Name in Web of Science standard format';
COMMENT ON COLUMN wos_contributors.prefix IS 'Name prefix';
COMMENT ON COLUMN wos_contributors.first_name IS 'First (given) name';
COMMENT ON COLUMN wos_contributors.middle_name IS 'Middle name';
COMMENT ON COLUMN wos_contributors.initials IS 'Initials';
COMMENT ON COLUMN wos_contributors.last_name IS 'Last name (surname)';
COMMENT ON COLUMN wos_contributors.suffix IS 'Name suffix';

REVOKE ALL ON TABLE wos_contributors FROM PUBLIC;
REVOKE ALL ON TABLE wos_contributors FROM postgres;
GRANT ALL ON TABLE wos_contributors TO postgres;

CREATE TABLE wos_contributor_email_addr (
    id character varying NOT NULL,
    contrib_id integer NOT NULL,
    email_id integer NOT NULL,
    email_addr character varying,
    lang_id character varying
);
 ALTER TABLE ONLY wos_contributor_email_addr
         ADD CONSTRAINT unique_contributor_email_addr UNIQUE (id, contrib_id, email_id);
 ALTER TABLE ONLY wos_contributor_email_addr
         ADD CONSTRAINT fk_contributor_addr_contributors FOREIGN KEY (id,contrib_id) REFERENCES wos_contributors(id,contrib_id) ON DELETE CASCADE;

COMMENT ON TABLE wos_contributor_email_addr IS 'Email Address Data from Contributor Names';
COMMENT ON COLUMN wos_contributor_email_addr.id IS 'Record ID (internal primary key)';
COMMENT ON COLUMN wos_contributor_email_addr.contrib_id IS 'Sequence number of associated name in list';
COMMENT ON COLUMN wos_contributor_email_addr.email_addr IS 'Email address';
COMMENT ON COLUMN wos_contributor_email_addr.lang_id IS 'Language of email address';

REVOKE ALL ON TABLE wos_contributor_email_addr FROM PUBLIC;
REVOKE ALL ON TABLE wos_contributor_email_addr FROM postgres;
GRANT ALL ON TABLE wos_contributor_email_addr TO postgres;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO wos_admin;
