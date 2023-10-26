SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kingdoms_war
-- ----------------------------
DROP TABLE IF EXISTS `kingdoms_war`;
CREATE TABLE `kingdoms_war` (
  `action` varbinary(124) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs ROW_FORMAT=DYNAMIC;
