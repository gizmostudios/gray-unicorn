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
-- Table structure for table `main_event`
--

DROP TABLE IF EXISTS `main_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_nl` varchar(200) DEFAULT NULL,
  `subtitle` varchar(200) NOT NULL,
  `subtitle_en` varchar(200) DEFAULT NULL,
  `subtitle_nl` varchar(200) DEFAULT NULL,
  `short_description` longtext NOT NULL,
  `short_description_en` longtext,
  `short_description_nl` longtext,
  `date` datetime NOT NULL,
  `image` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_event_89694383` (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_event`
--

LOCK TABLES `main_event` WRITE;
/*!40000 ALTER TABLE `main_event` DISABLE KEYS */;
INSERT INTO `main_event` VALUES (1,264,'Masterclass City of Tomorrow','Masterclass City of Tomorrow','Masterclass City of Tomorrow','Open inschrijving','Open registration','Open inschrijving','',NULL,NULL,'2013-12-06 10:00:00','uploaded_images/asset_image/events/017_roco.jpg',''),(2,292,'Masterclass City of Tomorrow','Masterclass City of Tomorrow','Masterclass City of Tomorrow','Open registration','Open registration','Open inschrijving','Blabla','Blabla','Blabla','2013-12-06 10:00:00','uploaded_images/asset_image/events/Grid_Nite_City_of_tomorrow_invite_v1_image.jpg',''),(3,348,'Get-to-know-us-lunch','Get-to-know-us-lunch',NULL,'Informal meet-up','Informal meet-up',NULL,'If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.','If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.',NULL,'2014-08-19 13:00:00','uploaded_images/asset_image/events/gridnight_ruilrestaurant.jpg',''),(4,348,'Get-to-know-us-lunch','Get-to-know-us-lunch',NULL,'Informal meet-up','Informal meet-up',NULL,'If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.','If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.',NULL,'2014-08-26 13:00:00','uploaded_images/asset_image/events/IMG_0157.JPG',''),(5,348,'Get-to-know-us-lunch','Get-to-know-us-lunch',NULL,'Informal meet-up','Informal meet-up',NULL,'If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.','If you want to know more about Except and our team, you are more than welcome to join our weekly lunch on Tuesdays. Please do apply by sending a mail to work@except.nl.',NULL,'2014-09-02 13:00:00','uploaded_images/asset_image/events/IMG_0154.JPG',''),(6,348,'Exceptional Drinks','Exceptional Drinks',NULL,'Our time of the month to share the fun','Our time of the month to share the fun',NULL,'Around 17.00h we are gathering for drinks. Today is our kickoff for a jolly new season, but we\'ll try doing this once a month. You are welcome to join us. Please do let us know you are coming by sending a mail to work@except.nl.','Around 17.00h we are gathering for drinks. Today is our kickoff for a jolly new season, but we\'ll try doing this once a month. You are welcome to join us. Please do let us know you are coming by sending a mail to work@except.nl.',NULL,'2014-09-02 17:00:00','uploaded_images/asset_image/events/gridnight_borrel2.jpg','');
/*!40000 ALTER TABLE `main_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:13
