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
-- Table structure for table `main_assetfile`
--

DROP TABLE IF EXISTS `main_assetfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_assetfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_nl` varchar(200) DEFAULT NULL,
  `file_en` varchar(100) NOT NULL,
  `file_nl` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `short_description` longtext NOT NULL,
  `short_description_en` longtext,
  `short_description_nl` longtext,
  `filetype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_assetfile_89694383` (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_assetfile`
--

LOCK TABLES `main_assetfile` WRITE;
/*!40000 ALTER TABLE `main_assetfile` DISABLE KEYS */;
INSERT INTO `main_assetfile` VALUES (1,'Schiebroek Brochure (English)','Schiebroek Brochure (English)',NULL,'uploaded_files/asset_files/Schiebroek-Zuid_Brochure_A3_v3_web.pdf','uploaded_files/asset_files/1163716','uploaded_images/asset_image/schiebroek.jpg',56,'2012-02-25 16:32:46','2013-03-13 23:42:19','Sustainable Schiebroek-Zuid Brochure (web res)','Sustainable Schiebroek-Zuid Brochure (web res)',NULL,'PDF'),(5,'Polydome Book','Polydome Book','Polydome Boek (EN)','uploaded_files/asset_files/Polydome_V2.3_15-4-2011_web.pdf','','uploaded_images/asset_image/polydome_book_cover_1.jpg',1,'2012-04-27 16:23:50','2014-10-10 21:20:00','94 pages of fully detailed explanation of the Polydome process.','94 pages of fully detailed explanation of the Polydome process.','94 pagina\'s met gedetailleerde beschrijving van het Polydome proces.','PDF'),(7,'House of Energy ','House of Energy ','Huis vol Energie','uploaded_files/asset_files/Huis_vol_Energie_v2.5_2011-10-20_web.pdf','','uploaded_images/asset_image/Cover_br_sm.jpg',154,'2012-05-20 01:59:46','2014-04-06 17:16:50','Inspiration book for energy neutral living, with interviews, examples and technical references.','Inspiration book for energy neutral living, with interviews, examples and technical references.','Inspiratieboek voor energie neutraal wonen, met interviews, voorbeelden en technische details.','PDF'),(3,'Schiebroek-Zuid Ingredient Book (NL)','Schiebroek-Zuid Ingredient Book (NL)','Schiebroek-Zuid Ingrediënten Boek ','uploaded_files/asset_files/Ingredient_Book_2011-01-10_web.pdf','','uploaded_images/asset_image/schiebroek_1.jpg',56,'2012-02-25 16:37:31','2013-03-13 23:42:19','Extensive reference book on all technical, design and community aspects of the Schiebroek-Zuid redevelopment (in Dutch).','Extensive reference book on all technical, design and community aspects of the Schiebroek-Zuid redevelopment (in Dutch).','Uitgebreid technisch naslagwerk over alle facetten van de Schiebroek-Zuid herontwikkeling.','PDF'),(6,'Inspiration Book Sustainable Overschie (Dutch)','Inspiration Book Sustainable Overschie (Dutch)','Inspiratieboek Duurzaam Overschie','uploaded_files/asset_files/Duurzaam_Overschie_v3.4_web_version_A4.pdf','','uploaded_images/asset_image/Booklet_Photo_edit_sm_1_1.jpg',139,'2012-05-08 18:42:48','2012-09-12 03:36:54','Download the inspirationbook for free.','Download the inspirationbook for free.','Download gratis het inspiratieboek Duurzaam Overschie.','PDF'),(8,'Learning From New construction - full report','Learning From New construction - full report','Leren van Nieuwbouw - compleet rapport','uploaded_files/asset_files/except_lerenvannieuwbouw2012.pdf','','uploaded_images/asset_image/IMG_4668.JPG',172,'2012-06-21 16:58:29','2014-10-10 21:38:21','Published under creative commons licence: BY-SA-NC 2012.','Published under creative commons licence: BY-SA-NC 2012.','Gepubliceerd onder Creative Commons licentie: BY-SA-NC 2012.','PDF'),(9,'Beautiful Intelligence','Beautiful Intelligence',NULL,'uploaded_files/asset_files/PlanningDesign_Except_A3_v3_web.pdf','','uploaded_images/asset_image/beautiful_intelligence.jpg',58,'2012-07-02 12:16:21','2013-04-27 17:14:04','Brochure Sustainable Architecture & Design (Web Resolution)','Brochure Sustainable Architecture & Design (Web Resolution)',NULL,'PDF'),(10,'Industry Roadmaps Brochure','Industry Roadmaps Brochure',NULL,'uploaded_files/asset_files/Industry_Roadmaps_A3_Brochure_web.pdf','','uploaded_images/asset_image/industry_roadmaps.jpg',53,'2012-07-02 12:18:08','2012-07-09 03:43:22','Industry Roadmaps Brochure (web resolution)','Industry Roadmaps Brochure (web resolution)',NULL,'PDF'),(11,'Innovation Communities Brochure','Innovation Communities Brochure',NULL,'uploaded_files/asset_files/Except_ICs_Single_A3_web.pdf','','uploaded_images/asset_image/ic_brochure.jpg',124,'2012-07-02 12:39:50','2013-05-17 13:15:12','Innovation Communities Brochure (web resolution)','Innovation Communities Brochure (web resolution)',NULL,'PDF'),(12,'Polydome Brochure','Polydome Brochure',NULL,'uploaded_files/asset_files/Polydome_Single_A3_v4_web.pdf','','uploaded_images/asset_image/polydome_brochure.jpg',1,'2012-07-02 12:46:43','2014-10-10 21:20:00','4 page Polydome brochure (web resolution)','4 page Polydome brochure (web resolution)',NULL,'PDF'),(13,'Schieboek-Zuid Vision Book (NL)','Schieboek-Zuid Vision Book (NL)','Schiebroek-Zuid Visieboek','uploaded_files/asset_files/Vision_Book_2011-01-10_web.pdf','','uploaded_images/asset_image/schiebroek_2.jpg',56,'2012-07-02 12:56:26','2013-03-13 23:42:20','This book contains the core redevelopment vision of the Schiebroek-Zuid social housing area (in Dutch).','This book contains the core redevelopment vision of the Schiebroek-Zuid social housing area (in Dutch).','Dit boek bevat de kernvisie voor de herontwikkeling van Schiebroek-Zuid.','PDF'),(17,'Velomobile Brochure (Dutch)','Velomobile Brochure (Dutch)','Velomobile Brochure','uploaded_files/asset_files/Velomobile_A3_Brochure_v1_web_2.pdf','','uploaded_images/asset_image/velomobile_folder.jpg',NULL,'2012-07-12 17:20:30','2012-07-12 17:20:53','A compact overview of the properties and advantages of Velomobiles - a new form of personal transportation in urban and rural areas.','A compact overview of the properties and advantages of Velomobiles - a new form of personal transportation in urban and rural areas.','Een compact overzicht van de eigenschappen van Velomobielen, een nieuwe vorm van persoonlijk transport voor stedelijke en landelijke gebieden.','PDF'),(18,'Pictures of the Future','Pictures of the Future','Plaatjes van de toekomst','uploaded_files/asset_files/Except_Picturesofthefuture_2012_web.pdf','','uploaded_images/asset_image/futurepictures.png',NULL,'2012-07-12 18:23:22','2012-07-12 18:23:22','This booklet combines some imagery we have produced for our sustainable innovation projects. It\'s a great collection of our best pictures, diagrams and visualizations.','This booklet combines some imagery we have produced for our sustainable innovation projects. It\'s a great collection of our best pictures, diagrams and visualizations.','Dit boekje combineert afbeeldingen die geproduceerd zijn voor onze duurzame innovatieprojecten. Het is een een mooie collectie van onze beste tekeningen, diagrammen en visualisaties.','PDF'),(19,'Energy and cost analysis triple glazing','Energy and cost analysis triple glazing',NULL,'uploaded_files/asset_files/Energy_and_cost_benefit_analysis_of_double_and_triple_glazing.pdf','','uploaded_images/asset_image/glazing_1.jpg',194,'2012-07-14 18:06:03','2012-07-14 18:08:52','Energy and cost analysis on triple glazing','Energy and cost analysis on triple glazing',NULL,'PDF'),(20,'Energie en kostenanalyse driedubbel glas','Energie en kostenanalyse driedubbel glas',NULL,'uploaded_files/asset_files/Energie_en_Kostenanalyse_dubbel_en_driedubbel_glas.pdf','','uploaded_images/asset_image/glazing_2.jpg',194,'2012-07-14 18:06:03','2012-07-14 18:08:52','Energie en kostenalyse voor driedubbel glas','Energie en kostenalyse voor driedubbel glas',NULL,'PDF'),(22,'Symbiosis in Development (SiD) Brochure','Symbiosis in Development (SiD) Brochure',NULL,'uploaded_files/asset_files/SiD_Single_A3_web.pdf','','uploaded_images/asset_image/sid.jpg',143,'2012-11-15 20:13:41','2013-02-06 18:14:03','English info leaflet about the SiD methodology','English info leaflet about the SiD methodology',NULL,'PDF'),(23,'Miya\'s Fish Selection Menu','Miya\'s Fish Selection Menu',NULL,'uploaded_files/asset_files/menu_v1_1.pdf','','uploaded_images/asset_image/showcase_image_1.jpg',219,'2012-12-07 10:14:31','2014-04-06 17:17:03','',NULL,NULL,'PDF'),(24,'Except\'s 13th Anniversary Booklet','Except\'s 13th Anniversary Booklet',NULL,'uploaded_files/asset_files/13_birthday_book_v5_web.pdf','','uploaded_images/asset_image/13_birthday_book_v4_web-1.jpg',229,'2013-01-02 17:11:53','2013-10-27 03:59:46','A celebration booklet for on our 13th birthday.','A celebration booklet for on our 13th birthday.',NULL,'PDF'),(26,'Hortus Celestia Brochure (NL)','Hortus Celestia Brochure (NL)','Hortus Celestia Brochure (NL)','uploaded_files/asset_files/Hortus_Celestia_Single_A3_v4_web_1.pdf','','uploaded_images/asset_image/hortus_ico_1.jpg',241,'2013-03-12 15:18:40','2014-04-06 17:16:37','',NULL,NULL,'PDF'),(27,'Urban Renaissance Brochure (English)','Urban Renaissance Brochure (English)','Urban Renaissance Brochure (Engels)','uploaded_files/asset_files/Except_Urban_Renaissance_folder_EN_v1.1_web_1.pdf','','uploaded_images/asset_image/UR_Brochure.jpg',248,'2013-04-27 17:00:58','2014-01-14 12:46:27','English brochure with an overview of the Urban Renaissance system.','English brochure with an overview of the Urban Renaissance system.','Engelse borchure met een overzicht van het Urban Renaissance systeem.','PDF'),(28,'Urban Renaissance Brochure (Dutch)','Urban Renaissance Brochure (Dutch)','Urban Renaissance Brochure (Nederlands)','uploaded_files/asset_files/Except_Urban_Renaissance_folder_NL_v1.1_web_1.pdf','','uploaded_images/asset_image/UR_Brochure_1.jpg',248,'2013-04-27 17:00:58','2014-01-14 12:46:27','Dutch brochure with an overview of the Urban Renaissance system.','Dutch brochure with an overview of the Urban Renaissance system.','Nederlandse brochure met een overzicht van het Urban Renaissance systeem.','PDF'),(29,'Heat network Tilburg vision document (in Dutch)','Heat network Tilburg vision document (in Dutch)','Visiebrochure Verduurzaming Wamrtenet Tilburg','uploaded_files/asset_files/Visiebrochure_doorontwikkeling_WNT_v12_web.pdf','','uploaded_images/asset_image/Voorkant_visiebrochure_1.jpg',255,'2013-05-29 10:06:15','2014-10-10 21:37:20','This vision document (in Dutch) explains the road map towards a sustainable heat delivery system fort he city of Tilburg.','This vision document (in Dutch) explains the road map towards a sustainable heat delivery system fort he city of Tilburg.','De visiebrochure beschrijft de ingrediënten van de visie en de stappen die nodig zijn om de warmtevoorziening van Tilburg te verduurzamen. ','PDF'),(39,'Food for the City (Dutch)','Food for the City (Dutch)','Voedsel voor de Stad','uploaded_files/asset_files/Voedsel_voor_de_Stad_-_Except_2011_-_v2_nologo_web.pdf','','uploaded_images/asset_image/voedsel.png',322,'2014-03-28 11:42:15','2014-10-10 21:38:55','This booklet tells about the relation of the city dweller to the global food system, and how to improve it.','This booklet tells about the relation of the city dweller to the global food system, and how to improve it.','Dit boekje vertelt over de relatie tussen de stadsmens en het voedselsysteem, en hoe stappen te nemen naar beter voedsel.','PDF'),(40,'Island Renaissance Brochure','Island Renaissance Brochure',NULL,'uploaded_files/asset_files/IIS_Single_A3_v4.0_web.pdf','','uploaded_images/asset_image/ir.jpg',213,'2014-07-25 16:03:17','2014-07-25 16:04:07','Short overview of the IR island transformation system.','Short overview of the IR island transformation system.',NULL,'PDF'),(30,'Expedition Greenland Brochure (Dutch)','Expedition Greenland Brochure (Dutch)','Expeditie Groenland Brochure','uploaded_files/asset_files/Expeditie_Groenland_brochure.pdf','','uploaded_images/asset_image/onzin.jpg',269,'2013-06-11 15:27:12','2013-06-18 16:01:03','',NULL,NULL,'PDF'),(33,'Cobouw - Renaissance van Stadsontwikkeling','Cobouw - Renaissance van Stadsontwikkeling','Cobouw - Renaissance van Stadsontwikkeling','uploaded_files/asset_files/20131021_Cobouw_-_Renaissance_van_Stadsontwikkeling.pdf','','',248,'2013-11-11 09:50:34','2014-01-14 12:46:27','We got published in Cobouw with an article about why and how to develop urban areas into resilient, self-sustaining, and flourishing places to live and work. (Dutch)','We got published in Cobouw with an article about why and how to develop urban areas into resilient, self-sustaining, and flourishing places to live and work. (Dutch)','Gepubliceerd in Cobouw, waarom en hoe kunnen we stedelijke gebieden transformeren naar veerkrachtige, zelfvoorzienende en fijne plekken om te wonen en werken.','PDF'),(32,'Except overview book','Except overview book','Except overzicht boek','uploaded_files/asset_files/Project_booklet_2013_v1.99_web.pdf','','uploaded_images/asset_image/IMGP9713_edit.jpg',NULL,'2013-09-19 13:48:48','2013-10-27 01:38:29','Read everything about Except in this overview book.','Read everything about Except in this overview book.','Lees alles over Except in dit overzicht boek.','PDF'),(34,'Interview Tom Bosschaert','Interview Tom Bosschaert','Interview Tom Bosschaert','uploaded_files/asset_files/InterviewBosschaert.pdf','','',66,'2013-11-11 09:59:03','2013-11-11 09:59:03','Tom is interviewd by DvhN as guest speaker for Kenniscafé Emmen. Read his interview here (Dutch).','Tom is interviewd by DvhN as guest speaker for Kenniscafé Emmen. Read his interview here (Dutch).','Tom is geïnterviewd door het DvhN als gastspreker bij Kenniscafé Emmen. Lees hier zijn interview.','PDF'),(36,'Kansenkaart Afvalwaterketen','[only Dutch] Kansenkaart Afvalwaterketen','Kansenkaart Afvalwaterketen','uploaded_files/asset_files/Waterschappen_kansen_v7.0.pdf','','uploaded_images/asset_image/Waterschappen_kansen.png',303,'2013-12-10 00:01:06','2014-08-27 10:08:28','',NULL,NULL,'PDF'),(38,'Associate Overview Booklet (EN)','Associate Overview Booklet (EN)',NULL,'uploaded_files/asset_files/Except_Associates_Overview_EN_March-2014_1.pdf','','uploaded_images/asset_image/Associate_overview_thumbnail.png',NULL,'2014-03-23 17:05:05','2014-03-24 20:03:57','This booklet shows all Except\'s associates and their CV\'s.','This booklet shows all Except\'s associates and their CV\'s.',NULL,'PDF');
/*!40000 ALTER TABLE `main_assetfile` ENABLE KEYS */;
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
