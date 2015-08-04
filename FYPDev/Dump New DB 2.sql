CREATE DATABASE  IF NOT EXISTS `cfms_newschema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cfms_newschema`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cfms_newschema
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
-- Table structure for table `coordinatorlist`
--

DROP TABLE IF EXISTS `coordinatorlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinatorlist` (
  `courseEntryID` int(11) NOT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionCount` varchar(45) NOT NULL,
  `coordinatorID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseEntryID`),
  KEY `coorList_subID_idx` (`subjectID`),
  KEY `coorList_coorID_idx` (`coordinatorID`),
  CONSTRAINT `coorList_coorID` FOREIGN KEY (`coordinatorID`) REFERENCES `userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coorList_entryID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coorList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinatorlist`
--

LOCK TABLES `coordinatorlist` WRITE;
/*!40000 ALTER TABLE `coordinatorlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinatorlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` varchar(5) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1SCSJ','Soft.Eng. 1'),('2SCSJ','Soft.Eng. 2'),('3SCSJ','Soft.Eng. 3'),('4SCSJ','Soft.Eng. 4');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseentry`
--

DROP TABLE IF EXISTS `courseentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseentry` (
  `courseEntryID` int(11) NOT NULL,
  `courseID` varchar(5) NOT NULL,
  `semYear` varchar(45) NOT NULL,
  PRIMARY KEY (`courseEntryID`),
  KEY `courseEntry_courseID_idx` (`courseID`),
  CONSTRAINT `courseEntry_courseID` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseentry`
--

LOCK TABLES `courseentry` WRITE;
/*!40000 ALTER TABLE `courseentry` DISABLE KEYS */;
INSERT INTO `courseentry` VALUES (1,'1SCSJ','3-14/15');
/*!40000 ALTER TABLE `courseentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filechangelog`
--

DROP TABLE IF EXISTS `filechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filechangelog` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` varchar(45) NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `subFile_fileID_idx` (`fileID`),
  KEY `fileLog_userID_idx` (`userID`),
  CONSTRAINT `fileLog_fileID` FOREIGN KEY (`fileID`) REFERENCES `subjectfile` (`fileID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fileLog_userID` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filechangelog`
--

LOCK TABLES `filechangelog` WRITE;
/*!40000 ALTER TABLE `filechangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `filechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectlist`
--

DROP TABLE IF EXISTS `lectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectlist` (
  `courseEntryID` int(11) NOT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionNo` varchar(45) NOT NULL,
  `lecturerID` varchar(45) NOT NULL,
  PRIMARY KEY (`courseEntryID`),
  KEY `lectList_subID_idx` (`subjectID`),
  KEY `lectList_secNo_idx` (`sectionNo`),
  KEY `subList_lectID_idx` (`lecturerID`),
  CONSTRAINT `lectList_courseEntryID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lectList_lectID` FOREIGN KEY (`lecturerID`) REFERENCES `userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lectList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectlist`
--

LOCK TABLES `lectlist` WRITE;
/*!40000 ALTER TABLE `lectlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectID` varchar(8) NOT NULL,
  `subjectName` varchar(45) NOT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('SCSJ1001','Test Subject 1'),('SCSJ2022','Test Subject 2'),('SCSJ3303','Test Subject 3'),('SCSJ4444','Test Subject 4');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectfile`
--

DROP TABLE IF EXISTS `subjectfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectfile` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `courseEntryID` int(11) NOT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionNo` varchar(45) NOT NULL,
  `fileType` varchar(45) NOT NULL,
  `fileName` varchar(45) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `courseEntryID_idx` (`courseEntryID`),
  CONSTRAINT `subFile_entryID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectfile`
--

LOCK TABLES `subjectfile` WRITE;
/*!40000 ALTER TABLE `subjectfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `userID` varchar(45) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userType` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('ID01','admin','abc123','1'),('ID02','pentadbir','abc123','2'),('ID03','penyelaras','abc123','3'),('ID04','pensyarah','abc123','4');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-04 12:04:02
