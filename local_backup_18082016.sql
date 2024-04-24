-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: nixposbase
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'1','2016-08-09','hyderabad','2016-08-09 16:54:45','2016-08-09 16:55:13',NULL,2570.00,NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13'),(2,'2','2016-08-09','hyderabad','2016-08-09 16:55:16','2016-08-09 17:05:27',NULL,960.00,NULL,'2016-08-09 11:35:26','2016-08-09 11:35:26'),(3,'3','2016-08-10','hyderabad','2016-08-09 18:59:01','2016-08-09 18:59:16',NULL,1150.00,NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16'),(4,'1','2016-08-10','vizag','2016-08-09 19:04:19','2016-08-09 19:04:56',NULL,7710.00,NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_human` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_product_modifiers`
--

DROP TABLE IF EXISTS `menu_product_modifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_product_modifiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `ProductModifierGroupId` int(11) NOT NULL,
  `ModifierGroupName` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_modifier_id` int(11) NOT NULL,
  `product_modifier_name` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_modifier_price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product_modifiers`
--

LOCK TABLES `menu_product_modifiers` WRITE;
/*!40000 ALTER TABLE `menu_product_modifiers` DISABLE KEYS */;
INSERT INTO `menu_product_modifiers` VALUES (122,2,11,'general',5,'Less Spice',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(123,2,11,'general',6,'More Spice',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(124,2,11,'general',7,'Less oil',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(125,2,11,'general',8,'More oil',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(126,2,11,'general',9,'Vegan',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(127,2,11,'general',10,'Bake more',0.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(128,2,12,'extras',11,'chicken',100.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(129,2,12,'extras',12,'lamb',200.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(130,2,12,'extras',13,'shrimp',300.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(131,2,12,'extras',14,'fish',300.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(132,2,12,'extras',15,'beef',150.00,'2016-08-17 12:58:22','2016-08-17 12:58:22');
/*!40000 ALTER TABLE `menu_product_modifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_products`
--

DROP TABLE IF EXISTS `menu_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_category` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_products`
--

LOCK TABLES `menu_products` WRITE;
/*!40000 ALTER TABLE `menu_products` DISABLE KEYS */;
INSERT INTO `menu_products` VALUES (55,2,2,'crostini al forno','antipasti',10.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(56,2,4,'bruschetta pomodoro','antipasti',432.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(57,2,9,'crostini melanzana','antipasti',223.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(58,2,8,'pane aglio','antipasti',143.00,'2016-08-17 12:58:22','2016-08-17 12:58:22'),(59,2,3,'crostini assortini','antipasti',10.00,'2016-08-17 12:58:22','2016-08-17 12:58:22');
/*!40000 ALTER TABLE `menu_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (2,'regularmenu',1,'2016-08-17 10:24:00','2016-08-17 12:58:31');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',2),('2016_07_21_092635_create_products_table',3),('2016_07_21_093152_create_product_modifiers_table',4),('2016_07_21_174601_remove_unique_constraints_products_table',5),('2016_07_24_083834_add_category_to_products_table',6),('2016_07_25_083411_create_product_modifier_groups_table',7),('2016_07_25_093807_upgrade-product_modifiers-table',8),('2016_07_27_075009_drop_unique_from_product_modifier_name_in_table',9),('2016_08_01_064750_create_locations_table',10),('2016_08_06_120303_create_bills_table',11),('2016_08_06_125926_create_order_items_table',12),('2016_08_13_041057_create_product_modifier_group_maps_table',13),('2016_08_15_052033_create_menus_table',14),('2016_08_17_095156_create_menu_products_table',15),('2016_08_17_095204_create_menu_product_modifiers_table',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,NULL,'crostini melanzana','A1',1.00,280.00,0,'','[{\"name\":\"chicken\",\"price\":\"100\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"fusili\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,NULL,'crostini al forno','A2',1.00,190.00,0,'','[]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,NULL,'pane aglio e verdure','A7',1.00,120.00,0,'','[]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,NULL,'crostini con pollo e formaggio','A11',1.00,300.00,0,'','[]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,NULL,'pane aglio e formaggio','A6',1.00,90.00,0,'','[]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,NULL,'crostini melanzana','A1',3.00,1590.00,0,'','[{\"name\":\"lamb\",\"price\":\"150\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"fish\",\"price\":\"200\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"fusili\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 11:25:13','2016-08-09 11:25:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,NULL,'crostini melanzana','A1',1.00,180.00,0,'','[{\"name\":\"spaghetti\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 11:35:26','2016-08-09 11:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2,NULL,'salsa spinaci','A21',1.00,300.00,0,'','[]',NULL,'2016-08-09 11:35:27','2016-08-09 11:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2,NULL,'funghi ripieni di pollo','A24',1.00,300.00,0,'','[]',NULL,'2016-08-09 11:35:27','2016-08-09 11:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,2,NULL,'crostini melanzana','A1',1.00,180.00,0,'','[{\"name\":\"spaghetti\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 11:35:27','2016-08-09 11:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,3,NULL,'pane aglio e formaggio','A6',1.00,90.00,0,'','[]',NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,NULL,'crostini assortiti','A3',1.00,210.00,0,'','[]',NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,NULL,'bruschetta pomodoro','A4',1.00,140.00,0,'','[]',NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,3,NULL,'pollo e limone','A16',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,3,NULL,'crostini melanzana','A1',2.00,410.00,0,'','[{\"name\":\"chicken\",\"price\":\"100\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1},{\"name\":\"fusili\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1},{\"name\":\"veg\",\"price\":\"-75\",\"maxselect\":\"3\",\"group\":\"extras\",\"qty\":1}]',NULL,'2016-08-09 13:29:16','2016-08-09 13:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,4,NULL,'crostini al forno','A2',1.00,190.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,NULL,'crostini assortiti','A3',1.00,210.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,4,NULL,'insalata caprese','A8',5.00,1100.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,4,NULL,'pane aglio e verdure','A7',1.00,120.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,4,NULL,'antipasto del maiale','A15',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,4,NULL,'antipasto del maiale','A15',3.00,900.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,4,NULL,'crostini con uova','A20',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,4,NULL,'funghi ripieni di pollo','A24',3.00,900.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,4,NULL,'funghi trifolati','A10',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,4,NULL,'pane aglio','A5',1.00,70.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,4,NULL,'peperoni arrosto','A9',1.00,220.00,0,'','[]',NULL,'2016-08-09 13:34:56','2016-08-09 13:34:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,4,NULL,'salsa jalapeno','A22',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,4,NULL,'funghi ripieni di verdure','A23',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,4,NULL,'crostini con tonno','A18',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,4,NULL,'funghi trifolati','A10',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,4,NULL,'bruschetta pomodoro','A4',1.00,140.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,4,NULL,'crostini assortiti','A3',1.00,210.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,4,NULL,'pane aglio e verdure','A7',1.00,120.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,4,NULL,'crostini con pollo e formaggio','A11',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,4,NULL,'pane aglio e formaggio','A6',1.00,90.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,4,NULL,'crostini melanzana','A1',1.00,180.00,0,'','[{\"name\":\"fusili\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"pasta\",\"qty\":1}]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,4,NULL,'pane aglio e verdure','A7',1.00,120.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,4,NULL,'insalata caprese','A8',1.00,220.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,4,NULL,'peperoni arrosto','A9',1.00,220.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,4,NULL,'crostini con tonno','A18',1.00,300.00,0,'','[]',NULL,'2016-08-09 13:34:57','2016-08-09 13:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifier_group_maps`
--

LOCK TABLES `product_modifier_group_maps` WRITE;
/*!40000 ALTER TABLE `product_modifier_group_maps` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifier_groups`
--

LOCK TABLES `product_modifier_groups` WRITE;
/*!40000 ALTER TABLE `product_modifier_groups` DISABLE KEYS */;
INSERT INTO `product_modifier_groups` VALUES (11,0,0,0,0,0,0,0,0,'',0,0,'general',NULL,'2016-08-16 11:41:57','2016-08-16 11:41:57'),(12,0,0,0,0,0,0,0,0,'',0,0,'extras',NULL,'2016-08-16 11:50:14','2016-08-16 11:50:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifiers`
--

LOCK TABLES `product_modifiers` WRITE;
/*!40000 ALTER TABLE `product_modifiers` DISABLE KEYS */;
INSERT INTO `product_modifiers` VALUES (1,'extra cheese','2016-08-14 07:49:18','2016-08-14 10:07:37',1,1,1,'2016-08-14 10:07:37'),(2,'extra chicken','2016-08-14 07:49:18','2016-08-14 10:07:37',2,1,1,'2016-08-14 10:07:37'),(3,'extra lamb','2016-08-14 07:49:18','2016-08-14 10:07:37',3,1,2,'2016-08-14 10:07:37'),(4,'soemthing','2016-08-14 08:57:05','2016-08-16 11:38:20',1,6,2,'2016-08-16 11:38:20'),(5,'Less Spice','2016-08-16 11:41:57','2016-08-16 11:41:57',1,11,1,NULL),(6,'More Spice','2016-08-16 11:41:57','2016-08-16 11:41:57',2,11,1,NULL),(7,'Less oil','2016-08-16 11:41:57','2016-08-16 11:41:57',3,11,1,NULL),(8,'More oil','2016-08-16 11:41:58','2016-08-16 11:41:58',4,11,1,NULL),(9,'Vegan','2016-08-16 11:41:58','2016-08-16 11:41:58',5,11,1,NULL),(10,'Bake more','2016-08-16 11:41:58','2016-08-16 11:41:58',6,11,1,NULL),(11,'chicken','2016-08-16 11:50:14','2016-08-16 11:50:14',1,12,3,NULL),(12,'lamb','2016-08-16 11:50:14','2016-08-16 11:50:14',2,12,3,NULL),(13,'shrimp','2016-08-16 11:50:14','2016-08-16 11:50:14',3,12,3,NULL),(14,'fish','2016-08-16 11:50:14','2016-08-16 11:50:14',4,12,3,NULL),(15,'beef','2016-08-16 11:50:14','2016-08-16 11:50:14',5,12,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'A2','crostini al forno','2016-07-21 07:02:37','2016-07-24 04:01:42','antipasti'),(3,'A3','crostini assortini','2016-07-21 07:16:15','2016-07-24 04:01:47','antipasti'),(4,'A4','bruschetta pomodoro','2016-07-21 07:17:14','2016-07-24 04:01:52','antipasti'),(8,'A5','pane aglio','2016-07-24 03:27:26','2016-07-24 04:01:56','antipasti'),(9,'A1','crostini melanzana','2016-08-06 13:23:13','2016-08-06 13:23:13','antipasti');
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

-- Dump completed on 2016-08-18  0:18:07
