-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cfms_db
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `course_sub`
--

DROP TABLE IF EXISTS `course_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_sub` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(5) NOT NULL,
  `subjectID` varchar(7) NOT NULL,
  `sectionCount` int(11) DEFAULT '1',
  `semYear` varchar(7) NOT NULL,
  PRIMARY KEY (`entryID`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `course_sub_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_list` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_changelog`
--

DROP TABLE IF EXISTS `file_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_changelog` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NOT NULL,
  `userID` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`entryID`),
  KEY `fileID_idx` (`fileID`),
  CONSTRAINT `fileID` FOREIGN KEY (`fileID`) REFERENCES `file_list` (`fileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_list`
--

DROP TABLE IF EXISTS `file_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_list` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileType` varchar(45) NOT NULL,
  `fileName` varchar(45) NOT NULL,
  `section` int(11) NOT NULL,
  `semYear` varchar(7) NOT NULL,
  `subjectID` varchar(8) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`fileID`),
  KEY `subjectID_idx` (`subjectID`),
  CONSTRAINT `subjectID` FOREIGN KEY (`subjectID`) REFERENCES `subject_list` (`subjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_lect`
--

DROP TABLE IF EXISTS `subject_lect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_lect` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectID` varchar(7) NOT NULL,
  `section` int(11) NOT NULL,
  `lectID` varchar(9) DEFAULT NULL,
  `semYear` varchar(7) NOT NULL,
  PRIMARY KEY (`entryID`),
  KEY `subjectID` (`subjectID`),
  KEY `lectID` (`lectID`),
  CONSTRAINT `subject_lect_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_list` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_lect_ibfk_2` FOREIGN KEY (`lectID`) REFERENCES `user_login` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_list`
--

DROP TABLE IF EXISTS `subject_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_list` (
  `subjectID` varchar(7) NOT NULL,
  `subjectName` varchar(255) NOT NULL,
  `penyelarasID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`subjectID`),
  KEY `penyelarasID` (`penyelarasID`),
  CONSTRAINT `subject_list_ibfk_1` FOREIGN KEY (`penyelarasID`) REFERENCES `user_login` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `userID` varchar(9) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(9) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`entryID`),
  KEY `userID` (`userID`),
  CONSTRAINT `user_permission_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_login` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-03 10:58:39