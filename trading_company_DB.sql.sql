CREATE DATABASE  IF NOT EXISTS `trading_company_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trading_company_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trading_company_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bill_body_in`
--

DROP TABLE IF EXISTS `bill_body_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_body_in` (
  `bill_body_in_id` int NOT NULL AUTO_INCREMENT,
  `bill_in_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  `discount` decimal(6,1) DEFAULT '0.0',
  PRIMARY KEY (`bill_body_in_id`),
  KEY `in_bodytohead` (`bill_in_id`),
  KEY `in_prod_bill` (`prod_id`),
  CONSTRAINT `in_bodytohead` FOREIGN KEY (`bill_in_id`) REFERENCES `bill_in` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `in_prod_bill` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_body_in`
--

LOCK TABLES `bill_body_in` WRITE;
/*!40000 ALTER TABLE `bill_body_in` DISABLE KEYS */;
INSERT INTO `bill_body_in` VALUES (1,1,3,26,130.0,5.0),(2,1,5,13,120.0,5.0),(3,2,4,5,140.0,0.0),(4,3,7,22,450.0,10.0),(5,3,8,14,750.0,0.0),(6,4,2,2,150.0,8.0),(7,5,1,13,70.0,0.0),(8,5,6,20,400.0,6.0);
/*!40000 ALTER TABLE `bill_body_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_body_out`
--

DROP TABLE IF EXISTS `bill_body_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_body_out` (
  `bill_body_out_id` int NOT NULL AUTO_INCREMENT,
  `bill_out_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  `discount` decimal(6,1) DEFAULT '0.0',
  PRIMARY KEY (`bill_body_out_id`),
  KEY `out_bodytohead` (`bill_out_id`),
  KEY `out_prod_bill` (`prod_id`),
  CONSTRAINT `out_bodytohead` FOREIGN KEY (`bill_out_id`) REFERENCES `bill_out` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `out_prod_bill` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_body_out`
--

LOCK TABLES `bill_body_out` WRITE;
/*!40000 ALTER TABLE `bill_body_out` DISABLE KEYS */;
INSERT INTO `bill_body_out` VALUES (1,1,3,12,130.0,5.0),(2,1,5,13,35.0,5.0),(3,2,4,5,33.0,0.0),(4,3,7,22,122.0,10.0),(5,3,8,14,16.0,0.0),(6,4,2,2,54.0,8.0),(7,5,1,13,33.0,0.0),(8,5,6,20,22.0,6.0);
/*!40000 ALTER TABLE `bill_body_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_in`
--

DROP TABLE IF EXISTS `bill_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_in` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` date NOT NULL,
  `emp_id` int NOT NULL,
  `bill_sup_id` int NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `in_bill_emp` (`emp_id`),
  KEY `in_bill_sup` (`bill_sup_id`),
  CONSTRAINT `in_bill_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `in_bill_sup` FOREIGN KEY (`bill_sup_id`) REFERENCES `supplier` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_in`
--

LOCK TABLES `bill_in` WRITE;
/*!40000 ALTER TABLE `bill_in` DISABLE KEYS */;
INSERT INTO `bill_in` VALUES (1,'2021-09-05',1,3),(2,'2021-12-03',1,4),(3,'2021-06-03',3,2),(4,'2022-10-02',4,5),(5,'2022-02-13',5,1);
/*!40000 ALTER TABLE `bill_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_out`
--

DROP TABLE IF EXISTS `bill_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_out` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` date NOT NULL,
  `emp_id` int NOT NULL,
  `bill_cus_id` int NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `out_bill_emp` (`emp_id`),
  KEY `out_bill_cus` (`bill_cus_id`),
  CONSTRAINT `out_bill_cus` FOREIGN KEY (`bill_cus_id`) REFERENCES `customer` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `out_bill_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_out`
--

LOCK TABLES `bill_out` WRITE;
/*!40000 ALTER TABLE `bill_out` DISABLE KEYS */;
INSERT INTO `bill_out` VALUES (1,'2021-09-05',1,3),(2,'2021-12-03',1,4),(3,'2021-06-03',3,2),(4,'2022-10-02',4,5),(5,'2022-02-13',5,1);
/*!40000 ALTER TABLE `bill_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Alex Branch','638','El-Marg','October'),(2,'Giza Branch','152','El-Saf','Giza'),(3,'Cairo Branch','731','Ain Shams','Cairo');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'body care'),(2,'fashion');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(10) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `LName` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `potential` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Hanaa','K','Adel','01258965458','40','Sarayat','Cairo','F','Hanaa40@gmail.com','20','3','1992','A'),(2,'Magdy','T','Magdi','01525469523','36','Khalifa','Zagazig','M','Magdy@gmail.com','11','5','1979','B'),(3,'Mariam','S','Mohammed','01025436598','12','El-Tahrir','Giza','F','Mariam399@gmail.com','14','7','1990','B'),(4,'Mina','K','Mohsen','01232532697','20','Fire El-Nasser','Cairo','M','Mina38@gmail.com','3','1','1996','C'),(5,'nabil','A','Fikry','01025125463','14','Ain Shams','Cairo','M','nabil200@gmail.com','12','2','1986','A');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_has`
--

DROP TABLE IF EXISTS `emp_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_has` (
  `emp_id` int NOT NULL,
  `role_id` int NOT NULL,
  `per_role_id` int NOT NULL,
  KEY `has_emp` (`emp_id`),
  KEY `has_role` (`role_id`),
  KEY `has_per` (`per_role_id`),
  CONSTRAINT `has_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `has_per` FOREIGN KEY (`per_role_id`) REFERENCES `permissions` (`per_role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `has_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_has`
--

LOCK TABLES `emp_has` WRITE;
/*!40000 ALTER TABLE `emp_has` DISABLE KEYS */;
INSERT INTO `emp_has` VALUES (2,1,4),(2,1,5),(2,1,6),(2,1,7),(1,2,8),(5,2,1),(5,2,2),(3,2,2),(1,2,2),(4,2,2),(4,2,3);
/*!40000 ALTER TABLE `emp_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(20) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `LName` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `com_id` int NOT NULL,
  `salary` decimal(6,1) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `emp_bran` (`com_id`),
  CONSTRAINT `emp_bran` FOREIGN KEY (`com_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Niveen','K','Adel','01258965458','40','Sarayat','Cairo','F','neven40@gmail.com','20','3','1992',1,4000.0),(2,'Islam','T','Magdi','01525469523','36','Khalifa','Zagazig','M','islaam@gmail.com','11','5','1979',3,3500.0),(3,'Alaa','S','Mohammed','01025436598','12','El-Tahrir','Giza','F','Alaa399@gmail.com','14','7','1991',1,4500.0),(4,'Ibrahim','K','Mohsen','01232532697','20','Fire El-Nasser','Cairo','M','Ibrahim38@gmail.com','3','1','1996',2,6000.0),(5,'Ali','A','Fikry','01025125463','14','Ain Shams','Cairo','M','AliFikry200@gmail.com','12','2','1986',3,7500.0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_emp` (`emp_id`),
  CONSTRAINT `log_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,1,'Niveen123','gkj256h21'),(2,2,'Islam345','ert25vh'),(3,3,'Alaa125','dffr56hbb21'),(4,4,'Ibrahim654','wer12f52'),(5,5,'Ali1267','drt12g5');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `per_role_id` int NOT NULL AUTO_INCREMENT,
  `per_name` char(20) NOT NULL,
  PRIMARY KEY (`per_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'burchasing'),(2,'selling'),(3,'make reports'),(4,'add product'),(5,'add employee'),(6,'add supplier'),(7,'add customer'),(8,'update price');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `ctg_id` int NOT NULL,
  `subctg_id` int NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `code` (`code`),
  KEY `prod_ctg` (`ctg_id`),
  KEY `prod_subCtg` (`subctg_id`),
  CONSTRAINT `prod_ctg` FOREIGN KEY (`ctg_id`) REFERENCES `category` (`ctg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prod_subCtg` FOREIGN KEY (`subctg_id`) REFERENCES `sub_category` (`subctg_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'nail remover','N001',1,1),(2,'blusher','g201',1,3),(3,'shower','r569',1,2),(4,'bodyLoshn','u589',1,2),(5,'maskara','g256',1,3),(6,'highWaste','yt569',2,6),(7,'shortDress','f256',2,4),(8,'nightDress','q236',2,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  `role_descibtion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'manager','contrl,lead'),(2,'employee','make bills'),(3,'worker','transporting goods');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `stock_id` (`prod_id`),
  CONSTRAINT `stock_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,100,70.0),(2,2,150,150.0),(3,3,141,130.0),(4,4,351,140.0),(5,5,120,250.0),(6,6,213,400.0),(7,7,250,450.0),(8,8,400,750.0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `subctg_id` int NOT NULL AUTO_INCREMENT,
  `subctg_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`subctg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'nails'),(2,'cosmetics'),(3,'makeup'),(4,'dress'),(5,'t-shirt'),(6,'jeans');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(10) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `LName` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Soaad','K','Adel','01258965458','40','Sarayat','Cairo','F','Soaad40@gmail.com','20','3','1992','chemicals'),(2,'Omar','T','Magdi','01525469523','36','Khalifa','Zagazig','M','Omar@gmail.com','11','5','1979','fashion'),(3,'Mary','S','Mohammed','01025436598','12','El-Tahrir','Giza','F','Mary399@gmail.com','14','7','1990','chemicals'),(4,'Fathy','K','Mohsen','01232532697','20','Fire El-Nasser','Cairo','M','Fathy38@gmail.com','3','1','1996','furniture'),(5,'Ali','A','Fikry','01025125463','14','Ain Shams','Cairo','M','AliFikry200@gmail.com','12','2','1986','fashion');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `person_id` int NOT NULL,
  `prod_id` int NOT NULL,
  KEY `supp` (`person_id`),
  KEY `sup_prod` (`prod_id`),
  CONSTRAINT `sup_prod` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supp` FOREIGN KEY (`person_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,5),(2,8),(5,7),(3,4),(4,3),(5,6),(3,1),(1,2),(2,6);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-07 21:30:57
