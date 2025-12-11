-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: localhost    Database: tutor_app
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a4409734-d67c-11f0-9b91-8d943f7db516:1-7';

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` int NOT NULL,
  `subject` varchar(20) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `cost` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` (`id`, `name`, `class`, `subject`, `experience`, `cost`, `location`, `phone`, `avatar`) VALUES (1,'Ravi Kumar',10,'math','8 years','₹500/hour','Rotary Nagar, Road No.7, Khammam 507002','9441234567','R'),(2,'Sridevi Reddy',8,'science','5 years','₹400/hour','Wyra Road, Near Collectorate, Khammam 507001','9000123456','S'),(3,'Anil Gupta',9,'math','10 years','₹550/hour','Brahmanwadi, Main Road, Khammam 507003','9390123456','A'),(4,'Ramesh Varma',6,'math','2 years','₹250/hour','Nizampet, Khammam 507001','9000000001','R'),(5,'Deepa Rani',8,'english','4 years','₹350/hour','Wyra Road, Khammam 507001','9000000002','D'),(6,'Manoj Rao',10,'science','6 years','₹500/hour','Rotary Nagar, Khammam 507002','9000000003','M'),(7,'Sai Kumar',6,'math','3 years','₹300/hour','Rotary Nagar, Road No.8, Khammam 507002','9000000001','S'),(8,'Deepa Rani',7,'english','4 years','₹350/hour','Wyra Road, Near Bus Depot, Khammam 507001','9000000002','D'),(9,'Mahesh Babu',8,'science','5 years','₹400/hour','Nehru Nagar, Khammam 507001','9000000003','M'),(10,'Anitha Joshi',9,'social','6 years','₹450/hour','Trunk Road, Khammam 507003','9000000004','A'),(11,'Kiran Reddy',10,'telugu','7 years','₹500/hour','Balaji Nagar, Khammam 507002','9000000005','K'),(12,'Farida Begum',6,'english','2 years','₹250/hour','Bus Stand Area, Khammam 507001','9000000006','F'),(13,'Suresh Naik',7,'science','3 years','₹300/hour','Wyra Road, Mamillagudem, Khammam 507002','9000000007','U'),(14,'Harika Ch',8,'math','5 years','₹400/hour','RTC Colony, Khammam 507003','9000000008','H'),(15,'Rohit Varma',9,'telugu','4 years','₹380/hour','Gandhi Nagar, Khammam 507002','9000000009','R'),(16,'Lakshmi Prasad',10,'social','8 years','₹520/hour','Bhagya Nagar, Khammam 507003','9000000010','L');
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11 17:48:23
