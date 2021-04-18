-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: oc_pizza
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `client_informations`
--

DROP TABLE IF EXISTS `client_informations`;
/*!50001 DROP VIEW IF EXISTS `client_informations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_informations` AS SELECT 
 1 AS `user_id`,
 1 AS `command_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `password`,
 1 AS `phone_number`,
 1 AS `street`,
 1 AS `city`,
 1 AS `zip_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `establishment_id` int NOT NULL,
  `order_state` varchar(15) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_command_payment1_idx` (`payment_id`),
  KEY `fk_command_user1_idx` (`user_id`),
  KEY `fk_command_establishment1_idx` (`establishment_id`),
  CONSTRAINT `fk_command_establishment1` FOREIGN KEY (`establishment_id`) REFERENCES `establishment` (`id`),
  CONSTRAINT `fk_command_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `fk_command_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES (1,1,1,1,'livree','2021-04-01'),(2,1,2,1,'livree','2021-04-02'),(3,2,3,2,'preparation','2021-04-03'),(4,2,4,2,'livree','2021-04-04'),(5,2,5,2,'preparation','2021-04-05');
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_has_product`
--

DROP TABLE IF EXISTS `command_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command_has_product` (
  `command_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `fk_command_has_product_command1_idx` (`command_id`),
  KEY `fk_command_has_product_product1_idx` (`product_id`),
  CONSTRAINT `fk_command_has_product_command1` FOREIGN KEY (`command_id`) REFERENCES `command` (`id`),
  CONSTRAINT `fk_command_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_has_product`
--

LOCK TABLES `command_has_product` WRITE;
/*!40000 ALTER TABLE `command_has_product` DISABLE KEYS */;
INSERT INTO `command_has_product` VALUES (1,3),(1,2),(2,5),(3,4),(4,3),(5,3),(5,3),(5,2);
/*!40000 ALTER TABLE `command_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `command_informations`
--

DROP TABLE IF EXISTS `command_informations`;
/*!50001 DROP VIEW IF EXISTS `command_informations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `command_informations` AS SELECT 
 1 AS `command_id`,
 1 AS `establishment_id`,
 1 AS `name`,
 1 AS `duty_free_price`,
 1 AS `order_state`,
 1 AS `date`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone_number`,
 1 AS `street`,
 1 AS `city`,
 1 AS `zip_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `job_designation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_user1_idx` (`user_id`),
  CONSTRAINT `fk_employee_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,3,'caissier'),(2,4,'livreur'),(3,5,'pizzaiolo');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_informations`
--

DROP TABLE IF EXISTS `employee_informations`;
/*!50001 DROP VIEW IF EXISTS `employee_informations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_informations` AS SELECT 
 1 AS `user_id`,
 1 AS `establishment_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `password`,
 1 AS `phone_number`,
 1 AS `street`,
 1 AS `city`,
 1 AS `zip_code`,
 1 AS `job_designation`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `establishment`
--

DROP TABLE IF EXISTS `establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_establishment_location1_idx` (`location_id`),
  CONSTRAINT `fk_establishment_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment`
--

LOCK TABLES `establishment` WRITE;
/*!40000 ALTER TABLE `establishment` DISABLE KEYS */;
INSERT INTO `establishment` VALUES (1,6,'0687435676'),(2,7,'0676654355');
/*!40000 ALTER TABLE `establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishment_has_employee`
--

DROP TABLE IF EXISTS `establishment_has_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment_has_employee` (
  `establishment_id` int NOT NULL,
  `employee_id` int NOT NULL,
  KEY `fk_establishment_has_employee_employee1_idx` (`employee_id`),
  KEY `fk_establishment_has_employee_establishment1_idx` (`establishment_id`),
  CONSTRAINT `fk_establishment_has_employee_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_establishment_has_employee_establishment1` FOREIGN KEY (`establishment_id`) REFERENCES `establishment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment_has_employee`
--

LOCK TABLES `establishment_has_employee` WRITE;
/*!40000 ALTER TABLE `establishment_has_employee` DISABLE KEYS */;
INSERT INTO `establishment_has_employee` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `establishment_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `establishment_informations`
--

DROP TABLE IF EXISTS `establishment_informations`;
/*!50001 DROP VIEW IF EXISTS `establishment_informations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `establishment_informations` AS SELECT 
 1 AS `establishment_id`,
 1 AS `phone_number`,
 1 AS `street`,
 1 AS `city`,
 1 AS `zip_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `establishment_revenue`
--

DROP TABLE IF EXISTS `establishment_revenue`;
/*!50001 DROP VIEW IF EXISTS `establishment_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `establishment_revenue` AS SELECT 
 1 AS `establishment_id`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'pate'),(2,'chorizo'),(3,'fromage'),(4,'gruyere'),(5,'anchois'),(6,'ice_tea'),(7,'coca_cola');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'2 avenue machin','perigueux','24000'),(2,'4 impasse truc','perigueux','24000'),(3,'8 rue du ragondin','perigueux','24000'),(4,'23 impasse des tortues','perigueux','24000'),(5,'1 rue des dauphins','perigueux','24000'),(6,'rue de la pizzera numero uno','boulazac','24750'),(7,'rue de la pizzeria numero dos','trelissac','24557');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(5) NOT NULL,
  `payment_amount` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CB',12.50),(2,'CASH',11.00),(3,'CB',12.00),(4,'CB',10.00),(5,'CASH',22.50);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  `duty_free_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'ice_tea','boisson non gazeuse',2.00),(2,'coca_cola','boisson gazeuse',2.50),(3,'pizza_chorizo','pizza avec du chorizo',10.00),(4,'pizza_quatre_fromages','pizza avec quatre fromages',12.00),(5,'pizza_anchois','pizza avec des anchois',11.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_ingredient`
--

DROP TABLE IF EXISTS `product_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_has_ingredient` (
  `product_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` int NOT NULL,
  KEY `fk_product_has_ingredient_product1_idx` (`product_id`),
  KEY `fk_product_has_ingredient_ingredient1_idx` (`ingredient_id`),
  CONSTRAINT `fk_product_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_product_has_ingredient_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_ingredient`
--

LOCK TABLES `product_has_ingredient` WRITE;
/*!40000 ALTER TABLE `product_has_ingredient` DISABLE KEYS */;
INSERT INTO `product_has_ingredient` VALUES (3,1,1),(3,2,5),(3,4,50),(4,1,1),(4,3,4),(4,4,50),(5,1,1),(5,5,7),(5,4,50),(1,6,1),(2,7,1);
/*!40000 ALTER TABLE `product_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_recipe`
--

DROP TABLE IF EXISTS `product_recipe`;
/*!50001 DROP VIEW IF EXISTS `product_recipe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_recipe` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `ingredient_name`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL,
  `establishment_id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `unit` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_ingredient1_idx` (`ingredient_id`),
  KEY `fk_stock_establishment1_idx` (`establishment_id`),
  CONSTRAINT `fk_stock_establishment1` FOREIGN KEY (`establishment_id`) REFERENCES `establishment` (`id`),
  CONSTRAINT `fk_stock_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,18),(2,1,2,15),(3,1,3,13),(4,1,4,32),(5,1,5,0),(6,1,6,45),(7,1,7,34),(8,2,1,55),(9,2,2,0),(10,2,3,76),(11,2,4,70),(12,2,5,45),(13,2,6,34),(14,2,7,43);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `unavailable_ingredients`
--

DROP TABLE IF EXISTS `unavailable_ingredients`;
/*!50001 DROP VIEW IF EXISTS `unavailable_ingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `unavailable_ingredients` AS SELECT 
 1 AS `stock_id`,
 1 AS `establishment_id`,
 1 AS `ingredient_name`,
 1 AS `unit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `unavailable_products`
--

DROP TABLE IF EXISTS `unavailable_products`;
/*!50001 DROP VIEW IF EXISTS `unavailable_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `unavailable_products` AS SELECT 
 1 AS `stock_id`,
 1 AS `establishment_id`,
 1 AS `product_name`,
 1 AS `ingredient_name`,
 1 AS `unit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_location1_idx` (`location_id`),
  CONSTRAINT `fk_user_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jean','Ragnotti','jean@gmail.com','abcde4546','0601010101',1),(2,'Mikael','Yukulele','mikael@gmail.com','azerty','0602020202',2),(3,'Georges','Panzani','georges@gmail.com','ohayogozaimasu','0603030303',3),(4,'Romain','Frugier','romain@gmail.com','abe14w67','0604040404',4),(5,'Brice','Venere','brice@gmail.com','hontoninanithefuck','0605050505',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'oc_pizza'
--

--
-- Final view structure for view `client_informations`
--

/*!50001 DROP VIEW IF EXISTS `client_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `client_informations` AS select `user`.`id` AS `user_id`,`command`.`id` AS `command_id`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`user`.`email` AS `email`,`user`.`password` AS `password`,`user`.`phone_number` AS `phone_number`,`location`.`street` AS `street`,`location`.`city` AS `city`,`location`.`zip_code` AS `zip_code` from ((`user` join `location` on((`location`.`id` = `user`.`id`))) join `command` on((`command`.`user_id` = `user`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `command_informations`
--

/*!50001 DROP VIEW IF EXISTS `command_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `command_informations` AS select `command`.`id` AS `command_id`,`command`.`establishment_id` AS `establishment_id`,`product`.`name` AS `name`,`product`.`duty_free_price` AS `duty_free_price`,`command`.`order_state` AS `order_state`,`command`.`date` AS `date`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`user`.`phone_number` AS `phone_number`,`location`.`street` AS `street`,`location`.`city` AS `city`,`location`.`zip_code` AS `zip_code` from ((((`command` join `command_has_product` on((`command_has_product`.`command_id` = `command`.`id`))) join `product` on((`product`.`id` = `command_has_product`.`product_id`))) join `user` on((`user`.`id` = `command`.`user_id`))) join `location` on((`location`.`id` = `user`.`id`))) order by `command`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_informations`
--

/*!50001 DROP VIEW IF EXISTS `employee_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_informations` AS select `user`.`id` AS `user_id`,`establishment`.`id` AS `establishment_id`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`user`.`email` AS `email`,`user`.`password` AS `password`,`user`.`phone_number` AS `phone_number`,`location`.`street` AS `street`,`location`.`city` AS `city`,`location`.`zip_code` AS `zip_code`,`employee`.`job_designation` AS `job_designation` from ((((`user` join `location` on((`location`.`id` = `user`.`id`))) join `employee` on((`employee`.`user_id` = `user`.`id`))) join `establishment_has_employee` on((`establishment_has_employee`.`employee_id` = `employee`.`id`))) join `establishment` on((`establishment`.`id` = `establishment_has_employee`.`establishment_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `establishment_informations`
--

/*!50001 DROP VIEW IF EXISTS `establishment_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `establishment_informations` AS select `establishment`.`id` AS `establishment_id`,`establishment`.`phone_number` AS `phone_number`,`location`.`street` AS `street`,`location`.`city` AS `city`,`location`.`zip_code` AS `zip_code` from (`establishment` join `location` on((`location`.`id` = `establishment`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `establishment_revenue`
--

/*!50001 DROP VIEW IF EXISTS `establishment_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `establishment_revenue` AS select `command`.`establishment_id` AS `establishment_id`,sum(`payment`.`payment_amount`) AS `amount` from (`command` join `payment` on((`payment`.`id` = `command`.`payment_id`))) group by `command`.`establishment_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_recipe`
--

/*!50001 DROP VIEW IF EXISTS `product_recipe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_recipe` AS select `product`.`id` AS `product_id`,`product`.`name` AS `product_name`,`ingredient`.`name` AS `ingredient_name`,`product_has_ingredient`.`quantity` AS `quantity` from ((`product` join `product_has_ingredient` on((`product_has_ingredient`.`product_id` = `product`.`id`))) join `ingredient` on((`ingredient`.`id` = `product_has_ingredient`.`ingredient_id`))) order by `product`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unavailable_ingredients`
--

/*!50001 DROP VIEW IF EXISTS `unavailable_ingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unavailable_ingredients` AS select `stock`.`id` AS `stock_id`,`stock`.`establishment_id` AS `establishment_id`,`ingredient`.`name` AS `ingredient_name`,`stock`.`unit` AS `unit` from (`stock` join `ingredient` on((`ingredient`.`id` = `stock`.`ingredient_id`))) where (`stock`.`unit` = 0) order by `stock`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unavailable_products`
--

/*!50001 DROP VIEW IF EXISTS `unavailable_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mindsky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unavailable_products` AS select `stock`.`id` AS `stock_id`,`stock`.`establishment_id` AS `establishment_id`,`product`.`name` AS `product_name`,`ingredient`.`name` AS `ingredient_name`,`stock`.`unit` AS `unit` from (((`stock` join `ingredient` on((`ingredient`.`id` = `stock`.`ingredient_id`))) join `product_has_ingredient` on((`product_has_ingredient`.`ingredient_id` = `ingredient`.`id`))) join `product` on((`product`.`id` = `product_has_ingredient`.`product_id`))) where (`stock`.`unit` < `product_has_ingredient`.`quantity`) order by `stock`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-18 16:13:50
