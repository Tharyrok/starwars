CREATE TABLE IF NOT EXISTS `ftpgroup` (
  `groupname` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `members` varchar(255) COLLATE utf8_general_ci NOT NULL,
  KEY `groupname` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ProFTP group table';

CREATE TABLE IF NOT EXISTS `ftpuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `passwd` varchar(80) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` smallint(6) NOT NULL DEFAULT '5500',
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `homedir` varchar(255) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shell` varchar(16) COLLATE utf8_general_ci NOT NULL DEFAULT '/sbin/nologin',
  `count` int(11) NOT NULL DEFAULT '0',
  `accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ProFTP user table';
