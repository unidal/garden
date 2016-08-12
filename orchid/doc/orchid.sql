CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL COMMENT 'Document URI, i.e. /producer/usecase.uml',
  `uri` varchar(250) NOT NULL COMMENT 'Document URI, i.e. /producer/usecase.uml',
  `content` mediumblob NOT NULL COMMENT 'Document content',
  `creation_date` timestamp NOT NULL COMMENT 'Document creation date, i.e. 2016-07-03 10:34:00',
  `last_modified_date` timestamp NOT NULL COMMENT 'Document last modified date, i.e. 2016-07-03 10:34:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UIDX_Product_URI` (`product`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='用于存放实时小时报表信息';
