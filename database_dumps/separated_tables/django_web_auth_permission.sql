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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add migration history',9,'add_migrationhistory'),(26,'Can change migration history',9,'change_migrationhistory'),(27,'Can delete migration history',9,'delete_migrationhistory'),(28,'Can add kv store',10,'add_kvstore'),(29,'Can change kv store',10,'change_kvstore'),(30,'Can delete kv store',10,'delete_kvstore'),(31,'Can add asset',11,'add_asset'),(32,'Can change asset',11,'change_asset'),(33,'Can delete asset',11,'delete_asset'),(34,'Can add asset image',12,'add_assetimage'),(35,'Can change asset image',12,'change_assetimage'),(36,'Can delete asset image',12,'delete_assetimage'),(94,'Can change news item',31,'change_newsitem'),(93,'Can add news item',31,'add_newsitem'),(40,'Can add project',14,'add_project'),(41,'Can change project',14,'change_project'),(42,'Can delete project',14,'delete_project'),(43,'Can add tool',15,'add_tool'),(44,'Can change tool',15,'change_tool'),(45,'Can delete tool',15,'delete_tool'),(46,'Can add service',16,'add_service'),(47,'Can change service',16,'change_service'),(48,'Can delete service',16,'delete_service'),(97,'Can change press reference',32,'change_pressreference'),(96,'Can add press reference',32,'add_pressreference'),(101,'Can delete client',33,'delete_client'),(100,'Can change client',33,'change_client'),(55,'Publish Assets',11,'publish'),(56,'Withdraw Assets',11,'withdraw'),(57,'Can add product',19,'add_product'),(58,'Can change product',19,'change_product'),(59,'Can delete product',19,'delete_product'),(60,'Can add article',20,'add_article'),(61,'Can change article',20,'change_article'),(62,'Can delete article',20,'delete_article'),(99,'Can add client',33,'add_client'),(98,'Can delete press reference',32,'delete_pressreference'),(66,'Can add quote',22,'add_quote'),(67,'Can change quote',22,'change_quote'),(68,'Can delete quote',22,'delete_quote'),(69,'Can add event',23,'add_event'),(70,'Can change event',23,'change_event'),(71,'Can delete event',23,'delete_event'),(72,'Can add link',24,'add_link'),(73,'Can change link',24,'change_link'),(74,'Can delete link',24,'delete_link'),(75,'Can add home image',25,'add_homeimage'),(76,'Can change home image',25,'change_homeimage'),(77,'Can delete home image',25,'delete_homeimage'),(78,'Can add Tag',26,'add_tag'),(79,'Can change Tag',26,'change_tag'),(80,'Can delete Tag',26,'delete_tag'),(81,'Can add Tagged Item',27,'add_taggeditem'),(82,'Can change Tagged Item',27,'change_taggeditem'),(83,'Can delete Tagged Item',27,'delete_taggeditem'),(84,'Can add user profile',28,'add_userprofile'),(85,'Can change user profile',28,'change_userprofile'),(86,'Can delete user profile',28,'delete_userprofile'),(87,'Can add asset file',29,'add_assetfile'),(88,'Can change asset file',29,'change_assetfile'),(89,'Can delete asset file',29,'delete_assetfile'),(90,'Can add blog post',30,'add_blogpost'),(91,'Can change blog post',30,'change_blogpost'),(92,'Can delete blog post',30,'delete_blogpost'),(95,'Can delete news item',31,'delete_newsitem'),(102,'Can add partner',34,'add_partner'),(103,'Can change partner',34,'change_partner'),(104,'Can delete partner',34,'delete_partner'),(105,'Can add comment',35,'add_comment'),(106,'Can change comment',35,'change_comment'),(107,'Can delete comment',35,'delete_comment'),(108,'Can add about item',36,'add_aboutitem'),(109,'Can change about item',36,'change_aboutitem'),(110,'Can delete about item',36,'delete_aboutitem'),(111,'Can add person',37,'add_person'),(112,'Can change person',37,'change_person'),(113,'Can delete person',37,'delete_person'),(114,'Edit Assets',11,'edit');
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

-- Dump completed on 2019-03-04 21:56:07
