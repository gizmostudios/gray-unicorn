-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: django_web
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (53,'main','0001_initial','2012-02-16 10:03:28'),(72,'main','0020_auto__chg_field_link_asset__chg_field_assetfile_asset','2012-07-12 15:16:04'),(71,'main','0019_auto__add_field_link_short_description__add_field_link_submitted_by','2012-05-11 12:57:16'),(70,'main','0018_auto__add_field_link_created_at','2012-05-11 12:28:59'),(69,'main','0017_auto__add_field_assetfile_filetype','2012-05-11 11:44:16'),(67,'main','0015_auto__add_person','2012-05-03 20:08:28'),(68,'main','0016_auto__add_field_person_role_en__add_field_person_role_nl','2012-05-03 20:08:28'),(66,'main','0014_auto__add_field_asset_telephone__add_field_asset_twitter__add_field_as','2012-05-03 14:56:56'),(65,'main','0013_auto__add_field_assetfile_short_description__add_field_assetfile_short','2012-05-03 14:56:55'),(64,'main','0012_auto__add_field_asset_p_supplemental_info_en__add_field_asset_p_supple','2012-04-27 10:01:29'),(63,'main','0011_auto__add_aboutitem','2012-04-26 13:06:43'),(62,'main','0010_auto__add_field_asset_released_at','2012-04-17 11:00:22'),(61,'main','0009_auto__add_comment','2012-04-11 13:14:22'),(60,'main','0008_auto','2012-02-27 20:20:25'),(59,'main','0007_auto','2012-02-27 19:56:59'),(58,'main','0006_auto__add_partner__add_client','2012-02-27 08:58:08'),(57,'main','0005_auto__chg_field_pressreference_asset__chg_field_quote_asset','2012-02-25 19:07:26'),(56,'main','0004_auto__del_field_asset_html','2012-02-24 01:46:14'),(55,'main','0003_auto__add_field_asset_html','2012-02-23 20:12:48'),(54,'main','0002_auto__add_pressreference','2012-02-23 19:22:11');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:12
