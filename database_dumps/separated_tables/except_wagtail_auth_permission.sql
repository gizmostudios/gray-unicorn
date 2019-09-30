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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can access Wagtail admin',3,'access_admin'),(2,'Can add document',4,'add_document'),(3,'Can change document',4,'change_document'),(4,'Can delete document',4,'delete_document'),(5,'Can add image',5,'add_image'),(6,'Can change image',5,'change_image'),(7,'Can delete image',5,'delete_image'),(8,'Can add home page',2,'add_homepage'),(9,'Can change home page',2,'change_homepage'),(10,'Can delete home page',2,'delete_homepage'),(11,'Can add form submission',6,'add_formsubmission'),(12,'Can change form submission',6,'change_formsubmission'),(13,'Can delete form submission',6,'delete_formsubmission'),(14,'Can add redirect',7,'add_redirect'),(15,'Can change redirect',7,'change_redirect'),(16,'Can delete redirect',7,'delete_redirect'),(17,'Can add embed',8,'add_embed'),(18,'Can change embed',8,'change_embed'),(19,'Can delete embed',8,'delete_embed'),(20,'Can add user profile',9,'add_userprofile'),(21,'Can change user profile',9,'change_userprofile'),(22,'Can delete user profile',9,'delete_userprofile'),(23,'Can add rendition',10,'add_rendition'),(24,'Can change rendition',10,'change_rendition'),(25,'Can delete rendition',10,'delete_rendition'),(26,'Can add query',11,'add_query'),(27,'Can change query',11,'change_query'),(28,'Can delete query',11,'delete_query'),(29,'Can add Query Daily Hits',12,'add_querydailyhits'),(30,'Can change Query Daily Hits',12,'change_querydailyhits'),(31,'Can delete Query Daily Hits',12,'delete_querydailyhits'),(32,'Can add page',1,'add_page'),(33,'Can change page',1,'change_page'),(34,'Can delete page',1,'delete_page'),(35,'Can add group page permission',13,'add_grouppagepermission'),(36,'Can change group page permission',13,'change_grouppagepermission'),(37,'Can delete group page permission',13,'delete_grouppagepermission'),(38,'Can add page revision',14,'add_pagerevision'),(39,'Can change page revision',14,'change_pagerevision'),(40,'Can delete page revision',14,'delete_pagerevision'),(41,'Can add page view restriction',15,'add_pageviewrestriction'),(42,'Can change page view restriction',15,'change_pageviewrestriction'),(43,'Can delete page view restriction',15,'delete_pageviewrestriction'),(44,'Can add site',16,'add_site'),(45,'Can change site',16,'change_site'),(46,'Can delete site',16,'delete_site'),(47,'Can add collection',17,'add_collection'),(48,'Can change collection',17,'change_collection'),(49,'Can delete collection',17,'delete_collection'),(50,'Can add group collection permission',18,'add_groupcollectionpermission'),(51,'Can change group collection permission',18,'change_groupcollectionpermission'),(52,'Can delete group collection permission',18,'delete_groupcollectionpermission'),(53,'Can add collection view restriction',19,'add_collectionviewrestriction'),(54,'Can change collection view restriction',19,'change_collectionviewrestriction'),(55,'Can delete collection view restriction',19,'delete_collectionviewrestriction'),(56,'Can add Tag',20,'add_tag'),(57,'Can change Tag',20,'change_tag'),(58,'Can delete Tag',20,'delete_tag'),(59,'Can add Tagged Item',21,'add_taggeditem'),(60,'Can change Tagged Item',21,'change_taggeditem'),(61,'Can delete Tagged Item',21,'delete_taggeditem'),(62,'Can add log entry',22,'add_logentry'),(63,'Can change log entry',22,'change_logentry'),(64,'Can delete log entry',22,'delete_logentry'),(65,'Can add permission',23,'add_permission'),(66,'Can change permission',23,'change_permission'),(67,'Can delete permission',23,'delete_permission'),(68,'Can add group',24,'add_group'),(69,'Can change group',24,'change_group'),(70,'Can delete group',24,'delete_group'),(71,'Can add user',25,'add_user'),(72,'Can change user',25,'change_user'),(73,'Can delete user',25,'delete_user'),(74,'Can add content type',26,'add_contenttype'),(75,'Can change content type',26,'change_contenttype'),(76,'Can delete content type',26,'delete_contenttype'),(77,'Can add session',27,'add_session'),(78,'Can change session',27,'change_session'),(79,'Can delete session',27,'delete_session'),(80,'Can view home page',2,'view_homepage'),(81,'Can view form submission',6,'view_formsubmission'),(82,'Can view redirect',7,'view_redirect'),(83,'Can view embed',8,'view_embed'),(84,'Can view user profile',9,'view_userprofile'),(85,'Can view document',4,'view_document'),(86,'Can view image',5,'view_image'),(87,'Can view rendition',10,'view_rendition'),(88,'Can view query',11,'view_query'),(89,'Can view Query Daily Hits',12,'view_querydailyhits'),(90,'Can view page',1,'view_page'),(91,'Can view group page permission',13,'view_grouppagepermission'),(92,'Can view page revision',14,'view_pagerevision'),(93,'Can view page view restriction',15,'view_pageviewrestriction'),(94,'Can view site',16,'view_site'),(95,'Can view collection',17,'view_collection'),(96,'Can view group collection permission',18,'view_groupcollectionpermission'),(97,'Can view collection view restriction',19,'view_collectionviewrestriction'),(98,'Can view Tag',20,'view_tag'),(99,'Can view Tagged Item',21,'view_taggeditem'),(100,'Can view log entry',22,'view_logentry'),(101,'Can view permission',23,'view_permission'),(102,'Can view group',24,'view_group'),(103,'Can view user',25,'view_user'),(104,'Can view content type',26,'view_contenttype'),(105,'Can view session',27,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:01
