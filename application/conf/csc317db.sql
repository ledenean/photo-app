-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` mediumtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `fk_postid` int NOT NULL,
  `fk_authorid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comment_belongsTo_idx` (`fk_postid`),
  KEY `comment_author_idx` (`fk_authorid`),
  CONSTRAINT `comment_author` FOREIGN KEY (`fk_authorid`) REFERENCES `users` (`id`),
  CONSTRAINT `comment_belongsTo` FOREIGN KEY (`fk_postid`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'comment from front-end','2022-05-15 00:32:46',8,4),(2,'comment test','2022-05-15 01:16:36',8,4),(3,'this is to test to see what longer strings look like','2022-05-15 01:19:35',8,4);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` mediumtext NOT NULL,
  `photopath` varchar(2048) NOT NULL,
  `thumbnail` varchar(2048) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_userid`),
  CONSTRAINT `post_author` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,'sleepy kirby','kirby is sleeping','public\\images\\uploads\\a0378dc72fae2688eaf5ba7f89428589c05e88eafc85.png','public/images/uploads/thumbnail-a0378dc72fae2688eaf5ba7f89428589c05e88eafc85.png',1,'2022-05-13 19:24:49',4),(6,'alley-oop','spongebob and patrick playing basketball','public\\images\\uploads\\690aedcca5f7caccd46c6016ce37412d733974af09c6.jpeg','public/images/uploads/thumbnail-690aedcca5f7caccd46c6016ce37412d733974af09c6.jpeg',1,'2022-05-13 20:29:10',4),(7,'handsome squidward','handsome handsome squidy','public\\images\\uploads\\4dae5c2691236d8ebdf10db8fe38bedcffe41b74c258.png','public/images/uploads/thumbnail-4dae5c2691236d8ebdf10db8fe38bedcffe41b74c258.png',1,'2022-05-14 00:11:40',4),(8,'life on a bench','a bunny on a bench','public\\images\\uploads\\371050711020593fd37adda23032ed438ddbb33201a5.jpeg','public/images/uploads/thumbnail-371050711020593fd37adda23032ed438ddbb33201a5.jpeg',1,'2022-05-14 00:14:32',4),(9,'train','besties on a train','public\\images\\uploads\\3397ddb0c5e4315e71332d3e7dab0d625fa776c6f29a.jpeg','public/images/uploads/thumbnail-3397ddb0c5e4315e71332d3e7dab0d625fa776c6f29a.jpeg',1,'2022-05-14 00:48:13',4),(10,'pink blob','pink blob on grass','public\\images\\uploads\\00590f834c0ef58abba183a679b15080ad212fd40222.png','public/images/uploads/thumbnail-00590f834c0ef58abba183a679b15080ad212fd40222.png',1,'2022-05-14 19:03:36',5),(11,'pink blob','pink blob on grass','public\\images\\uploads\\a184982982147915c1d2c8face80d6faa77af4f7751d.png','public/images/uploads/thumbnail-a184982982147915c1d2c8face80d6faa77af4f7751d.png',1,'2022-05-14 19:03:49',5),(12,'pink blob','pink blob on grass','public\\images\\uploads\\16bf582c1d2ec1e00c4cc7fff98781ecf22e961267ca.png','public/images/uploads/thumbnail-16bf582c1d2ec1e00c4cc7fff98781ecf22e961267ca.png',1,'2022-05-14 19:03:58',5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'tester1','tester1@mail.com','$2b$15$YP.hylwgPi5G2cefr2Vrv.h.hoUV1M05SUQw4Xvk5LO7e1QUq3PKe',1,'2022-05-13 19:24:16'),(5,'refactTest1','refactTest1@mail.com','$2b$15$Lb5Mvfcq7ouaHIjnhck5mO4du/fg3TdWORoC.PdqWBBO3ApqlEcVu',1,'2022-05-14 17:21:04');
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

-- Dump completed on 2022-05-15  1:32:35
