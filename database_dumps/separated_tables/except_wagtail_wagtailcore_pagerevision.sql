-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: except_wagtail
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
-- Table structure for table `wagtailcore_pagerevision`
--

DROP TABLE IF EXISTS `wagtailcore_pagerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_pagerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_for_moderation` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `content_json` longtext NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_submitted_for_moderation_c682e44c` (`submitted_for_moderation`),
  KEY `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` (`page_id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  CONSTRAINT `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagerevision`
--

LOCK TABLES `wagtailcore_pagerevision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagerevision` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagerevision` VALUES (1,0,'2019-02-28 21:20:54.588105','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Yeah it works!\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,3,1),(2,0,'2019-03-04 20:24:19.961086','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Polydome\", \"draft_title\": \"Yeah it works!\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-02-28T21:20:54.613Z\", \"last_published_at\": \"2019-02-28T21:20:54.613Z\", \"latest_revision_created_at\": \"2019-02-28T21:20:54.588Z\", \"live_revision\": 1}',NULL,3,1),(3,0,'2019-03-04 20:25:00.711968','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Polydome\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-02-28T21:20:54.613Z\", \"last_published_at\": \"2019-03-04T20:24:20.014Z\", \"latest_revision_created_at\": \"2019-03-04T20:24:19.961Z\", \"live_revision\": 2}',NULL,3,1),(4,0,'2019-03-04 20:25:25.375476','{\"pk\": 4, \"path\": \"00010002\", \"depth\": 2, \"numchild\": 0, \"title\": \"Projects\", \"draft_title\": \"Projects\", \"slug\": \"projects\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/projects/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,4,1),(5,0,'2019-03-04 20:26:02.797062','{\"pk\": 5, \"path\": \"00010003\", \"depth\": 2, \"numchild\": 0, \"title\": \"Services\", \"draft_title\": \"Services\", \"slug\": \"services\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/services/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,5,1),(6,0,'2019-03-04 20:26:16.038732','{\"pk\": 6, \"path\": \"00010004\", \"depth\": 2, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,6,1),(7,0,'2019-03-04 20:35:10.727371','{\"pk\": 6, \"path\": \"00010004\", \"depth\": 2, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:26:16.060Z\", \"last_published_at\": \"2019-03-04T20:26:16.060Z\", \"latest_revision_created_at\": \"2019-03-04T20:26:16.038Z\", \"live_revision\": 6}',NULL,6,1),(8,0,'2019-03-04 20:36:45.767491','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Except\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-02-28T21:20:54.613Z\", \"last_published_at\": \"2019-03-04T20:25:00.813Z\", \"latest_revision_created_at\": \"2019-03-04T20:25:00.711Z\", \"live_revision\": 3}',NULL,3,1),(9,0,'2019-03-04 20:36:53.844103','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Except\", \"draft_title\": \"Except\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-02-28T21:20:54.613Z\", \"last_published_at\": \"2019-03-04T20:25:00.813Z\", \"latest_revision_created_at\": \"2019-03-04T20:36:45.767Z\", \"live_revision\": 3}',NULL,3,1),(10,0,'2019-03-04 20:38:05.706353','{\"pk\": 7, \"path\": \"000100010006\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,7,1),(11,0,'2019-03-04 20:38:09.859968','{\"pk\": 7, \"path\": \"000100010006\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2019-03-04T20:38:05.706Z\", \"live_revision\": null}',NULL,7,1),(12,0,'2019-03-04 20:38:11.806420','{\"pk\": 7, \"path\": \"000100010006\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2019-03-04T20:38:09.859Z\", \"live_revision\": null}',NULL,7,1),(13,0,'2019-03-04 20:38:22.729283','{\"pk\": 8, \"path\": \"000100010007\", \"depth\": 3, \"numchild\": 0, \"title\": \"Knowledge\", \"draft_title\": \"Knowledge\", \"slug\": \"knowledge\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/home/knowledge/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,8,1),(14,0,'2019-03-04 20:38:25.785640','{\"pk\": 8, \"path\": \"000100010007\", \"depth\": 3, \"numchild\": 0, \"title\": \"Knowledge\", \"draft_title\": \"Knowledge\", \"slug\": \"knowledge\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/home/knowledge/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2019-03-04T20:38:22.729Z\", \"live_revision\": null}',NULL,8,1);
/*!40000 ALTER TABLE `wagtailcore_pagerevision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:05
