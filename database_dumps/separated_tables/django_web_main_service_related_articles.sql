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
-- Table structure for table `main_service_related_articles`
--

DROP TABLE IF EXISTS `main_service_related_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_service_related_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_service_related_articles_service_id_347ed80fa39da865_uniq` (`service_id`,`article_id`),
  KEY `main_service_related_articles_90e28c3e` (`service_id`),
  KEY `main_service_related_articles_30525a19` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1640 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_service_related_articles`
--

LOCK TABLES `main_service_related_articles` WRITE;
/*!40000 ALTER TABLE `main_service_related_articles` DISABLE KEYS */;
INSERT INTO `main_service_related_articles` VALUES (834,166,79),(815,166,192),(806,57,91),(1593,62,204),(814,166,94),(1586,248,148),(1390,248,298),(833,61,79),(1397,117,90),(1396,117,89),(1398,117,91),(805,57,137),(1164,62,149),(1585,143,148),(1594,143,204),(1584,125,148),(906,49,190),(1583,49,148),(1595,160,204),(1215,62,262),(1216,161,262),(1366,62,292),(1227,62,271),(1391,248,292),(1392,248,190),(1384,306,294),(1639,306,136),(1592,307,311),(1591,143,311),(1590,125,311),(1589,57,311),(1588,55,311),(1587,53,311),(1546,307,312),(1545,143,312),(1544,125,312),(1543,57,312),(1542,55,312),(1541,53,312);
/*!40000 ALTER TABLE `main_service_related_articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:18
