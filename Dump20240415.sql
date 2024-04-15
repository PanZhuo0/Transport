-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: transport
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `roads`
--

DROP TABLE IF EXISTS `roads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roads` (
  `RoadID` int NOT NULL AUTO_INCREMENT,
  `RoadName` varchar(100) NOT NULL,
  `Length` decimal(10,2) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`RoadID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roads`
--

LOCK TABLES `roads` WRITE;
/*!40000 ALTER TABLE `roads` DISABLE KEYS */;
INSERT INTO `roads` VALUES (1,'Main Street',10.50,'City'),(2,'Highway A',50.20,'Highway'),(3,'Side Road',5.80,'City'),(4,'Main Street',10.50,'Urban'),(5,'Oak Avenue',8.20,'Suburban'),(6,'Elm Street',5.70,'Urban'),(7,'Maple Drive',3.40,'Suburban'),(8,'Pine Avenue',6.80,'Rural'),(9,'Cedar Lane',4.50,'Urban'),(10,'Willow Road',7.90,'Suburban'),(11,'Birch Street',9.30,'Urban'),(12,'Spruce Court',2.60,'Rural'),(13,'Palm Avenue',11.20,'Urban'),(14,'Sunset Boulevard',8.10,'Suburban'),(15,'River Road',6.30,'Rural'),(16,'Mountain View Drive',4.80,'Urban'),(17,'Lake Shore Drive',7.60,'Suburban'),(18,'Forest Hill Avenue',5.90,'Rural'),(19,'Meadow Lane',3.20,'Urban'),(20,'Ocean View Drive',9.70,'Suburban'),(21,'Valley Road',6.50,'Rural'),(22,'Highland Avenue',8.40,'Urban'),(23,'Parkway',10.10,'Suburban'),(24,'Washington Avenue',6.20,'Urban'),(25,'Lincoln Street',4.30,'Suburban'),(26,'Jefferson Boulevard',8.70,'Rural'),(27,'Madison Lane',3.90,'Urban'),(28,'Monroe Drive',5.50,'Suburban'),(29,'Adams Avenue',7.10,'Rural'),(30,'Jackson Road',9.40,'Urban'),(31,'Grant Parkway',6.80,'Suburban'),(32,'Taylor Street',5.30,'Rural'),(33,'Franklin Avenue',7.90,'Urban'),(34,'Van Buren Lane',4.60,'Suburban'),(35,'Roosevelt Boulevard',8.20,'Rural'),(36,'Wilson Drive',3.70,'Urban'),(37,'Johnson Street',6.10,'Suburban'),(38,'Hoover Avenue',5.60,'Rural'),(39,'Truman Road',8.30,'Urban'),(40,'Eisenhower Lane',4.90,'Suburban'),(41,'Kennedy Drive',7.20,'Rural'),(42,'Nixon Parkway',6.40,'Urban'),(43,'Ford Street',9.80,'Suburban');
/*!40000 ALTER TABLE `roads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_road_info`
--

DROP TABLE IF EXISTS `traffic_road_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traffic_road_info` (
  `id` char(36) NOT NULL,
  `road_name` varchar(100) NOT NULL,
  `traffic_flow` int NOT NULL,
  `average_speed` int NOT NULL,
  `congestion_level` enum('low','medium','high') NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_road_info`
--

LOCK TABLES `traffic_road_info` WRITE;
/*!40000 ALTER TABLE `traffic_road_info` DISABLE KEYS */;
INSERT INTO `traffic_road_info` VALUES ('4838b4bf-fa75-11ee-95c5-2cf05d86653f','Main Street',123,123,'medium','2024-04-14 15:40:12'),('8df5ea0d-f959-11ee-80cf-2cf05d86653f','Main Street',1231231,123123,'medium','2024-04-13 05:49:12'),('a25dd543-f89a-11ee-9cbc-2cf05d86653f','Jones Avenue',180,55,'medium','2024-04-12 07:02:32'),('a25dd5f8-f89a-11ee-9cbc-2cf05d86653f','Johnson Road',150,65,'high','2024-04-12 07:02:32'),('a25dd663-f89a-11ee-9cbc-2cf05d86653f','Williams Lane',200,45,'low','2024-04-12 07:02:32'),('a25dd79e-f89a-11ee-9cbc-2cf05d86653f','Brown Boulevard',100,50,'low','2024-04-12 07:02:32'),('a25dd817-f89a-11ee-9cbc-2cf05d86653f','Davis Drive',170,60,'medium','2024-04-12 07:02:32'),('a25dd87b-f89a-11ee-9cbc-2cf05d86653f','Miller Parkway',130,35,'high','2024-04-12 07:02:32'),('a25dd8d2-f89a-11ee-9cbc-2cf05d86653f','Wilson Court',160,70,'low','2024-04-12 07:02:32'),('a25dd923-f89a-11ee-9cbc-2cf05d86653f','Moore Way',140,75,'low','2024-04-12 07:02:32'),('a25dd971-f89a-11ee-9cbc-2cf05d86653f','Taylor Terrace',110,80,'low','2024-04-12 07:02:32'),('a25dda0e-f89a-11ee-9cbc-2cf05d86653f','Thomas Turnpike',120,55,'medium','2024-04-12 07:02:32'),('a25ddb4a-f89a-11ee-9cbc-2cf05d86653f','White Way',180,60,'low','2024-04-12 07:02:32'),('a25ddb9f-f89a-11ee-9cbc-2cf05d86653f','Harris Highway',150,70,'medium','2024-04-12 07:02:32'),('a25ddbee-f89a-11ee-9cbc-2cf05d86653f','Martin Mile',140,40,'high','2024-04-12 07:02:32'),('a25ddc52-f89a-11ee-9cbc-2cf05d86653f','Thompson Trail',160,50,'low','2024-04-12 07:02:32'),('a25ddcac-f89a-11ee-9cbc-2cf05d86653f','Garcia Grove',170,65,'low','2024-04-12 07:02:32'),('a25ddcfd-f89a-11ee-9cbc-2cf05d86653f','Martinez Mews',190,80,'low','2024-04-12 07:02:32'),('a25dde3b-f89a-11ee-9cbc-2cf05d86653f','Robinson Ridge',200,75,'low','2024-04-12 07:02:32'),('b223c4a7-f9b0-11ee-80cf-2cf05d86653f','Main Street',100,120,'low','2024-04-13 16:12:59'),('c00625d8-f892-11ee-9cbc-2cf05d86653f','Broadway Avenue',200,50,'medium','2024-04-12 06:06:06'),('c0062f62-f892-11ee-9cbc-2cf05d86653f','Oak Street',80,45,'low','2024-04-12 06:06:06'),('c006300b-f892-11ee-9cbc-2cf05d86653f','Maple Road',180,65,'medium','2024-04-12 06:06:06'),('c0063072-f892-11ee-9cbc-2cf05d86653f','Cedar Lane',90,35,'high','2024-04-12 06:06:06'),('c00630c1-f892-11ee-9cbc-2cf05d86653f','Pine Street',110,70,'low','2024-04-12 06:06:06'),('c0063114-f892-11ee-9cbc-2cf05d86653f','River Road',220,40,'high','2024-04-12 06:06:06'),('c0063166-f892-11ee-9cbc-2cf05d86653f','Lakeview Drive',130,75,'low','2024-04-12 06:06:06'),('c3e930bc-f892-11ee-9cbc-2cf05d86653f','Highland Avenue',190,40,'high','2024-04-12 06:06:13'),('c3e93137-f892-11ee-9cbc-2cf05d86653f','Ocean Avenue',140,50,'low','2024-04-12 06:06:13'),('c3e9318d-f892-11ee-9cbc-2cf05d86653f','Mountain Street',100,65,'low','2024-04-12 06:06:13'),('c3e931dd-f892-11ee-9cbc-2cf05d86653f','Valley Road',130,45,'high','2024-04-12 06:06:13'),('c3e9322d-f892-11ee-9cbc-2cf05d86653f','Riverside Drive',210,60,'low','2024-04-12 06:06:13'),('c3e9327c-f892-11ee-9cbc-2cf05d86653f','Hillside Avenue',150,70,'medium','2024-04-12 06:06:13'),('c3e932d0-f892-11ee-9cbc-2cf05d86653f','Grove Street',120,35,'high','2024-04-12 06:06:13'),('c3e9332f-f892-11ee-9cbc-2cf05d86653f','Forest Avenue',180,75,'low','2024-04-12 06:06:13'),('c3e93393-f892-11ee-9cbc-2cf05d86653f','Central Avenue',160,80,'low','2024-04-12 06:06:13'),('dab858ce-f99d-11ee-80cf-2cf05d86653f','Park Avenue',120,100,'medium','2024-04-13 13:58:06'),('e1632cdd-f979-11ee-80cf-2cf05d86653f','Sunset Boulevard',123,123,'medium','2024-04-13 09:40:36');
/*!40000 ALTER TABLE `traffic_road_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trafficevents`
--

DROP TABLE IF EXISTS `trafficevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trafficevents` (
  `EventID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EventType` enum('Accident','Construction','Road Closure','Traffic Control','Other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Roadname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trafficevents`
--

LOCK TABLES `trafficevents` WRITE;
/*!40000 ALTER TABLE `trafficevents` DISABLE KEYS */;
INSERT INTO `trafficevents` VALUES ('39d037f0-f99c-11ee-80cf-2cf05d86653f','Construction','2024-04-12 21:46:14','Road Construction Happened','Main Road'),('3da59586-f99c-11ee-80cf-2cf05d86653f','Construction','2024-04-12 21:46:14','Road Construction Happened','Main Road'),('5c1462da-f980-11ee-80cf-2cf05d86653f','Accident','2024-04-13 18:26:59','Car Accident Crash','Main street'),('68b0e13a-f99c-11ee-80cf-2cf05d86653f','Road Closure','2024-04-06 21:47:37','Road Broked','Side Road'),('9923a44d-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 08:30:00','Vehicle collision causing traffic congestion','Main Street'),('9923a9ca-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 10:45:00','Traffic accident','Maple Drive'),('9923aa2a-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-11 11:30:00','Emergency repair, road closure','Pine Avenue'),('9923aa89-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-11 12:15:00','Road construction in progress','Cedar Lane'),('9923aae9-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 13:00:00','Vehicle collision','Willow Road'),('9923ab42-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-11 13:45:00','Traffic control, vehicles stopped','Birch Street'),('9923aba4-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-11 14:30:00','Road construction','Spruce Court'),('9923ac00-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-11 15:15:00','Temporary traffic control','Palm Avenue'),('9923ac5b-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 16:00:00','Vehicle collision','Sunset Boulevard'),('9923acb7-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-11 16:45:00','Road construction','River Road'),('9923ad12-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-11 17:30:00','Road closure due to construction','Mountain View Drive'),('9923ada4-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 18:15:00','Traffic accident','Lake Shore Drive'),('9923ae0c-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-11 19:00:00','Road construction','Forest Hill Avenue'),('9923ae68-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-11 19:45:00','Emergency repair, road closure','Meadow Lane'),('9923aec3-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 20:30:00','Vehicle collision','Ocean View Drive'),('9923af25-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-11 21:15:00','Traffic control, vehicles stopped','Valley Road'),('9923af82-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-11 22:00:00','Road construction','Highland Avenue'),('9923afdb-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-11 22:45:00','Traffic accident','Parkway'),('9923b036-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-11 23:30:00','Emergency repair, road closure','Washington Avenue'),('9923b090-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 00:15:00','Vehicle collision','Lincoln Street'),('9923b0ea-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 01:00:00','Road construction','Jefferson Boulevard'),('9923b143-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 01:45:00','Road closure due to construction','Madison Lane'),('9923b1b3-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 02:30:00','Vehicle collision','Monroe Drive'),('9923b212-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 03:15:00','Traffic control, vehicles stopped','Adams Avenue'),('9923b271-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 04:00:00','Road construction','Jackson Road'),('9923b2cb-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 04:45:00','Emergency repair, road closure','Grant Parkway'),('9923b324-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 05:30:00','Vehicle collision','Taylor Street'),('9923b37f-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 06:15:00','Traffic control, vehicles stopped','Franklin Avenue'),('9923b3ea-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 07:00:00','Road construction','Van Buren Lane'),('9923b444-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 07:45:00','Emergency repair, road closure','Roosevelt Boulevard'),('9923b49f-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 08:30:00','Vehicle collision','Wilson Drive'),('9923b4fa-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 09:15:00','Traffic control, vehicles stopped','Lincoln Avenue'),('9923b554-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 10:00:00','Road construction','Madison Street'),('9923b5bd-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 10:45:00','Emergency repair, road closure','Jefferson Drive'),('9923b6c2-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 11:30:00','Vehicle collision','Monroe Avenue'),('9923b73f-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 12:15:00','Traffic control, vehicles stopped','Adams Street'),('9923b79b-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 13:00:00','Road construction','Jackson Lane'),('9923b7f6-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 13:45:00','Emergency repair, road closure','Grant Road'),('9923b851-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 14:30:00','Vehicle collision','Taylor Avenue'),('9923b8b9-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 15:15:00','Traffic control, vehicles stopped','Franklin Street'),('9923b918-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 16:00:00','Road construction','Van Buren Boulevard'),('9923b971-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 16:45:00','Emergency repair, road closure','Roosevelt Lane'),('9923b9ce-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 17:30:00','Vehicle collision','Wilson Avenue'),('9923ba27-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 18:15:00','Traffic control, vehicles stopped','Lincoln Street'),('9923ba81-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 19:00:00','Road construction','Madison Drive'),('9923bad9-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 19:45:00','Emergency repair, road closure','Jefferson Avenue'),('9923bb44-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 20:30:00','Vehicle collision','Monroe Street'),('9923bb9f-f8b4-11ee-9cbc-2cf05d86653f','Traffic Control','2024-04-12 21:15:00','Traffic control, vehicles stopped','Adams Lane'),('9923bbfb-f8b4-11ee-9cbc-2cf05d86653f','Construction','2024-04-12 22:00:00','Road construction','Jackson Boulevard'),('9923bc54-f8b4-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-12 22:45:00','Emergency repair, road closure','Grant Street'),('9923bd5e-f8b4-11ee-9cbc-2cf05d86653f','Accident','2024-04-12 23:30:00','Vehicle collision','Taylor Drive'),('b5978fae-f99c-11ee-80cf-2cf05d86653f','Road Closure','2024-04-13 21:49:37','Road Closure','Middle Road'),('e42042c9-f8ca-11ee-9cbc-2cf05d86653f','Road Closure','2024-04-11 20:47:48','Road Broked','MainRoad');
/*!40000 ALTER TABLE `trafficevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trafficflow`
--

DROP TABLE IF EXISTS `trafficflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trafficflow` (
  `FlowID` int NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime NOT NULL,
  `RoadID` int DEFAULT NULL,
  `VehicleCount` int DEFAULT NULL,
  `AverageSpeed` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`FlowID`),
  KEY `RoadID` (`RoadID`),
  CONSTRAINT `trafficflow_ibfk_1` FOREIGN KEY (`RoadID`) REFERENCES `roads` (`RoadID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trafficflow`
--

LOCK TABLES `trafficflow` WRITE;
/*!40000 ALTER TABLE `trafficflow` DISABLE KEYS */;
INSERT INTO `trafficflow` VALUES (1,'2024-03-22 08:30:00',1,100,60.50),(2,'2024-03-23 10:15:00',2,150,70.20),(3,'2024-03-24 17:00:00',3,80,40.80);
/*!40000 ALTER TABLE `trafficflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trafficsignals`
--

DROP TABLE IF EXISTS `trafficsignals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trafficsignals` (
  `SignalID` int NOT NULL AUTO_INCREMENT,
  `SignalName` varchar(100) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Status` enum('red','yellow','green') NOT NULL,
  PRIMARY KEY (`SignalID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trafficsignals`
--

LOCK TABLES `trafficsignals` WRITE;
/*!40000 ALTER TABLE `trafficsignals` DISABLE KEYS */;
INSERT INTO `trafficsignals` VALUES (1,'Main Street Traffic Light','Intersection of Main Street','red'),(2,'Highway A Traffic Light','Intersection of Highway A','green');
/*!40000 ALTER TABLE `trafficsignals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `real_name` varchar(100) NOT NULL,
  `user_type` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('523e4567-e89b-12d3-a456-426614174004','emily567','emilypwd','emily@example.com','Emily Wang','user','2024-04-12 04:20:00'),('550e8400-e29b-41d4-a716-446655440000','user1','password1','user1@example.com','Wang Gang','user','2024-04-11 13:45:35'),('551e8400-e29b-41d4-a716-446655440001','user2','password2','user2@example.com','Jane Smith','user','2024-04-11 13:45:35'),('552e8400-e29b-41d4-a716-446655440002','admin1','adminpass1','admin1@example.com','Admin One','admin','2024-04-11 13:45:35'),('553e8400-e29b-41d4-a716-446655440003','user3','password3','user3@example.com','Alice Johnson','user','2024-04-11 13:45:35'),('554e8400-e29b-41d4-a716-446655440004','user4','password4','user4@example.com','Bob Brown','user','2024-04-11 13:45:35'),('555e8400-e29b-41d4-a716-446655440005','admin2','adminpass2','admin2@example.com','Admin Two','admin','2024-04-11 13:45:35'),('556e8400-e29b-41d4-a716-446655440006','user5','password5','user5@example.com','Charlie Davis','user','2024-04-11 13:45:35'),('557e8400-e29b-41d4-a716-446655440007','user6','password6','user6@example.com','Diana Lee','user','2024-04-11 13:45:35'),('558e8400-e29b-41d4-a716-446655440008','user7','password7','user7@example.com','Ethan Wilson','user','2024-04-11 13:45:35'),('559e8400-e29b-41d4-a716-446655440009','admin3','adminpass3','admin3@example.com','Admin Three','admin','2024-04-11 13:45:35'),('623e4567-e89b-12d3-a456-426614174005','frank123','frankpass','frank@example.com','Frank Davis','user','2024-04-12 04:25:00'),('723e4567-e89b-12d3-a456-426614174006','grace456','gracepwd','grace@example.com','Grace Chen','admin','2024-04-12 04:30:00'),('823e4567-e89b-12d3-a456-426614174007','hannah789','hannahpass','hannah@example.com','Hannah Kim','user','2024-04-12 04:35:00'),('923e4567-e89b-12d3-a456-426614174008','isaac123','isaacpwd','isaac@example.com','Isaac Rodriguez','user','2024-04-12 04:40:00'),('a23e4567-e89b-12d3-a456-426614174009','jenny456','jennypwd','jenny@example.com','Jenny Liu','user','2024-04-12 04:45:00'),('b23e4567-e89b-12d3-a456-426614174010','kate123','katepass','kate@example.com','Kate Brown','admin','2024-04-12 04:50:00'),('c23e4567-e89b-12d3-a456-426614174011','lucas456','lucaspwd','lucas@example.com','Lucas Martinez','user','2024-04-12 04:55:00'),('d23e4567-e89b-12d3-a456-426614174012','mary789','marypass','mary@example.com','Mary Nguyen','user','2024-04-12 05:00:00'),('dc0fc52a-fa43-11ee-93e9-2cf05d86653f','123','#@#*!@^#&*!@*^#(','12313@1231.com','','user','2024-04-14 09:46:25'),('e23e4567-e89b-12d3-a456-426614174013','nathan123','nathanpwd','nathan@example.com','Nathan Taylor','user','2024-04-12 05:05:00'),('eca81ee5-f99f-11ee-80cf-2cf05d86653f','','','','','user','2024-04-13 14:12:56'),('f23e4567-e89b-12d3-a456-426614174014','olivia456','oliviapwd','olivia@example.com','Olivia Smith','admin','2024-04-12 05:10:00'),('g23e4567-e89b-12d3-a456-426614174015','peter789','peterpass','peter@example.com','Peter White','user','2024-04-12 05:15:00'),('h23e4567-e89b-12d3-a456-426614174016','quinn123','quinnpwd','quinn@example.com','Quinn Anderson','user','2024-04-12 05:20:00'),('i23e4567-e89b-12d3-a456-426614174017','rachel456','rachelpwd','rachel@example.com','Rachel Brown','user','2024-04-12 05:25:00'),('j23e4567-e89b-12d3-a456-426614174018','sam789','sampass','sam@example.com','Sam Wilson','admin','2024-04-12 05:30:00'),('k23e4567-e89b-12d3-a456-426614174019','tina123','tinapwd','tina@example.com','Tina Martinez','user','2024-04-12 05:35:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `VehicleID` int NOT NULL AUTO_INCREMENT,
  `LicensePlate` varchar(20) NOT NULL,
  `VehicleType` varchar(50) DEFAULT NULL,
  `OwnerName` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (40,'ABC123','Sedan','John Doe','123-456-7890'),(41,'DEF456','Truck','Jane Smith','456-789-0123'),(42,'GHI789','SUV','Michael Johnson','789-012-3456'),(43,'JKL012','Motorcycle','Emily Brown','012-345-6789'),(44,'MNO345','Van','David Lee','345-678-9012'),(45,'PQR678','SUV','Sarah Davis','678-901-2345'),(46,'STU901','Truck','Jessica Wilson','901-234-5678'),(47,'VWX234','Sedan','Daniel Martinez','234-567-8901'),(48,'YZA567','Motorcycle','Lisa Miller','567-890-1234'),(49,'BCD890','Van','Christopher Taylor','890-123-4567'),(50,'EFG123','SUV','Amanda Anderson','123-456-7890'),(51,'HIJ456','Truck','Ryan Thomas','456-789-0123'),(52,'KLM789','Sedan','Michelle Garcia','789-012-3456'),(53,'NOP012','Van','William Hernandez','012-345-6789'),(54,'QRS345','Motorcycle','Jennifer Young','345-678-9012'),(55,'TUV678','SUV','Steven King','678-901-2345'),(56,'VWX901','Truck','Laura White','901-234-5678'),(57,'YZA234','Sedan','Matthew Lopez','234-567-8901'),(58,'BCD567','Van','Elizabeth Clark','567-890-1234'),(59,'EFG890','Motorcycle','Kevin Hall','890-123-4567'),(60,'HIJ123','SUV','Patricia Lewis','123-456-7890'),(61,'KLM456','Truck','Andrew Scott','456-789-0123'),(62,'NOP789','Sedan','Stephanie Green','789-012-3456'),(63,'QRS012','Van','James Baker','012-345-6789'),(64,'TUV345','Motorcycle','Nicole Adams','345-678-9012'),(65,'VWX678','SUV','Charles Nelson','678-901-2345'),(66,'YZA901','Truck','Kimberly Carter','901-234-5678'),(67,'BCD234','Sedan','Joseph Rivera','234-567-8901'),(68,'EFG567','Van','Melissa Mitchell','567-890-1234'),(69,'HIJ890','Motorcycle','David Perez','890-123-4567'),(70,'KLM123','SUV','Samantha Roberts','123-456-7890'),(71,'NOP456','Truck','John Davis','456-789-0123'),(72,'QRS789','Sedan','Emily Moore','789-012-3456'),(73,'TUV012','Van','Robert Johnson','012-345-6789'),(74,'VWX345','Motorcycle','Jessica Martinez','345-678-9012'),(75,'YZA678','SUV','Michael Hernandez','678-901-2345'),(76,'BCD901','Truck','Amanda Young','901-234-5678'),(77,'XYZ123','SUV','Justin Roberts','123-456-7890'),(78,'ABC456','Truck','Ashley Hall','456-789-0123'),(79,'DEF789','Sedan','Christopher Brown','789-012-3456'),(80,'GHI012','Van','Megan Davis','012-345-6789'),(81,'JKL345','Motorcycle','Joshua Martinez','345-678-9012'),(82,'MNO678','SUV','Taylor Clark','678-901-2345'),(83,'PQR901','Truck','Emily Rodriguez','901-234-5678'),(84,'STU234','Sedan','Daniel Thompson','234-567-8901'),(85,'VWX567','Van','Alexis Walker','567-890-1234'),(86,'YZA890','Motorcycle','Brandon Hernandez','890-123-4567');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violations`
--

DROP TABLE IF EXISTS `violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `violation_time` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `violation_description` varchar(255) DEFAULT NULL,
  `penalty` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations`
--

LOCK TABLES `violations` WRITE;
/*!40000 ALTER TABLE `violations` DISABLE KEYS */;
INSERT INTO `violations` VALUES (9,'James Wilson','WA12340','2024-04-02 16:00:00','Seattle, WA','Overloading','Fine $500, 6 points deduction'),(10,'Lisa Thomas','CO98760','2024-04-01 13:10:00','Denver, CO','Wrong-way driving','Fine $150, 2 points deduction'),(11,'Ryan White','OR24680','2024-03-31 09:30:00','Portland, OR','Not wearing seat belt','Fine $50'),(12,'Melissa Anderson','GA97531','2024-03-30 14:45:00','Atlanta, GA','Using emergency lane','Fine $100, 2 points deduction'),(13,'Daniel Clark','MI35791','2024-03-29 11:20:00','Detroit, MI','Driving without license','License suspended, Detained'),(14,'Amanda Hill','PA46201','2024-03-28 08:10:00','Philadelphia, PA','Driving electric scooter over speed limit','Fine $100, 3 points deduction'),(15,'Justin Moore','NC12340','2024-03-27 16:30:00','Charlotte, NC','Disobeying traffic signal','Fine $200, 6 points deduction'),(16,'Megan King','TN98760','2024-03-26 10:00:00','Nashville, TN','Assembling unauthorized vehicle','Fine $500, 12 points deduction'),(17,'Brandon Green','OH35792','2024-03-25 13:20:00','Columbus, OH','Driving with expired license','License suspended, 15 points deduction'),(18,'Rachel Baker','MA46202','2024-03-24 15:50:00','Boston, MA','Disregarding traffic signal','Fine $100, 3 points deduction'),(19,'Kevin Young','VA12341','2024-03-23 09:40:00','Richmond, VA','Illegal parking','Fine $50, Warning'),(20,'Hannah Scott','WI98761','2024-03-22 11:10:00','Milwaukee, WI','Overloading cargo','Fine $2000, 10 points deduction'),(21,'Emma Johnson','TX78901','2024-04-10 09:30:00','Dallas, TX','Failure to yield','Fine $150'),(22,'Noah Williams','CA45678','2024-04-09 15:45:00','San Diego, CA','Driving without insurance','Fine $500, 3 points deduction'),(23,'Olivia Brown','FL23456','2024-04-08 12:15:00','Orlando, FL','Ignoring pedestrian crosswalk','Fine $100'),(24,'Liam Davis','WA34567','2024-04-07 17:20:00','Tacoma, WA','Improper passing','Fine $200, 2 points deduction'),(25,'Sophia Wilson','GA56789','2024-04-06 08:30:00','Savannah, GA','Failure to stop at stop sign','Fine $100, Warning'),(26,'Ethan Miller','NY67890','2024-04-05 14:00:00','Buffalo, NY','Exceeding noise pollution limit','Fine $50'),(27,'Ava Garcia','CA89012','2024-04-04 10:20:00','Los Angeles, CA','Illegal lane change','Fine $200, 2 points deduction'),(28,'Jackson Martinez','NV01234','2024-04-03 11:45:00','Las Vegas, NV','Reckless driving','License suspended, Detained'),(29,'Amelia Thompson','IL23456','2024-04-02 16:00:00','Chicago, IL','Driving without headlights at night','Fine $50, Warning'),(30,'Logan White','TX34567','2024-04-01 13:10:00','Houston, TX','Running a school bus stop sign','Fine $300, 3 points deduction'),(31,'Harper Martinez','CA45678','2024-03-31 09:30:00','San Francisco, CA','Using fake license plate','License suspended, Detained'),(32,'Mason Lee','FL56789','2024-03-30 14:45:00','Miami, FL','Failure to yield to emergency vehicle','Fine $150'),(33,'Evelyn Taylor','NY67890','2024-03-29 11:20:00','New York City, NY','Driving with expired registration','Fine $100, 2 points deduction'),(34,'Lucas Harris','CA89012','2024-03-28 08:10:00','San Diego, CA','Blocking intersection','Fine $150, Warning'),(35,'Avery Thompson','NV01234','2024-03-27 16:30:00','Las Vegas, NV','Failure to use turn signal','Fine $50'),(36,'Layla Wilson','GA23456','2024-03-26 10:00:00','Atlanta, GA','Driving with obstructed view','Fine $100, Warning'),(37,'Elijah Garcia','NY34567','2024-03-25 13:20:00','Buffalo, NY','Leaving scene of accident','License suspended, Detained'),(38,'Riley Davis','TX45678','2024-03-24 15:50:00','Dallas, TX','Driving under influence of drugs','License suspended, Detained'),(39,'Zoey Wilson','CA56789','2024-03-23 09:40:00','Los Angeles, CA','Street racing','License suspended, Detained');
/*!40000 ALTER TABLE `violations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 10:23:33
