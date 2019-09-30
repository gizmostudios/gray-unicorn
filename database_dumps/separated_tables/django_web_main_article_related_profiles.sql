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
-- Table structure for table `main_article_related_profiles`
--

DROP TABLE IF EXISTS `main_article_related_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_article_related_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_article_related_profiles_article_id_2adf54bf8a28cc5e_uniq` (`article_id`,`userprofile_id`),
  KEY `main_article_related_profiles_30525a19` (`article_id`),
  KEY `main_article_related_profiles_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1329 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_article_related_profiles`
--

LOCK TABLES `main_article_related_profiles` WRITE;
/*!40000 ALTER TABLE `main_article_related_profiles` DISABLE KEYS */;
INSERT INTO `main_article_related_profiles` VALUES (1311,312,66),(468,137,110),(1326,136,74),(501,190,64),(1310,311,66),(1309,298,66),(1308,292,66),(1307,190,66),(1325,136,66),(465,137,64),(1306,137,66),(1324,136,64),(1044,292,249),(1178,292,214),(1290,292,274),(1038,292,240),(1328,292,270),(1285,292,173),(1327,136,110),(1291,294,274),(1304,93,66),(1169,311,287),(1303,90,66),(1140,312,287),(1302,89,66),(1182,292,316);
/*!40000 ALTER TABLE `main_article_related_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:22
