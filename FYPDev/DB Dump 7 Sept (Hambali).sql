-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cfms_newschema
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
  `listID` int(11) NOT NULL AUTO_INCREMENT,
  `semYear` varchar(7) NOT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionCount` varchar(45) NOT NULL,
  `coordinatorID` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Incomplete',
  `courseEntryID` int(11) NOT NULL,
  PRIMARY KEY (`listID`),
  UNIQUE KEY `listID_UNIQUE` (`listID`),
  KEY `coorList_subID_idx` (`subjectID`),
  KEY `coorList_coorID_idx` (`coordinatorID`),
  KEY `coorList_entryID` (`semYear`),
  KEY `coorList_courseEntryID_idx` (`courseEntryID`),
  CONSTRAINT `coorList_coorID` FOREIGN KEY (`coordinatorID`) REFERENCES `userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coorList_courseEntryID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coorList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinatorlist`
--

LOCK TABLES `coordinatorlist` WRITE;
/*!40000 ALTER TABLE `coordinatorlist` DISABLE KEYS */;
INSERT INTO `coordinatorlist` VALUES (1,'1-13/14','SCSD1513','2',NULL,'PENDING',19),(2,'1-13/14','SCSI1013','3',NULL,'Incomplete',19),(3,'1-13/14','SCSJ1013','2',NULL,'Incomplete',19),(4,'1-13/14','SCSR1013','3',NULL,'Incomplete',19),(5,'1-13/14','UHAS1162','2',NULL,'Incomplete',19),(6,'1-13/14','UHAS1172','3',NULL,'Incomplete',19),(7,'1-13/14','ULAB1122','2',NULL,'Incomplete',19);
/*!40000 ALTER TABLE `coordinatorlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseentry`
--

DROP TABLE IF EXISTS `courseentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseentry` (
  `courseEntryID` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(5) NOT NULL,
  `semYear` varchar(45) NOT NULL,
  PRIMARY KEY (`courseEntryID`),
  UNIQUE KEY `courseentry` (`courseID`,`semYear`),
  KEY `courseEntry_courseID_idx` (`courseID`),
  CONSTRAINT `courseEntry_courseID` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseentry`
--

LOCK TABLES `courseentry` WRITE;
/*!40000 ALTER TABLE `courseentry` DISABLE KEYS */;
INSERT INTO `courseentry` VALUES (19,'1SCSB','1-13/14');
/*!40000 ALTER TABLE `courseentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectlist`
--

DROP TABLE IF EXISTS `lectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectlist` (
  `listID` int(11) NOT NULL AUTO_INCREMENT,
  `courseEntryID` int(11) DEFAULT NULL,
  `lecturerID` varchar(45) DEFAULT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionNo` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`listID`),
  KEY `lectList_subID_idx` (`subjectID`),
  KEY `lectList_secNo_idx` (`sectionNo`),
  KEY `subList_lectID_idx` (`lecturerID`),
  KEY `lectList_courseEntryID_idx` (`courseEntryID`),
  CONSTRAINT `lectList_courseID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lectList_lectID` FOREIGN KEY (`lecturerID`) REFERENCES `userinfo` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lectList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectlist`
--

LOCK TABLES `lectlist` WRITE;
/*!40000 ALTER TABLE `lectlist` DISABLE KEYS */;
INSERT INTO `lectlist` VALUES (24,19,'ID02','SCSD1513','1','Pending'),(25,19,'ID03','SCSD1513','2','Pending');
/*!40000 ALTER TABLE `lectlist` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2015-09-06 23:14:27
