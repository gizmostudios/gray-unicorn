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
-- Table structure for table `main_project_related_news`
--

DROP TABLE IF EXISTS `main_project_related_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_project_related_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `newsitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_project_related_news_project_id_37d4a49afcc663c2_uniq` (`project_id`,`newsitem_id`),
  KEY `main_project_related_news_b6620684` (`project_id`),
  KEY `main_project_related_news_6a1332dc` (`newsitem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=868 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_project_related_news`
--

LOCK TABLES `main_project_related_news` WRITE;
/*!40000 ALTER TABLE `main_project_related_news` DISABLE KEYS */;
INSERT INTO `main_project_related_news` VALUES (855,1,378),(156,56,84),(152,171,83),(863,255,268),(859,253,268),(638,241,268),(640,219,268),(595,139,305),(594,73,305),(593,14,305),(509,12,304),(510,14,304),(861,17,304),(854,1,84),(853,1,361),(842,63,358),(634,176,321),(633,139,321),(867,95,321),(758,63,359),(852,1,360),(756,63,360),(851,1,359),(834,63,361),(830,303,369),(857,201,369),(865,175,369),(850,1,358);
/*!40000 ALTER TABLE `main_project_related_news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:14
