-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: netcracker
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `idMovie` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `duration` double unsigned NOT NULL,
  `year` smallint(6) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text,
  `link` varchar(45) NOT NULL,
  PRIMARY KEY (`idMovie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main table for movies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_and_occupations`
--

DROP TABLE IF EXISTS `movies_and_occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_and_occupations` (
  `idMovie` bigint(20) unsigned NOT NULL,
  `idOccupation` bigint(20) unsigned NOT NULL,
  `idPerson` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`idMovie`,`idOccupation`,`idPerson`),
  KEY `FK_movies_and_occupations_occupations_idx` (`idOccupation`),
  KEY `FK_movies_and_occupations_persons_idx` (`idPerson`),
  CONSTRAINT `FK_movies_and_occupations_movies` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`idMovie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_movies_and_occupations_occupations` FOREIGN KEY (`idOccupation`) REFERENCES `occupations` (`idOccupation`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_movies_and_occupations_persons` FOREIGN KEY (`idPerson`) REFERENCES `persons` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_and_tags`
--

DROP TABLE IF EXISTS `movies_and_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_and_tags` (
  `idMovie` bigint(20) unsigned NOT NULL,
  `idTag` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`idMovie`,`idTag`),
  KEY `FK_movies_and_tags_tags_idx` (`idTag`),
  CONSTRAINT `FK_movies_and_tags_movies` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`idMovie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_movies_and_tags_tags` FOREIGN KEY (`idTag`) REFERENCES `tags` (`idtag`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='setting tags for movies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occupations`
--

DROP TABLE IF EXISTS `occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupations` (
  `idOccupation` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idOccupation`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id for occupation and name of it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `idPerson` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`idPerson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='persons who involved in movies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `idtag` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idtag`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id for tag and it''s name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUser` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `balance` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_hashcode`
--

DROP TABLE IF EXISTS `users_hashcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_hashcode` (
  `idUser` bigint(20) unsigned NOT NULL,
  `hashCode` varchar(32) NOT NULL,
  `dateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dateInspire` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`,`hashCode`),
  CONSTRAINT `FK_users_hashcode_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hashcode for logging in';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `netcracker`.`users_hashcode_AFTER_INSERT` AFTER INSERT ON `users_hashcode` FOR EACH ROW
	Update users_hashcode set dateInspire = current_timestamp() + interval 1 day where idUser = New.idUser and hashcode = New.hashcode */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users_purchased_movies`
--

DROP TABLE IF EXISTS `users_purchased_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_purchased_movies` (
  `idUser` bigint(20) unsigned NOT NULL,
  `idMovie` bigint(20) unsigned NOT NULL,
  `dateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`,`idMovie`),
  KEY `FK_users_purchased_movies_movies_idx` (`idMovie`),
  CONSTRAINT `FK_users_purchased_movies_movies` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`idMovie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_purchased_movies_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_watched_movies`
--

DROP TABLE IF EXISTS `users_watched_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_watched_movies` (
  `idUser` bigint(20) unsigned NOT NULL,
  `idMovie` bigint(20) unsigned NOT NULL,
  `dateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`,`idMovie`),
  KEY `FK_users_watched_movies_movies_idx` (`idMovie`),
  CONSTRAINT `FK_users_watched_movies_movies` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`idMovie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_watched_movies_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_wishlish`
--

DROP TABLE IF EXISTS `users_wishlish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_wishlish` (
  `idUser` bigint(20) unsigned NOT NULL,
  `idMovie` bigint(20) unsigned NOT NULL,
  `dateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`,`idMovie`),
  KEY `FK_users_wishlish_movies_idx` (`idMovie`),
  CONSTRAINT `FK_users_wishlish_movies` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_users_wishlish_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='matching users with movies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'netcracker'
--

--
-- Dumping routines for database 'netcracker'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-21 21:13:50
