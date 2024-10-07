CREATE DATABASE  IF NOT EXISTS `kashkan` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kashkan`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kashkan
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `person_person_id` int NOT NULL,
  PRIMARY KEY (`person_person_id`),
  CONSTRAINT `fk_customer_person1` FOREIGN KEY (`person_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101),(102),(104),(105),(106),(109),(110);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `person_person_id` int NOT NULL,
  PRIMARY KEY (`person_person_id`),
  CONSTRAINT `fk_employee_person` FOREIGN KEY (`person_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (101),(102),(103),(105),(108);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_position`
--

DROP TABLE IF EXISTS `employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_position` (
  `employee_person_person_id` int NOT NULL,
  `position_position_id` int NOT NULL,
  PRIMARY KEY (`employee_person_person_id`,`position_position_id`),
  KEY `fk_employee_position_position1_idx` (`position_position_id`),
  CONSTRAINT `fk_employee_position_employee1` FOREIGN KEY (`employee_person_person_id`) REFERENCES `employee` (`person_person_id`),
  CONSTRAINT `fk_employee_position_position1` FOREIGN KEY (`position_position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_position`
--

LOCK TABLES `employee_position` WRITE;
/*!40000 ALTER TABLE `employee_position` DISABLE KEYS */;
INSERT INTO `employee_position` VALUES (101,1),(108,2),(102,3),(105,4),(103,5);
/*!40000 ALTER TABLE `employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `item_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `order_order_id` int NOT NULL,
  `order_person_person_id` int NOT NULL,
  `order_person_transaction_transaction_id` int NOT NULL,
  `order_person_review_review_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`order_order_id`,`order_person_person_id`,`order_person_transaction_transaction_id`,`order_person_review_review_id`),
  KEY `fk_menu_order1_idx` (`order_order_id`,`order_person_person_id`,`order_person_transaction_transaction_id`,`order_person_review_review_id`),
  CONSTRAINT `fk_menu_order1` FOREIGN KEY (`order_order_id`, `order_person_person_id`, `order_person_transaction_transaction_id`, `order_person_review_review_id`) REFERENCES `order` (`order_id`, `person_person_id`, `person_transaction_transaction_id`, `person_review_review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (301,'rajma chawal',30.00,'veg, main course ',NULL,1000,101,201,1),(302,'kadi pakoda',25.00,'veg, main course',NULL,1001,102,202,2),(303,'french fries',20.00,'veg, starters',NULL,1002,103,203,3),(304,'naan',3.00,'veg, main course',NULL,1003,104,204,4),(305,'roti',2.00,'veg, main course',NULL,1004,105,205,5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `person_person_id` int NOT NULL,
  `person_transaction_transaction_id` int NOT NULL,
  `person_review_review_id` int NOT NULL,
  `total_revenue` decimal(10,2) DEFAULT NULL,
  `total_profit` decimal(10,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`,`person_person_id`,`person_transaction_transaction_id`,`person_review_review_id`),
  KEY `fk_order_person1_idx` (`person_person_id`,`person_transaction_transaction_id`,`person_review_review_id`),
  CONSTRAINT `fk_order_person1` FOREIGN KEY (`person_person_id`, `person_transaction_transaction_id`, `person_review_review_id`) REFERENCES `person` (`person_id`, `transaction_id`, `review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1000,101,201,1,60.00,48.00,'2023-02-02'),(1001,102,202,2,68.00,54.40,'2023-02-02'),(1002,103,203,3,30.00,24.00,'2023-02-04'),(1003,104,204,4,60.00,48.00,'2023-02-24'),(1004,105,205,5,150.00,120.00,'2023-02-08');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `subtotal` decimal(5,2) DEFAULT NULL,
  `order_id` int NOT NULL,
  `person_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`order_detail_id`,`order_id`,`person_id`,`transaction_id`,`review_id`),
  KEY `fk_order_details_order1_idx` (`order_id`,`person_id`,`transaction_id`,`review_id`),
  CONSTRAINT `fk_order_details_order1` FOREIGN KEY (`order_id`, `person_id`, `transaction_id`, `review_id`) REFERENCES `order` (`order_id`, `person_person_id`, `person_transaction_transaction_id`, `person_review_review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (501,2,30.00,60.00,1000,101,201,1),(502,2,34.00,78.00,1001,102,202,2),(503,1,30.00,30.00,1002,103,203,3),(504,3,20.00,60.00,1003,104,204,4),(505,5,30.00,90.00,1004,105,205,5);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `transaction_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`person_id`,`transaction_id`,`review_id`),
  KEY `fk_person_transaction1_idx` (`transaction_id`),
  KEY `fk_person_review1_idx` (`review_id`),
  CONSTRAINT `fk_person_review1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `fk_person_transaction1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (101,'kajal','kajal2852@gmail.com ','pembridge cres','1999-01-21',201,1),(102,'harshit ','harshit@gmail.com','woodbine rd','1998-05-20',202,2),(102,'harshit','harshit@gmail.com','woodbine rd','1998-05-20',301,11),(102,'harshit','harshit@gmail.com','woodbine rd','1998-05-20',301,14),(102,'harshit','harshit@gmail.com','woodbine rd','1998-05-20',303,13),(103,'ashish sharma','ashu@gmail.com','rosewood dr.','1997-12-20',203,3),(104,'shikha ','shikha@gmail.com','roosedairy rd','2000-01-02',204,4),(105,'naman sharma','naman@gmail.com','tenley dr','1998-08-09',205,5),(106,'prince','prince@gmail.com','tremont dr','2000-07-12',206,6),(107,'rubi','rubi@gmail.com','princess street','1996-08-09',207,7),(108,'anjali','anjali@gmail.com','milford dr.','1997-04-12',208,8),(108,'anjali','anjali@gmail.com','milford dr','1997-04-12',302,12),(108,'anjali','anjali@gmail.com','milford dr.','1997-04-12',303,15),(109,'shiwangi','shanu@gmail.com','bayridge dr','1994-08-01',209,9),(110,'swati','swati@gmail.com','woodheaven','1995-07-13',300,10);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL,
  `job_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Manager'),(2,'housekeeping'),(3,'waiter'),(4,'dishwasher'),(5,'chef');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `number of guests` varchar(45) DEFAULT NULL,
  `person_person_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`,`person_person_id`),
  KEY `fk_reservation_person1_idx` (`person_person_id`),
  CONSTRAINT `fk_reservation_person1` FOREIGN KEY (`person_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (401,'2023-01-21','2',101),(402,'2023-01-22','2',102),(403,'2023-01-23','1',103),(404,'2023-01-24','3',104),(405,'2023-01-27','2',105),(406,'2023-01-27','2',106),(407,'2023-01-22','4',107),(408,'2023-01-27','6',108),(409,'2023-01-07','3',109),(500,'2023-04-27','3',110);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL,
  `review_date` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'2023-02-02','5'),(2,'2023-02-02','4'),(3,'2023-02-04','3.5'),(4,'2023-02-12','3'),(5,'2023-02-22','4'),(6,'2023-02-24','3.5'),(7,'2023-02-21','2.5'),(8,'2023-02-08','4'),(9,'2023-03-11','4.5'),(10,'2023-04-11','5'),(11,'2023-04-12','5'),(12,'2023-04-13','4.5'),(13,'2023-04-14','4.5'),(14,'2023-04-15','5'),(15,'2023-04-15','2.5');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `payment_type` varchar(45) DEFAULT NULL,
  `refunds` varchar(45) DEFAULT NULL,
  `additional_discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (201,'credit',NULL,NULL),(202,'cash','3','10'),(203,'cash','2','3'),(204,'cash',NULL,NULL),(205,'cash',NULL,NULL),(206,'credit',NULL,NULL),(207,'cash',NULL,NULL),(208,'credit',NULL,NULL),(209,'credit',NULL,'4'),(300,'credit','2',NULL),(301,'cash',NULL,NULL),(302,'cash',NULL,NULL),(303,'cash',NULL,NULL),(304,'cash',NULL,NULL),(305,'credit',NULL,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 18:15:18
