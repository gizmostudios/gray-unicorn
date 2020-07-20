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
-- Table structure for table `main_newsitem_related_profiles`
--

DROP TABLE IF EXISTS `main_newsitem_related_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_newsitem_related_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsitem_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_newsitem_related_profile_newsitem_id_161204265dc351dc_uniq` (`newsitem_id`,`userprofile_id`),
  KEY `main_newsitem_related_profiles_6a1332dc` (`newsitem_id`),
  KEY `main_newsitem_related_profiles_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2211 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_newsitem_related_profiles`
--

LOCK TABLES `main_newsitem_related_profiles` WRITE;
/*!40000 ALTER TABLE `main_newsitem_related_profiles` DISABLE KEYS */;
INSERT INTO `main_newsitem_related_profiles` VALUES (113,178,72),(1042,264,223),(1993,198,108),(1043,193,70),(112,122,72),(1053,237,238),(1046,264,226),(454,250,251),(1992,122,108),(1047,264,249),(1059,264,214),(1058,237,214),(1057,236,214),(1056,229,214),(1055,178,214),(1039,264,240),(1054,122,214),(1044,250,226),(1045,252,226),(1986,84,66),(933,269,96),(1987,264,66),(1073,319,214),(1501,328,287),(1500,328,214),(1499,328,249),(1989,331,66),(1988,330,66),(1288,330,240),(1537,341,287),(1536,341,214),(1535,341,249),(1979,343,214),(1981,346,214),(2201,366,287),(2200,366,249),(2209,370,337),(2208,370,340),(2207,370,289),(2210,370,316);
/*!40000 ALTER TABLE `main_newsitem_related_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:19
