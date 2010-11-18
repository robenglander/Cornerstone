-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema Chime
--

CREATE DATABASE IF NOT EXISTS Chime;
USE Chime;

--
-- Definition of table `Chime`.`ChimeSchema`
--

DROP TABLE IF EXISTS `Chime`.`ChimeSchema`;
CREATE TABLE  `Chime`.`ChimeSchema` (
  `ID` varchar(40) NOT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `DISPLAYFORMAT` varchar(16) DEFAULT NULL,
  `COL` int(11) DEFAULT NULL,
  `DISPLAYCOL` int(11) DEFAULT NULL,
  `FIELDNAME` varchar(64) DEFAULT NULL,
  `FIELD_TYPEID` varchar(40) DEFAULT NULL,
  `MAXVALUES` int(11) DEFAULT '0',
  `FIELDDESCRIPTION` varchar(128) DEFAULT NULL,
  `PRIVATE` char(1) DEFAULT 'N',
  `USEREDITABLE` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IDX1` (`DATATYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`ChimeSchema`
--

/*!40000 ALTER TABLE `ChimeSchema` DISABLE KEYS */;
LOCK TABLES `ChimeSchema` WRITE;
INSERT INTO `Chime`.`ChimeSchema` VALUES  ('0ad79fa0bc5643cd9bb849e80df34a1000','800',NULL,7,NULL,'Local Authentication','1600',1,'Always use local password.','N','Y'),
 ('100','800',NULL,1,1,'Community','900',0,'Community membership','N','N'),
 ('1000','1300',NULL,1,1,'Search Criteria','200',1,'The search criteria','Y','N'),
 ('1300','1400',NULL,1,1,'File ID','200',1,'Image File','N','Y'),
 ('1400','1500',NULL,1,1,'File ID','200',1,'File Identifier','N','Y'),
 ('1500','1400',NULL,2,2,'Extension','200',1,'The default file extension','Y','N'),
 ('1600','1400',NULL,3,3,'MIME Type','200',1,'The detected MIME type','Y','N'),
 ('1700','1400',NULL,4,4,'Size','300',1,'The file size in bytes','Y','N'),
 ('1800','1500',NULL,2,2,'Extension','200',1,'Default file extension','Y','N'),
 ('1900','1500',NULL,3,3,'MIME Type','200',1,'The file mime type','Y','N'),
 ('200','800',NULL,3,3,'Home','2000',1,'Home Content','N','Y'),
 ('2000','1500',NULL,4,4,'Size','300',1,'The size of the file in bytes.','Y','N'),
 ('2100','1500',NULL,5,5,'File','200',1,'File contents','Y','N'),
 ('2200','1900',NULL,1,1,'Script','200',1,'The CAL Script','Y','N'),
 ('2300','2100',NULL,1,1,'Data Items','2000',0,'The data items in the folder.','N','Y'),
 ('300','800',NULL,4,4,'Favorites','2000',0,'Favorites','N','Y'),
 ('3d81192efe4f4c4084c4465a31e7a80a00','a97381dce3d44e139823679460d2a5f100',NULL,3,NULL,'Summary','1100',1,'A detailed summary of the event.','N','Y'),
 ('400','800',NULL,5,5,'Email Address','400',1,'Email Address','N','Y'),
 ('4266cbec26e84036b2f0a4f6c6813a3600','a97381dce3d44e139823679460d2a5f100',NULL,1,NULL,'Type','f574d270d05146ba9fe55bbbeacec8e300',1,'The type of event.','N','Y'),
 ('4c4fbffe70994ed0bf43c9f410efca6500','f574d270d05146ba9fe55bbbeacec8e300',NULL,3,NULL,'Retention Days','300',1,'The number of days to retain events of this type (0 means forever, and blank means never).','N','Y'),
 ('500','800',NULL,2,2,'Community Moderator','900',0,'Community Moderator','N','N'),
 ('600','900',NULL,1,1,'Favorites','2000',0,'Favorite Content','N','Y'),
 ('700','800',NULL,6,6,'Login ID','200',1,'The ID used to log into Chime.','N','N'),
 ('800','1200',NULL,1,1,'TemplateDefinition','200',1,'The template definition','Y','N'),
 ('9f349cf32a554c96993f2d02acb0a4e900','f574d270d05146ba9fe55bbbeacec8e300',NULL,2,NULL,'Periodic Notification','900',0,'Communities whose periodic notifications will include this event.','N','Y'),
 ('e6cb20e100b8453194c65107fdb9a27a00','f574d270d05146ba9fe55bbbeacec8e300',NULL,1,NULL,'Immediate Notification','900',0,'Communities that will be notified immediately when this event occurs.','N','Y'),
 ('f69e8e68c0e944e1af518dde22157e5500','a97381dce3d44e139823679460d2a5f100',NULL,2,NULL,'Related Content','2000',0,'Any Chime data that is somehow relevant to this event.','N','Y');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ChimeSchema` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance`;
CREATE TABLE  `Chime`.`DataInstance` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  `CREATED` timestamp NULL DEFAULT NULL,
  `CREATEDBY` varchar(40) DEFAULT NULL,
  `CREATEDBYNAME` varchar(254) DEFAULT NULL,
  `UPDATED` timestamp NULL DEFAULT NULL,
  `UPDATEDBY` varchar(40) DEFAULT NULL,
  `UPDATEDBYNAME` varchar(254) DEFAULT NULL,
  `AVERAGERATING` double DEFAULT NULL,
  `RATINGCOUNT` int(11) DEFAULT NULL,
  `COMMENTCOUNT` int(11) DEFAULT NULL,
  `TAGCOUNT` int(11) DEFAULT NULL,
  `COMMENTED` timestamp NULL DEFAULT NULL,
  `COMMENTEDBY` varchar(40) DEFAULT NULL,
  `COMMENTEDBYNAME` varchar(254) DEFAULT NULL,
  `REVIEWED` timestamp NULL DEFAULT NULL,
  `REVIEWEDBY` varchar(40) DEFAULT NULL,
  `REVIEWEDBYNAME` varchar(254) DEFAULT NULL,
  `REVIEWEDBYACTION` char(1) DEFAULT NULL,
  `TAGGED` timestamp NULL DEFAULT NULL,
  `TAGGEDBY` varchar(40) DEFAULT NULL,
  `TAGGEDBYNAME` varchar(254) DEFAULT NULL,
  `TAGGEDACTION` char(1) DEFAULT NULL,
  `POSITIVECOUNT` bigint(20) DEFAULT '0',
  `NEGATIVECOUNT` bigint(20) DEFAULT '0',
  `RANKING` int(11) DEFAULT '0',
  `INTVAL` bigint(20) DEFAULT '0',
  `INTVAL2` bigint(20) DEFAULT '0',
  `CHARVAL` varchar(254) DEFAULT NULL,
  `LOCKTYPE` varchar(4) DEFAULT 'NONE',
  `LOCKEDBY` varchar(40) DEFAULT NULL,
  `LOCKEDBYNAME` varchar(254) DEFAULT NULL,
  `LOCKED` timestamp NULL DEFAULT NULL,
  `backRef` varchar(40) DEFAULT NULL,
  `EXPIRATION` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance`
--

/*!40000 ALTER TABLE `DataInstance` DISABLE KEYS */;
LOCK TABLES `DataInstance` WRITE;
INSERT INTO `Chime`.`DataInstance` VALUES  ('100','Shape','A Chime Shape definition','2010-02-23 15:17:07','19900','system','2010-02-23 15:17:07','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYYYYYNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1000','Discussion','A user discussion thread.','2010-02-23 15:53:49','19900','system','2010-02-23 15:53:49','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYYYYYNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('100000300','Default Home Page','This is the default home page for Chime users.','2010-02-26 14:19:42','19800','admin','2010-02-26 14:19:42','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('100000400','Chime Home','Chime Home Page','2010-05-15 12:08:59','19800','admin','2010-05-15 12:08:59','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('100000500','About Chime Page','About Chime Page','2010-05-15 12:09:46','19800','admin','2010-05-15 12:09:46','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('100000600','Chime Help','Chime Help Page','2010-05-15 12:10:37','19800','admin','2010-05-15 12:10:37','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('10100','Admin Home Page','This is the Chime administrator home page.','2010-02-26 09:51:08','19800','admin','2010-02-26 09:51:08','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('10200','Chime Administrators','Members of this community have admin priveleges.','2010-02-26 10:33:11','19900','system','2010-02-26 10:33:11','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'NONE',NULL,NULL,NULL,NULL,NULL),
 ('1100','Rich Text','Richly formatted text (i.e. html)','2010-02-23 15:56:32','19900','system','2010-02-23 15:56:32','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1200','Dashboard','A page used to display various snippets of information using a rich set of available portlets.','2010-02-23 15:57:49','19900','system','2010-02-23 15:57:49','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYYNYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1300','Named Search','Saved search criteria that can be subsequently executed directly or used on a dashboard or in a script.','2010-02-23 15:58:52','19900','system','2010-08-08 14:17:58','19800','admin',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYNNYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1400','Image','An image file.','2010-02-23 16:00:44','19900','system','2010-02-23 16:00:44','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYYNYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1500','File','A document file of any type.','2010-02-23 16:01:16','19900','system','2010-02-23 16:01:16','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYNNYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1600','Yes/No','A boolean value.','2010-11-16 05:08:06','19900','system','2010-11-16 05:08:06','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('1900','Analytic','A script used to query and process Chime data','2010-02-25 16:10:38','19900','system','2010-02-25 16:10:38','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,50,0,0,'NYYYYYYYYYYYN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('19800','admin','The Chime administrator','2010-02-26 09:43:20','19900','system','2010-11-18 03:22:56','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'admin','NONE',NULL,NULL,NULL,NULL,NULL),
 ('19900','system','The Chime System','2010-02-23 15:12:56','19900','system','2010-11-18 03:22:09','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'xyz123','NONE',NULL,NULL,NULL,NULL,NULL),
 ('200','Text','Raw Text','2010-02-23 15:45:02','19900','system','2010-02-23 15:45:02','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('2000','Reference','A reference to any chime data instance','2010-02-23 15:45:02','19900','system','2010-02-23 15:45:02','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('2100','Folder','A folder is a collection of Chime data instance references.','2010-08-07 17:37:04','19900','system','2010-08-07 17:40:07','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYYYYYN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('2200','Date','A date value.','2010-08-07 17:37:04','19900','system','2010-08-07 17:40:07','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('2300','Timestamp','A date/time.','2010-08-07 17:37:04','19900','system','2010-08-07 17:40:07','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('300','Number','Numeric Data','2010-02-23 15:46:29','19900','system','2010-02-23 15:46:29','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('400','URL','A single URL','2010-02-23 15:47:22','19900','system','2010-02-23 15:47:22','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'YYNNNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('500','Review','A user\'s review of a Shape instance','2010-02-23 15:49:04','19900','system','2010-02-23 15:49:04','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYNYYNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('600','Comment','A user\'s comment about a Shape instance','2010-02-23 15:49:32','19900','system','2010-02-23 15:49:32','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NNNYNNNNNNNNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('700','Tag','A simple Shape instance that can be used to form ad hoc associations','2010-02-23 15:50:53','19900','system','2010-02-23 15:50:53','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYYYYYNNYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('800','User','A Chime user','2010-02-23 15:51:13','19900','system','2010-02-23 15:51:13','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNNNNYNYYYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('900','Community','A community of Chime users that share common interests.  The community may also provide for access control on associated data instances and shapes.','2010-02-23 15:53:19','19900','system','2010-02-23 15:53:19','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYYYYYYYYNN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('a97381dce3d44e139823679460d2a5f100','Event','A Chime event.','2010-08-08 11:58:52','19900','system','2010-08-08 11:58:52','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYNYYYYYYYYYN','NONE',NULL,NULL,NULL,NULL,NULL),
 ('f574d270d05146ba9fe55bbbeacec8e300','Event Type','The type of a Chime event.','2010-08-08 11:53:37','19900','system','2010-08-08 11:53:37','19900','system',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,'NYYYYYYYYYYYN','NONE',NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Attachment`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Attachment`;
CREATE TABLE  `Chime`.`DataInstance_Attachment` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `FILETYPE` char(1) DEFAULT NULL,
  `FILENUM` int(11) DEFAULT NULL,
  `FOREIGN_ID` varchar(40) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX3` (`INSTANCE_ID`,`FILETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Attachment`
--

/*!40000 ALTER TABLE `DataInstance_Attachment` DISABLE KEYS */;
LOCK TABLES `DataInstance_Attachment` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Attachment` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_History`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_History`;
CREATE TABLE  `Chime`.`DataInstance_History` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `USER_NAME` varchar(254) DEFAULT NULL,
  `EVENTTYPE` varchar(10) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `COMMENT` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `IDX5` (`TIMESTAMP`),
  KEY `IDX4` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_History`
--

/*!40000 ALTER TABLE `DataInstance_History` DISABLE KEYS */;
LOCK TABLES `DataInstance_History` WRITE;
INSERT INTO `Chime`.`DataInstance_History` VALUES  ('0b5fd1da7f4b4afeacf542662de69a9800','19900','19900','system','Modify','2010-11-17 11:53:46','Removed User : Local Authentication data'),
 ('0fc612ca319b42088955e07aaf7050ec00','19900','19900','system','Modify','2010-11-17 11:31:48','Added User : Local Authentication data'),
 ('100000200','100000200','19900','system','Create','2010-02-26 10:33:11',''),
 ('100000300','100000300','19800','admin','Create','2010-02-26 14:19:42',''),
 ('100000400','100000400','19800','admin','Create','2010-05-15 12:08:59',''),
 ('100000500','100000500','19800','admin','Create','2010-05-15 12:09:46',''),
 ('100000600','100000600','19800','admin','Create','2010-05-15 12:10:37',''),
 ('289ed7176b3d427d826ff7a2c10d2f4200','19900','19900','system','Modify','2010-11-17 11:25:31','Added User : Local Authentication data'),
 ('305b154753c945ad87796bfd03ecc2e600','19900','19900','system','Modify','2010-11-17 13:15:25','Added User : Local Authentication data'),
 ('3787e62fdae3492eb5b4a66079d1fa7e00','19900','19900','system','Modify','2010-11-17 11:23:01','Added User : Local Authentication data'),
 ('3efda7ced8f4401c97f38c2c5f04043600','19900','19900','system','Modify','2010-11-17 11:33:48','Removed User : Local Authentication data'),
 ('4392d790b06c416b84f1e2f1b11468a300','19900','19900','system','Modify','2010-11-17 04:28:13','Removed User : Local Authentication data'),
 ('44eef941183b4c19b7ee6af84ef875ed00','19900','19900','system','Modify','2010-11-17 11:53:46','Added User : Local Authentication data'),
 ('4a68ba296e0e4424900ab6bedf34710200','19900','19900','system','Modify','2010-11-17 06:29:24','Added User : Local Authentication data'),
 ('4bd6aa03530043d3b8311c3cbd0ed64100','19900','19900','system','Modify','2010-11-17 04:28:13','Added User : Local Authentication data'),
 ('553c9cc2a1c34e25b073e543bced94fd00','19900','19900','system','Modify','2010-11-17 13:15:25','Removed User : Local Authentication data'),
 ('641763bbdbcf41b68e84a619c6a6485f00','19900','19900','system','Modify','2010-11-17 11:34:04','Removed User : Local Authentication data'),
 ('6ba130fd9ee54c7e9330cafa182b87fb00','19800','19900','system','Modify','2010-11-18 03:22:56','Added User : Local Authentication data'),
 ('72498477ee934f47b74d1abc09b30fac00','1600','19900','system','Create','2010-11-16 05:08:07',''),
 ('7d6292fb8b9c4802ab7a20c253f7a7b000','19900','19900','system','Modify','2010-11-12 11:05:03','Added User : Community data'),
 ('8c633eb10b5849e6997bc76de59209f000','19900','19900','system','Modify','2010-11-17 13:15:16','Added User : Local Authentication data'),
 ('9681c4dad71441b6b2533f10918bbd7900','19800','19900','system','Modify','2010-11-18 03:22:42','Added User : Local Authentication data'),
 ('9f5ac485bce54635995d888e1cb2a48400','19800','19900','system','Modify','2010-11-18 03:22:56','Removed User : Local Authentication data'),
 ('a11908d84f1348d1b35118378d7232ba00','19900','19900','system','Modify','2010-11-17 04:22:19','Added User : Local Authentication data'),
 ('a176dd03b64741848dfd7e450e39be9000','19900','19900','system','Modify','2010-11-17 11:34:04','Added User : Local Authentication data'),
 ('a8b23fcdd74a4fd0af7e7c89998601c100','a97381dce3d44e139823679460d2a5f100','19900','system','Create','2010-08-08 11:58:52',''),
 ('abef7706e1934d38ac9102c108101ccf00','19900','19900','system','Modify','2010-11-17 11:10:31','Added User : Local Authentication data'),
 ('aeed454c7e674d829d0fad1a27d38ec700','19900','19900','system','Modify','2010-11-17 13:15:16','Removed User : Local Authentication data'),
 ('b034dd0759a24d59b54adf1f66d2ae6c00','19900','19900','system','Modify','2010-11-17 11:27:06','Added User : Local Authentication data'),
 ('b2340ab9740d4fdca3c503a1b539b0d500','19900','19900','system','Modify','2010-11-17 11:30:07','Added User : Local Authentication data'),
 ('bbaf778cfe514fc1ac1a2aa4d2a1bf0300','19800','19900','system','Modify','2010-11-12 11:05:20','Removed User : Community data'),
 ('bd8a3a40a419442ab18888ec7e735eb000','19800','19900','system','Modify','2010-11-18 03:22:31','Removed User : Community data'),
 ('be40a4e9e61b4f76a937db51ac4a8c9500','0a221845f6c9466f978def67cf999b8400','19900','system','Create','2010-08-07 17:37:05',''),
 ('be9194d7079742a9bcf3320a41fb148500','f574d270d05146ba9fe55bbbeacec8e300','19900','system','Create','2010-08-08 11:53:37',''),
 ('cd36cb70dc054addac9ed10be451ebbd00','19900','19900','system','Modify','2010-11-17 04:27:16','Removed User : Local Authentication data'),
 ('ce9e21d5bfa346eda669e1b4f6f7092000','19900','19900','system','Modify','2010-11-17 06:26:22','Added User : Local Authentication data'),
 ('d53f3e05a96a4cfca3236b3e6a98caa900','19900','19900','system','Modify','2010-11-17 11:31:49','Removed User : Local Authentication data'),
 ('dce11fd3b2664a3f9d0bbc636285109a00','19900','19900','system','Modify','2010-11-17 11:33:47','Added User : Local Authentication data'),
 ('dd0a52bbf6ab40639f28b2f367a39dd900','19900','19900','system','Modify','2010-11-18 03:22:09','Removed User : Community data'),
 ('f0e7876967894d6b8d91d2e8ced9c83200','19800','19900','system','Modify','2010-11-12 11:05:20','Added User : Community data'),
 ('f3695390d70647069863eb3689b7a1ff00','19900','19900','system','Modify','2010-11-17 11:12:20','Added User : Local Authentication data'),
 ('fab46f7c406548358c22e3825fd5097300','19800','19900','system','Modify','2010-11-18 03:22:31','Added User : Community data'),
 ('ff1f3828968e4ddda85b33962d6f271000','19900','19900','system','Modify','2010-11-17 04:27:16','Added User : Local Authentication data');
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_History` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Number`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Number`;
CREATE TABLE  `Chime`.`DataInstance_Number` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_COLUMN` int(11) DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX8` (`INSTANCE_ID`,`DATATYPE_ID`),
  KEY `IDX7` (`DATATYPE_ID`),
  KEY `IDX6` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Number`
--

/*!40000 ALTER TABLE `DataInstance_Number` DISABLE KEYS */;
LOCK TABLES `DataInstance_Number` WRITE;
INSERT INTO `Chime`.`DataInstance_Number` VALUES  ('1afcbc63d2a7474ba5c3ec4b9bd37b7a00','19800','800',7,1,'2010-11-18 03:22:56',1),
 ('d82fcccb1c4e43df828f0d7ca195069c00','19900','800',7,1,'2010-11-17 13:15:25',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Number` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Reference`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Reference`;
CREATE TABLE  `Chime`.`DataInstance_Reference` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_COLUMN` int(11) DEFAULT NULL,
  `FOREIGN_ID` varchar(40) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX9` (`INSTANCE_ID`),
  KEY `IDX11` (`INSTANCE_ID`,`DATATYPE_ID`),
  KEY `IDX10` (`DATATYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Reference`
--

/*!40000 ALTER TABLE `DataInstance_Reference` DISABLE KEYS */;
LOCK TABLES `DataInstance_Reference` WRITE;
INSERT INTO `Chime`.`DataInstance_Reference` VALUES  ('100','19800','800',4,'10100','2010-02-26 09:56:40',NULL),
 ('59677c51ac1a4aad9b41cd3bf6ca0a8f00','19800','800',1,'10200','2010-11-18 03:22:31',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Reference` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Text`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Text`;
CREATE TABLE  `Chime`.`DataInstance_Text` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_COLUMN` int(11) DEFAULT NULL,
  `VALUE` mediumtext,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX14` (`INSTANCE_ID`,`DATATYPE_ID`),
  KEY `IDX13` (`DATATYPE_ID`),
  KEY `IDX12` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Text`
--

/*!40000 ALTER TABLE `DataInstance_Text` DISABLE KEYS */;
LOCK TABLES `DataInstance_Text` WRITE;
INSERT INTO `Chime`.`DataInstance_Text` VALUES  ('100000100','100000300','1200',1,'{\"columns\":[{\"portlets\":[{\"properties\":[{\"content\":\"<div id=##QUOTE##portal##QUOTE##><div style=##QUOTE##text-align: center;##QUOTE##>Welcome to <span style=##QUOTE##font-weight: bold; font-style: italic;##QUOTE##>Chime</span>.&nbsp; This is the default page presented to users that have not saved any other pages in the favorites.<br><br><br></div></div>\"}],\"pinned\":false,\"type\":\"RichText\",\"showHeader\":true,\"id\":1}],\"width\":1.0}],\"id\":-1}','2010-02-26 14:20:54',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Text` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Timestamp`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Timestamp`;
CREATE TABLE  `Chime`.`DataInstance_Timestamp` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `DATATYPE_COLUMN` int(11) DEFAULT NULL,
  `VALUE` datetime DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX98` (`INSTANCE_ID`,`DATATYPE_ID`),
  KEY `IDX97` (`DATATYPE_ID`),
  KEY `IDX96` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Timestamp`
--

/*!40000 ALTER TABLE `DataInstance_Timestamp` DISABLE KEYS */;
LOCK TABLES `DataInstance_Timestamp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Timestamp` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_Type`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_Type`;
CREATE TABLE  `Chime`.`DataInstance_Type` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `DATATYPE_ID` varchar(40) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX16` (`DATATYPE_ID`),
  KEY `IDX15` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_Type`
--

/*!40000 ALTER TABLE `DataInstance_Type` DISABLE KEYS */;
LOCK TABLES `DataInstance_Type` WRITE;
INSERT INTO `Chime`.`DataInstance_Type` VALUES  ('000','19900','system','800','2010-02-24 12:45:29',NULL),
 ('100','100','Shape','100','2010-02-24 12:23:15',NULL),
 ('1000','1000','Discussion','100','2010-02-24 12:27:25',NULL),
 ('100000700','100000300','Default Home Page','1200',NULL,NULL),
 ('100000800','100000400','Chime Home','1200',NULL,NULL),
 ('100000900','100000500','About Chime Page','1200',NULL,NULL),
 ('100001000','100000600','Chime Help','1200',NULL,NULL),
 ('10100','10100','Admin Home Page','1200',NULL,NULL),
 ('10200','10200','Chime Administrators','900',NULL,NULL),
 ('1100','1100','Rich Text','100','2010-02-24 12:27:47',NULL),
 ('1200','1200','Portal Page','100','2010-02-24 12:28:02',NULL),
 ('1300','1300','Named Search','100','2010-02-24 12:28:34',NULL),
 ('1600','1600','Search Collection','100','2010-02-24 12:29:10',NULL),
 ('1700','1700','User Collection','100','2010-02-24 12:29:32',NULL),
 ('1800','1400','Image','100','2010-02-24 12:46:39',NULL),
 ('1900','1500','File','100','2010-02-24 12:46:48',NULL),
 ('200','200','Text','100','2010-02-24 12:23:38',NULL),
 ('2000','1900','Analytic','100','2010-02-25 16:16:56',NULL),
 ('2100','19800','admin','800','2010-02-26 09:46:24',NULL),
 ('2200','2000','Reference','100','2010-02-24 12:27:10',NULL),
 ('2300','2100','Folder','100','2010-02-24 12:25:19',NULL),
 ('2500','2200','Date','100','2010-02-24 12:25:19',NULL),
 ('2600','2300','Timestamp','100','2010-02-24 12:25:19',NULL),
 ('300','300','Number','100','2010-02-24 12:23:57',NULL),
 ('400','400','URL','100','2010-02-24 12:25:19',NULL),
 ('500','500','Review','100','2010-02-24 12:26:19',NULL),
 ('600','600','Comment','100','2010-02-24 12:26:33',NULL),
 ('700','700','Tag','100','2010-02-24 12:26:47',NULL),
 ('772caaead0074d7d96cb9e345ef95c9900','f574d270d05146ba9fe55bbbeacec8e300','Event Type','100','2010-02-24 12:26:47',NULL),
 ('800','800','User','100','2010-02-24 12:26:59',NULL),
 ('900','900','Community','100','2010-02-24 12:27:10',NULL),
 ('c3fbe45584614be99cb4d73653e0a2c600','1600','Yes/No','100',NULL,1),
 ('c9e6b95ca0574bb785803595884cfff200','a97381dce3d44e139823679460d2a5f100','Event','100','2010-02-24 12:26:47',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_Type` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_community`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_community`;
CREATE TABLE  `Chime`.`DataInstance_community` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `COMMUNITY_ID` varchar(40) DEFAULT NULL,
  `PERMISSIONS` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX18` (`COMMUNITY_ID`),
  KEY `IDX17` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_community`
--

/*!40000 ALTER TABLE `DataInstance_community` DISABLE KEYS */;
LOCK TABLES `DataInstance_community` WRITE;
INSERT INTO `Chime`.`DataInstance_community` VALUES  ('100000400','100000300','100','R'),
 ('100000500','100000300','10200','RU'),
 ('100000700','100000400','100','R'),
 ('100000800','100000400','10200','RU'),
 ('100000900','100000500','100','R'),
 ('100001000','100000500','10200','RU'),
 ('100001100','100000600','100','R'),
 ('100001200','100000600','10200','RU'),
 ('117b5c40e68746c8ac7cdda8ac1ce15800','f574d270d05146ba9fe55bbbeacec8e300','100','R'),
 ('375de15373f84fb89596771123a1465f00','2100','19900','RUC'),
 ('394982873d9144c29977c2bd9c6705c700','a97381dce3d44e139823679460d2a5f100','19900','RUC'),
 ('41a83e42d2784f2eae60bb40511f8f5a00','a97381dce3d44e139823679460d2a5f100','100','R'),
 ('4c344e4f6004447bab1b01bc3362eced00','1600','19900','RUC'),
 ('9e2dea1fe7c642369ecaa8419032231400','19500','100','R'),
 ('a44d448ef0e14d4894e4a55dd58a8db700','1600','100','R'),
 ('a9478ee88f6e40baba08ac02f43c1b8d00','f574d270d05146ba9fe55bbbeacec8e300','19900','RUC'),
 ('d8b6772047be42f0819ec7db6c89ee1f00','2100','100','R');
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_community` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_positive`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_positive`;
CREATE TABLE  `Chime`.`DataInstance_positive` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `VALUE` char(1) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `INSTANCE_USERID` varchar(40) NOT NULL DEFAULT '0',
  `INSTANCE_TYPEID` varchar(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX19` (`INSTANCE_ID`,`USER_ID`),
  KEY `IDX15A` (`INSTANCE_USERID`,`INSTANCE_TYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_positive`
--

/*!40000 ALTER TABLE `DataInstance_positive` DISABLE KEYS */;
LOCK TABLES `DataInstance_positive` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_positive` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_tag`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_tag`;
CREATE TABLE  `Chime`.`DataInstance_tag` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `TAG_ID` varchar(40) DEFAULT NULL,
  `PRIVATE` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IDX20` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_tag`
--

/*!40000 ALTER TABLE `DataInstance_tag` DISABLE KEYS */;
LOCK TABLES `DataInstance_tag` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_tag` ENABLE KEYS */;


--
-- Definition of table `Chime`.`DataInstance_tag_metrics`
--

DROP TABLE IF EXISTS `Chime`.`DataInstance_tag_metrics`;
CREATE TABLE  `Chime`.`DataInstance_tag_metrics` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `TAG_ID` varchar(40) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX21` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`DataInstance_tag_metrics`
--

/*!40000 ALTER TABLE `DataInstance_tag_metrics` DISABLE KEYS */;
LOCK TABLES `DataInstance_tag_metrics` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `DataInstance_tag_metrics` ENABLE KEYS */;


--
-- Definition of table `Chime`.`EventJournal`
--

DROP TABLE IF EXISTS `Chime`.`EventJournal`;
CREATE TABLE  `Chime`.`EventJournal` (
  `id` varchar(40) NOT NULL,
  `type_id` varchar(40) NOT NULL,
  `message` mediumtext NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains event journal entries.';

--
-- Dumping data for table `Chime`.`EventJournal`
--

/*!40000 ALTER TABLE `EventJournal` DISABLE KEYS */;
LOCK TABLES `EventJournal` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `EventJournal` ENABLE KEYS */;


--
-- Definition of table `Chime`.`MessageJournal`
--

DROP TABLE IF EXISTS `Chime`.`MessageJournal`;
CREATE TABLE  `Chime`.`MessageJournal` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) NOT NULL,
  `SUBJECT` varchar(254) NOT NULL,
  `MESSAGE` text NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEEN` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userIdx` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`MessageJournal`
--

/*!40000 ALTER TABLE `MessageJournal` DISABLE KEYS */;
LOCK TABLES `MessageJournal` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `MessageJournal` ENABLE KEYS */;


--
-- Definition of table `Chime`.`RegisteredInterest`
--

DROP TABLE IF EXISTS `Chime`.`RegisteredInterest`;
CREATE TABLE  `Chime`.`RegisteredInterest` (
  `ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `INSTANCE_NAME` varchar(254) DEFAULT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `last_notification` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX23` (`USER_ID`),
  KEY `IDX22` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`RegisteredInterest`
--

/*!40000 ALTER TABLE `RegisteredInterest` DISABLE KEYS */;
LOCK TABLES `RegisteredInterest` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `RegisteredInterest` ENABLE KEYS */;


--
-- Definition of table `Chime`.`Template`
--

DROP TABLE IF EXISTS `Chime`.`Template`;
CREATE TABLE  `Chime`.`Template` (
  `ID` varchar(40) NOT NULL,
  `TYPE_ID` varchar(40) DEFAULT NULL,
  `INSTANCE_ID` varchar(40) DEFAULT NULL,
  `TEMPLATE` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `IDX25` (`TYPE_ID`),
  KEY `IDX24` (`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`Template`
--

/*!40000 ALTER TABLE `Template` DISABLE KEYS */;
LOCK TABLES `Template` WRITE;
INSERT INTO `Chime`.`Template` VALUES  ('100','0','0','{\"columns\":[{\"portlets\":[{\"properties\":[],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceField\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4},{\"properties\":[],\"pinned\":true,\"type\":\"FileGallery\",\"showHeader\":true,\"id\":5},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceReferrers\",\"showHeader\":true,\"id\":6}],\"width\":300.0}],\"id\":-1}'),
 ('1000','1200','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showCollapsed\":\"true\"},{\"headerType\":\"Shaded\"},{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[{\"headerType\":\"None\"}],\"pinned\":true,\"type\":\"PortalPage\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0}],\"id\":-1}'),
 ('1100','1300','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"NamedSearchDetail\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4},{\"properties\":[],\"pinned\":true,\"type\":\"FileGallery\",\"showHeader\":true,\"id\":5},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceReferrers\",\"showHeader\":true,\"id\":6}],\"width\":300.0}],\"id\":-1}'),
 ('1200','1900','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"AnalyticDetail\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4},{\"properties\":[],\"pinned\":true,\"type\":\"FileGallery\",\"showHeader\":true,\"id\":5},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceReferrers\",\"showHeader\":true,\"id\":6}],\"width\":300.0}],\"id\":-1}'),
 ('200','100','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"DataTypeContent\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0}],\"id\":-1}'),
 ('300','1400','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"ImageContent\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[{\"height\":\"250\"}],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceReferrers\",\"showHeader\":true,\"id\":5}],\"width\":300.0}],\"id\":-1}'),
 ('400','1500','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"FileContent\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[{\"height\":\"250\"}],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceReferrers\",\"showHeader\":true,\"id\":5}],\"width\":300.0}],\"id\":-1}'),
 ('500','500','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"false\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"ReviewContent\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0},{\"portlets\":[{\"properties\":[{\"height\":\"250\"}],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":4}],\"width\":300.0}],\"id\":-1}'),
 ('600','700','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"TagContent\",\"showHeader\":false,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0}],\"id\":-1}'),
 ('700','800','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"true\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"UserDetail\",\"showHeader\":true,\"id\":2},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceField\",\"showHeader\":false,\"id\":3},{\"properties\":[],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":4}],\"width\":1.0},{\"portlets\":[{\"properties\":[],\"pinned\":true,\"type\":\"ImageGallery\",\"showHeader\":true,\"id\":5}],\"width\":300.0}],\"id\":-1}'),
 ('900','1000','0','{\"columns\":[{\"portlets\":[{\"properties\":[{\"showDescription\":\"false\"}],\"pinned\":true,\"type\":\"InstanceHeader\",\"showHeader\":false,\"id\":1},{\"properties\":[],\"pinned\":true,\"type\":\"DiscussionContent\",\"showHeader\":false,\"id\":2},{\"properties\":[{\"showComments\":\"false\"}],\"pinned\":true,\"type\":\"InstanceSocialActivity\",\"showHeader\":true,\"id\":3}],\"width\":1.0}],\"id\":-1}');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Template` ENABLE KEYS */;


--
-- Definition of table `Chime`.`Type_tag_usage`
--

DROP TABLE IF EXISTS `Chime`.`Type_tag_usage`;
CREATE TABLE  `Chime`.`Type_tag_usage` (
  `ID` varchar(40) NOT NULL,
  `TYPE_ID` varchar(40) DEFAULT NULL,
  `TAG_ID` varchar(40) DEFAULT NULL,
  `USAGECOUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX26` (`TAG_ID`,`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`Type_tag_usage`
--

/*!40000 ALTER TABLE `Type_tag_usage` DISABLE KEYS */;
LOCK TABLES `Type_tag_usage` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `Type_tag_usage` ENABLE KEYS */;


--
-- Definition of table `Chime`.`UserProfile`
--

DROP TABLE IF EXISTS `Chime`.`UserProfile`;
CREATE TABLE  `Chime`.`UserProfile` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `EMAILADDRESS` varchar(254) DEFAULT NULL,
  `EMAILNOTIFICATION` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IDX27` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`UserProfile`
--

/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
LOCK TABLES `UserProfile` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;


--
-- Definition of table `Chime`.`User_tag_applied`
--

DROP TABLE IF EXISTS `Chime`.`User_tag_applied`;
CREATE TABLE  `Chime`.`User_tag_applied` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) NOT NULL,
  `TAG_ID` varchar(40) NOT NULL,
  `INSTANCE_ID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX30` (`USER_ID`,`TAG_ID`,`INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`User_tag_applied`
--

/*!40000 ALTER TABLE `User_tag_applied` DISABLE KEYS */;
LOCK TABLES `User_tag_applied` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `User_tag_applied` ENABLE KEYS */;


--
-- Definition of table `Chime`.`User_tag_usage`
--

DROP TABLE IF EXISTS `Chime`.`User_tag_usage`;
CREATE TABLE  `Chime`.`User_tag_usage` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `TAG_ID` varchar(40) DEFAULT NULL,
  `TYPE_ID` varchar(40) DEFAULT NULL,
  `USAGECOUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX28` (`USER_ID`,`TAG_ID`,`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chime`.`User_tag_usage`
--

/*!40000 ALTER TABLE `User_tag_usage` DISABLE KEYS */;
LOCK TABLES `User_tag_usage` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `User_tag_usage` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
