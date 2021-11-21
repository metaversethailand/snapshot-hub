-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: beco
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliases` (
  `id` varchar(66) NOT NULL,
  `ipfs` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `created` int NOT NULL,
  PRIMARY KEY (`address`,`alias`),
  KEY `ipfs` (`ipfs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliases`
--

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` varchar(128) NOT NULL,
  `event` varchar(64) NOT NULL,
  `space` varchar(64) NOT NULL,
  `expire` int NOT NULL,
  PRIMARY KEY (`id`,`event`),
  KEY `space` (`space`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` varchar(66) NOT NULL,
  `ipfs` varchar(64) NOT NULL,
  `follower` varchar(64) NOT NULL,
  `space` varchar(64) NOT NULL,
  `created` int NOT NULL,
  PRIMARY KEY (`follower`,`space`),
  KEY `ipfs` (`ipfs`),
  KEY `space` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubs`
--

DROP TABLE IF EXISTS `hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hubs` (
  `host` varchar(64) NOT NULL,
  `address` varchar(64) DEFAULT NULL,
  `is_self` int DEFAULT '0',
  `is_active` int DEFAULT '1',
  `scope` text NOT NULL,
  PRIMARY KEY (`host`),
  KEY `address` (`address`),
  KEY `is_self` (`is_self`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubs`
--

LOCK TABLES `hubs` WRITE;
/*!40000 ALTER TABLE `hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` varchar(66) NOT NULL,
  `ipfs` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `version` varchar(6) NOT NULL,
  `timestamp` bigint NOT NULL,
  `space` varchar(64) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `sig` varchar(256) NOT NULL,
  `receipt` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ipfs` (`ipfs`),
  KEY `address` (`address`),
  KEY `version` (`version`),
  KEY `timestamp` (`timestamp`),
  KEY `space` (`space`),
  KEY `type` (`type`),
  KEY `receipt` (`receipt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals` (
  `id` varchar(66) NOT NULL,
  `ipfs` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `created` int NOT NULL,
  `space` varchar(64) NOT NULL,
  `network` varchar(12) NOT NULL,
  `type` varchar(24) NOT NULL,
  `strategies` json NOT NULL,
  `plugins` json NOT NULL,
  `title` text NOT NULL,
  `body` mediumtext NOT NULL,
  `choices` json NOT NULL,
  `start` int NOT NULL,
  `end` int NOT NULL,
  `snapshot` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ipfs` (`ipfs`),
  KEY `author` (`author`),
  KEY `created` (`created`),
  KEY `network` (`network`),
  KEY `space` (`space`),
  KEY `start` (`start`),
  KEY `end` (`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces`
--

DROP TABLE IF EXISTS `spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces` (
  `id` varchar(64) NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`created_at`),
  KEY `is_self` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces`
--

LOCK TABLES `spaces` WRITE;
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
INSERT INTO `spaces` VALUES ('meta','{\"name\": \"Metaverse Thailand Gov\", \"symbol\": \"WMETA\", \"filters\": {\"invalids\": [], \"minScore\": 1000}, \"members\": [], \"network\": \"17\", \"plugins\": {}, \"strategies\": [{\"name\": \"erc20-balance-of\", \"params\": {\"symbol\": \"WMETA\", \"address\": \"0x5462f746B6aD010c4E2B67dfD871767d49d151fA\", \"decimals\": 18}}]}',0,0);
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` varchar(66) NOT NULL,
  `ipfs` varchar(64) NOT NULL,
  `voter` varchar(64) NOT NULL,
  `created` int NOT NULL,
  `space` varchar(64) NOT NULL,
  `proposal` varchar(66) NOT NULL,
  `choice` json NOT NULL,
  `metadata` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ipfs` (`ipfs`),
  KEY `voter` (`voter`),
  KEY `created` (`created`),
  KEY `space` (`space`),
  KEY `proposal` (`proposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 19:08:07
