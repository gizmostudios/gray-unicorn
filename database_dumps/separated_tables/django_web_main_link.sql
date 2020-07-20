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
-- Table structure for table `main_link`
--

DROP TABLE IF EXISTS `main_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `short_description` longtext,
  `submitted_by` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_link_89694383` (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_link`
--

LOCK TABLES `main_link` WRITE;
/*!40000 ALTER TABLE `main_link` DISABLE KEYS */;
INSERT INTO `main_link` VALUES (4,NULL,'Gapminder','http://www.gapminder.org/','2012-07-12 17:36:25','Gapminder is a website where you can graphically animate important global statistics in intuitive graphs. It\'s a useful tool for tracking world trends.',NULL),(2,129,'Green living saves 400 million in health costs (NL)','http://www.duurzaamnieuws.nl/bericht.rxml?id=81801','2012-05-24 21:15:43','Living in green houses saves hundreds of millions in health plans and hospital costs, says research by Dutch Ministry.',NULL),(3,126,'FactLink','http://https://factlink.com/','2012-06-12 18:27:14','FactLink builds collectively reviewed databases of valuable information around the web.',NULL),(5,NULL,'GetUp!','http://www.getup.org.au/','2012-09-13 09:55:52','An independent movement to build a progressive Australia and bring participation back into our democracy.',NULL),(6,271,'Expeditie Groenland','http://media.except.nl/media/uploaded_files/asset_files/Expeditie_Groenland_brochure.pdf','2013-06-14 13:56:51',NULL,NULL),(7,292,'Performance Oriented Design','http://www.except.nl/nl/#OverOns_aboutnews','2013-10-14 00:02:05',NULL,NULL),(8,292,'Bottom up Urban Development','http://www.except.nl/nl/#OverOns_aboutnews','2013-10-14 00:02:05',NULL,NULL);
/*!40000 ALTER TABLE `main_link` ENABLE KEYS */;
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
