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
-- Table structure for table `main_article_related_articles`
--

DROP TABLE IF EXISTS `main_article_related_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_article_related_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_article_id` int(11) NOT NULL,
  `to_article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_article_related_arti_from_article_id_127ff79a73a7c308_uniq` (`from_article_id`,`to_article_id`),
  KEY `main_article_related_articles_55dc30a7` (`from_article_id`),
  KEY `main_article_related_articles_4ae5b0ca` (`to_article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1897 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_article_related_articles`
--

LOCK TABLES `main_article_related_articles` WRITE;
/*!40000 ALTER TABLE `main_article_related_articles` DISABLE KEYS */;
INSERT INTO `main_article_related_articles` VALUES (207,89,90),(208,90,89),(1682,148,190),(720,190,262),(516,190,191),(520,191,190),(1681,148,312),(718,262,190),(1895,190,136),(1893,136,190),(1710,148,204),(1688,190,148),(1687,312,148),(1700,190,311),(1679,148,149),(1896,191,136),(1711,149,204),(1894,136,191),(1696,311,149),(1685,149,148),(1709,204,190),(1707,204,148),(1280,262,292),(1278,292,262),(1279,149,292),(1277,292,149),(1284,137,298),(1283,298,137),(1698,148,311),(1697,311,190),(1712,190,204),(1699,149,311),(1677,148,262),(1695,311,148),(1592,190,312),(1588,312,149),(1589,312,190),(1708,204,149),(1591,149,312),(1683,262,148);
/*!40000 ALTER TABLE `main_article_related_articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:09
