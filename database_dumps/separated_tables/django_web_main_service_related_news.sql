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
-- Table structure for table `main_service_related_news`
--

DROP TABLE IF EXISTS `main_service_related_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_service_related_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `newsitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_service_related_news_service_id_66bb170cefe24c06_uniq` (`service_id`,`newsitem_id`),
  KEY `main_service_related_news_90e28c3e` (`service_id`),
  KEY `main_service_related_news_6a1332dc` (`newsitem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_service_related_news`
--

LOCK TABLES `main_service_related_news` WRITE;
/*!40000 ALTER TABLE `main_service_related_news` DISABLE KEYS */;
INSERT INTO `main_service_related_news` VALUES (22,57,84),(48,62,237),(201,62,264),(328,117,264),(188,62,269),(332,248,305),(174,125,268),(173,62,268),(326,248,268),(920,52,304),(330,54,304),(395,248,317),(394,146,317),(393,117,317),(1099,54,318),(1098,53,318),(922,52,323),(1097,52,318),(1096,51,318),(755,54,320),(754,53,320),(921,52,320),(752,51,320),(751,50,320),(915,54,323),(914,53,323),(1095,50,318),(912,51,323),(911,50,323),(1020,165,341),(1021,307,341),(1143,49,359),(1148,49,358),(1142,49,360),(1147,49,361);
/*!40000 ALTER TABLE `main_service_related_news` ENABLE KEYS */;
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
