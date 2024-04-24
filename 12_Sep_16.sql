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
  `payment_details` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'1','2016-08-10','hyderabad','2016-08-09 19:01:12','2016-08-09 19:01:41',NULL,1980.00,NULL,'2016-08-09 19:01:41','2016-08-09 19:01:41',NULL),(2,'2','2016-08-21','hyderabad','2016-08-20 21:45:12','2016-08-20 21:45:46',NULL,2380.00,NULL,'2016-08-20 21:45:46','2016-08-20 21:45:46','{\"settledAmount\":2380,\"billAmount\":2380,\"paymentDetails\":[{\"payid\":\"6710a\",\"amount\":1090,\"type\":\"cash\",\"opts\":null},{\"payid\":\"4zq08\",\"amount\":1290,\"type\":\"credit\",\"opts\":{\"CC Number\":\"1233\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(3,'3','2016-08-21','hyderabad','2016-08-20 22:13:46','2016-08-20 22:16:31',NULL,915.00,NULL,'2016-08-20 22:16:32','2016-08-20 22:16:32','{\"settledAmount\":732,\"billAmount\":915,\"paymentDetails\":[{\"payid\":\"x3f9x\",\"amount\":500,\"type\":\"cash\",\"opts\":null},{\"payid\":\"jpp1e\",\"amount\":232,\"type\":\"credit\",\"opts\":{\"CC Number\":\"4567\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":183,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(4,'4','2016-08-22','hyderabad','2016-08-22 08:13:28','2016-08-22 08:14:34',NULL,150.00,NULL,'2016-08-22 08:14:35','2016-08-22 08:14:35','{\"settledAmount\":120,\"billAmount\":150,\"paymentDetails\":[{\"payid\":\"9n7jm\",\"amount\":120,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":30,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(5,'5','2016-08-22','hyderabad','2016-08-22 08:26:05','2016-08-22 08:26:53',NULL,730.00,NULL,'2016-08-22 08:27:41','2016-08-22 08:27:41','{\"settledAmount\":511,\"billAmount\":730,\"paymentDetails\":[{\"payid\":\"13oy8\",\"amount\":211,\"type\":\"cash\",\"opts\":null},{\"payid\":\"qv9lg\",\"amount\":300,\"type\":\"credit\",\"opts\":{\"CC Number\":\"8769\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":219,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(6,'6','2016-08-22','hyderabad','2016-08-22 08:28:02','2016-08-22 08:28:30',NULL,315.00,NULL,'2016-08-22 08:28:30','2016-08-22 08:28:30','{\"settledAmount\":315,\"billAmount\":315,\"paymentDetails\":[{\"payid\":\"ob2v1\",\"amount\":315,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(7,'7','2016-08-22','hyderabad','2016-08-22 08:28:38','2016-08-22 08:29:32',NULL,2506.00,NULL,'2016-08-22 08:29:32','2016-08-22 08:29:32','{\"settledAmount\":2005,\"billAmount\":2506,\"paymentDetails\":[{\"payid\":\"4i33d\",\"amount\":1005,\"type\":\"cash\",\"opts\":null},{\"payid\":\"nu5ne\",\"amount\":1000,\"type\":\"credit\",\"opts\":{\"CC Number\":\"2345\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":501,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(8,'8','2016-08-22','hyderabad','2016-08-22 08:29:39','2016-08-22 08:30:06',NULL,665.00,NULL,'2016-08-22 08:30:06','2016-08-22 08:30:06','{\"settledAmount\":665,\"billAmount\":665,\"paymentDetails\":[{\"payid\":\"iyyao\",\"amount\":665,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(9,'9','2016-08-22','hyderabad','2016-08-22 08:31:07','2016-08-22 08:31:51',NULL,2050.00,NULL,'2016-08-22 08:31:51','2016-08-22 08:31:51','{\"settledAmount\":2050,\"billAmount\":2050,\"paymentDetails\":[{\"payid\":\"c24bl\",\"amount\":2050,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(10,'10','2016-08-22','hyderabad','2016-08-22 10:24:35','2016-08-22 10:26:01',NULL,515.00,NULL,'2016-08-22 10:26:01','2016-08-22 10:26:01','{\"settledAmount\":415,\"billAmount\":515,\"paymentDetails\":[{\"payid\":\"2mof2\",\"amount\":200,\"type\":\"cash\",\"opts\":null},{\"payid\":\"6rknx\",\"amount\":215,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":100,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(11,'9401','2016-09-06','visakhapatnam-waltair-uplands','2016-09-06 16:28:33','2016-09-06 16:29:11',1,790.00,NULL,'2016-09-06 16:29:11','2016-09-06 16:29:11','{\"settledAmount\":790,\"billAmount\":790,\"paymentDetails\":[{\"payid\":\"e9c5x\",\"amount\":790,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(12,'9402','2016-09-06','visakhapatnam-waltair-uplands','2016-09-06 16:29:31','2016-09-06 16:30:23',1,190.00,NULL,'2016-09-06 16:30:23','2016-09-06 16:30:23','{\"settledAmount\":190,\"billAmount\":190,\"paymentDetails\":[{\"payid\":\"wmxyy\",\"amount\":190,\"type\":\"credit\",\"opts\":{\"CC Number\":\"7087\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(13,'9403','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:30:27','2016-09-06 16:33:05',1,850.00,NULL,'2016-09-06 16:33:05','2016-09-06 16:33:05','{\"settledAmount\":850,\"billAmount\":850,\"paymentDetails\":[{\"payid\":\"pmvk2\",\"amount\":850,\"type\":\"credit\",\"opts\":{\"CC Number\":\"8391\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(14,'9404','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:33:09','2016-09-06 16:33:47',1,860.00,NULL,'2016-09-06 16:33:47','2016-09-06 16:33:47','{\"settledAmount\":860,\"billAmount\":860,\"paymentDetails\":[{\"payid\":\"ch7lf\",\"amount\":860,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(15,'9405','2016-09-06','visakhapatnam-waltair-uplands','2016-09-06 16:33:52','2016-09-06 16:36:23',1,1020.00,NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23','{\"settledAmount\":1020,\"billAmount\":1020,\"paymentDetails\":[{\"payid\":\"f5jfc\",\"amount\":1020,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(16,'9406','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:36:27','2016-09-06 16:38:53',1,1110.00,NULL,'2016-09-06 16:38:53','2016-09-06 16:38:53','{\"settledAmount\":1110,\"billAmount\":1110,\"paymentDetails\":[{\"payid\":\"afrem\",\"amount\":1110,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(17,'9407','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:38:58','2016-09-06 16:40:15',1,960.00,NULL,'2016-09-06 16:40:15','2016-09-06 16:40:15','{\"settledAmount\":960,\"billAmount\":960,\"paymentDetails\":[{\"payid\":\"jvub9\",\"amount\":960,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(18,'9408','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:40:20','2016-09-06 16:41:20',1,1270.00,NULL,'2016-09-06 16:41:20','2016-09-06 16:41:20','{\"settledAmount\":1270,\"billAmount\":1270,\"paymentDetails\":[{\"payid\":\"nnn9a\",\"amount\":1270,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(19,'9409','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:41:25','2016-09-06 16:42:48',1,1290.00,NULL,'2016-09-06 16:42:48','2016-09-06 16:42:48','{\"settledAmount\":1290,\"billAmount\":1290,\"paymentDetails\":[{\"payid\":\"as8fa\",\"amount\":1290,\"type\":\"credit\",\"opts\":{\"CC Number\":\"0009\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(20,'9410','2016-09-06','visakhapatnam-waltair-uplands','2016-09-06 16:42:53','2016-09-06 16:43:37',1,1270.00,NULL,'2016-09-06 16:43:37','2016-09-06 16:43:37','{\"settledAmount\":1270,\"billAmount\":1270,\"paymentDetails\":[{\"payid\":\"3vg4b\",\"amount\":1270,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(21,'9411','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:47:48','2016-09-06 16:53:04',1,1200.00,NULL,'2016-09-06 16:53:04','2016-09-06 16:53:04','{\"settledAmount\":1200,\"billAmount\":1200,\"paymentDetails\":[{\"payid\":\"qy6wz\",\"amount\":1200,\"type\":\"credit\",\"opts\":{\"CC Number\":\"3629\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(22,'9412','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 16:56:09','2016-09-06 17:04:28',1,670.00,NULL,'2016-09-06 17:04:28','2016-09-06 17:04:28','{\"settledAmount\":670,\"billAmount\":670,\"paymentDetails\":[{\"payid\":\"go9v4\",\"amount\":670,\"type\":\"credit\",\"opts\":{\"CC Number\":\"5726\"}}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}'),(23,'9413','2016-09-01','visakhapatnam-waltair-uplands','2016-09-06 17:04:32','2016-09-06 17:09:53',1,320.00,NULL,'2016-09-06 17:09:53','2016-09-06 17:09:53','{\"settledAmount\":320,\"billAmount\":320,\"paymentDetails\":[{\"payid\":\"nv130\",\"amount\":320,\"type\":\"cash\",\"opts\":null}],\"toBeSettledAmount\":0,\"status\":true,\"numberPayment\":0,\"discount\":0,\"PAYMENT_TYPES\":[\"cash\",\"credit\"]}');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_user`
--

DROP TABLE IF EXISTS `location_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `home` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_user`
--

LOCK TABLES `location_user` WRITE;
/*!40000 ALTER TABLE `location_user` DISABLE KEYS */;
INSERT INTO `location_user` VALUES (1,1,2,0,'2016-08-31 11:07:21','2016-08-31 11:07:21'),(2,1,1,1,'2016-08-31 11:07:21','2016-08-31 11:07:21'),(3,2,1,1,'2016-08-31 11:07:21','2016-08-31 11:07:21'),(4,3,2,1,'2016-08-31 11:07:21','2016-08-31 11:07:21');
/*!40000 ALTER TABLE `location_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_location_slug_unique` (`location_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'hyderabad-jubilee-hills','jubilee hills','hyderabad',1,'2016-08-31 11:06:39','2016-08-31 11:06:39'),(2,'hyderabad-banjara-hills','banjara hills','hyderabad',1,'2016-08-31 11:06:39','2016-08-31 11:06:39'),(3,'visakhapatnam-waltair-uplands','waltair uplands','visakhapatnam',1,'2016-09-06 15:16:17','2016-09-06 15:16:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product_modifiers`
--

LOCK TABLES `menu_product_modifiers` WRITE;
/*!40000 ALTER TABLE `menu_product_modifiers` DISABLE KEYS */;
INSERT INTO `menu_product_modifiers` VALUES (259,1,1,'Drinks',1,'no ice',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(260,1,1,'Drinks',2,'less ice',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(261,1,1,'Drinks',3,'less sweet',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(262,1,1,'Drinks',4,'with ice',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(263,1,1,'Drinks',5,'sweet',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(264,1,1,'Drinks',6,'salt',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(265,1,1,'Drinks',7,'sweet and salt',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(266,1,1,'Drinks',59,'honey',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(267,1,1,'Drinks',67,'no mint',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(268,1,1,'Drinks',68,'no icecream',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(269,1,1,'Drinks',69,'sugar free',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(270,1,1,'Drinks',70,'with food',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(271,1,2,'Pasta',8,'penne',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(272,1,2,'Pasta',9,'spaghetti',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(273,1,2,'Pasta',10,'fussili',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(274,1,2,'Pasta',11,'tagliatelle',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(275,1,2,'Pasta',12,'farfalle',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(276,1,2,'Pasta',13,'spinach ravioli',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(277,1,2,'Pasta',14,'gnocchi',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(278,1,2,'Pasta',15,'tortellini',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(279,1,2,'Pasta',16,'risotto',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(280,1,3,'Cooking Instructions',17,'no mushrooms',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(281,1,3,'Cooking Instructions',18,'less spicy',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(282,1,3,'Cooking Instructions',19,'medium spicy',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(283,1,3,'Cooking Instructions',20,'more spicy',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(284,1,3,'Cooking Instructions',21,'no spicy',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(285,1,3,'Cooking Instructions',22,'more cheese',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(286,1,3,'Cooking Instructions',23,'no cheese',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(287,1,3,'Cooking Instructions',24,'thick sauce',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(288,1,3,'Cooking Instructions',25,'al dente',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(289,1,3,'Cooking Instructions',26,'no onion garlic',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(290,1,3,'Cooking Instructions',27,'parcel',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(291,1,3,'Cooking Instructions',28,'gluten free',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(292,1,3,'Cooking Instructions',29,'no garnish',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(293,1,3,'Cooking Instructions',65,'no tomato sauce',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(294,1,3,'Cooking Instructions',66,'more sauce',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(295,1,3,'Cooking Instructions',88,'well cooked',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(296,1,4,'Juice',32,'cranberry',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(297,1,4,'Juice',33,'guava',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(298,1,4,'Juice',34,'mango',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(299,1,4,'Juice',35,'orange',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(300,1,4,'Juice',36,'pineapple',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(301,1,5,'Extra Toppings',37,'chicken',80.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(302,1,5,'Extra Toppings',38,'lamb',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(303,1,5,'Extra Toppings',39,'beef',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(304,1,5,'Extra Toppings',40,'bacon',160.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(305,1,5,'Extra Toppings',41,'vegetables',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(306,1,5,'Extra Toppings',42,'mushroom',60.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(307,1,5,'Extra Toppings',43,'extra cheese',80.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(308,1,5,'Extra Toppings',44,'broccoli',80.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(309,1,5,'Extra Toppings',45,'shrimp',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(310,1,5,'Extra Toppings',46,'smoked salmon',300.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(311,1,5,'Extra Toppings',47,'parmesan',80.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(312,1,5,'Extra Toppings',48,'blue cheese',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(313,1,5,'Extra Toppings',49,'artichokes',80.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(314,1,5,'Extra Toppings',50,'black olives',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(315,1,5,'Extra Toppings',51,'green olives',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(316,1,5,'Extra Toppings',52,'capers',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(317,1,5,'Extra Toppings',53,'jalapenos',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(318,1,5,'Extra Toppings',54,'sun dried tomatoes',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(319,1,5,'Extra Toppings',55,'extra meatballs',200.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(320,1,5,'Extra Toppings',56,'pepperoni',200.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(321,1,5,'Extra Toppings',57,'red yellow bell peppers',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(322,1,5,'Extra Toppings',58,'green bell peppers',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(323,1,6,'Inc Modifiers',60,'soy inc',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(324,1,6,'Inc Modifiers',61,'chicken inc',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(325,1,6,'Inc Modifiers',62,'lamb inc',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(326,1,6,'Inc Modifiers',63,'beef inc',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(327,1,6,'Inc Modifiers',64,'bacon inc',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(328,1,7,'Soup',71,'tomato',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(329,1,7,'Soup',72,'mushroom',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(330,1,7,'Soup',73,'broccoli',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(331,1,7,'Soup',74,'clear vegetable',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(332,1,7,'Soup',75,'asparagus',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(333,1,7,'Soup',76,'chickpea',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(334,1,7,'Soup',77,'bell pepper',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(335,1,7,'Soup',78,'spring onion',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(336,1,7,'Soup',79,'X 2',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(337,1,7,'Soup',80,'X 3',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(338,1,7,'Soup',81,'X 4',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(339,1,7,'Soup',82,'X 5',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(340,1,7,'Soup',83,'X 6',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(341,1,7,'Soup',84,'X 7',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(342,1,7,'Soup',85,'X 8',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(343,1,7,'Soup',86,'X 9',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(344,1,7,'Soup',87,'X 10',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10');
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
  `product_category` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=781 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_products`
--

LOCK TABLES `menu_products` WRITE;
/*!40000 ALTER TABLE `menu_products` DISABLE KEYS */;
INSERT INTO `menu_products` VALUES (581,1,1,'crostini melanzana','Antipasti',200.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(582,1,2,'crostini al forno','Antipasti',210.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(583,1,3,'crostini assortiti','Antipasti',230.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(584,1,4,'bruschetta pomodoro','Antipasti',160.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(585,1,5,'pane aglio','Antipasti',70.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(586,1,6,'pane aglio e mozzarella','Antipasti',100.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(587,1,7,'pane aglio e verdure ','Antipasti',140.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(588,1,8,'crostini verdure ','Antipasti',220.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(589,1,9,'insalata caprese','Antipasti',250.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(590,1,10,'peperoni arrosto','Antipasti',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(591,1,11,'funghi trifolati','Antipasti',220.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(592,1,12,'crostini con pollo e formaggio','Antipasti',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(593,1,13,'carpaccio di salmone','Antipasti',510.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(594,1,14,'antipasto del maiale','Antipasti',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(595,1,15,'pollo e limone','Antipasti',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(596,1,16,'crostini con tonno','Antipasti',260.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(597,1,17,'salsa spinaci','Antipasti',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(598,1,18,'salsa jalapeno','Antipasti',260.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(599,1,19,'funghi ripieni di verdure','Antipasti',250.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(600,1,20,'funghi ripieni di pollo','Antipasti',270.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(601,1,21,'verdure saltate','Contorni',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(602,1,22,'broccoli strascinati','Antipasti',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(603,1,23,'zuppa del giorno','Soup',150.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(604,1,24,'insalata pomodoro','Salads',210.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(605,1,25,'insalata contadina','Salads',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(606,1,26,'insalata mista','Salads',240.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(607,1,27,'insalata pollo','Salads',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(608,1,28,'insalata cesare','Salads',270.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(609,1,29,'insalata verde di pollo','Salads',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(610,1,30,'insalata pancetta','Salads',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(611,1,31,'insalata russo','Salads',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(612,1,32,'insalata con formaggio di capra','Salads',400.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(613,1,33,'insalata vecchi monaco','Salads',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(614,1,34,'insalata tonno','Salads',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(615,1,35,'pizza margherita','Pizza',260.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(616,1,36,'pizza funghi','Pizza',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(617,1,37,'pizza cipolla','Pizza',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(618,1,38,'pizza melanzana','Pizza',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(619,1,39,'pizza vito','Pizza',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(620,1,40,'pizza hawaiiano','Pizza',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(621,1,41,'pizza mediterranean','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(622,1,42,'pizza pomodoro','Pizza',270.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(623,1,43,'pizza casa','Pizza',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(624,1,44,'pizza tabasco','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(625,1,45,'pizza tre peperoni','Pizza',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(626,1,46,'pizza sicilia','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(627,1,47,'pizza spinaci','Pizza',290.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(628,1,48,'pizza liscio','Pizza',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(629,1,49,'pizza sovrano','Pizza',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(630,1,50,'pizza genovese','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(631,1,51,'pizza pollito','Pizza',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(632,1,52,'pizza quattro formaggi','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(633,1,53,'pizza con pollo','Pizza',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(634,1,54,'pizza tonno e cipolla','Pizza',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(635,1,55,'pizza diavola','Pizza',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(636,1,56,'pizza straniera','Pizza',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(637,1,57,'pizza alla vodka','Pizza',410.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(638,1,58,'pizza alpi','Pizza',410.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(639,1,59,'pizza gamberetti e sugo rosa','Pizza',430.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(640,1,60,'pizza pollo e pesto','Pizza',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(641,1,61,'pizza salmone affuicata','Pizza',620.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(642,1,62,'pizza salame di maiale ','Pizza',430.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(643,1,63,'pizza agnello speziato ','Pizza',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(644,1,64,'pizza salame di pollo','Pizza',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(645,1,65,'pizza maiale blu','Pizza',470.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(646,1,66,'pizza arcevia ','Pizza',490.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(647,1,67,'pizza bismark','Pizza',470.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(648,1,68,'pizza spagnolo','Pizza',490.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(649,1,69,'pizza piri piri','Pizza',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(650,1,70,'crespelle di funghi','Fresh Pasta',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(651,1,71,'crespelle di pollo','Fresh Pasta',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(652,1,72,'crespelle di verdure ','Fresh Pasta',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(653,1,73,'cannelloni alla fiorentina ','Fresh Pasta',290.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(654,1,74,'lasagne napoletana(cheese)','Fresh Pasta',270.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(655,1,75,'lasagne di funghi','Fresh Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(656,1,76,'lasagne di pollo','Fresh Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(657,1,77,'lasagne di agnello','Fresh Pasta',400.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(658,1,78,'lasagne di verdure ','Fresh Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(659,1,79,'pasta napoletana','Pasta',220.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(660,1,80,'pasta aglio olio e peperoncino','Pasta',230.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(661,1,81,'pasta aglio olio e agnello','Pasta',400.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(662,1,82,'pasta aglio olio e verdure ','Pasta',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(663,1,83,'pasta puttanesca napoletana','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(664,1,84,'pasta melanzana','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(665,1,85,'pasta pesto genovese','Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(666,1,86,'pasta arrabbiata','Pasta',270.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(667,1,87,'pasta ai quattro formaggi ','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(668,1,88,'pasta alfredo','Pasta',280.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(669,1,89,'pasta panna e noci','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(670,1,90,'pasta panna funghi e piselli','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(671,1,91,'pasta spinaci e formaggio','Pasta',300.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(672,1,92,'patsa supremo broccoli','Pasta',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(673,1,93,'pasta pollo supremo ','Pasta',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(674,1,94,'pasta milazzo','Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(675,1,95,'pasta sugo rosa','Pasta',290.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(676,1,96,'pizza grano turco','Pizza',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(677,1,97,'pizza grande','Pizza',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(678,1,98,'pasta primavera ','Pasta',310.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(679,1,99,'pasta al capone','Pasta',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(680,1,100,'pasta funghi porcini','Pasta',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(681,1,101,'pasta quattro stagioni','Pasta',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(682,1,102,'pasta sugo alla matriciana','Pasta',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(683,1,103,'pasta carbonara ','Pasta',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(684,1,104,'pasta bolognese','Pasta',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(685,1,105,'pasta vodka','Pasta',420.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(686,1,106,'pasta campesina ','Pasta',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(687,1,107,'pasta agnello al vino','Pasta',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(688,1,108,'pasta gricia','Pasta',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(689,1,109,'pasta polpettine al sugo','Pasta',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(690,1,110,'pasta salmone','Pasta',620.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(691,1,111,'pasta tonno al sugo','Pasta',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(692,1,112,'pasta gamberetti al sugo','Pasta',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(693,1,113,'pasta gamberi di salsa bianca','Pasta',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(694,1,114,'pasta shrimp campesina ','Pasta',430.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(695,1,115,'risotto al forno','Risotto',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(696,1,116,'risotto funghi e zaffrano','Risotto',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(697,1,117,'risotto funghi porcini','Risotto',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(698,1,118,'risotto quattro formaggi','Risotto',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(699,1,119,'risotto al salsa ','Risotto',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(700,1,120,'risotto di pesto','Risotto',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(701,1,121,'risotto panna piccante','Risotto',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(702,1,122,'risotto di pollo','Risotto',340.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(703,1,123,'risotto alla campesina ','Risotto',370.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(704,1,124,'risotto di spinaci e pollo','Risotto',370.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(705,1,125,'risotto fruitti di mare','Risotto',390.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(706,1,126,'pollo panna e funghi','Secondi',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(707,1,127,'pollo cacciatore','Secondi',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(708,1,128,'pollo alla raganello','Secondi',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(709,1,129,'panna e pesci','Secondi',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(710,1,130,'pesci nepoletana','Secondi',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(711,1,131,'pollo grigliata','Secondi',360.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(712,1,132,'pesci grigliata','Secondi',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(713,1,133,'paolas tiramisu','Desserts',140.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(714,1,134,'the bomb','Desserts',190.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(715,1,135,'sizzling brownie','Desserts',190.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(716,1,136,'no-bake blueberry cheesecake ','Desserts',190.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(717,1,137,'panna cotta','Desserts',150.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(718,1,138,'pasta teramo','Pasta',330.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(719,1,139,'pasta al forno','Pasta',320.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(720,1,140,'pizza sicilia alla pollo','Pizza',420.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(721,1,141,'pizza pollo tabasco','Pizza',420.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(722,1,142,'insalata cesare di pollo','Salads',350.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(723,1,143,'pasta pollo ai quattro formaggi  ','Pasta',380.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(724,1,144,'pasta pollo al forno','Pasta',400.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(725,1,147,'zappalicious','Mocktails',160.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(726,1,148,'pinita colada','Mocktails',160.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(727,1,149,'eye of the tiger','Mocktails',190.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(728,1,150,'nojito','Mocktails',120.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(729,1,151,'marilyn mongoose','Mocktails',160.00,'2016-09-06 15:56:09','2016-09-06 15:56:09'),(730,1,152,'lemon ice tea','Mocktails',70.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(731,1,153,'peach ice tea','Mocktails',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(732,1,154,'blackcurrant ice tea','Mocktails',130.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(733,1,155,'fruit punch','Mocktails',170.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(734,1,156,'strawberry lemonade','Mocktails',150.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(735,1,157,'blue curacao lemonade','Mocktails',150.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(736,1,158,'green apple lemonade','Mocktails',150.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(737,1,159,'barking dog','Mocktails',160.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(738,1,160,'smooth operator','Mocktails',160.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(739,1,161,'caffeine berg','Mocktails',140.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(740,1,162,'green tea','Drinks',60.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(741,1,163,'espresso','Drinks',60.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(742,1,164,'cappuccino','Drinks',60.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(743,1,165,'fresh lemon soda','Drinks',70.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(744,1,166,'fresh lemon water','Drinks',70.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(745,1,167,'canned juice','Drinks',100.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(746,1,168,'bottled water','Drinks',40.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(747,1,169,'coke','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(748,1,170,'sprite','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(749,1,171,'soda','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(750,1,172,'thums up','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(751,1,173,'diet coke','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(752,1,174,'coke zero','Drinks',50.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(753,1,175,'red bull','Drinks',100.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(754,1,176,'latte','Drinks',60.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(755,1,177,'milkshake','Mocktails',160.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(756,1,178,'mongolian rice chicken','Specials',350.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(757,1,179,'mongolian rice veg','Specials',350.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(758,1,180,'mongolian rice lamb','Specials',400.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(759,1,181,'cheese nachos','Mexican',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(760,1,182,'chicken nachos','Mexican',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(761,1,183,'beans nachos','Mexican',0.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(762,1,184,'pizza umbra','Pizza',330.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(763,1,185,'Piemonte','Pizza',330.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(764,1,186,'chicken parmigiana','Specials',320.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(765,1,188,'bean tacos','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(766,1,199,'cheese quesadillas','Mexican',250.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(767,1,200,'Chicken quesadillas','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(768,1,189,'chicken tacos','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(769,1,191,'Enchiladas with beans','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(770,1,194,'Enchiladas with chicken','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(771,1,192,'Enchiladas with corn','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(772,1,195,'Enchiladas with lamb','Mexican',340.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(773,1,193,'Enchiladas with mushrooms','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(774,1,190,'lamb tacos','Mexican',350.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(775,1,202,'Mexican rice chicken','Mexican',350.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(776,1,201,'Mexican rice veg','Mexican',320.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(777,1,187,'Tortilla chips with Salsa','Mexican',190.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(778,1,198,'Veg quesadillas','Mexican',290.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(779,1,197,'Chef special chicken enchiladas','Mexican',350.00,'2016-09-06 15:56:10','2016-09-06 15:56:10'),(780,1,196,'Chef special enchiladas','Mexican',330.00,'2016-09-06 15:56:10','2016-09-06 15:56:10');
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
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Regular menu',1,'2016-09-06 15:40:58','2016-09-06 15:41:03',3);
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
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',2),('2014_10_12_100000_create_password_resets_table',3),('2016_07_21_092635_create_products_table',4),('2016_07_21_093152_create_product_modifiers_table',5),('2016_07_21_174601_remove_unique_constraints_products_table',6),('2016_07_24_083834_add_category_to_products_table',7),('2016_07_25_083411_create_product_modifier_groups_table',8),('2016_07_25_093807_upgrade-product_modifiers-table',9),('2016_07_27_075009_drop_unique_from_product_modifier_name_in_table',10),('2016_08_06_120303_create_bills_table',11),('2016_08_06_125926_create_order_items_table',12),('2016_08_13_041057_create_product_modifier_group_maps_table',13),('2016_08_15_052033_create_menus_table',14),('2016_08_17_095156_create_menu_products_table',14),('2016_08_17_095204_create_menu_product_modifiers_table',14),('2016_08_18_071044_update_menu_products_to_make_category_nullable',15),('2016_08_20_212713_update_bills_table_create_payment_text_columm',16),('2016_08_25_053539_create_acl_tables',17),('2016_08_25_055847_create_locations_table',17),('2016_08_31_050139_update_menu_table_with_location_id',17);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,11,NULL,'pasta pollo supremo ','D31',1.00,350.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:29:11','2016-09-06 16:29:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,11,NULL,'pizza sovrano','P19',1.00,440.00,0,'','[{\"name\":\"broccoli\",\"price\":\"80.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1}]',NULL,'2016-09-06 16:29:11','2016-09-06 16:29:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,12,NULL,'the bomb','G2',1.00,190.00,0,'','[]',NULL,'2016-09-06 16:30:23','2016-09-06 16:30:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,13,NULL,'pasta pollo supremo ','D31',1.00,430.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1},{\"name\":\"broccoli\",\"price\":\"80.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1}]',NULL,'2016-09-06 16:33:05','2016-09-06 16:33:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,13,NULL,'risotto alla campesina ','F8',1.00,420.00,0,'','[{\"name\":\"vegetables\",\"price\":\"50.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1}]',NULL,'2016-09-06 16:33:05','2016-09-06 16:33:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,14,NULL,'pizza arcevia ','P40',1.00,490.00,0,'','[]',NULL,'2016-09-06 16:33:47','2016-09-06 16:33:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,14,NULL,'risotto alla campesina ','F8',1.00,370.00,0,'','[]',NULL,'2016-09-06 16:33:47','2016-09-06 16:33:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,15,NULL,'nojito','',1.00,120.00,0,'','[]',NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,15,NULL,'nojito','',1.00,120.00,0,'','[]',NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,15,NULL,'pane aglio e verdure ','A7',1.00,140.00,0,'','[]',NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,15,NULL,'patsa supremo broccoli','D14',1.00,350.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,15,NULL,'chicken tacos','',1.00,290.00,0,'','[]',NULL,'2016-09-06 16:36:23','2016-09-06 16:36:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,16,NULL,'pizza diavola','P28',1.00,330.00,0,'','[]',NULL,'2016-09-06 16:38:53','2016-09-06 16:38:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,16,NULL,'pasta alfredo','D10',1.00,360.00,0,'','[{\"name\":\"chicken\",\"price\":\"80.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1},{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:38:53','2016-09-06 16:38:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,16,NULL,'pizza sicilia alla pollo','P31',1.00,420.00,0,'','[]',NULL,'2016-09-06 16:38:53','2016-09-06 16:38:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,17,NULL,'zuppa del giorno','Z1',1.00,150.00,0,'','[{\"name\":\"mushroom\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Soup\",\"qty\":1}]',NULL,'2016-09-06 16:40:15','2016-09-06 16:40:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,17,NULL,'pizza agnello speziato ','P37',1.00,390.00,0,'','[]',NULL,'2016-09-06 16:40:15','2016-09-06 16:40:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,17,NULL,'patsa supremo broccoli','D14',1.00,350.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:40:15','2016-09-06 16:40:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,17,NULL,'lemon ice tea','',1.00,70.00,0,'','[]',NULL,'2016-09-06 16:40:15','2016-09-06 16:40:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,18,NULL,'Mexican rice veg','',1.00,320.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,18,NULL,'pane aglio e verdure ','A7',1.00,140.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,18,NULL,'pizza sicilia','P13',1.00,340.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,18,NULL,'the bomb','G2',1.00,190.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,18,NULL,'nojito','',1.00,120.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,18,NULL,'nojito','',1.00,120.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,18,NULL,'bottled water','',1.00,40.00,0,'','[]',NULL,'2016-09-06 16:41:21','2016-09-06 16:41:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,19,NULL,'bean tacos','',1.00,290.00,0,'','[]',NULL,'2016-09-06 16:42:48','2016-09-06 16:42:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,19,NULL,'Chicken quesadillas','',2.00,580.00,0,'','[]',NULL,'2016-09-06 16:42:48','2016-09-06 16:42:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,19,NULL,'risotto alla campesina ','F8',1.00,370.00,0,'','[]',NULL,'2016-09-06 16:42:48','2016-09-06 16:42:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,19,NULL,'thums up','',1.00,50.00,0,'','[]',NULL,'2016-09-06 16:42:48','2016-09-06 16:42:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,20,NULL,'insalata caprese','A8',1.00,250.00,0,'','[]',NULL,'2016-09-06 16:43:37','2016-09-06 16:43:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,20,NULL,'pizza casa','P10',1.00,320.00,0,'','[]',NULL,'2016-09-06 16:43:37','2016-09-06 16:43:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,20,NULL,'patsa supremo broccoli','D14',1.00,350.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:43:37','2016-09-06 16:43:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,20,NULL,'pasta quattro stagioni','D22',1.00,350.00,0,'','[{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:43:37','2016-09-06 16:43:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,21,NULL,'zuppa del giorno','Z1',1.00,200.00,0,'','[{\"name\":\"vegetables\",\"price\":\"50.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1}]',NULL,'2016-09-06 16:53:04','2016-09-06 16:53:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,21,NULL,'barking dog','',1.00,160.00,0,'','[]',NULL,'2016-09-06 16:53:04','2016-09-06 16:53:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,21,NULL,'pasta vodka','D27',1.00,550.00,0,'','[{\"name\":\"bacon inc\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Inc Modifiers\",\"qty\":1},{\"name\":\"lamb\",\"price\":\"130.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1},{\"name\":\"penne\",\"price\":\"null\",\"maxselect\":\"1\",\"group\":\"Pasta\",\"qty\":1}]',NULL,'2016-09-06 16:53:04','2016-09-06 16:53:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,21,NULL,'Enchiladas with chicken','',1.00,290.00,0,'','[]',NULL,'2016-09-06 16:53:04','2016-09-06 16:53:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,22,NULL,'pizza sicilia','P13',1.00,390.00,0,'','[{\"name\":\"black olives\",\"price\":\"50.00\",\"maxselect\":\"0\",\"group\":\"Extra Toppings\",\"qty\":1}]',NULL,'2016-09-06 17:04:28','2016-09-06 17:04:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,22,NULL,'pane aglio e verdure ','A7',1.00,140.00,0,'','[]',NULL,'2016-09-06 17:04:28','2016-09-06 17:04:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,22,NULL,'lemon ice tea','',1.00,70.00,0,'','[]',NULL,'2016-09-06 17:04:28','2016-09-06 17:04:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,22,NULL,'lemon ice tea','',1.00,70.00,0,'','[]',NULL,'2016-09-06 17:04:28','2016-09-06 17:04:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,23,NULL,'pizza grano turco','P17',1.00,320.00,0,'','[]',NULL,'2016-09-06 17:09:53','2016-09-06 17:09:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,2,27,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(2,2,28,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(3,2,29,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(4,2,30,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(5,2,31,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(6,2,32,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(7,2,33,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(8,2,34,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(9,2,35,'2016-08-31 11:07:02','2016-08-31 11:07:02'),(10,2,26,'2016-08-31 11:07:02','2016-08-31 11:07:02');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permission_human` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_permission_slug_unique` (`permission_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'index-product','index@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(2,'store-product','store@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(3,'edit-product','edit@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(4,'update-product','update@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(5,'delete-product','delete@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(6,'destroy-product','destroy@product',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(7,'index-productmodifier','index@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(8,'store-productmodifier','store@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(9,'edit-productmodifier','edit@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(10,'update-productmodifier','update@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(11,'delete-productmodifier','delete@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(12,'destroy-productmodifier','destroy@productmodifier',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(13,'index-productmodifiergroup','index@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(14,'store-productmodifiergroup','store@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(15,'edit-productmodifiergroup','edit@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(16,'update-productmodifiergroup','update@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(17,'delete-productmodifiergroup','delete@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(18,'destroy-productmodifiergroup','destroy@productmodifiergroup',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(19,'index-location','index@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(20,'create-location','create@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(21,'store-location','store@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(22,'edit-location','edit@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(23,'update-location','update@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(24,'delete-location','delete@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(25,'destroy-location','destroy@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(26,'change-location','change@location',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(27,'index-bill','index@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(28,'create-bill','create@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(29,'store-bill','store@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(30,'getnextbillid-bill','getnextid@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(31,'list-bill','list@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(32,'print-bill','print@bill',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(33,'productcategory-share','productcategory@Share',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(34,'product-share','product@share',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(35,'menudata-share','menudata@share',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(36,'index-menu','index@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(37,'create-menu','create@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(38,'store-menu','store@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(39,'edit-menu','edit@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(40,'update-menu','update@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(41,'delete-menu','delete@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(42,'destroy-menu','destroy@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28'),(43,'activate-menu','activate@menu',NULL,1,'2016-08-31 11:06:28','2016-08-31 11:06:28');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifier_group_maps`
--

LOCK TABLES `product_modifier_group_maps` WRITE;
/*!40000 ALTER TABLE `product_modifier_group_maps` DISABLE KEYS */;
INSERT INTO `product_modifier_group_maps` VALUES (10,4,'canned juice','*','2016-08-16 18:40:49','2016-08-16 18:40:49'),(22,6,'pasta bolognese','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(23,6,'pasta sugo alla matriciana','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(24,6,'pasta carbonara ','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(25,6,'pasta vodka','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(26,6,'pasta polpettine al sugo','Pasta','2016-08-16 19:12:03','2016-08-16 19:12:03'),(32,1,'*','Drinks','2016-08-16 19:20:26','2016-08-16 19:20:26'),(33,1,'*','Mocktails','2016-08-16 19:20:26','2016-08-16 19:20:26'),(39,3,'*','*','2016-08-16 20:18:48','2016-08-16 20:18:48'),(41,2,'*','Pasta','2016-08-18 18:17:50','2016-08-18 18:17:50'),(42,5,'*','Pasta','2016-09-06 16:47:28','2016-09-06 16:47:28'),(43,5,'*','Salads','2016-09-06 16:47:28','2016-09-06 16:47:28'),(44,5,'*','Pizza','2016-09-06 16:47:28','2016-09-06 16:47:28'),(45,5,'*','Fresh Pasta','2016-09-06 16:47:28','2016-09-06 16:47:28'),(46,5,'*','Risotto','2016-09-06 16:47:28','2016-09-06 16:47:28'),(47,5,'*','Secondi','2016-09-06 16:47:28','2016-09-06 16:47:28'),(48,5,'*','Specials','2016-09-06 16:47:28','2016-09-06 16:47:28'),(49,5,'*','Mexican','2016-09-06 16:47:28','2016-09-06 16:47:28'),(50,5,'*','Antipasti','2016-09-06 16:47:28','2016-09-06 16:47:28'),(51,5,'*','Soup','2016-09-06 16:47:28','2016-09-06 16:47:28'),(53,7,'zuppa del giorno','Soup','2016-09-06 16:55:14','2016-09-06 16:55:14');
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
INSERT INTO `product_modifier_groups` VALUES (1,0,0,0,0,0,0,0,0,'',0,0,'Drinks',NULL,'2016-07-27 11:22:42','2016-07-27 11:22:42'),(2,0,0,0,0,1,0,0,0,'',0,0,'Pasta',NULL,'2016-08-16 16:44:02','2016-08-18 18:17:50'),(3,0,0,0,0,0,0,0,0,'',0,0,'Cooking Instructions',NULL,'2016-08-16 17:31:39','2016-08-16 17:31:39'),(4,0,0,0,0,1,0,0,0,'',0,0,'Juice',NULL,'2016-08-16 18:40:49','2016-08-16 18:40:49'),(5,0,0,0,0,0,0,0,0,'',0,0,'Extra Toppings',NULL,'2016-08-16 18:49:50','2016-08-16 18:49:50'),(6,0,0,0,0,0,0,0,0,'',0,0,'Inc Modifiers',NULL,'2016-08-16 19:09:46','2016-08-16 19:09:46'),(7,0,0,0,0,0,0,0,0,'',0,0,'Soup',NULL,'2016-08-16 19:24:31','2016-08-16 19:24:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_modifiers`
--

LOCK TABLES `product_modifiers` WRITE;
/*!40000 ALTER TABLE `product_modifiers` DISABLE KEYS */;
INSERT INTO `product_modifiers` VALUES (1,'no ice','2016-07-27 11:22:42','2016-07-27 11:22:42',1,1,1,NULL),(2,'less ice','2016-07-27 11:22:42','2016-07-27 11:22:42',2,1,1,NULL),(3,'less sweet','2016-07-27 11:22:42','2016-07-27 11:27:38',4,1,1,NULL),(4,'with ice','2016-07-27 11:22:42','2016-07-27 11:27:38',3,1,1,NULL),(5,'sweet','2016-07-27 11:22:42','2016-07-27 11:22:42',5,1,1,NULL),(6,'salt','2016-07-27 11:22:42','2016-07-27 11:22:42',6,1,1,NULL),(7,'sweet and salt','2016-07-27 11:22:42','2016-07-27 11:22:42',7,1,1,NULL),(8,'penne','2016-08-16 16:44:02','2016-08-16 17:50:31',1,2,1,NULL),(9,'spaghetti','2016-08-16 16:44:02','2016-08-16 17:50:31',2,2,1,NULL),(10,'fussili','2016-08-16 16:44:02','2016-08-16 17:50:31',3,2,1,NULL),(11,'tagliatelle','2016-08-16 16:44:02','2016-08-16 17:50:31',4,2,1,NULL),(12,'farfalle','2016-08-16 16:44:02','2016-08-16 17:50:31',5,2,1,NULL),(13,'spinach ravioli','2016-08-16 16:44:02','2016-08-16 17:50:31',6,2,1,NULL),(14,'gnocchi','2016-08-16 16:44:02','2016-08-16 17:50:31',7,2,1,NULL),(15,'tortellini','2016-08-16 16:44:02','2016-08-16 17:50:31',8,2,1,NULL),(16,'risotto','2016-08-16 16:44:02','2016-08-16 17:50:31',9,2,1,NULL),(17,'no mushrooms','2016-08-16 17:31:39','2016-08-16 17:31:39',1,3,1,NULL),(18,'less spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',3,3,1,NULL),(19,'medium spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',4,3,1,NULL),(20,'more spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',5,3,1,NULL),(21,'no spicy','2016-08-16 17:31:39','2016-08-16 19:16:19',6,3,1,NULL),(22,'more cheese','2016-08-16 17:31:39','2016-08-16 19:16:19',7,3,1,NULL),(23,'no cheese','2016-08-16 17:31:39','2016-08-16 19:16:19',8,3,1,NULL),(24,'thick sauce','2016-08-16 17:31:39','2016-08-16 19:16:19',9,3,1,NULL),(25,'al dente','2016-08-16 17:31:39','2016-08-16 19:16:19',10,3,1,NULL),(26,'no onion garlic','2016-08-16 17:31:39','2016-08-16 19:16:19',11,3,1,NULL),(27,'parcel','2016-08-16 17:31:39','2016-08-16 19:16:19',12,3,1,NULL),(28,'gluten free','2016-08-16 17:31:39','2016-08-16 19:16:19',13,3,1,NULL),(29,'no garnish','2016-08-16 17:31:39','2016-08-16 19:16:19',14,3,1,NULL),(30,'test1','2016-08-16 17:31:39','2016-08-16 17:31:56',14,3,1,'2016-08-16 17:31:56'),(31,'test2','2016-08-16 17:31:40','2016-08-16 17:31:56',15,3,1,'2016-08-16 17:31:56'),(32,'cranberry','2016-08-16 18:40:49','2016-08-16 18:40:49',1,4,1,NULL),(33,'guava','2016-08-16 18:40:49','2016-08-16 18:40:49',2,4,1,NULL),(34,'mango','2016-08-16 18:40:49','2016-08-16 18:40:49',3,4,1,NULL),(35,'orange','2016-08-16 18:40:49','2016-08-16 18:40:49',4,4,1,NULL),(36,'pineapple','2016-08-16 18:40:49','2016-08-16 18:40:49',5,4,1,NULL),(37,'chicken','2016-08-16 18:49:50','2016-08-16 18:49:50',1,5,0,NULL),(38,'lamb','2016-08-16 18:49:50','2016-08-16 18:49:50',2,5,0,NULL),(39,'beef','2016-08-16 18:49:50','2016-08-16 18:49:50',3,5,0,NULL),(40,'bacon','2016-08-16 18:49:50','2016-08-16 18:49:50',4,5,0,NULL),(41,'vegetables','2016-08-16 18:49:50','2016-08-16 18:49:50',5,5,0,NULL),(42,'mushroom','2016-08-16 18:49:50','2016-08-16 18:49:50',6,5,0,NULL),(43,'extra cheese','2016-08-16 18:49:50','2016-08-16 18:49:50',7,5,0,NULL),(44,'broccoli','2016-08-16 18:49:50','2016-08-16 18:49:50',8,5,0,NULL),(45,'shrimp','2016-08-16 18:49:50','2016-08-16 18:49:50',9,5,0,NULL),(46,'smoked salmon','2016-08-16 18:49:50','2016-08-16 18:49:50',10,5,0,NULL),(47,'parmesan','2016-08-16 18:49:50','2016-08-16 18:49:50',11,5,0,NULL),(48,'blue cheese','2016-08-16 18:49:50','2016-08-16 18:49:50',12,5,0,NULL),(49,'artichokes','2016-08-16 18:49:50','2016-08-16 18:49:50',13,5,0,NULL),(50,'black olives','2016-08-16 18:49:50','2016-08-16 18:49:50',14,5,0,NULL),(51,'green olives','2016-08-16 18:49:50','2016-08-16 18:49:50',15,5,0,NULL),(52,'capers','2016-08-16 18:49:50','2016-08-16 18:49:50',16,5,0,NULL),(53,'jalapenos','2016-08-16 18:49:50','2016-08-16 18:49:50',17,5,0,NULL),(54,'sun dried tomatoes','2016-08-16 18:49:50','2016-08-16 18:49:50',18,5,0,NULL),(55,'extra meatballs','2016-08-16 18:49:50','2016-08-16 18:49:50',19,5,0,NULL),(56,'pepperoni','2016-08-16 18:49:50','2016-08-16 18:49:50',20,5,0,NULL),(57,'red yellow bell peppers','2016-08-16 18:49:50','2016-08-16 18:49:50',21,5,0,NULL),(58,'green bell peppers','2016-08-16 18:49:50','2016-08-16 18:49:50',22,5,0,NULL),(59,'honey','2016-08-16 18:52:09','2016-08-16 18:52:09',8,1,1,NULL),(60,'soy inc','2016-08-16 19:09:46','2016-08-16 19:10:04',1,6,1,NULL),(61,'chicken inc','2016-08-16 19:09:46','2016-08-16 19:10:04',2,6,1,NULL),(62,'lamb inc','2016-08-16 19:09:46','2016-08-16 19:10:04',3,6,1,NULL),(63,'beef inc','2016-08-16 19:09:46','2016-08-16 19:10:04',4,6,1,NULL),(64,'bacon inc','2016-08-16 19:09:46','2016-08-16 19:10:04',5,6,1,NULL),(65,'no tomato sauce','2016-08-16 19:15:46','2016-08-16 19:16:19',2,3,1,NULL),(66,'more sauce','2016-08-16 19:16:19','2016-08-16 19:16:29',15,3,1,NULL),(67,'no mint','2016-08-16 19:20:12','2016-08-16 19:20:26',9,1,1,NULL),(68,'no icecream','2016-08-16 19:20:12','2016-08-16 19:20:26',10,1,1,NULL),(69,'sugar free','2016-08-16 19:20:12','2016-08-16 19:20:26',11,1,1,NULL),(70,'with food','2016-08-16 19:20:12','2016-08-16 19:20:26',12,1,1,NULL),(71,'tomato','2016-08-16 19:24:31','2016-08-16 19:24:31',1,7,1,NULL),(72,'mushroom','2016-08-16 19:24:31','2016-09-06 16:55:14',2,7,1,NULL),(73,'broccoli','2016-08-16 19:24:31','2016-09-06 16:55:14',3,7,1,NULL),(74,'clear vegetable','2016-08-16 19:24:32','2016-09-06 16:55:14',4,7,1,NULL),(75,'asparagus','2016-08-16 19:24:32','2016-09-06 16:55:14',5,7,1,NULL),(76,'chickpea','2016-08-16 19:24:32','2016-09-06 16:55:14',6,7,1,NULL),(77,'bell pepper','2016-08-16 19:24:32','2016-09-06 16:55:14',7,7,1,NULL),(78,'spring onion','2016-08-16 19:24:32','2016-09-06 16:55:14',8,7,1,NULL),(79,'X 2','2016-08-16 19:24:32','2016-09-06 16:55:14',9,7,1,NULL),(80,'X 3','2016-08-16 19:24:32','2016-09-06 16:55:14',10,7,1,NULL),(81,'X 4','2016-08-16 19:24:32','2016-09-06 16:55:14',11,7,1,NULL),(82,'X 5','2016-08-16 19:24:32','2016-09-06 16:55:14',12,7,1,NULL),(83,'X 6','2016-08-16 19:24:32','2016-09-06 16:55:14',13,7,1,NULL),(84,'X 7','2016-08-16 19:24:32','2016-09-06 16:55:14',14,7,1,NULL),(85,'X 8','2016-08-16 19:24:32','2016-09-06 16:55:14',15,7,1,NULL),(86,'X 9','2016-08-16 19:24:32','2016-09-06 16:55:14',16,7,1,NULL),(87,'X 10','2016-08-16 19:24:32','2016-09-06 16:55:14',17,7,1,NULL),(88,'well cooked','2016-08-16 20:18:36','2016-08-16 20:18:48',16,3,1,NULL),(89,'Chicken','2016-09-06 16:48:58','2016-09-06 16:55:14',2,7,1,'2016-09-06 16:55:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'A1','crostini melanzana','2016-07-21 14:58:45','2016-07-24 11:53:53','Antipasti'),(2,'A2','crostini al forno','2016-07-21 14:58:53','2016-07-24 11:56:58','Antipasti'),(3,'A3','crostini assortiti','2016-07-21 14:59:03','2016-07-21 15:06:49','Antipasti'),(4,'A4','bruschetta pomodoro','2016-07-21 15:23:41','2016-07-21 15:23:41','Antipasti'),(5,'A5','pane aglio','2016-07-21 15:24:09','2016-07-21 15:24:09','Antipasti'),(6,'A6','pane aglio e mozzarella','2016-07-21 15:25:11','2016-07-21 15:25:11','Antipasti'),(7,'A7','pane aglio e verdure ','2016-07-21 15:25:33','2016-07-21 15:25:33','Antipasti'),(8,'A25','crostini verdure ','2016-07-21 15:27:26','2016-07-21 15:27:26','Antipasti'),(9,'A8','insalata caprese','2016-07-21 15:27:54','2016-07-21 15:27:54','Antipasti'),(10,'A9','peperoni arrosto','2016-07-21 15:28:28','2016-07-21 15:28:28','Antipasti'),(11,'A10','funghi trifolati','2016-07-21 15:28:56','2016-07-21 15:28:56','Antipasti'),(12,'A11','crostini con pollo e formaggio','2016-07-21 15:29:45','2016-07-21 15:29:45','Antipasti'),(13,'A14','carpaccio di salmone','2016-07-21 15:30:30','2016-07-21 15:30:30','Antipasti'),(14,'A15','antipasto del maiale','2016-07-21 15:31:24','2016-07-21 15:31:24','Antipasti'),(15,'A16','pollo e limone','2016-07-21 15:31:59','2016-07-21 15:31:59','Antipasti'),(16,'A18','crostini con tonno','2016-07-21 15:32:29','2016-07-21 15:32:29','Antipasti'),(17,'A21','salsa spinaci','2016-07-21 15:33:06','2016-07-21 15:33:06','Antipasti'),(18,'A22','salsa jalapeno','2016-07-21 15:33:28','2016-07-21 15:33:28','Antipasti'),(19,'A23','funghi ripieni di verdure','2016-07-21 15:34:10','2016-07-21 15:34:10','Antipasti'),(20,'A24','funghi ripieni di pollo','2016-07-21 15:34:40','2016-07-21 15:34:40','Antipasti'),(21,'A30','verdure saltate','2016-07-21 15:35:24','2016-07-24 12:30:20','Contorni'),(22,'A31','broccoli strascinati','2016-07-21 15:35:57','2016-07-21 15:35:57','Antipasti'),(23,'Z1','zuppa del giorno','2016-07-21 15:36:33','2016-07-24 12:03:50','Soup'),(24,'B1','insalata pomodoro','2016-07-21 15:37:24','2016-07-21 15:37:24','Salads'),(25,'B2','insalata contadina','2016-07-21 15:38:15','2016-07-24 14:10:59','Salads'),(26,'B3','insalata mista','2016-07-21 15:38:32','2016-07-21 15:38:32','Salads'),(27,'B4','insalata pollo','2016-07-21 15:38:54','2016-07-21 15:38:54','Salads'),(28,'B6','insalata cesare','2016-07-21 15:39:21','2016-07-21 15:45:26','Salads'),(29,'B5','insalata verde di pollo','2016-07-21 15:46:56','2016-07-21 15:46:56','Salads'),(30,'B8','insalata pancetta','2016-07-21 15:47:22','2016-07-21 15:47:22','Salads'),(31,'B9','insalata russo','2016-07-21 15:47:50','2016-07-21 15:47:50','Salads'),(32,'B10','insalata con formaggio di capra','2016-07-21 15:48:27','2016-07-21 15:48:27','Salads'),(33,'B11','insalata vecchi monaco','2016-07-21 15:48:52','2016-07-21 15:48:52','Salads'),(34,'B12','insalata tonno','2016-07-21 15:49:12','2016-07-21 15:49:12','Salads'),(35,'P2','pizza margherita','2016-07-21 15:50:37','2016-07-21 15:50:37','Pizza'),(36,'P3','pizza funghi','2016-07-21 15:50:58','2016-07-21 15:50:58','Pizza'),(37,'P4','pizza cipolla','2016-07-21 15:51:18','2016-07-21 15:51:18','Pizza'),(38,'P5','pizza melanzana','2016-07-21 15:51:38','2016-07-21 15:51:38','Pizza'),(39,'P6','pizza vito','2016-07-21 15:51:55','2016-07-21 15:51:55','Pizza'),(40,'P7','pizza hawaiiano','2016-07-21 15:52:13','2016-07-21 15:52:13','Pizza'),(41,'P8','pizza mediterranean','2016-07-21 15:53:26','2016-07-21 15:53:26','Pizza'),(42,'P9','pizza pomodoro','2016-07-21 15:53:53','2016-07-21 15:53:53','Pizza'),(43,'P10','pizza casa','2016-07-21 15:54:18','2016-07-21 15:54:18','Pizza'),(44,'P11','pizza tabasco','2016-07-21 15:54:36','2016-07-21 15:54:36','Pizza'),(45,'P12','pizza tre peperoni','2016-07-21 15:55:16','2016-07-21 15:55:16','Pizza'),(46,'P13','pizza sicilia','2016-07-21 15:55:32','2016-07-21 15:55:32','Pizza'),(47,'P14','pizza spinaci','2016-07-21 15:56:07','2016-07-21 15:56:07','Pizza'),(48,'P15','pizza liscio','2016-07-21 15:56:28','2016-07-21 15:56:28','Pizza'),(49,'P19','pizza sovrano','2016-07-21 15:56:54','2016-07-21 15:56:54','Pizza'),(50,'P20','pizza genovese','2016-07-21 15:57:14','2016-07-21 15:57:14','Pizza'),(51,'P21','pizza pollito','2016-07-21 15:57:34','2016-07-21 15:57:34','Pizza'),(52,'P22','pizza quattro formaggi','2016-07-21 16:04:11','2016-07-21 16:04:11','Pizza'),(53,'P23','pizza con pollo','2016-07-21 16:04:26','2016-07-21 16:04:26','Pizza'),(54,'P24','pizza tonno e cipolla','2016-07-21 16:04:57','2016-07-21 16:04:57','Pizza'),(55,'P28','pizza diavola','2016-07-21 16:05:43','2016-07-21 16:05:43','Pizza'),(56,'P29','pizza straniera','2016-07-21 16:08:11','2016-07-21 16:08:11','Pizza'),(57,'P30','pizza alla vodka','2016-07-21 16:08:41','2016-07-21 16:08:41','Pizza'),(58,'P32','pizza alpi','2016-07-21 16:09:03','2016-07-21 16:09:03','Pizza'),(59,'P33','pizza gamberetti e sugo rosa','2016-07-21 16:11:26','2016-07-21 16:11:26','Pizza'),(60,'P34','pizza pollo e pesto','2016-07-21 16:11:46','2016-07-21 16:11:46','Pizza'),(61,'P35','pizza salmone affuicata','2016-07-21 16:12:21','2016-07-21 16:12:21','Pizza'),(62,'P36','pizza salame di maiale ','2016-07-21 16:13:38','2016-07-21 16:13:38','Pizza'),(63,'P37','pizza agnello speziato ','2016-07-21 16:14:21','2016-07-21 16:14:21','Pizza'),(64,'P38','pizza salame di pollo','2016-07-21 16:14:47','2016-07-21 16:14:47','Pizza'),(65,'P39','pizza maiale blu','2016-07-21 16:15:15','2016-07-21 16:15:15','Pizza'),(66,'P40','pizza arcevia ','2016-07-21 16:15:34','2016-07-21 16:15:34','Pizza'),(67,'P41','pizza bismark','2016-07-21 16:15:57','2016-07-21 16:15:57','Pizza'),(68,'P42','pizza spagnolo','2016-07-21 16:16:44','2016-07-21 16:16:44','Pizza'),(69,'P43','pizza piri piri','2016-07-21 16:17:02','2016-07-21 16:17:02','Pizza'),(70,'C7','crespelle di funghi','2016-07-21 16:17:36','2016-07-21 16:17:36','Fresh Pasta'),(71,'C8','crespelle di pollo','2016-07-21 16:17:57','2016-07-21 16:17:57','Fresh Pasta'),(72,'C9','crespelle di verdure ','2016-07-21 16:18:25','2016-07-21 16:18:25','Fresh Pasta'),(73,'C1','cannelloni alla fiorentina ','2016-07-21 16:19:06','2016-07-21 16:19:06','Fresh Pasta'),(74,'C2','lasagne napoletana(cheese)','2016-07-21 16:28:08','2016-07-24 13:25:29','Fresh Pasta'),(75,'C3','lasagne di funghi','2016-07-21 16:28:37','2016-07-21 16:28:37','Fresh Pasta'),(76,'C4','lasagne di pollo','2016-07-21 16:29:16','2016-07-21 16:29:16','Fresh Pasta'),(77,'C5','lasagne di agnello','2016-07-21 16:30:18','2016-07-21 16:30:18','Fresh Pasta'),(78,'C6','lasagne di verdure ','2016-07-21 16:30:39','2016-07-21 16:30:39','Fresh Pasta'),(79,'D1','pasta napoletana','2016-07-21 16:31:18','2016-07-21 16:31:18','Pasta'),(80,'D2','pasta aglio olio e peperoncino','2016-07-21 16:31:56','2016-07-21 16:31:56','Pasta'),(81,'D40','pasta aglio olio e agnello','2016-07-21 16:34:32','2016-07-21 16:34:32','Pasta'),(82,'D3','pasta aglio olio e verdure ','2016-07-21 16:35:18','2016-07-21 16:35:18','Pasta'),(83,'D5','pasta puttanesca napoletana','2016-07-21 16:35:50','2016-07-21 16:35:50','Pasta'),(84,'D6','pasta melanzana','2016-07-21 16:36:11','2016-07-21 16:36:11','Pasta'),(85,'D7','pasta pesto genovese','2016-07-21 16:36:36','2016-07-21 16:36:36','Pasta'),(86,'D8','pasta arrabbiata','2016-07-21 16:37:18','2016-07-21 16:37:18','Pasta'),(87,'D9','pasta ai quattro formaggi ','2016-07-21 16:37:52','2016-07-21 16:37:52','Pasta'),(88,'D10','pasta alfredo','2016-07-21 16:38:17','2016-07-21 16:38:17','Pasta'),(89,'D11','pasta panna e noci','2016-07-21 16:38:38','2016-07-21 16:38:38','Pasta'),(90,'D12','pasta panna funghi e piselli','2016-07-21 16:39:12','2016-07-21 16:39:12','Pasta'),(91,'D13','pasta spinaci e formaggio','2016-07-21 16:39:49','2016-07-21 16:39:49','Pasta'),(92,'D14','patsa supremo broccoli','2016-07-21 16:40:43','2016-07-21 16:40:43','Pasta'),(93,'D31','pasta pollo supremo ','2016-07-21 16:41:09','2016-07-21 16:41:09','Pasta'),(94,'D15','pasta milazzo','2016-07-21 16:41:27','2016-07-21 16:41:27','Pasta'),(95,'D16','pasta sugo rosa','2016-07-21 16:41:53','2016-07-21 16:41:53','Pasta'),(96,'P17','pizza grano turco','2016-07-21 16:43:25','2016-07-24 14:04:12','Pizza'),(97,'P18','pizza grande','2016-07-21 16:43:48','2016-07-24 14:05:36','Pizza'),(98,'D19','pasta primavera ','2016-07-21 16:49:45','2016-07-21 16:49:45','Pasta'),(99,'D20','pasta al capone','2016-07-21 16:50:10','2016-07-21 16:50:10','Pasta'),(100,'D21','pasta funghi porcini','2016-07-21 16:50:36','2016-07-21 16:50:36','Pasta'),(101,'D22','pasta quattro stagioni','2016-07-21 16:51:47','2016-07-21 16:51:47','Pasta'),(102,'D24','pasta sugo alla matriciana','2016-07-21 16:52:29','2016-07-21 16:52:29','Pasta'),(103,'D25','pasta carbonara ','2016-07-21 16:53:06','2016-07-21 16:53:06','Pasta'),(104,'D26','pasta bolognese','2016-07-21 16:53:51','2016-07-21 16:53:51','Pasta'),(105,'D27','pasta vodka','2016-07-21 16:54:06','2016-07-21 16:54:06','Pasta'),(106,'D29','pasta campesina ','2016-07-21 16:54:29','2016-07-21 16:54:29','Pasta'),(107,'D32','pasta agnello al vino','2016-07-21 16:54:59','2016-07-21 16:54:59','Pasta'),(108,'D33','pasta gricia','2016-07-21 16:55:21','2016-07-21 16:55:21','Pasta'),(109,'D34','pasta polpettine al sugo','2016-07-21 16:56:06','2016-07-21 16:56:06','Pasta'),(110,'D35','pasta salmone','2016-07-21 16:56:22','2016-07-21 16:56:22','Pasta'),(111,'D36','pasta tonno al sugo','2016-07-21 16:56:47','2016-07-21 16:56:47','Pasta'),(112,'D37','pasta gamberetti al sugo','2016-07-21 16:57:26','2016-07-21 16:57:26','Pasta'),(113,'D38','pasta gamberi di salsa bianca','2016-07-21 16:57:55','2016-07-21 16:57:55','Pasta'),(114,'D39','pasta shrimp campesina ','2016-07-21 16:58:53','2016-07-21 16:58:53','Pasta'),(115,'F1','risotto al forno','2016-07-21 16:59:25','2016-07-21 16:59:25','Risotto'),(116,'F2','risotto funghi e zaffrano','2016-07-21 16:59:51','2016-07-21 16:59:51','Risotto'),(117,'F3','risotto funghi porcini','2016-07-21 17:00:12','2016-07-21 17:00:12','Risotto'),(118,'F4','risotto quattro formaggi','2016-07-21 17:00:48','2016-07-21 17:00:48','Risotto'),(119,'F5','risotto al salsa ','2016-07-21 17:01:11','2016-07-21 17:01:11','Risotto'),(120,'F6','risotto di pesto','2016-07-21 17:01:35','2016-07-21 17:01:35','Risotto'),(121,'F9','risotto panna piccante','2016-07-21 17:02:11','2016-07-21 17:02:11','Risotto'),(122,'F7','risotto di pollo','2016-07-21 17:02:28','2016-07-21 17:02:28','Risotto'),(123,'F8','risotto alla campesina ','2016-07-21 17:02:53','2016-07-21 17:02:53','Risotto'),(124,'F10','risotto di spinaci e pollo','2016-07-21 17:03:22','2016-07-21 17:03:22','Risotto'),(125,'F11','risotto fruitti di mare','2016-07-21 17:04:04','2016-07-21 17:04:04','Risotto'),(126,'L2','pollo panna e funghi','2016-07-21 17:04:30','2016-07-21 17:04:30','Secondi'),(127,'L3','pollo cacciatore','2016-07-21 17:04:58','2016-07-21 17:04:58','Secondi'),(128,'L4','pollo alla raganello','2016-07-21 17:05:18','2016-07-21 17:05:18','Secondi'),(129,'L5','panna e pesci','2016-07-21 17:05:39','2016-07-21 17:05:39','Secondi'),(130,'L6','pesci nepoletana','2016-07-21 17:06:07','2016-07-21 17:06:07','Secondi'),(131,'L7','pollo grigliata','2016-07-21 17:06:28','2016-07-21 17:06:28','Secondi'),(132,'L8','pesci grigliata','2016-07-21 17:06:45','2016-07-21 17:06:45','Secondi'),(133,'G1','paolas tiramisu','2016-07-21 17:07:58','2016-07-21 17:07:58','Desserts'),(134,'G2','the bomb','2016-07-21 17:08:09','2016-07-21 17:08:09','Desserts'),(135,'G3','sizzling brownie','2016-07-21 17:08:38','2016-07-21 17:08:38','Desserts'),(136,'G4','no-bake blueberry cheesecake ','2016-07-21 17:09:19','2016-07-21 17:09:19','Desserts'),(137,'G5','panna cotta','2016-07-21 17:09:44','2016-07-21 17:09:44','Desserts'),(138,'D17','pasta teramo','2016-07-21 17:18:17','2016-07-21 17:18:17','Pasta'),(139,'D18','pasta al forno','2016-07-21 17:18:34','2016-07-21 17:18:34','Pasta'),(140,'P31','pizza sicilia alla pollo','2016-07-21 17:21:03','2016-07-21 17:21:03','Pizza'),(141,'P44','pizza pollo tabasco','2016-07-21 17:21:25','2016-07-21 17:21:25','Pizza'),(142,'B7','insalata cesare di pollo','2016-07-21 17:25:01','2016-07-21 17:25:01','Salads'),(143,'D28','pasta pollo ai quattro formaggi  ','2016-07-21 17:26:09','2016-07-21 17:26:09','Pasta'),(144,'D30','pasta pollo al forno','2016-07-21 17:26:53','2016-07-21 17:26:53','Pasta'),(147,'','zappalicious','2016-07-24 13:14:48','2016-07-24 13:14:48','Mocktails'),(148,'','pinita colada','2016-07-24 13:15:03','2016-07-24 13:15:03','Mocktails'),(149,'','eye of the tiger','2016-07-24 13:15:21','2016-07-24 13:15:21','Mocktails'),(150,'','nojito','2016-07-24 13:16:35','2016-07-24 13:16:35','Mocktails'),(151,'','marilyn mongoose','2016-07-24 13:16:56','2016-07-24 13:16:56','Mocktails'),(152,'','lemon ice tea','2016-07-24 13:17:16','2016-07-24 13:17:16','Mocktails'),(153,'','peach ice tea','2016-07-24 13:17:28','2016-07-24 13:17:28','Mocktails'),(154,'','blackcurrant ice tea','2016-07-24 13:17:47','2016-07-24 13:17:47','Mocktails'),(155,'','fruit punch','2016-07-24 13:18:02','2016-07-24 13:18:02','Mocktails'),(156,'','strawberry lemonade','2016-07-24 13:18:44','2016-07-24 13:18:44','Mocktails'),(157,'','blue curacao lemonade','2016-07-24 13:19:08','2016-07-24 13:19:08','Mocktails'),(158,'','green apple lemonade','2016-07-24 13:19:22','2016-07-24 13:19:22','Mocktails'),(159,'','barking dog','2016-07-24 13:19:42','2016-07-24 13:19:42','Mocktails'),(160,'','smooth operator','2016-07-24 13:20:09','2016-07-24 13:20:09','Mocktails'),(161,'','caffeine berg','2016-07-24 13:20:26','2016-07-24 13:20:26','Mocktails'),(162,'','green tea','2016-07-24 13:20:37','2016-07-24 13:24:30','Drinks'),(163,'','espresso','2016-07-24 13:20:51','2016-07-24 13:26:40','Drinks'),(164,'','cappuccino','2016-07-24 13:21:12','2016-07-24 13:21:53','Drinks'),(165,'','fresh lemon soda','2016-07-24 13:21:39','2016-07-24 13:22:06','Drinks'),(166,'','fresh lemon water','2016-07-24 13:21:55','2016-07-24 13:22:15','Drinks'),(167,'','canned juice','2016-07-24 13:22:36','2016-07-24 13:24:40','Drinks'),(168,'','bottled water','2016-07-24 13:22:53','2016-07-24 13:24:50','Drinks'),(169,'','coke','2016-07-24 13:29:07','2016-07-24 13:41:03','Drinks'),(170,'','sprite','2016-07-24 13:29:14','2016-07-24 13:41:14','Drinks'),(171,'','soda','2016-07-24 13:29:21','2016-07-24 13:43:55','Drinks'),(172,'','thums up','2016-07-24 13:29:29','2016-07-24 13:44:15','Drinks'),(173,'','diet coke','2016-07-24 13:29:57','2016-07-24 13:44:33','Drinks'),(174,'','coke zero','2016-07-24 13:30:07','2016-07-24 13:45:00','Drinks'),(175,'','red bull','2016-07-24 13:30:16','2016-07-24 13:46:21','Drinks'),(176,'','latte','2016-07-24 13:32:35','2016-07-24 13:46:28','Drinks'),(177,'','milkshake','2016-07-24 13:33:08','2016-07-24 13:45:26','Mocktails'),(178,'','mongolian rice chicken','2016-07-24 13:34:30','2016-07-24 14:11:37','Specials'),(179,'','mongolian rice veg','2016-07-24 13:34:45','2016-07-24 14:11:45','Specials'),(180,'','mongolian rice lamb','2016-07-24 13:34:57','2016-07-24 14:11:54','Specials'),(181,'','cheese nachos','2016-07-24 13:35:28','2016-07-24 14:10:12','Mexican'),(182,'','chicken nachos','2016-07-24 13:35:45','2016-07-24 14:08:34','Mexican'),(183,'','beans nachos','2016-07-24 13:36:10','2016-07-24 14:08:14','Mexican'),(184,'P27','pizza umbra','2016-07-24 14:06:00','2016-07-24 14:06:00','Pizza'),(185,'P26','Piemonte','2016-07-24 14:06:15','2016-07-24 14:06:15','Pizza'),(186,'','chicken parmigiana','2016-07-24 14:13:06','2016-07-24 14:13:06','Specials'),(187,'','Tortilla chips with Salsa','2016-09-06 15:42:56','2016-09-06 15:42:56','Mexican'),(188,'','bean tacos','2016-09-06 15:43:22','2016-09-06 15:43:22','Mexican'),(189,'','chicken tacos','2016-09-06 15:43:38','2016-09-06 15:43:38','Mexican'),(190,'','lamb tacos','2016-09-06 15:43:47','2016-09-06 15:43:47','Mexican'),(191,'','Enchiladas with beans','2016-09-06 15:44:17','2016-09-06 15:44:17','Mexican'),(192,'','Enchiladas with corn','2016-09-06 15:44:33','2016-09-06 15:44:33','Mexican'),(193,'','Enchiladas with mushrooms','2016-09-06 15:44:48','2016-09-06 15:44:48','Mexican'),(194,'','Enchiladas with chicken','2016-09-06 15:45:03','2016-09-06 15:45:03','Mexican'),(195,'','Enchiladas with lamb','2016-09-06 15:45:33','2016-09-06 15:45:33','Mexican'),(196,'','Chef special enchiladas','2016-09-06 15:46:09','2016-09-06 15:55:01','Mexican'),(197,'','Chef special chicken enchiladas','2016-09-06 15:46:30','2016-09-06 15:55:20','Mexican'),(198,'','Veg quesadillas','2016-09-06 15:46:57','2016-09-06 15:46:57','Mexican'),(199,'','cheese quesadillas','2016-09-06 15:47:17','2016-09-06 15:47:17','Mexican'),(200,'','Chicken quesadillas','2016-09-06 15:47:31','2016-09-06 15:47:31','Mexican'),(201,'','Mexican rice veg','2016-09-06 15:47:49','2016-09-06 15:47:49','Mexican'),(202,'','Mexican rice chicken','2016-09-06 15:48:00','2016-09-06 15:48:00','Mexican');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,'2016-08-31 11:07:21','2016-08-31 11:07:21'),(2,2,2,'2016-08-31 11:07:21','2016-08-31 11:07:21'),(3,3,2,'2016-08-31 11:07:21','2016-08-31 11:07:21');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role_human` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_role_slug_unique` (`role_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','Administrator',1,'2016-08-31 11:06:18','2016-08-31 11:06:18'),(2,'accountant','Accountant','Can create and view bills',1,'2016-08-31 11:06:18','2016-08-31 11:06:18');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fsm.admin','admin@fsm.in','$2y$10$nBhhqLkLyIX5z8ImM2sEMOgCSbPOYlyNOVi.8vkFjanhBvIKq0cpi','zOfLjjgrAimQkUYc2kOry7JfrKlXwRMkRHOGsTz08KbJZi0mFATVNHC5S0IQ','2016-08-31 11:06:05','2016-09-06 18:49:35'),(2,'jubilee.accountant','jubilee@fsm.in','$2y$10$oTYUxhGUTKTCRxhp4khEZ.8Awv8xi3Rlhcq/9Dd6xdfaLmiWuK/v6',NULL,'2016-08-31 11:06:05','2016-08-31 11:06:05'),(3,'banjara.accountant','banjara@fsm.in','$2y$10$FhNfhI9dO9bn0Q8tfSztEOPCMBIDmLAvqCsQ.650cbBEQC.rXRH8S','FzXra1YGcUipqp3E1762vP0XztKxBdbefnngmstxoIA4S6O8m7ZVznvgPPqN','2016-08-31 11:06:05','2016-09-08 15:39:19');
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

-- Dump completed on 2016-09-12 14:41:39
