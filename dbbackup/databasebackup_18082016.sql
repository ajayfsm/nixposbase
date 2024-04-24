-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: nixposbase
-- ------------------------------------------------------
-- Server version	5.6.25-0ubuntu0.15.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_start_time` datetime DEFAULT NULL,
  `bill_end_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_amount` decimal(8,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'1','2016-08-10','hyderabad','2016-08-09 19:01:12','2016-08-09 19:01:41',NULL,1980.00,NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',2),('2014_10_12_100000_create_password_resets_table',3),('2016_07_21_092635_create_products_table',4),('2016_07_21_093152_create_product_modifiers_table',5),('2016_07_21_174601_remove_unique_constraints_products_table',6),('2016_07_24_083834_add_category_to_products_table',7),('2016_07_25_083411_create_product_modifier_groups_table',8),('2016_07_25_093807_upgrade-product_modifiers-table',9),('2016_07_27_075009_drop_unique_from_product_modifier_name_in_table',10),('2016_08_06_120303_create_bills_table',11),('2016_08_06_125926_create_order_items_table',12),('2016_08_13_041057_create_product_modifier_group_maps_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_item_quantity` decimal(16,2) DEFAULT '1.00',
  `order_item_price` decimal(16,2) NOT NULL,
  `order_item_price_change` tinyint(1) NOT NULL DEFAULT '0',
  `order_item_price_change_note` text COLLATE utf8_unicode_ci,
  `order_item_modifiers` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `portion_name` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `portion_count` int(11) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `calculate_price` tinyint(1) DEFAULT NULL,
  `increase_inventory` tinyint(1) DEFAULT NULL,
  `decrease_inventory` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `creating_user_name` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creating_user_id` int(11) DEFAULT NULL,
  `account_transaction_type_id` int(11) DEFAULT NULL,
  `product_timer_id` int(11) DEFAULT NULL,
  `price_tag` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,NULL,'crostini melanzana','A1',1.00,430.00,0,'','[{\"name\":\"chicken\",\"price\":\"100\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"lamb\",\"price\":\"150\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"spaghetti\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,NULL,'pane aglio e formaggio','A6',1.00,90.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,NULL,'pane aglio e verdure','A7',1.00,120.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,NULL,'bruschetta pomodoro','A4',1.00,140.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,NULL,'funghi trifolati','A10',1.00,300.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,NULL,'antipasto del maiale','A15',1.00,300.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,NULL,'carpaccio di salmone','A14',1.00,300.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1,NULL,'crostini con pollo e formaggio','A11',1.00,300.00,0,'','[]',NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_modifier_group_maps`
--

DROP TABLE IF EXISTS `product_modifier_group_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_modifier_group_maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_modifier_group_id` int(11) NOT NULL,
  `products` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_category` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifier_group_maps`
--

LOCK TABLES `product_modifier_group_maps` WRITE;
/*!40000 ALTER TABLE `product_modifier_group_maps` DISABLE KEYS */;
INSERT INTO `product_modifier_group_maps` VALUES (7,2,'*','Pasta','2016-08-16 17:50:31','2016-08-16 17:50:31'),(10,4,'canned juice','*','2016-08-16 18:40:49','2016-08-16 18:40:49'),(11,5,'*','Pasta','2016-08-16 18:51:19','2016-08-16 18:51:19'),(12,5,'*','Salads','2016-08-16 18:51:19','2016-08-16 18:51:19'),(13,5,'*','Pizza','2016-08-16 18:51:19','2016-08-16 18:51:19'),(14,5,'*','Fresh Pasta','2016-08-16 18:51:19','2016-08-16 18:51:19'),(15,5,'*','Risotto','2016-08-16 18:51:19','2016-08-16 18:51:19'),(16,5,'*','Secondi','2016-08-16 18:51:19','2016-08-16 18:51:19'),(17,5,'*','Specials','2016-08-16 18:51:19','2016-08-16 18:51:19'),(18,5,'*','Mexican','2016-08-16 18:51:19','2016-08-16 18:51:19'),(19,5,'*','Antipasti','2016-08-16 18:51:19','2016-08-16 18:51:19'),(22,6,'pasta bolognese','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(23,6,'pasta sugo alla matriciana','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(24,6,'pasta carbonara ','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(25,6,'pasta vodka','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(26,6,'pasta polpettine al sugo','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(32,1,'*','Drinks','2016-08-16 19:20:26','2016-08-16 19:20:26'),(33,1,'*','Mocktails','2016-08-16 19:20:26','2016-08-16 19:20:26'),(39,3,'*','*','2016-08-16 20:18:48','2016-08-16 20:18:48'),(40,7,'zuppa del giorno','Soup','2016-08-17 05:28:39','2016-08-17 05:28:39');
/*!40000 ALTER TABLE `product_modifier_group_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_modifier_groups`
--

DROP TABLE IF EXISTS `product_modifier_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_modifier_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SortOrder` int(11) NOT NULL,
  `ColumnCount` int(11) NOT NULL,
  `ButtonHeight` int(11) NOT NULL,
  `MaxSelectedItems` int(11) NOT NULL,
  `MinSelectedItems` int(11) NOT NULL,
  `AddTagPriceToOrderPrice` tinyint(1) NOT NULL,
  `FreeTagging` tinyint(1) NOT NULL,
  `SaveFreeTags` tinyint(1) NOT NULL,
  `GroupTag` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TaxFree` tinyint(1) NOT NULL,
  `Hidden` tinyint(1) NOT NULL,
  `ModifierGroupName` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifier_groups`
--

LOCK TABLES `product_modifier_groups` WRITE;
/*!40000 ALTER TABLE `product_modifier_groups` DISABLE KEYS */;
INSERT INTO `product_modifier_groups` VALUES (1,0,0,0,0,0,0,0,0,'',0,0,'Drinks',NULL,'2016-07-27 11:22:42','2016-07-27 11:22:42'),(2,0,0,0,0,0,0,0,0,'',0,0,'Pasta',NULL,'2016-08-16 16:44:02','2016-08-16 17:31:49'),(3,0,0,0,0,0,0,0,0,'',0,0,'Cooking Instructions',NULL,'2016-08-16 17:31:39','2016-08-16 17:31:39'),(4,0,0,0,0,1,0,0,0,'',0,0,'Juice',NULL,'2016-08-16 18:40:49','2016-08-16 18:40:49'),(5,0,0,0,0,0,0,0,0,'',0,0,'Extra Toppings',NULL,'2016-08-16 18:49:50','2016-08-16 18:49:50'),(6,0,0,0,0,0,0,0,0,'',0,0,'Inc Modifiers',NULL,'2016-08-16 19:09:46','2016-08-16 19:09:46'),(7,0,0,0,0,0,0,0,0,'',0,0,'Soup',NULL,'2016-08-16 19:24:31','2016-08-16 19:24:31');
/*!40000 ALTER TABLE `product_modifier_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_modifiers`
--

DROP TABLE IF EXISTS `product_modifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_modifiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_modifier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `SortOrder` int(11) NOT NULL,
  `ProductModifierGroupId` int(11) NOT NULL,
  `MaxQuantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifiers`
--

LOCK TABLES `product_modifiers` WRITE;
/*!40000 ALTER TABLE `product_modifiers` DISABLE KEYS */;
INSERT INTO `product_modifiers` VALUES (1,'no ice','2016-07-27 11:22:42','2016-07-27 11:22:42',1,1,1,NULL),(2,'less ice','2016-07-27 11:22:42','2016-07-27 11:22:42',2,1,1,NULL),(3,'less sweet','2016-07-27 11:22:42','2016-07-27 11:27:38',4,1,1,NULL),(4,'with ice','2016-07-27 11:22:42','2016-07-27 11:27:38',3,1,1,NULL),(5,'sweet','2016-07-27 11:22:42','2016-07-27 11:22:42',5,1,1,NULL),(6,'salt','2016-07-27 11:22:42','2016-07-27 11:22:42',6,1,1,NULL),(7,'sweet and salt','2016-07-27 11:22:42','2016-07-27 11:22:42',7,1,1,NULL),(8,'penne','2016-08-16 16:44:02','2016-08-16 17:50:31',1,2,1,NULL),(9,'spaghetti','2016-08-16 16:44:02','2016-08-16 17:50:31',2,2,1,NULL),(10,'fussili','2016-08-16 16:44:02','2016-08-16 17:50:31',3,2,1,NULL),(11,'tagliatelle','2016-08-16 16:44:02','2016-08-16 17:50:31',4,2,1,NULL),(12,'farfalle','2016-08-16 16:44:02','2016-08-16 17:50:31',5,2,1,NULL),(13,'spinach ravioli','2016-08-16 16:44:02','2016-08-16 17:50:31',6,2,1,NULL),(14,'gnocchi','2016-08-16 16:44:02','2016-08-16 17:50:31',7,2,1,NULL),(15,'tortellini','2016-08-16 16:44:02','2016-08-16 17:50:31',8,2,1,NULL),(16,'risotto','2016-08-16 16:44:02','2016-08-16 17:50:31',9,2,1,NULL),(17,'no mushrooms','2016-08-16 17:31:39','2016-08-16 17:31:39',1,3,1,NULL),(18,'less spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',3,3,1,NULL),(19,'medium spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',4,3,1,NULL),(20,'more spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',5,3,1,NULL),(21,'no spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',6,3,1,NULL),(22,'more cheese','2016-08-16 17:31:39','2016-08-16 19:16:19',7,3,1,NULL),(23,'no cheese','2016-08-16 17:31:39','2016-08-16 19:16:19',8,3,1,NULL),(24,'thick sauce','2016-08-16 17:31:39','2016-08-16 19:16:19',9,3,1,NULL),(25,'al dente','2016-08-16 17:31:39','2016-08-16 19:16:19',10,3,1,NULL),(26,'no onion garlic','2016-08-16 17:31:39','2016-08-16 19:16:19',11,3,1,NULL),(27,'parcel','2016-08-16 17:31:39','2016-08-16 19:16:19',12,3,1,NULL),(28,'gluten free','2016-08-16 17:31:39','2016-08-16 19:16:19',13,3,1,NULL),(29,'no garnish','2016-08-16 17:31:39','2016-08-16 19:16:19',14,3,1,NULL),(30,'test1','2016-08-16 17:31:39','2016-08-16 17:31:56',14,3,1,'2016-08-16 17:31:56'),(31,'test2','2016-08-16 17:31:40','2016-08-16 17:31:56',15,3,1,'2016-08-16 17:31:56'),(32,'cranberry','2016-08-16 18:40:49','2016-08-16 18:40:49',1,4,1,NULL),(33,'guava','2016-08-16 18:40:49','2016-08-16 18:40:49',2,4,1,NULL),(34,'mango','2016-08-16 18:40:49','2016-08-16 18:40:49',3,4,1,NULL),(35,'orange','2016-08-16 18:40:49','2016-08-16 18:40:49',4,4,1,NULL),(36,'pineapple','2016-08-16 18:40:49','2016-08-16 18:40:49',5,4,1,NULL),(37,'chicken','2016-08-16 18:49:50','2016-08-16 18:49:50',1,5,0,NULL),(38,'lamb','2016-08-16 18:49:50','2016-08-16 18:49:50',2,5,0,NULL),(39,'beef','2016-08-16 18:49:50','2016-08-16 18:49:50',3,5,0,NULL),(40,'bacon','2016-08-16 18:49:50','2016-08-16 18:49:50',4,5,0,NULL),(41,'vegetables','2016-08-16 18:49:50','2016-08-16 18:49:50',5,5,0,NULL),(42,'mushroom','2016-08-16 18:49:50','2016-08-16 18:49:50',6,5,0,NULL),(43,'extra cheese','2016-08-16 18:49:50','2016-08-16 18:49:50',7,5,0,NULL),(44,'broccoli','2016-08-16 18:49:50','2016-08-16 18:49:50',8,5,0,NULL),(45,'shrimp','2016-08-16 18:49:50','2016-08-16 18:49:50',9,5,0,NULL),(46,'smoked salmon','2016-08-16 18:49:50','2016-08-16 18:49:50',10,5,0,NULL),(47,'parmesan','2016-08-16 18:49:50','2016-08-16 18:49:50',11,5,0,NULL),(48,'blue cheese','2016-08-16 18:49:50','2016-08-16 18:49:50',12,5,0,NULL),(49,'artichokes','2016-08-16 18:49:50','2016-08-16 18:49:50',13,5,0,NULL),(50,'black olives','2016-08-16 18:49:50','2016-08-16 18:49:50',14,5,0,NULL),(51,'green olives','2016-08-16 18:49:50','2016-08-16 18:49:50',15,5,0,NULL),(52,'capers','2016-08-16 18:49:50','2016-08-16 18:49:50',16,5,0,NULL),(53,'jalapenos','2016-08-16 18:49:50','2016-08-16 18:49:50',17,5,0,NULL),(54,'sun dried tomatoes','2016-08-16 18:49:50','2016-08-16 18:49:50',18,5,0,NULL),(55,'extra meatballs','2016-08-16 18:49:50','2016-08-16 18:49:50',19,5,0,NULL),(56,'pepperoni','2016-08-16 18:49:50','2016-08-16 18:49:50',20,5,0,NULL),(57,'red yellow bell peppers','2016-08-16 18:49:50','2016-08-16 18:49:50',21,5,0,NULL),(58,'green bell peppers','2016-08-16 18:49:50','2016-08-16 18:49:50',22,5,0,NULL),(59,'honey','2016-08-16 18:52:09','2016-08-16 18:52:09',8,1,1,NULL),(60,'soy inc','2016-08-16 19:09:46','2016-08-16 19:10:04',1,6,1,NULL),(61,'chicken inc','2016-08-16 19:09:46','2016-08-16 19:10:04',2,6,1,NULL),(62,'lamb inc','2016-08-16 19:09:46','2016-08-16 19:10:04',3,6,1,NULL),(63,'beef inc','2016-08-16 19:09:46','2016-08-16 19:10:04',4,6,1,NULL),(64,'bacon inc','2016-08-16 19:09:46','2016-08-16 19:10:04',5,6,1,NULL),(65,'no tomato sauce','2016-08-16 19:15:46','2016-08-16 19:16:19',2,3,1,NULL),(66,'more sauce','2016-08-16 19:16:19','2016-08-16 19:16:29',15,3,1,NULL),(67,'no mint','2016-08-16 19:20:12','2016-08-16 19:20:26',9,1,1,NULL),(68,'no icecream','2016-08-16 19:20:12','2016-08-16 19:20:26',10,1,1,NULL),(69,'sugar free','2016-08-16 19:20:12','2016-08-16 19:20:26',11,1,1,NULL),(70,'with food','2016-08-16 19:20:12','2016-08-16 19:20:26',12,1,1,NULL),(71,'tomato','2016-08-16 19:24:31','2016-08-16 19:24:31',1,7,1,NULL),(72,'mushroom','2016-08-16 19:24:31','2016-08-16 19:24:31',2,7,1,NULL),(73,'broccoli','2016-08-16 19:24:31','2016-08-16 19:24:31',3,7,1,NULL),(74,'clear vegetable','2016-08-16 19:24:32','2016-08-16 19:35:37',4,7,1,NULL),(75,'asparagus','2016-08-16 19:24:32','2016-08-16 19:24:32',5,7,1,NULL),(76,'chickpea','2016-08-16 19:24:32','2016-08-16 19:24:32',6,7,1,NULL),(77,'bell pepper','2016-08-16 19:24:32','2016-08-16 19:35:37',7,7,1,NULL),(78,'spring onion','2016-08-16 19:24:32','2016-08-16 19:35:37',8,7,1,NULL),(79,'X 2','2016-08-16 19:24:32','2016-08-16 19:24:32',9,7,1,NULL),(80,'X 3','2016-08-16 19:24:32','2016-08-16 19:24:32',10,7,1,NULL),(81,'X 4','2016-08-16 19:24:32','2016-08-17 05:28:39',11,7,1,NULL),(82,'X 5','2016-08-16 19:24:32','2016-08-16 19:35:37',12,7,1,NULL),(83,'X 6','2016-08-16 19:24:32','2016-08-16 19:35:37',13,7,1,NULL),(84,'X 7','2016-08-16 19:24:32','2016-08-16 19:35:37',14,7,1,NULL),(85,'X 8','2016-08-16 19:24:32','2016-08-16 19:35:37',15,7,1,NULL),(86,'X 9','2016-08-16 19:24:32','2016-08-16 19:35:37',16,7,1,NULL),(87,'X 10','2016-08-16 19:24:32','2016-08-16 19:35:37',17,7,1,NULL),(88,'well cooked','2016-08-16 20:18:36','2016-08-16 20:18:48',16,3,1,NULL);
/*!40000 ALTER TABLE `product_modifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_name_unique` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'A1','crostini melanzana','2016-07-21 14:58:45','2016-07-24 11:53:53','Antipasti'),(2,'A2','crostini al forno','2016-07-21 14:58:53','2016-07-24 11:56:58','Antipasti'),(3,'A3','crostini assortiti','2016-07-21 14:59:03','2016-07-21 15:06:49','Antipasti'),(4,'A4','bruschetta pomodoro','2016-07-21 15:23:41','2016-07-21 15:23:41','Antipasti'),(5,'A5','pane aglio','2016-07-21 15:24:09','2016-07-21 15:24:09','Antipasti'),(6,'A6','pane aglio e mozzarella','2016-07-21 15:25:11','2016-07-21 15:25:11','Antipasti'),(7,'A7','pane aglio e verdure ','2016-07-21 15:25:33','2016-07-21 15:25:33','Antipasti'),(8,'A25','crostini verdure ','2016-07-21 15:27:26','2016-07-21 15:27:26','Antipasti'),(9,'A8','insalata caprese','2016-07-21 15:27:54','2016-07-21 15:27:54','Antipasti'),(10,'A9','peperoni arrosto','2016-07-21 15:28:28','2016-07-21 15:28:28','Antipasti'),(11,'A10','funghi trifolati','2016-07-21 15:28:56','2016-07-21 15:28:56','Antipasti'),(12,'A11','crostini con pollo e formaggio','2016-07-21 15:29:45','2016-07-21 15:29:45','Antipasti'),(13,'A14','carpaccio di salmone','2016-07-21 15:30:30','2016-07-21 15:30:30','Antipasti'),(14,'A15','antipasto del maiale','2016-07-21 15:31:24','2016-07-21 15:31:24','Antipasti'),(15,'A16','pollo e limone','2016-07-21 15:31:59','2016-07-21 15:31:59','Antipasti'),(16,'A18','crostini con tonno','2016-07-21 15:32:29','2016-07-21 15:32:29','Antipasti'),(17,'A21','salsa spinaci','2016-07-21 15:33:06','2016-07-21 15:33:06','Antipasti'),(18,'A22','salsa jalapeno','2016-07-21 15:33:28','2016-07-21 15:33:28','Antipasti'),(19,'A23','funghi ripieni di verdure','2016-07-21 15:34:10','2016-07-21 15:34:10','Antipasti'),(20,'A24','funghi ripieni di pollo','2016-07-21 15:34:40','2016-07-21 15:34:40','Antipasti'),(21,'A30','verdure saltate','2016-07-21 15:35:24','2016-07-24 12:30:20','Contorni'),(22,'A31','broccoli strascinati','2016-07-21 15:35:57','2016-07-21 15:35:57','Antipasti'),(23,'Z1','zuppa del giorno','2016-07-21 15:36:33','2016-07-24 12:03:50','Soup'),(24,'B1','insalata pomodoro','2016-07-21 15:37:24','2016-07-21 15:37:24','Salads'),(25,'B2','insalata contadina','2016-07-21 15:38:15','2016-07-24 14:10:59','Salads'),(26,'B3','insalata mista','2016-07-21 15:38:32','2016-07-21 15:38:32','Salads'),(27,'B4','insalata pollo','2016-07-21 15:38:54','2016-07-21 15:38:54','Salads'),(28,'B6','insalata cesare','2016-07-21 15:39:21','2016-07-21 15:45:26','Salads'),(29,'B5','insalata verde di pollo','2016-07-21 15:46:56','2016-07-21 15:46:56','Salads'),(30,'B8','insalata pancetta','2016-07-21 15:47:22','2016-07-21 15:47:22','Salads'),(31,'B9','insalata russo','2016-07-21 15:47:50','2016-07-21 15:47:50','Salads'),(32,'B10','insalata con formaggio di capra','2016-07-21 15:48:27','2016-07-21 15:48:27','Salads'),(33,'B11','insalata vecchi monaco','2016-07-21 15:48:52','2016-07-21 15:48:52','Salads'),(34,'B12','insalata tonno','2016-07-21 15:49:12','2016-07-21 15:49:12','Salads'),(35,'P2','pizza margherita','2016-07-21 15:50:37','2016-07-21 15:50:37','Pizza'),(36,'P3','pizza funghi','2016-07-21 15:50:58','2016-07-21 15:50:58','Pizza'),(37,'P4','pizza cipolla','2016-07-21 15:51:18','2016-07-21 15:51:18','Pizza'),(38,'P5','pizza melanzana','2016-07-21 15:51:38','2016-07-21 15:51:38','Pizza'),(39,'P6','pizza vito','2016-07-21 15:51:55','2016-07-21 15:51:55','Pizza'),(40,'P7','pizza hawaiiano','2016-07-21 15:52:13','2016-07-21 15:52:13','Pizza'),(41,'P8','pizza mediterranean','2016-07-21 15:53:26','2016-07-21 15:53:26','Pizza'),(42,'P9','pizza pomodoro','2016-07-21 15:53:53','2016-07-21 15:53:53','Pizza'),(43,'P10','pizza casa','2016-07-21 15:54:18','2016-07-21 15:54:18','Pizza'),(44,'P11','pizza tabasco','2016-07-21 15:54:36','2016-07-21 15:54:36','Pizza'),(45,'P12','pizza tre peperoni','2016-07-21 15:55:16','2016-07-21 15:55:16','Pizza'),(46,'P13','pizza sicilia','2016-07-21 15:55:32','2016-07-21 15:55:32','Pizza'),(47,'P14','pizza spinaci','2016-07-21 15:56:07','2016-07-21 15:56:07','Pizza'),(48,'P15','pizza liscio','2016-07-21 15:56:28','2016-07-21 15:56:28','Pizza'),(49,'P19','pizza sovrano','2016-07-21 15:56:54','2016-07-21 15:56:54','Pizza'),(50,'P20','pizza genovese','2016-07-21 15:57:14','2016-07-21 15:57:14','Pizza'),(51,'P21','pizza pollito','2016-07-21 15:57:34','2016-07-21 15:57:34','Pizza'),(52,'P22','pizza quattro formaggi','2016-07-21 16:04:11','2016-07-21 16:04:11','Pizza'),(53,'P23','pizza con pollo','2016-07-21 16:04:26','2016-07-21 16:04:26','Pizza'),(54,'P24','pizza tonno e cipolla','2016-07-21 16:04:57','2016-07-21 16:04:57','Pizza'),(55,'P28','pizza diavola','2016-07-21 16:05:43','2016-07-21 16:05:43','Pizza'),(56,'P29','pizza straniera','2016-07-21 16:08:11','2016-07-21 16:08:11','Pizza'),(57,'P30','pizza alla vodka','2016-07-21 16:08:41','2016-07-21 16:08:41','Pizza'),(58,'P32','pizza alpi','2016-07-21 16:09:03','2016-07-21 16:09:03','Pizza'),(59,'P33','pizza gamberetti e sugo rosa','2016-07-21 16:11:26','2016-07-21 16:11:26','Pizza'),(60,'P34','pizza pollo e pesto','2016-07-21 16:11:46','2016-07-21 16:11:46','Pizza'),(61,'P35','pizza salmone affuicata','2016-07-21 16:12:21','2016-07-21 16:12:21','Pizza'),(62,'P36','pizza salame di maiale ','2016-07-21 16:13:38','2016-07-21 16:13:38','Pizza'),(63,'P37','pizza agnello speziato ','2016-07-21 16:14:21','2016-07-21 16:14:21','Pizza'),(64,'P38','pizza salame di pollo','2016-07-21 16:14:47','2016-07-21 16:14:47','Pizza'),(65,'P39','pizza maiale blu','2016-07-21 16:15:15','2016-07-21 16:15:15','Pizza'),(66,'P40','pizza arcevia ','2016-07-21 16:15:34','2016-07-21 16:15:34','Pizza'),(67,'P41','pizza bismark','2016-07-21 16:15:57','2016-07-21 16:15:57','Pizza'),(68,'P42','pizza spagnolo','2016-07-21 16:16:44','2016-07-21 16:16:44','Pizza'),(69,'P43','pizza piri piri','2016-07-21 16:17:02','2016-07-21 16:17:02','Pizza'),(70,'C7','crespelle di funghi','2016-07-21 16:17:36','2016-07-21 16:17:36','Fresh Pasta'),(71,'C8','crespelle di pollo','2016-07-21 16:17:57','2016-07-21 16:17:57','Fresh Pasta'),(72,'C9','crespelle di verdure ','2016-07-21 16:18:25','2016-07-21 16:18:25','Fresh Pasta'),(73,'C1','cannelloni alla fiorentina ','2016-07-21 16:19:06','2016-07-21 16:19:06','Fresh Pasta'),(74,'C2','lasagne napoletana(cheese)','2016-07-21 16:28:08','2016-07-24 13:25:29','Fresh Pasta'),(75,'C3','lasagne di funghi','2016-07-21 16:28:37','2016-07-21 16:28:37','Fresh Pasta'),(76,'C4','lasagne di pollo','2016-07-21 16:29:16','2016-07-21 16:29:16','Fresh Pasta'),(77,'C5','lasagne di agnello','2016-07-21 16:30:18','2016-07-21 16:30:18','Fresh Pasta'),(78,'C6','lasagne di verdure ','2016-07-21 16:30:39','2016-07-21 16:30:39','Fresh Pasta'),(79,'D1','pasta napoletana','2016-07-21 16:31:18','2016-07-21 16:31:18','Pasta'),(80,'D2','pasta aglio olio e peperoncino','2016-07-21 16:31:56','2016-07-21 16:31:56','Pasta'),(81,'D40','pasta aglio olio e agnello','2016-07-21 16:34:32','2016-07-21 16:34:32','Pasta'),(82,'D3','pasta aglio olio e verdure ','2016-07-21 16:35:18','2016-07-21 16:35:18','Pasta'),(83,'D5','pasta puttanesca napoletana','2016-07-21 16:35:50','2016-07-21 16:35:50','Pasta'),(84,'D6','pasta melanzana','2016-07-21 16:36:11','2016-07-21 16:36:11','Pasta'),(85,'D7','pasta pesto genovese','2016-07-21 16:36:36','2016-07-21 16:36:36','Pasta'),(86,'D8','pasta arrabbiata','2016-07-21 16:37:18','2016-07-21 16:37:18','Pasta'),(87,'D9','pasta ai quattro formaggi ','2016-07-21 16:37:52','2016-07-21 16:37:52','Pasta'),(88,'D10','pasta alfredo','2016-07-21 16:38:17','2016-07-21 16:38:17','Pasta'),(89,'D11','pasta panna e noci','2016-07-21 16:38:38','2016-07-21 16:38:38','Pasta'),(90,'D12','pasta panna funghi e piselli','2016-07-21 16:39:12','2016-07-21 16:39:12','Pasta'),(91,'D13','pasta spinaci e formaggio','2016-07-21 16:39:49','2016-07-21 16:39:49','Pasta'),(92,'D14','patsa supremo broccoli','2016-07-21 16:40:43','2016-07-21 16:40:43','Pasta'),(93,'D31','pasta pollo supremo ','2016-07-21 16:41:09','2016-07-21 16:41:09','Pasta'),(94,'D15','pasta milazzo','2016-07-21 16:41:27','2016-07-21 16:41:27','Pasta'),(95,'D16','pasta sugo rosa','2016-07-21 16:41:53','2016-07-21 16:41:53','Pasta'),(96,'P17','pizza grano turco','2016-07-21 16:43:25','2016-07-24 14:04:12','Pizza'),(97,'P18','pizza grande','2016-07-21 16:43:48','2016-07-24 14:05:36','Pizza'),(98,'D19','pasta primavera ','2016-07-21 16:49:45','2016-07-21 16:49:45','Pasta'),(99,'D20','pasta al capone','2016-07-21 16:50:10','2016-07-21 16:50:10','Pasta'),(100,'D21','pasta funghi porcini','2016-07-21 16:50:36','2016-07-21 16:50:36','Pasta'),(101,'D22','pasta quattro stagioni','2016-07-21 16:51:47','2016-07-21 16:51:47','Pasta'),(102,'D24','pasta sugo alla matriciana','2016-07-21 16:52:29','2016-07-21 16:52:29','Pasta'),(103,'D25','pasta carbonara ','2016-07-21 16:53:06','2016-07-21 16:53:06','Pasta'),(104,'D26','pasta bolognese','2016-07-21 16:53:51','2016-07-21 16:53:51','Pasta'),(105,'D27','pasta vodka','2016-07-21 16:54:06','2016-07-21 16:54:06','Pasta'),(106,'D29','pasta campesina ','2016-07-21 16:54:29','2016-07-21 16:54:29','Pasta'),(107,'D32','pasta agnello al vino','2016-07-21 16:54:59','2016-07-21 16:54:59','Pasta'),(108,'D33','pasta gricia','2016-07-21 16:55:21','2016-07-21 16:55:21','Pasta'),(109,'D34','pasta polpettine al sugo','2016-07-21 16:56:06','2016-07-21 16:56:06','Pasta'),(110,'D35','pasta salmone','2016-07-21 16:56:22','2016-07-21 16:56:22','Pasta'),(111,'D36','pasta tonno al sugo','2016-07-21 16:56:47','2016-07-21 16:56:47','Pasta'),(112,'D37','pasta gamberetti al sugo','2016-07-21 16:57:26','2016-07-21 16:57:26','Pasta'),(113,'D38','pasta gamberi di salsa bianca','2016-07-21 16:57:55','2016-07-21 16:57:55','Pasta'),(114,'D39','pasta shrimp campesina ','2016-07-21 16:58:53','2016-07-21 16:58:53','Pasta'),(115,'F1','risotto al forno','2016-07-21 16:59:25','2016-07-21 16:59:25','Risotto'),(116,'F2','risotto funghi e zaffrano','2016-07-21 16:59:51','2016-07-21 16:59:51','Risotto'),(117,'F3','risotto funghi porcini','2016-07-21 17:00:12','2016-07-21 17:00:12','Risotto'),(118,'F4','risotto quattro formaggi','2016-07-21 17:00:48','2016-07-21 17:00:48','Risotto'),(119,'F5','risotto al salsa ','2016-07-21 17:01:11','2016-07-21 17:01:11','Risotto'),(120,'F6','risotto di pesto','2016-07-21 17:01:35','2016-07-21 17:01:35','Risotto'),(121,'F9','risotto panna piccante','2016-07-21 17:02:11','2016-07-21 17:02:11','Risotto'),(122,'F7','risotto di pollo','2016-07-21 17:02:28','2016-07-21 17:02:28','Risotto'),(123,'F8','risotto alla campesina ','2016-07-21 17:02:53','2016-07-21 17:02:53','Risotto'),(124,'F10','risotto di spinaci e pollo','2016-07-21 17:03:22','2016-07-21 17:03:22','Risotto'),(125,'F11','risotto fruitti di mare','2016-07-21 17:04:04','2016-07-21 17:04:04','Risotto'),(126,'L2','pollo panna e funghi','2016-07-21 17:04:30','2016-07-21 17:04:30','Secondi'),(127,'L3','pollo cacciatore','2016-07-21 17:04:58','2016-07-21 17:04:58','Secondi'),(128,'L4','pollo alla raganello','2016-07-21 17:05:18','2016-07-21 17:05:18','Secondi'),(129,'L5','panna e pesci','2016-07-21 17:05:39','2016-07-21 17:05:39','Secondi'),(130,'L6','pesci nepoletana','2016-07-21 17:06:07','2016-07-21 17:06:07','Secondi'),(131,'L7','pollo grigliata','2016-07-21 17:06:28','2016-07-21 17:06:28','Secondi'),(132,'L8','pesci grigliata','2016-07-21 17:06:45','2016-07-21 17:06:45','Secondi'),(133,'G1','paolas tiramisu','2016-07-21 17:07:58','2016-07-21 17:07:58','Desserts'),(134,'G2','the bomb','2016-07-21 17:08:09','2016-07-21 17:08:09','Desserts'),(135,'G3','sizzling brownie','2016-07-21 17:08:38','2016-07-21 17:08:38','Desserts'),(136,'G4','no-bake blueberry cheesecake ','2016-07-21 17:09:19','2016-07-21 17:09:19','Desserts'),(137,'G5','panna cotta','2016-07-21 17:09:44','2016-07-21 17:09:44','Desserts'),(138,'D17','pasta teramo','2016-07-21 17:18:17','2016-07-21 17:18:17','Pasta'),(139,'D18','pasta al forno','2016-07-21 17:18:34','2016-07-21 17:18:34','Pasta'),(140,'P31','pizza sicilia alla pollo','2016-07-21 17:21:03','2016-07-21 17:21:03','Pizza'),(141,'P44','pizza pollo tabasco','2016-07-21 17:21:25','2016-07-21 17:21:25','Pizza'),(142,'B7','insalata cesare di pollo','2016-07-21 17:25:01','2016-07-21 17:25:01','Salads'),(143,'D28','pasta pollo ai quattro formaggi  ','2016-07-21 17:26:09','2016-07-21 17:26:09','Pasta'),(144,'D30','pasta pollo al forno','2016-07-21 17:26:53','2016-07-21 17:26:53','Pasta'),(147,'','zappalicious','2016-07-24 13:14:48','2016-07-24 13:14:48','Mocktails'),(148,'','pinita colada','2016-07-24 13:15:03','2016-07-24 13:15:03','Mocktails'),(149,'','eye of the tiger','2016-07-24 13:15:21','2016-07-24 13:15:21','Mocktails'),(150,'','nojito','2016-07-24 13:16:35','2016-07-24 13:16:35','Mocktails'),(151,'','marilyn mongoose','2016-07-24 13:16:56','2016-07-24 13:16:56','Mocktails'),(152,'','lemon ice tea','2016-07-24 13:17:16','2016-07-24 13:17:16','Mocktails'),(153,'','peach ice tea','2016-07-24 13:17:28','2016-07-24 13:17:28','Mocktails'),(154,'','blackcurrant ice tea','2016-07-24 13:17:47','2016-07-24 13:17:47','Mocktails'),(155,'','fruit punch','2016-07-24 13:18:02','2016-07-24 13:18:02','Mocktails'),(156,'','strawberry lemonade','2016-07-24 13:18:44','2016-07-24 13:18:44','Mocktails'),(157,'','blue curacao lemonade','2016-07-24 13:19:08','2016-07-24 13:19:08','Mocktails'),(158,'','green apple lemonade','2016-07-24 13:19:22','2016-07-24 13:19:22','Mocktails'),(159,'','barking dog','2016-07-24 13:19:42','2016-07-24 13:19:42','Mocktails'),(160,'','smooth operator','2016-07-24 13:20:09','2016-07-24 13:20:09','Mocktails'),(161,'','caffeine berg','2016-07-24 13:20:26','2016-07-24 13:20:26','Mocktails'),(162,'','green tea','2016-07-24 13:20:37','2016-07-24 13:24:30','Drinks'),(163,'','espresso','2016-07-24 13:20:51','2016-07-24 13:26:40','Drinks'),(164,'','cappuccino','2016-07-24 13:21:12','2016-07-24 13:21:53','Drinks'),(165,'','fresh lemon soda','2016-07-24 13:21:39','2016-07-24 13:22:06','Drinks'),(166,'','fresh lemon water','2016-07-24 13:21:55','2016-07-24 13:22:15','Drinks'),(167,'','canned juice','2016-07-24 13:22:36','2016-07-24 13:24:40','Drinks'),(168,'','bottled water','2016-07-24 13:22:53','2016-07-24 13:24:50','Drinks'),(169,'','coke','2016-07-24 13:29:07','2016-07-24 13:41:03','Drinks'),(170,'','sprite','2016-07-24 13:29:14','2016-07-24 13:41:14','Drinks'),(171,'','soda','2016-07-24 13:29:21','2016-07-24 13:43:55','Drinks'),(172,'','thums up','2016-07-24 13:29:29','2016-07-24 13:44:15','Drinks'),(173,'','diet coke','2016-07-24 13:29:57','2016-07-24 13:44:33','Drinks'),(174,'','coke zero','2016-07-24 13:30:07','2016-07-24 13:45:00','Drinks'),(175,'','red bull','2016-07-24 13:30:16','2016-07-24 13:46:21','Drinks'),(176,'','latte','2016-07-24 13:32:35','2016-07-24 13:46:28','Drinks'),(177,'','milkshake','2016-07-24 13:33:08','2016-07-24 13:45:26','Mocktails'),(178,'','mongolian rice chicken','2016-07-24 13:34:30','2016-07-24 14:11:37','Specials'),(179,'','mongolian rice veg','2016-07-24 13:34:45','2016-07-24 14:11:45','Specials'),(180,'','mongolian rice lamb','2016-07-24 13:34:57','2016-07-24 14:11:54','Specials'),(181,'','cheese nachos','2016-07-24 13:35:28','2016-07-24 14:10:12','Mexican'),(182,'','chicken nachos','2016-07-24 13:35:45','2016-07-24 14:08:34','Mexican'),(183,'','beans nachos','2016-07-24 13:36:10','2016-07-24 14:08:14','Mexican'),(184,'P27','pizza umbra','2016-07-24 14:06:00','2016-07-24 14:06:00','Pizza'),(185,'P26','Piemonte','2016-07-24 14:06:15','2016-07-24 14:06:15','Pizza'),(186,'','chicken parmigiana','2016-07-24 14:13:06','2016-07-24 14:13:06','Specials');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-17 18:44:17
