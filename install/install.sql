DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255)  NOT NULL,
  `description` text  NOT NULL,
  `public` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `entities`
-- 

DROP TABLE IF EXISTS `entities`;
CREATE TABLE IF NOT EXISTS `entities` (
  `id` bigint(20) NOT NULL auto_increment,
  `first_name` text ,
  `middle_name` text ,
  `last_name` text ,
  `email` text ,
  `institution` text ,
  `parent_id` bigint(20) default NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `entities_relations`
-- 

DROP TABLE IF EXISTS `entities_relations`;
CREATE TABLE IF NOT EXISTS `entities_relations` (
  `id` bigint(20) NOT NULL auto_increment,
  `entity_id` bigint(20) default NULL,
  `relation_id` bigint(20) default NULL,
  `relationship_id` bigint(20) default NULL,
  `type` varchar(50) NOT NULL,
  `time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `entity_relationships`
-- 

DROP TABLE IF EXISTS `entity_relationships`;
CREATE TABLE IF NOT EXISTS `entity_relationships` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` text ,
  `description` text ,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `entity_relationships` (`id`, `name`, `description`) VALUES (1, 'added', NULL),
(2, 'modified', NULL),
(3, 'favorite', NULL),
(4, 'collector', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `exhibits`
-- 

DROP TABLE IF EXISTS `exhibits`;
CREATE TABLE IF NOT EXISTS `exhibits` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255)  default NULL,
  `description` text ,
  `credits` text ,
  `featured` tinyint(1) default 0,
  `public` tinyint(1) default 0,
  `theme` varchar(30)  default NULL,
  `slug` varchar(30)  default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `public` (`public`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `file_meta_lookup`
-- 

DROP TABLE IF EXISTS `file_meta_lookup`;
CREATE TABLE IF NOT EXISTS `file_meta_lookup` (
  `id` bigint(20) NOT NULL auto_increment,
  `mime_type` varchar(255)  default NULL,
  `table_name` varchar(255)  default NULL,
  `table_class` varchar(255)  default NULL,
  PRIMARY KEY  (`id`),
  KEY `mime_type_idx` (`mime_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `files`
-- 

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` text  NOT NULL,
  `publisher` text  NOT NULL,
  `language` varchar(40)  NOT NULL default '',
  `relation` text  NOT NULL,
  `coverage` text  NOT NULL,
  `rights` text  NOT NULL,
  `description` text  NOT NULL,
  `source` text  NOT NULL,
  `subject` text  NOT NULL,
  `creator` text  NOT NULL,
  `additional_creator` text  NOT NULL,
  `date` date default NULL,
  `added` datetime default NULL,
  `modified` datetime default NULL,
  `item_id` bigint(20) default NULL,
  `format` text  NOT NULL,
  `transcriber` text  NOT NULL,
  `producer` text  NOT NULL,
  `render_device` text  NOT NULL,
  `render_details` text  NOT NULL,
  `capture_date` datetime default NULL,
  `capture_device` text  NOT NULL,
  `capture_details` text  NOT NULL,
  `change_history` text  NOT NULL,
  `watermark` text  NOT NULL,
  `authentication` text  NOT NULL,
  `encryption` text  NOT NULL,
  `compression` text  NOT NULL,
  `post_processing` text  NOT NULL,
  `archive_filename` text  NOT NULL,
  `fullsize_filename` text ,
  `original_filename` text  NOT NULL,
  `thumbnail_filename` text ,
  `size` bigint(20) NOT NULL default '0',
  `mime_browser` text ,
  `mime_os` text ,
  `type_os` text ,
  `lookup_id` bigint(20) unsigned default NULL,
  `has_derivative_image` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `item_idx` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `files_images`
-- 

DROP TABLE IF EXISTS `files_images`;
CREATE TABLE IF NOT EXISTS `files_images` (
  `id` bigint(20) NOT NULL auto_increment,
  `width` bigint(20) default NULL,
  `height` bigint(20) default NULL,
  `bit_depth` bigint(20) default NULL,
  `channels` bigint(20) default NULL,
  `exif_string` text ,
  `exif_array` text ,
  `iptc_string` text ,
  `iptc_array` text ,
  `file_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `files_videos`
-- 

DROP TABLE IF EXISTS `files_videos`;
CREATE TABLE IF NOT EXISTS `files_videos` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `bitrate` smallint(5) unsigned default NULL,
  `duration` bigint(20) unsigned default NULL,
  `sample_rate` int(10) unsigned default NULL,
  `codec` text ,
  `file_id` bigint(20) unsigned NOT NULL,
  `width` int(10) unsigned default NULL,
  `height` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Table structure for table `items`
-- 

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255)  NOT NULL default '',
  `publisher` text  NOT NULL,
  `language` text  NOT NULL,
  `relation` text  NOT NULL,
  `spatial_coverage` text  NOT NULL,
  `rights` text  NOT NULL,
  `description` text  NOT NULL,
  `source` text  NOT NULL,
  `subject` text  NOT NULL,
  `creator` text  NOT NULL,
  `additional_creator` text  NOT NULL,
  `date` date default NULL,
  `type_id` bigint(20) default NULL,
  `collection_id` bigint(20) default NULL,
  `contributor` text  NOT NULL,
  `rights_holder` text  NOT NULL,
  `provenance` text  NOT NULL,
  `citation` text  NOT NULL,
  `temporal_coverage_start` date default NULL,
  `temporal_coverage_end` date default NULL,
  `featured` tinyint(1) NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `featured_idx` (`featured`),
  KEY `public_idx` (`public`),
  KEY `type_idx` (`type_id`),
  KEY `coll_idx` (`collection_id`),
  FULLTEXT KEY `search_all_idx` (`title`,`publisher`,`language`,`relation`,`spatial_coverage`,`rights`,`description`,`source`,`subject`,`creator`,`additional_creator`,`contributor`,`rights_holder`,`provenance`,`citation`),
  FULLTEXT KEY `title_search_idx` (`title`),
  FULLTEXT KEY `publisher_search_idx` (`publisher`),
  FULLTEXT KEY `language_search_idx` (`language`),
  FULLTEXT KEY `relation_search_idx` (`relation`),
  FULLTEXT KEY `spatial_coverage_search_idx` (`spatial_coverage`),
  FULLTEXT KEY `rights_search_idx` (`rights`),
  FULLTEXT KEY `description_search_idx` (`description`),
  FULLTEXT KEY `source_search_idx` (`source`),
  FULLTEXT KEY `subject_search_idx` (`subject`),
  FULLTEXT KEY `creator_search_idx` (`creator`),
  FULLTEXT KEY `additional_creator_search_idx` (`additional_creator`),
  FULLTEXT KEY `contributor_search_idx` (`contributor`),
  FULLTEXT KEY `rights_holder_search_idx` (`rights_holder`),
  FULLTEXT KEY `provenance_search_idx` (`provenance`),
  FULLTEXT KEY `citation_search_idx` (`citation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `items_section_pages`
-- 

DROP TABLE IF EXISTS `items_section_pages`;
CREATE TABLE IF NOT EXISTS `items_section_pages` (
  `id` bigint(20) NOT NULL auto_increment,
  `item_id` bigint(20) default NULL,
  `page_id` bigint(20) NOT NULL,
  `text` text ,
  `entry_order` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `metafields`
-- 

DROP TABLE IF EXISTS `metafields`;
CREATE TABLE IF NOT EXISTS `metafields` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255)  NOT NULL,
  `description` text  NOT NULL,
  `plugin_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `plugin_idx` (`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `metatext`
-- 

DROP TABLE IF EXISTS `metatext`;
CREATE TABLE IF NOT EXISTS `metatext` (
  `id` bigint(20) NOT NULL auto_increment,
  `item_id` bigint(20) unsigned NOT NULL,
  `metafield_id` bigint(20) unsigned NOT NULL,
  `text` text  NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `item_idx` (`item_id`),
  KEY `metafield_idx` (`metafield_id`),
  FULLTEXT KEY `metatext_search` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `options`
-- 

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(30)  NOT NULL,
  `value` text ,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `plugins`
-- 

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255)  NOT NULL,
  `description` text  NOT NULL,
  `author` text  NOT NULL,
  `config` text ,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `routes`
-- 

DROP TABLE IF EXISTS `routes`;
CREATE TABLE IF NOT EXISTS `routes` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` text ,
  `route` text ,
  `defaults` text ,
  `path` text ,
  `added` datetime default NULL,
  `static` tinyint(1) default NULL,
  `active` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `static_idx` (`active`,`static`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `section_pages`
-- 

DROP TABLE IF EXISTS `section_pages`;
CREATE TABLE IF NOT EXISTS `section_pages` (
  `id` bigint(20) NOT NULL auto_increment,
  `section_id` bigint(20) NOT NULL,
  `layout` varchar(255)  default NULL,
  `page_order` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `sections`
-- 

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255)  default NULL,
  `description` text ,
  `exhibit_id` bigint(20) NOT NULL,
  `section_order` bigint(20) NOT NULL,
  `slug` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `tags`
-- 

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255)  default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
DROP TABLE IF EXISTS `taggings`;
CREATE TABLE `taggings` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `relation_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `type` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tag` (`relation_id`,`tag_id`,`entity_id`,`type`)
) ENGINE=MyISAM;


-- 
-- Table structure for table `types`
-- 

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255)  NOT NULL,
  `description` text  NOT NULL,
  `plugin_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `types_metafields`
-- 

DROP TABLE IF EXISTS `types_metafields`;
CREATE TABLE `types_metafields` (
  `id` bigint(20) NOT NULL auto_increment,
  `type_id` bigint(20) NOT NULL,
  `metafield_id` bigint(20) NOT NULL,
  `plugin_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type_metafield` (`type_id`,`metafield_id`),
  KEY `type_idx` (`type_id`),
  KEY `metafield_idx` (`metafield_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(30)  NOT NULL,
  `password` varchar(40)  NOT NULL,
  `active` tinyint(1) NOT NULL,
  `role` varchar(40)  NOT NULL default 'default',
  `entity_id` bigint(20) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `active_idx` (`active`),
  KEY `entity_id` (`entity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `users_activations`
-- 

DROP TABLE IF EXISTS `users_activations`;
CREATE TABLE IF NOT EXISTS `users_activations` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL,
  `url` varchar(100)  default NULL,
  `added` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Types and Metafields

INSERT INTO `types` (id, name, description) VALUES (1, 'Document', 'A resource containing textual data.  Note that facsimiles or images of texts are still of the genre text.');
INSERT INTO `types` (id, name, description) VALUES (3, 'Moving Image', 'A series of visual representations that, when shown in succession, impart an impression of motion.');
INSERT INTO `types` (id, name, description) VALUES (4, 'Oral History', 'A resource containing historical information obtained in interviews with persons having firsthand knowledge.');
INSERT INTO `types` (id, name, description) VALUES (5, 'Sound', 'A resource whose content is primarily intended to be rendered as audio.');
INSERT INTO `types` (id, name, description) VALUES (6, 'Still Image', 'A static visual representation. Examples of still images are: paintings, drawings, graphic designs, plans and maps.  Recommended best practice is to assign the type "text" to images of textual materials.');
INSERT INTO `types` (id, name, description) VALUES (7, 'Website', 'A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).');
INSERT INTO `types` (id, name, description) VALUES (8, 'Event', 'A non-persistent, time-based occurrence.  Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.');



-- Additions
INSERT INTO `types` (id, name, description) VALUES (9, 'Email', 'A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.');
INSERT INTO `types` (id, name, description) VALUES (10, 'Lesson Plan', 'Instructional materials.');
INSERT INTO `types` (id, name, description) VALUES (11, 'Hyperlink', 'Title, URL, Description or annotation.');
INSERT INTO `types` (id, name, description) VALUES (12, 'Person', 'An individual, biographical data, birth and death, etc.');
INSERT INTO `types` (id, name, description) VALUES (13, 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.');

INSERT INTO `metafields` (id, name, description) VALUES (1, 'Text', 'Any textual data included in the document.');
INSERT INTO `metafields` (id, name, description) VALUES (2, 'Interviewer', 'The person(s) performing the interview.');
INSERT INTO `metafields` (id, name, description) VALUES (3, 'Interviewee', 'The person(s) being interviewed.');
INSERT INTO `metafields` (id, name, description) VALUES (4, 'Location', 'The location of the interview.');
INSERT INTO `metafields` (id, name, description) VALUES (5, 'Transcription', 'Any written text transcribed from a sound.');
INSERT INTO `metafields` (id, name, description) VALUES (6, 'Local URL', 'The URL of the local directory containing all assets of the website.');

-- Additions
-- Document
INSERT INTO `metafields` (id, name, description) VALUES (7, 'Original Format', '');

-- Still Image
INSERT INTO `metafields` (id, name, description) VALUES (10, 'Physical Dimensions', '');

-- Moving Image
INSERT INTO `metafields` (id, name, description) VALUES (11, 'Duration', '');
INSERT INTO `metafields` (id, name, description) VALUES (12, 'Compression', '');
INSERT INTO `metafields` (id, name, description) VALUES (13, 'Producer', '');
INSERT INTO `metafields` (id, name, description) VALUES (14, 'Director', '');

-- Sound
INSERT INTO `metafields` (id, name, description) VALUES (15, 'Bit Rate/Frequency', '');

-- Oral History
INSERT INTO `metafields` (id, name, description) VALUES (16, 'Time Summary', '');

-- Email
INSERT INTO `metafields` (id, name, description) VALUES (17, 'Email Body', 'The main body of the email, including all replied and forwarded text and headers.');
INSERT INTO `metafields` (id, name, description) VALUES (18, 'Subject Line', 'The content of the subject line of the email.');
INSERT INTO `metafields` (id, name, description) VALUES (19, 'From', 'The name and email address of the person sending the email.');
INSERT INTO `metafields` (id, name, description) VALUES (20, 'To', 'The name(s) and email address(es) of the person to whom the email was sent.');
INSERT INTO `metafields` (id, name, description) VALUES (21, 'CC', 'The name(s) and email address(es) of the person to whom the email was carbon copied.');
INSERT INTO `metafields` (id, name, description) VALUES (22, 'BCC', 'The name(s) and email address(es) of the person to whom the email was blind carbon copied.');
INSERT INTO `metafields` (id, name, description) VALUES (23, 'Number of Attachments', 'The number of attachments to the email.');

-- Lesson Plan
INSERT INTO `metafields` (id, name, description) VALUES (24, 'Standards', '');
INSERT INTO `metafields` (id, name, description) VALUES (25, 'Objectives', '');
INSERT INTO `metafields` (id, name, description) VALUES (26, 'Materials', '');
INSERT INTO `metafields` (id, name, description) VALUES (27, 'Lesson Plan Text', '');

-- Hyperlink
INSERT INTO `metafields` (id, name, description) VALUES (28, 'URL', '');

-- Event
INSERT INTO `metafields` (id, name, description) VALUES (29, 'Event Type', '');
INSERT INTO `metafields` (id, name, description) VALUES (30, 'Participants', '');

-- Person
INSERT INTO `metafields` (id, name, description) VALUES (31, 'Birth Date', '');
INSERT INTO `metafields` (id, name, description) VALUES (32, 'Birthplace', '');
INSERT INTO `metafields` (id, name, description) VALUES (33, 'Death Date', '');
INSERT INTO `metafields` (id, name, description) VALUES (34, 'Occupation', '');
INSERT INTO `metafields` (id, name, description) VALUES (35, 'Biographical Text', '');
INSERT INTO `metafields` (id, name, description) VALUES (36, 'Bibliography', '');

-- Insert the types_metafields relationships

INSERT INTO `types_metafields` (`id`, `type_id`, `metafield_id`) VALUES (1, 1, 7),
(2, 1, 1),
(3, 6, 7),
(6, 6, 10),
(7, 3, 7),
(8, 3, 11),
(9, 3, 12),
(10, 3, 13),
(11, 3, 14),
(12, 3, 5),
(13, 5, 7),
(14, 5, 11),
(15, 5, 15),
(16, 5, 5),
(17, 4, 7),
(18, 4, 11),
(19, 4, 15),
(20, 4, 5),
(21, 4, 2),
(22, 4, 3),
(23, 4, 4),
(24, 4, 16),
(25, 9, 17),
(26, 9, 18),
(27, 9, 20),
(28, 9, 19),
(29, 9, 21),
(30, 9, 22),
(31, 9, 23),
(32, 10, 24),
(33, 10, 25),
(34, 10, 26),
(35, 10, 11),
(36, 10, 27),
(37, 7, 6),
(38, 11, 28),
(39, 8, 29),
(40, 8, 30),
(41, 8, 11),
(42, 12, 31),
(43, 12, 32),
(44, 12, 33),
(45, 12, 34),
(46, 12, 35),
(47, 12, 36);


INSERT INTO `file_meta_lookup` ( `id` , `mime_type` , `table_name` , `table_class` ) 
VALUES 
(NULL , 'image/bmp', 'files_images', 'FilesImages'), 
(NULL , 'image/gif', 'files_images', 'FilesImages'), 
(NULL , 'image/ief', 'files_images', 'FilesImages'), 
(NULL , 'image/jpeg', 'files_images', 'FilesImages'), 
(NULL , 'image/pict', 'files_images', 'FilesImages'), 
(NULL , 'image/pjpeg', 'files_images', 'FilesImages'), 
(NULL , 'image/png', 'files_images', 'FilesImages'), 
(NULL , 'image/tiff', 'files_images', 'FilesImages'), 
(NULL , 'image/vnd.rn-realflash', 'files_images', 'FilesImages'), 
(NULL , 'image/vnd.rn-realpix', 'files_images', 'FilesImages'), 
(NULL , 'image/vnd.wap.wbmp', 'files_images', 'FilesImages'), 
(NULL , 'image/x-icon', 'files_images', 'FilesImages'), 
(NULL , 'image/x-jg', 'files_images', 'FilesImages'), 
(NULL , 'image/x-jps', 'files_images', 'FilesImages'), 
(NULL , 'image/x-niff', 'files_images', 'FilesImages'), 
(NULL , 'image/x-pcx', 'files_images', 'FilesImages'), 
(NULL , 'image/x-pict', 'files_images', 'FilesImages'), 
(NULL , 'image/x-quicktime', 'files_images', 'FilesImages'), 
(NULL , 'image/x-rgb', 'files_images', 'FilesImages'), 
(NULL , 'image/x-tiff', 'files_images', 'FilesImages'), 
(NULL , 'image/x-windows-bmp', 'files_images', 'FilesImages'), 
(NULL , 'image/x-xbitmap', 'files_images', 'FilesImages'), 
(NULL , 'image/x-xbm', 'files_images', 'FilesImages'), 
(NULL , 'image/x-xpixmap', 'files_images', 'FilesImages'), 
(NULL , 'image/x-xwd', 'files_images', 'FilesImages'), 
(NULL , 'image/x-xwindowdump', 'files_images', 'FilesImages');

INSERT INTO `file_meta_lookup` ( `id` , `mime_type` , `table_name` , `table_class` ) 
VALUES
(NULL , 'video/x-msvideo', 'files_videos', 'FilesVideos'), 
(NULL , 'video/avi', 'files_videos', 'FilesVideos'), 
(NULL , 'video/msvideo', 'files_videos', 'FilesVideos'), 
(NULL , 'video/x-mpeg', 'files_videos', 'FilesVideos'), 
(NULL , 'video/x-ms-asf', 'files_videos', 'FilesVideos'), 
(NULL , 'video/mpeg', 'files_videos', 'FilesVideos'), 
(NULL , 'video/quicktime', 'files_videos', 'FilesVideos'),
(NULL , 'video/x-ms-wmv', 'files_videos', 'FilesVideos');