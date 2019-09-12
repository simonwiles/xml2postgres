ALTER TABLE ONLY wos_summary
        ADD CONSTRAINT wos_summary_pk PRIMARY KEY (id);

ALTER TABLE ONLY wos_page
        ADD CONSTRAINT unique_page_summary UNIQUE (id, page_id);
ALTER TABLE ONLY wos_page
        ADD CONSTRAINT fk_page_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_titles
        ADD CONSTRAINT unique_titles_summary UNIQUE (id, title_id);
ALTER TABLE ONLY wos_titles
        ADD CONSTRAINT fk_titles_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_summary_names
        ADD CONSTRAINT unique_summary_names UNIQUE (id, name_id);
ALTER TABLE ONLY wos_summary_names
        ADD CONSTRAINT fk_summary_names_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_summary_names_email_addr
        ADD CONSTRAINT unique_summary_names_email_addr UNIQUE (id, name_id, email_id);
ALTER TABLE ONLY wos_summary_names_email_addr
        ADD CONSTRAINT fk_summary_addr_summary_names FOREIGN KEY (id,name_id) REFERENCES wos_summary_names(id,name_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_doctypes
        ADD CONSTRAINT unique_doctypes UNIQUE (id, doctype_id);
ALTER TABLE ONLY wos_doctypes
        ADD CONSTRAINT fk_doctypes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_normalized_doctypes
        ADD CONSTRAINT unique_normalized_doctypes UNIQUE (id, doctype_id);
ALTER TABLE ONLY wos_normalized_doctypes
        ADD CONSTRAINT fk_normalized_doctypes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_languages
        ADD CONSTRAINT unique_languages UNIQUE (id, language_id);
ALTER TABLE ONLY wos_languages
        ADD CONSTRAINT fk_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_normalized_languages
        ADD CONSTRAINT unique_normalized_languages UNIQUE (id, language_id);
ALTER TABLE ONLY wos_normalized_languages
        ADD CONSTRAINT fk_normalized_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conference
        ADD CONSTRAINT unique_conference UNIQUE (id, conf_record_id);
ALTER TABLE ONLY wos_conference
        ADD CONSTRAINT fk_conference_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conf_info
        ADD CONSTRAINT unique_conf_info UNIQUE (id, conf_record_id, info_id);
ALTER TABLE ONLY wos_conf_info
        ADD CONSTRAINT fk_conf_info_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conf_title
        ADD CONSTRAINT unique_conf_title UNIQUE (id, conf_record_id, title_id);
ALTER TABLE ONLY wos_conf_title
        ADD CONSTRAINT fk_conf_title_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conf_date
        ADD CONSTRAINT unique_conf_date UNIQUE (id, conf_record_id, date_id);
ALTER TABLE ONLY wos_conf_date
        ADD CONSTRAINT fk_conf_date_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conf_location
        ADD CONSTRAINT unique_conf_location UNIQUE (id, conf_record_id, location_id);
ALTER TABLE ONLY wos_conf_location
        ADD CONSTRAINT fk_conf_location_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_conf_sponsor
        ADD CONSTRAINT unique_conf_sponsor UNIQUE (id, conf_record_id, sponsor_id);
ALTER TABLE ONLY wos_conf_sponsor
        ADD CONSTRAINT fk_conf_sponsor_conference FOREIGN KEY (id,conf_record_id) REFERENCES wos_conference(id,conf_record_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher
        ADD CONSTRAINT unique_publisher UNIQUE (id, publisher_id);
ALTER TABLE ONLY wos_publisher
        ADD CONSTRAINT fk_publisher_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_names
        ADD CONSTRAINT unique_publisher_names UNIQUE (id, publisher_id, name_id);
ALTER TABLE ONLY wos_publisher_names
        ADD CONSTRAINT fk_publisher_names_publisher FOREIGN KEY (id, publisher_id) REFERENCES wos_publisher(id, publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_names_email_addr
        ADD CONSTRAINT unique_publisher_names_email_addr UNIQUE (id, publisher_id, name_id, email_id);
ALTER TABLE ONLY wos_publisher_names_email_addr
        ADD CONSTRAINT fk_publisher_names_addr_publisher_names FOREIGN KEY (id,publisher_id,name_id) REFERENCES wos_publisher_names(id,publisher_id,name_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_email_addr
        ADD CONSTRAINT unique_publisher_email_addr UNIQUE (id, publisher_id, email_id);
ALTER TABLE ONLY wos_publisher_email_addr
        ADD CONSTRAINT fk_publisher_addr_publishers FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_zip
        ADD CONSTRAINT unique_publisher_zip UNIQUE (id, publisher_id, zip_id);
ALTER TABLE ONLY wos_publisher_zip
        ADD CONSTRAINT fk_publisher_zip_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_organizations
        ADD CONSTRAINT unique_publisher_organizations UNIQUE (id, publisher_id, org_id);
ALTER TABLE ONLY wos_publisher_organizations
        ADD CONSTRAINT fk_publisher_organizations_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_suborganizations
        ADD CONSTRAINT unique_publisher_suborganizations UNIQUE (id, publisher_id, suborg_id);
ALTER TABLE ONLY wos_publisher_suborganizations
        ADD CONSTRAINT fk_publisher_suborganizations_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_publisher_dois
        ADD CONSTRAINT unique_publisher_dois UNIQUE (id, publisher_id, doi_id);
ALTER TABLE ONLY wos_publisher_dois
        ADD CONSTRAINT fk_publisher_doi_publisher FOREIGN KEY (id,publisher_id) REFERENCES wos_publisher(id,publisher_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_edition
        ADD CONSTRAINT unique_edition UNIQUE (id, edition_ctr);
ALTER TABLE ONLY wos_edition
    ADD CONSTRAINT fk_edition_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_references
        ADD CONSTRAINT unique_references UNIQUE (id, ref_id);
ALTER TABLE ONLY wos_references
    ADD CONSTRAINT fk_references_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_addresses
	ADD CONSTRAINT unique_addresses UNIQUE (id, addr_id);
ALTER TABLE ONLY wos_addresses
	ADD CONSTRAINT fk_addresses_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_names
        ADD CONSTRAINT unique_address_names UNIQUE (id, addr_id, name_id);
ALTER TABLE ONLY wos_address_names
        ADD CONSTRAINT fk_address_names_addresses FOREIGN KEY (id, addr_id) REFERENCES wos_addresses(id, addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_names_email_addr
        ADD CONSTRAINT unique_address_names_email_addr UNIQUE (id, addr_id, name_id, email_id);
ALTER TABLE ONLY wos_address_names_email_addr
        ADD CONSTRAINT fk_address_names_email_addr_address_names FOREIGN KEY (id,addr_id, name_id) REFERENCES wos_address_names(id,addr_id, name_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_email_addr
        ADD CONSTRAINT unique_address_email_addr UNIQUE (id, addr_id, email_id);
ALTER TABLE ONLY wos_address_email_addr
        ADD CONSTRAINT fk_address_email_addr_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_zip
        ADD CONSTRAINT unique_address_zip UNIQUE (id, addr_id, zip_id);
ALTER TABLE ONLY wos_address_zip
        ADD CONSTRAINT fk_address_zip_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_organizations
        ADD CONSTRAINT unique_address_organizations UNIQUE (id, addr_id, org_id);
ALTER TABLE ONLY wos_address_organizations
        ADD CONSTRAINT fk_address_organizations_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_suborganizations
        ADD CONSTRAINT unique_address_suborganizations UNIQUE (id, addr_id, suborg_id);
ALTER TABLE ONLY wos_address_suborganizations
        ADD CONSTRAINT fk_address_suborganizations_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_address_dois
        ADD CONSTRAINT unique_address_dois UNIQUE (id, addr_id, doi_id);
ALTER TABLE ONLY wos_address_dois
        ADD CONSTRAINT fk_address_doi_address FOREIGN KEY (id,addr_id) REFERENCES wos_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_headings
	ADD CONSTRAINT unique_headings UNIQUE (id, heading_id);
ALTER TABLE ONLY wos_headings
	ADD CONSTRAINT fk_headings_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_subheadings
        ADD CONSTRAINT unique_subheadings UNIQUE (id, subheading_id);
ALTER TABLE ONLY wos_subheadings
        ADD CONSTRAINT fk_subheadings_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_subjects
        ADD CONSTRAINT unique_subjects UNIQUE (id, subject_id);
ALTER TABLE ONLY wos_subjects
        ADD CONSTRAINT fk_subjects_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_grants
        ADD CONSTRAINT unique_grants UNIQUE (id, grant_id);
ALTER TABLE ONLY wos_grants
        ADD CONSTRAINT fk_grants_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_grant_alt_agencies
	ADD CONSTRAINT unique_grant_alt_agencies UNIQUE(id, grant_id, alt_agency_id);
ALTER TABLE ONLY wos_grant_alt_agencies
	ADD CONSTRAINT fk_grant_alt_agencies_grants FOREIGN KEY (id, grant_id) REFERENCES wos_grants(id, grant_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_grant_ids
        ADD CONSTRAINT unique_grant_ids UNIQUE(id, grant_id, id_id);
ALTER TABLE ONLY wos_grant_ids
        ADD CONSTRAINT fk_grant_ids_grants FOREIGN KEY (id, grant_id) REFERENCES wos_grants(id, grant_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_keywords
        ADD CONSTRAINT unique_keywords UNIQUE (id, keyword_id);
ALTER TABLE ONLY wos_keywords
        ADD CONSTRAINT fk_keywords_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_abstracts
        ADD CONSTRAINT unique_abstracts UNIQUE (id, abstract_id);
ALTER TABLE ONLY wos_abstracts
        ADD CONSTRAINT fk_abstracts_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_abstract_paragraphs
        ADD CONSTRAINT unique_abstract_paragraphs UNIQUE(id, abstract_id, paragraph_id);
ALTER TABLE ONLY wos_abstract_paragraphs
        ADD CONSTRAINT fk_abstract_paragraphs_abstractss FOREIGN KEY (id, abstract_id) REFERENCES wos_abstracts(id, abstract_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reviewed_languages
	ADD CONSTRAINT unique_reviewed_languages UNIQUE (id, language_id);
ALTER TABLE ONLY wos_reviewed_languages
        ADD CONSTRAINT fk_reviewed_languages_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reviewed_authors
        ADD CONSTRAINT unique_reviewed_authors UNIQUE (id, author_id);
ALTER TABLE ONLY wos_reviewed_authors
        ADD CONSTRAINT fk_reviewed_authors_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_addresses
        ADD CONSTRAINT unique_reprint_addresses UNIQUE (id, addr_id);
ALTER TABLE ONLY wos_reprint_addresses
        ADD CONSTRAINT fk_reprint_addresses_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_names
        ADD CONSTRAINT unique_reprint_address_names UNIQUE (id, addr_id, name_id);
ALTER TABLE ONLY wos_reprint_address_names
        ADD CONSTRAINT fk_reprint_address_names_reprint_addresses FOREIGN KEY (id, addr_id) REFERENCES wos_reprint_addresses(id, addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_names_email_addr
        ADD CONSTRAINT unique_reprint_address_names_email_addr UNIQUE (id, addr_id, name_id, email_id);
ALTER TABLE ONLY wos_reprint_address_names_email_addr
        ADD CONSTRAINT fk_reprint_address_names_email_addr_reprint_address_names FOREIGN KEY (id,addr_id, name_id) REFERENCES wos_reprint_address_names(id,addr_id, name_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_email_addr
        ADD CONSTRAINT unique_reprint_address_email_addr UNIQUE (id, addr_id, email_id);
ALTER TABLE ONLY wos_reprint_address_email_addr
        ADD CONSTRAINT fk_reprint_address_email_addr_reprint_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_zip
        ADD CONSTRAINT unique_reprint_address_zip UNIQUE (id, addr_id, zip_id);
ALTER TABLE ONLY wos_reprint_address_zip
        ADD CONSTRAINT fk_reprint_address_zip_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_organizations
        ADD CONSTRAINT unique_reprint_address_organizations UNIQUE (id, addr_id, org_id);
ALTER TABLE ONLY wos_reprint_address_organizations
        ADD CONSTRAINT fk_reprint_address_organizations_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_suborganizations
        ADD CONSTRAINT unique_reprint_address_suborganizations UNIQUE (id, addr_id, suborg_id);
ALTER TABLE ONLY wos_reprint_address_suborganizations
        ADD CONSTRAINT fk_reprint_address_suborganizations_addresses FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_reprint_address_dois
        ADD CONSTRAINT unique_reprint_address_dois UNIQUE (id, addr_id, doi_id);
ALTER TABLE ONLY wos_reprint_address_dois
        ADD CONSTRAINT fk_reprint_address_doi_reprint_address FOREIGN KEY (id,addr_id) REFERENCES wos_reprint_addresses(id,addr_id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_keywords_plus
        ADD CONSTRAINT unique_keywords_plus UNIQUE (id, keyword_id);
ALTER TABLE ONLY wos_keywords_plus
        ADD CONSTRAINT fk_keywords_plus_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_book_notes
        ADD CONSTRAINT unique_book_notes UNIQUE (id, note_id);
ALTER TABLE ONLY wos_book_notes
        ADD CONSTRAINT fk_book_notes_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_book_desc
        ADD CONSTRAINT unique_book_desc UNIQUE (id, desc_id);
ALTER TABLE ONLY wos_book_desc
        ADD CONSTRAINT fk_book_desc_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_chapters
        ADD CONSTRAINT unique_chapters UNIQUE (id, chapter_id);
ALTER TABLE ONLY wos_chapters
        ADD CONSTRAINT fk_chapters_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_dynamic_identifiers
        ADD CONSTRAINT unique_dynamic_identifiers UNIQUE (id, dynamic_id);
ALTER TABLE ONLY wos_dynamic_identifiers
        ADD CONSTRAINT fk_dynamic_identifiers_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_contributors
        ADD CONSTRAINT unique_contributors UNIQUE (id, contrib_id);
ALTER TABLE ONLY wos_contributors
        ADD CONSTRAINT fk_contributors_summary FOREIGN KEY (id) REFERENCES wos_summary(id) ON DELETE CASCADE;

ALTER TABLE ONLY wos_contributor_email_addr
        ADD CONSTRAINT unique_contributor_email_addr UNIQUE (id, contrib_id, email_id);
ALTER TABLE ONLY wos_contributor_email_addr
        ADD CONSTRAINT fk_contributor_addr_contributors FOREIGN KEY (id,contrib_id) REFERENCES wos_contributors(id,contrib_id) ON DELETE CASCADE;
