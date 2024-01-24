/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AbstractModifiedResidue`
--
DROP TABLE IF EXISTS `AbstractModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbstractModifiedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `referenceSequence` int unsigned NOT NULL,
    `referenceSequence_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `referenceSequence` (`referenceSequence`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"Affiliation_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Affiliation`
--
DROP TABLE IF EXISTS `Affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `address` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `address` (`address`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Anatomy`
--
DROP TABLE IF EXISTS `Anatomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anatomy` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlackBoxEvent`
--
DROP TABLE IF EXISTS `BlackBoxEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `templateEvent` int unsigned DEFAULT NULL,
    `templateEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `templateEvent` (`templateEvent`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Book_2_chapterAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book_2_chapterAuthors` (
  `DB_ID` int unsigned DEFAULT NULL,
  `chapterAuthors_rank` int unsigned DEFAULT NULL,
  `chapterAuthors` int unsigned DEFAULT NULL,
  `chapterAuthors_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `chapterAuthors` (`chapterAuthors`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Book`
--
DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `ISBN` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `chapterTitle` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `pages` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `year` int unsigned NOT NULL,
    `publisher` int unsigned DEFAULT NULL,
    `publisher_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `ISBN` (`ISBN`(10)),
    KEY `chapterTitle` (`chapterTitle`(10)),
    KEY `pages` (`pages`(10)),
    KEY `year` (`year`),
    KEY `publisher` (`publisher`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CandidateSet_2_hasCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet_2_hasCandidate` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasCandidate_rank` int unsigned DEFAULT NULL,
  `hasCandidate` int unsigned DEFAULT NULL,
  `hasCandidate_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasCandidate` (`hasCandidate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CandidateSet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet_2_hasMember` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasMember_rank` int unsigned DEFAULT NULL,
  `hasMember` int unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateSet`
--
DROP TABLE IF EXISTS `CandidateSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CatalystActivity_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity_2_activeUnit` (
  `DB_ID` int unsigned DEFAULT NULL,
  `activeUnit_rank` int unsigned DEFAULT NULL,
  `activeUnit` int unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivity`
--
DROP TABLE IF EXISTS `CatalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `activity` int unsigned DEFAULT NULL,
    `activity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `physicalEntity` int unsigned NOT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `activity` (`activity`),
    KEY `physicalEntity` (`physicalEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivityReference`
--
DROP TABLE IF EXISTS `CatalystActivityReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivityReference` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `catalystActivity` int unsigned NOT NULL,
    `catalystActivity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `catalystActivity` (`catalystActivity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_RNAMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_RNAMarker` (
  `DB_ID` int unsigned DEFAULT NULL,
  `RNAMarker_rank` int unsigned DEFAULT NULL,
  `RNAMarker` int unsigned DEFAULT NULL,
  `RNAMarker_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `RNAMarker` (`RNAMarker`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_markerReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_markerReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `markerReference_rank` int unsigned DEFAULT NULL,
  `markerReference` int unsigned DEFAULT NULL,
  `markerReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `markerReference` (`markerReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_proteinMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_proteinMarker` (
  `DB_ID` int unsigned DEFAULT NULL,
  `proteinMarker_rank` int unsigned DEFAULT NULL,
  `proteinMarker` int unsigned DEFAULT NULL,
  `proteinMarker_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `proteinMarker` (`proteinMarker`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_cellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_cellType` (
  `DB_ID` int unsigned DEFAULT NULL,
  `cellType_rank` int unsigned DEFAULT NULL,
  `cellType` int unsigned DEFAULT NULL,
  `cellType_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `cellType` (`cellType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cell`
--
DROP TABLE IF EXISTS `Cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `organ` int unsigned DEFAULT NULL,
    `organ_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `tissueLayer` int unsigned DEFAULT NULL,
    `tissueLayer_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `tissue` int unsigned NOT NULL,
    `tissue_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `organ` (`organ`),
    KEY `tissueLayer` (`tissueLayer`),
    KEY `tissue` (`tissue`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CellDevelopmentStep_2_requiredInputComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellDevelopmentStep_2_requiredInputComponent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `requiredInputComponent_rank` int unsigned DEFAULT NULL,
  `requiredInputComponent` int unsigned DEFAULT NULL,
  `requiredInputComponent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `requiredInputComponent` (`requiredInputComponent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CellDevelopmentStep_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellDevelopmentStep_2_catalystActivity` (
  `DB_ID` int unsigned DEFAULT NULL,
  `catalystActivity_rank` int unsigned DEFAULT NULL,
  `catalystActivity` int unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellDevelopmentStep`
--
DROP TABLE IF EXISTS `CellDevelopmentStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellDevelopmentStep` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `tissue` int unsigned DEFAULT NULL,
    `tissue_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `tissue` (`tissue`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellLineagePath`
--
DROP TABLE IF EXISTS `CellLineagePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellLineagePath` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `tissue` int unsigned DEFAULT NULL,
    `tissue_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `tissue` (`tissue`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellType`
--
DROP TABLE IF EXISTS `CellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellType` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ChemicalDrug`
--
DROP TABLE IF EXISTS `ChemicalDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChemicalDrug` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Compartment`
--
DROP TABLE IF EXISTS `Compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compartment` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_hasComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_hasComponent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasComponent_rank` int unsigned DEFAULT NULL,
  `hasComponent` int unsigned DEFAULT NULL,
  `hasComponent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasComponent` (`hasComponent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_includedLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_includedLocation` (
  `DB_ID` int unsigned DEFAULT NULL,
  `includedLocation_rank` int unsigned DEFAULT NULL,
  `includedLocation` int unsigned DEFAULT NULL,
  `includedLocation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `includedLocation` (`includedLocation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_entityOnOtherCell` (
  `DB_ID` int unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int unsigned DEFAULT NULL,
  `entityOnOtherCell` int unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_relatedSpecies` (
  `DB_ID` int unsigned DEFAULT NULL,
  `relatedSpecies_rank` int unsigned DEFAULT NULL,
  `relatedSpecies` int unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex`
--
DROP TABLE IF EXISTS `Complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `stoichiometryKnown` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `compartment` int unsigned NOT NULL,
    `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `isChimeric` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `stoichiometryKnown` (`stoichiometryKnown`),
    KEY `compartment` (`compartment`),
    KEY `isChimeric` (`isChimeric`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ControlledVocabulary_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlledVocabulary`
--
DROP TABLE IF EXISTS `ControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ControlReference_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlReference_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlReference`
--
DROP TABLE IF EXISTS `ControlReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlReference` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CrosslinkedResidue`
--
DROP TABLE IF EXISTS `CrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrosslinkedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `secondCoordinate` int unsigned DEFAULT NULL,
    `modification` int unsigned DEFAULT NULL,
    `modification_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `secondCoordinate` (`secondCoordinate`),
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DatabaseIdentifier_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseIdentifier`
--
DROP TABLE IF EXISTS `DatabaseIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `identifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseObject`
--
DROP TABLE IF EXISTS `DatabaseObject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseObject` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `_displayName` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `_timestamp` timestamp DEFAULT NULL,
    `created` int unsigned DEFAULT NULL,
    `created_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `modified` int unsigned DEFAULT NULL,
    `modified_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stableIdentifier` int unsigned DEFAULT NULL,
    `stableIdentifier_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `DB_ID` int unsigned DEFAULT NULL,
    KEY `_displayName` (`_displayName`(10)),
    KEY `_timestamp` (`_timestamp`),
    KEY `created` (`created`),
    KEY `modified` (`modified`),
    KEY `stableIdentifier` (`stableIdentifier`),
    KEY `_class` (`_class`),
    KEY `DB_ID` (`DB_ID`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DefinedSet`
--
DROP TABLE IF EXISTS `DefinedSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefinedSet` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"_Deleted_2_deletedInstanceDB_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_deletedInstanceDB_ID` (
  `DB_ID` int unsigned DEFAULT NULL,
  `deletedInstanceDB_ID_rank` int unsigned DEFAULT NULL,
  `deletedInstanceDB_ID` int DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `deletedInstanceDB_ID` (`deletedInstanceDB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_deletedInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_deletedInstance` (
  `DB_ID` int unsigned DEFAULT NULL,
  `deletedInstance_rank` int unsigned DEFAULT NULL,
  `deletedInstance` int unsigned DEFAULT NULL,
  `deletedInstance_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `deletedInstance` (`deletedInstance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_replacementInstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_replacementInstances` (
  `DB_ID` int unsigned DEFAULT NULL,
  `replacementInstances_rank` int unsigned DEFAULT NULL,
  `replacementInstances` int unsigned DEFAULT NULL,
  `replacementInstances_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `replacementInstances` (`replacementInstances`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"_Deleted_2_replacementInstanceDB_IDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_replacementInstanceDB_IDs` (
  `DB_ID` int unsigned DEFAULT NULL,
  `replacementInstanceDB_IDs_rank` int unsigned DEFAULT NULL,
  `replacementInstanceDB_IDs` int DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `replacementInstanceDB_IDs` (`replacementInstanceDB_IDs`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Deleted`
--
DROP TABLE IF EXISTS `_Deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `curatorComment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `reason` int unsigned DEFAULT NULL,
    `reason_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `curatorComment` (`curatorComment`(10)),
    KEY `reason` (`reason`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeletedControlledVocabulary`
--
DROP TABLE IF EXISTS `DeletedControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedControlledVocabulary` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_DeletedInstance_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_DeletedInstance_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DeletedInstance`
--
DROP TABLE IF EXISTS `_DeletedInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_DeletedInstance` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `class` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `deletedInstanceDB_ID` int unsigned DEFAULT NULL,
    `deletedStableIdentifier` int unsigned DEFAULT NULL,
    `deletedStableIdentifier_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `class` (`class`(10)),
    KEY `deletedInstanceDB_ID` (`deletedInstanceDB_ID`),
    KEY `deletedStableIdentifier` (`deletedStableIdentifier`),
    KEY `name` (`name`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Depolymerisation`
--
DROP TABLE IF EXISTS `Depolymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Disease`
--
DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Drug_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug_2_disease` (
  `DB_ID` int unsigned DEFAULT NULL,
  `disease_rank` int unsigned DEFAULT NULL,
  `disease` int unsigned DEFAULT NULL,
  `disease_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Drug_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Drug`
--
DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `referenceEntity` int unsigned NOT NULL,
    `referenceEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `referenceEntity` (`referenceEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DrugActionType_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugActionType_2_instanceOf` (
  `DB_ID` int unsigned DEFAULT NULL,
  `instanceOf_rank` int unsigned DEFAULT NULL,
  `instanceOf` int unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DrugActionType`
--
DROP TABLE IF EXISTS `DrugActionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugActionType` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntityFunctionalStatus_2_functionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus_2_functionalStatus` (
  `DB_ID` int unsigned DEFAULT NULL,
  `functionalStatus_rank` int unsigned DEFAULT NULL,
  `functionalStatus` int unsigned DEFAULT NULL,
  `functionalStatus_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `functionalStatus` (`functionalStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityFunctionalStatus`
--
DROP TABLE IF EXISTS `EntityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `diseaseEntity` int unsigned NOT NULL,
    `diseaseEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `normalEntity` int unsigned DEFAULT NULL,
    `normalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `diseaseEntity` (`diseaseEntity`),
    KEY `normalEntity` (`normalEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_hasMember` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasMember_rank` int unsigned DEFAULT NULL,
  `hasMember` int unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_relatedSpecies` (
  `DB_ID` int unsigned DEFAULT NULL,
  `relatedSpecies_rank` int unsigned DEFAULT NULL,
  `relatedSpecies` int unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet`
--
DROP TABLE IF EXISTS `EntitySet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `isOrdered` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `compartment` int unsigned NOT NULL,
    `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `isOrdered` (`isOrdered`),
    KEY `compartment` (`compartment`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntityWithAccessionedSequence_2_hasModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence_2_hasModifiedResidue` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasModifiedResidue_rank` int unsigned DEFAULT NULL,
  `hasModifiedResidue` int unsigned DEFAULT NULL,
  `hasModifiedResidue_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasModifiedResidue` (`hasModifiedResidue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"EntityWithAccessionedSequence_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityWithAccessionedSequence`
--
DROP TABLE IF EXISTS `EntityWithAccessionedSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `endCoordinate` int unsigned DEFAULT NULL,
    `startCoordinate` int unsigned DEFAULT NULL,
    `referenceEntity` int unsigned NOT NULL,
    `referenceEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `species` int unsigned NOT NULL,
    `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `endCoordinate` (`endCoordinate`),
    KEY `startCoordinate` (`startCoordinate`),
    KEY `referenceEntity` (`referenceEntity`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_disease` (
  `DB_ID` int unsigned DEFAULT NULL,
  `disease_rank` int unsigned DEFAULT NULL,
  `disease` int unsigned DEFAULT NULL,
  `disease_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_precedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_precedingEvent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `precedingEvent_rank` int unsigned DEFAULT NULL,
  `precedingEvent` int unsigned DEFAULT NULL,
  `precedingEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `precedingEvent` (`precedingEvent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_inferredFrom` (
  `DB_ID` int unsigned DEFAULT NULL,
  `inferredFrom_rank` int unsigned DEFAULT NULL,
  `inferredFrom` int unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_orthologousEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_orthologousEvent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `orthologousEvent_rank` int unsigned DEFAULT NULL,
  `orthologousEvent` int unsigned DEFAULT NULL,
  `orthologousEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `orthologousEvent` (`orthologousEvent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_reviewed` (
  `DB_ID` int unsigned DEFAULT NULL,
  `reviewed_rank` int unsigned DEFAULT NULL,
  `reviewed` int unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_internalReviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_internalReviewed` (
  `DB_ID` int unsigned DEFAULT NULL,
  `internalReviewed_rank` int unsigned DEFAULT NULL,
  `internalReviewed` int unsigned DEFAULT NULL,
  `internalReviewed_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `internalReviewed` (`internalReviewed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_negativePrecedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_negativePrecedingEvent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `negativePrecedingEvent_rank` int unsigned DEFAULT NULL,
  `negativePrecedingEvent` int unsigned DEFAULT NULL,
  `negativePrecedingEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `negativePrecedingEvent` (`negativePrecedingEvent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_figure` (
  `DB_ID` int unsigned DEFAULT NULL,
  `figure_rank` int unsigned DEFAULT NULL,
  `figure` int unsigned DEFAULT NULL,
  `figure_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"Event_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_relatedSpecies` (
  `DB_ID` int unsigned DEFAULT NULL,
  `relatedSpecies_rank` int unsigned DEFAULT NULL,
  `relatedSpecies` int unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_revised` (
  `DB_ID` int unsigned DEFAULT NULL,
  `revised_rank` int unsigned DEFAULT NULL,
  `revised` int unsigned DEFAULT NULL,
  `revised_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_summation` (
  `DB_ID` int unsigned DEFAULT NULL,
  `summation_rank` int unsigned DEFAULT NULL,
  `summation` int unsigned DEFAULT NULL,
  `summation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--
DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `_doRelease` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `releaseDate` date DEFAULT NULL,
    `releaseStatus` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `evidenceType` int unsigned DEFAULT NULL,
    `evidenceType_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `_doRelease` (`_doRelease`),
    KEY `releaseDate` (`releaseDate`),
    KEY `releaseStatus` (`releaseStatus`(10)),
    KEY `evidenceType` (`evidenceType`),
    KEY `definition` (`definition`(10)),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EvidenceType_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType_2_instanceOf` (
  `DB_ID` int unsigned DEFAULT NULL,
  `instanceOf_rank` int unsigned DEFAULT NULL,
  `instanceOf` int unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"EvidenceType_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EvidenceType`
--
DROP TABLE IF EXISTS `EvidenceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ExternalOntology_2_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_synonym` (
  `DB_ID` int unsigned DEFAULT NULL,
  `synonym_rank` int unsigned DEFAULT NULL,
  `synonym` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `synonym` (`synonym`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ExternalOntology_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_instanceOf` (
  `DB_ID` int unsigned DEFAULT NULL,
  `instanceOf_rank` int unsigned DEFAULT NULL,
  `instanceOf` int unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ExternalOntology_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology`
--
DROP TABLE IF EXISTS `ExternalOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `identifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `definition` (`definition`(10)),
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_output` (
  `DB_ID` int unsigned DEFAULT NULL,
  `output_rank` int unsigned DEFAULT NULL,
  `output` int unsigned DEFAULT NULL,
  `output_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `output` (`output`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_catalystActivity` (
  `DB_ID` int unsigned DEFAULT NULL,
  `catalystActivity_rank` int unsigned DEFAULT NULL,
  `catalystActivity` int unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FailedReaction`
--
DROP TABLE IF EXISTS `FailedReaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `normalReaction` int unsigned NOT NULL,
    `normalReaction_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `normalReaction` (`normalReaction`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Figure`
--
DROP TABLE IF EXISTS `Figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Figure` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `url` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `url` (`url`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentDeletionModification`
--
DROP TABLE IF EXISTS `FragmentDeletionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentDeletionModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentInsertionModification`
--
DROP TABLE IF EXISTS `FragmentInsertionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentInsertionModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `coordinate` int unsigned DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentModification`
--
DROP TABLE IF EXISTS `FragmentModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `endPositionInReferenceSequence` int unsigned NOT NULL,
    `startPositionInReferenceSequence` int unsigned NOT NULL,
    KEY `endPositionInReferenceSequence` (`endPositionInReferenceSequence`),
    KEY `startPositionInReferenceSequence` (`startPositionInReferenceSequence`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentReplacedModification`
--
DROP TABLE IF EXISTS `FragmentReplacedModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentReplacedModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `alteredAminoAcidFragment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `alteredAminoAcidFragment` (`alteredAminoAcidFragment`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FrontPage_2_frontPageItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage_2_frontPageItem` (
  `DB_ID` int unsigned DEFAULT NULL,
  `frontPageItem_rank` int unsigned DEFAULT NULL,
  `frontPageItem` int unsigned DEFAULT NULL,
  `frontPageItem_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `frontPageItem` (`frontPageItem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FrontPage`
--
DROP TABLE IF EXISTS `FrontPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatus`
--
DROP TABLE IF EXISTS `FunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatus` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `functionalStatusType` int unsigned NOT NULL,
    `functionalStatusType_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `structuralVariant` int unsigned NOT NULL,
    `structuralVariant_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `functionalStatusType` (`functionalStatusType`),
    KEY `structuralVariant` (`structuralVariant`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"FunctionalStatusType_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatusType`
--
DROP TABLE IF EXISTS `FunctionalStatusType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeneticallyModifiedResidue`
--
DROP TABLE IF EXISTS `GeneticallyModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneticallyModifiedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GenomeEncodedEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenomeEncodedEntity_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenomeEncodedEntity`
--
DROP TABLE IF EXISTS `GenomeEncodedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenomeEncodedEntity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `species` int unsigned NOT NULL,
    `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"GO_BiologicalProcess_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess`
--
DROP TABLE IF EXISTS `GO_BiologicalProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `accession` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_componentOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_componentOf` (
  `DB_ID` int unsigned DEFAULT NULL,
  `componentOf_rank` int unsigned DEFAULT NULL,
  `componentOf` int unsigned DEFAULT NULL,
  `componentOf_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `componentOf` (`componentOf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_hasPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_hasPart` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasPart_rank` int unsigned DEFAULT NULL,
  `hasPart` int unsigned DEFAULT NULL,
  `hasPart_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasPart` (`hasPart`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_instanceOf` (
  `DB_ID` int unsigned DEFAULT NULL,
  `instanceOf_rank` int unsigned DEFAULT NULL,
  `instanceOf` int unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_surroundedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_surroundedBy` (
  `DB_ID` int unsigned DEFAULT NULL,
  `surroundedBy_rank` int unsigned DEFAULT NULL,
  `surroundedBy` int unsigned DEFAULT NULL,
  `surroundedBy_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `surroundedBy` (`surroundedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"GO_CellularComponent_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent`
--
DROP TABLE IF EXISTS `GO_CellularComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `accession` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"GO_MolecularFunction_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction`
--
DROP TABLE IF EXISTS `GO_MolecularFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `ecNumber` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `accession` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `ecNumber` (`ecNumber`(10)),
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GroupModifiedResidue`
--
DROP TABLE IF EXISTS `GroupModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupModifiedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `modification` int unsigned NOT NULL,
    `modification_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasCandidate`
--
DROP TABLE IF EXISTS `HasCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasCandidate` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasCompartment`
--
DROP TABLE IF EXISTS `HasCompartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasCompartment` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `compartment` int unsigned DEFAULT NULL,
    `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    KEY `compartment` (`compartment`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasComponent`
--
DROP TABLE IF EXISTS `HasComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasComponent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasEncapsulatedEvent`
--
DROP TABLE IF EXISTS `HasEncapsulatedEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasEncapsulatedEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `event` int unsigned DEFAULT NULL,
    `event_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    KEY `event` (`event`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasEvent`
--
DROP TABLE IF EXISTS `HasEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `event` int unsigned DEFAULT NULL,
    `event_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `event` (`event`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasMember`
--
DROP TABLE IF EXISTS `HasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasMember` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasModifiedResidue`
--
DROP TABLE IF EXISTS `HasModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasModifiedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `abstractModifiedResidue` int unsigned DEFAULT NULL,
    `abstractModifiedResidue_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `abstractModifiedResidue` (`abstractModifiedResidue`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Input`
--
DROP TABLE IF EXISTS `Input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Input` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InstanceEdit_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit_2_author` (
  `DB_ID` int unsigned DEFAULT NULL,
  `author_rank` int unsigned DEFAULT NULL,
  `author` int unsigned DEFAULT NULL,
  `author_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstanceEdit`
--
DROP TABLE IF EXISTS `InstanceEdit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `dateTime` timestamp DEFAULT NULL,
    `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `_applyToAllEditedInstances` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `dateTime` (`dateTime`),
    KEY `note` (`note`(10)),
    KEY `_applyToAllEditedInstances` (`_applyToAllEditedInstances`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InteractionEvent_2_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InteractionEvent_2_partners` (
  `DB_ID` int unsigned DEFAULT NULL,
  `partners_rank` int unsigned DEFAULT NULL,
  `partners` int unsigned DEFAULT NULL,
  `partners_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `partners` (`partners`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InteractionEvent`
--
DROP TABLE IF EXISTS `InteractionEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InteractionEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_equivalentTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_equivalentTo` (
  `DB_ID` int unsigned DEFAULT NULL,
  `equivalentTo_rank` int unsigned DEFAULT NULL,
  `equivalentTo` int unsigned DEFAULT NULL,
  `equivalentTo_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `equivalentTo` (`equivalentTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_secondReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_secondReferenceSequence` (
  `DB_ID` int unsigned DEFAULT NULL,
  `secondReferenceSequence_rank` int unsigned DEFAULT NULL,
  `secondReferenceSequence` int unsigned DEFAULT NULL,
  `secondReferenceSequence_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondReferenceSequence` (`secondReferenceSequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InterChainCrosslinkedResidue`
--
DROP TABLE IF EXISTS `InterChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IntraChainCrosslinkedResidue`
--
DROP TABLE IF EXISTS `IntraChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IntraChainCrosslinkedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LiteratureReference`
--
DROP TABLE IF EXISTS `LiteratureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LiteratureReference` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `journal` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `pages` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `pubMedIdentifier` int unsigned DEFAULT NULL,
    `volume` int unsigned DEFAULT NULL,
    `year` int unsigned NOT NULL,
    KEY `journal` (`journal`(10)),
    KEY `pages` (`pages`(10)),
    KEY `pubMedIdentifier` (`pubMedIdentifier`),
    KEY `volume` (`volume`),
    KEY `year` (`year`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `MarkerReference_2_cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarkerReference_2_cell` (
  `DB_ID` int unsigned DEFAULT NULL,
  `cell_rank` int unsigned DEFAULT NULL,
  `cell` int unsigned DEFAULT NULL,
  `cell_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `cell` (`cell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MarkerReference`
--
DROP TABLE IF EXISTS `MarkerReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarkerReference` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `marker` int unsigned NOT NULL,
    `marker_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `marker` (`marker`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ModifiedNucleotide`
--
DROP TABLE IF EXISTS `ModifiedNucleotide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedNucleotide` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `coordinate` int unsigned NOT NULL,
    `modification` int unsigned NOT NULL,
    `modification_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ModifiedResidue`
--
DROP TABLE IF EXISTS `ModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeGeneExpressionRegulation`
--
DROP TABLE IF EXISTS `NegativeGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeGeneExpressionRegulation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `NegativePrecedingEvent_2_precedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEvent_2_precedingEvent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `precedingEvent_rank` int unsigned DEFAULT NULL,
  `precedingEvent` int unsigned DEFAULT NULL,
  `precedingEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `precedingEvent` (`precedingEvent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativePrecedingEvent`
--
DROP TABLE IF EXISTS `NegativePrecedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `reason` int unsigned DEFAULT NULL,
    `reason_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `comment` (`comment`(10)),
    KEY `reason` (`reason`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativePrecedingEventReason`
--
DROP TABLE IF EXISTS `NegativePrecedingEventReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEventReason` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeRegulation`
--
DROP TABLE IF EXISTS `NegativeRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeRegulation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NonsenseMutation`
--
DROP TABLE IF EXISTS `NonsenseMutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NonsenseMutation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `OtherEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherEntity_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OtherEntity`
--
DROP TABLE IF EXISTS `OtherEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherEntity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Output`
--
DROP TABLE IF EXISTS `Output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Output` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_hasEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_hasEvent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasEvent_rank` int unsigned DEFAULT NULL,
  `hasEvent` int unsigned DEFAULT NULL,
  `hasEvent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasEvent` (`hasEvent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pathway`
--
DROP TABLE IF EXISTS `Pathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `doi` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `hasEHLD` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `isCanonical` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `normalPathway` int unsigned DEFAULT NULL,
    `normalPathway_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `lastUpdatedDate` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `doi` (`doi`(10)),
    KEY `hasEHLD` (`hasEHLD`(10)),
    KEY `isCanonical` (`isCanonical`),
    KEY `normalPathway` (`normalPathway`),
    KEY `lastUpdatedDate` (`lastUpdatedDate`(10)),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PathwayDiagram_2_representedPathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram_2_representedPathway` (
  `DB_ID` int unsigned DEFAULT NULL,
  `representedPathway_rank` int unsigned DEFAULT NULL,
  `representedPathway` int unsigned DEFAULT NULL,
  `representedPathway_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `representedPathway` (`representedPathway`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayDiagram`
--
DROP TABLE IF EXISTS `PathwayDiagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `width` int unsigned DEFAULT NULL,
    `height` int unsigned DEFAULT NULL,
    `storedATXML` longblob DEFAULT NULL,
    KEY `width` (`width`),
    KEY `height` (`height`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_affiliation` (
  `DB_ID` int unsigned DEFAULT NULL,
  `affiliation_rank` int unsigned DEFAULT NULL,
  `affiliation` int unsigned DEFAULT NULL,
  `affiliation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `affiliation` (`affiliation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_figure` (
  `DB_ID` int unsigned DEFAULT NULL,
  `figure_rank` int unsigned DEFAULT NULL,
  `figure` int unsigned DEFAULT NULL,
  `figure_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person`
--
DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `firstname` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `initial` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `project` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `surname` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `url` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `firstname` (`firstname`(10)),
    KEY `initial` (`initial`(10)),
    KEY `project` (`project`(10)),
    KEY `surname` (`surname`(10)),
    KEY `url` (`url`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_disease` (
  `DB_ID` int unsigned DEFAULT NULL,
  `disease_rank` int unsigned DEFAULT NULL,
  `disease` int unsigned DEFAULT NULL,
  `disease_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredTo` (
  `DB_ID` int unsigned DEFAULT NULL,
  `inferredTo_rank` int unsigned DEFAULT NULL,
  `inferredTo` int unsigned DEFAULT NULL,
  `inferredTo_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredTo` (`inferredTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredFrom` (
  `DB_ID` int unsigned DEFAULT NULL,
  `inferredFrom_rank` int unsigned DEFAULT NULL,
  `inferredFrom` int unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_reviewed` (
  `DB_ID` int unsigned DEFAULT NULL,
  `reviewed_rank` int unsigned DEFAULT NULL,
  `reviewed` int unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_cellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_cellType` (
  `DB_ID` int unsigned DEFAULT NULL,
  `cellType_rank` int unsigned DEFAULT NULL,
  `cellType` int unsigned DEFAULT NULL,
  `cellType_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `cellType` (`cellType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_figure` (
  `DB_ID` int unsigned DEFAULT NULL,
  `figure_rank` int unsigned DEFAULT NULL,
  `figure` int unsigned DEFAULT NULL,
  `figure_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"PhysicalEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_revised` (
  `DB_ID` int unsigned DEFAULT NULL,
  `revised_rank` int unsigned DEFAULT NULL,
  `revised` int unsigned DEFAULT NULL,
  `revised_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_summation` (
  `DB_ID` int unsigned DEFAULT NULL,
  `summation_rank` int unsigned DEFAULT NULL,
  `summation` int unsigned DEFAULT NULL,
  `summation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity`
--
DROP TABLE IF EXISTS `PhysicalEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `systematicName` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goCellularComponent` int unsigned DEFAULT NULL,
    `goCellularComponent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `authored` int unsigned DEFAULT NULL,
    `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `definition` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `systematicName` (`systematicName`(10)),
    KEY `goCellularComponent` (`goCellularComponent`),
    KEY `authored` (`authored`),
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_repeatedUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_repeatedUnit` (
  `DB_ID` int unsigned DEFAULT NULL,
  `repeatedUnit_rank` int unsigned DEFAULT NULL,
  `repeatedUnit` int unsigned DEFAULT NULL,
  `repeatedUnit_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `repeatedUnit` (`repeatedUnit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_species` (
  `DB_ID` int unsigned DEFAULT NULL,
  `species_rank` int unsigned DEFAULT NULL,
  `species` int unsigned DEFAULT NULL,
  `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymer`
--
DROP TABLE IF EXISTS `Polymer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `maxUnitCount` int unsigned DEFAULT NULL,
    `minUnitCount` int unsigned DEFAULT NULL,
    KEY `maxUnitCount` (`maxUnitCount`),
    KEY `minUnitCount` (`minUnitCount`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymerisation_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymerisation_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymerisation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymerisation`
--
DROP TABLE IF EXISTS `Polymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveGeneExpressionRegulation`
--
DROP TABLE IF EXISTS `PositiveGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveGeneExpressionRegulation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveRegulation`
--
DROP TABLE IF EXISTS `PositiveRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveRegulation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProteinDrug`
--
DROP TABLE IF EXISTS `ProteinDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProteinDrug` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PsiMod`
--
DROP TABLE IF EXISTS `PsiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PsiMod` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `label` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `label` (`label`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Publication_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication_2_author` (
  `DB_ID` int unsigned DEFAULT NULL,
  `author_rank` int unsigned DEFAULT NULL,
  `author` int unsigned DEFAULT NULL,
  `author_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publication`
--
DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `title` (`title`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PublicationAuthor`
--
DROP TABLE IF EXISTS `PublicationAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PublicationAuthor` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `author` int unsigned DEFAULT NULL,
    `author_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    KEY `author` (`author`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Reaction_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction_2_authored` (
  `DB_ID` int unsigned DEFAULT NULL,
  `authored_rank` int unsigned DEFAULT NULL,
  `authored` int unsigned DEFAULT NULL,
  `authored_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Reaction_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction_2_edited` (
  `DB_ID` int unsigned DEFAULT NULL,
  `edited_rank` int unsigned DEFAULT NULL,
  `edited` int unsigned DEFAULT NULL,
  `edited_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Reaction_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reaction`
--
DROP TABLE IF EXISTS `Reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `reverseReaction` int unsigned DEFAULT NULL,
    `reverseReaction_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `reverseReaction` (`reverseReaction`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityFunctionalStatus` (
  `DB_ID` int unsigned DEFAULT NULL,
  `entityFunctionalStatus_rank` int unsigned DEFAULT NULL,
  `entityFunctionalStatus` int unsigned DEFAULT NULL,
  `entityFunctionalStatus_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityFunctionalStatus` (`entityFunctionalStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_input` (
  `DB_ID` int unsigned DEFAULT NULL,
  `input_rank` int unsigned DEFAULT NULL,
  `input` int unsigned DEFAULT NULL,
  `input_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `input` (`input`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_output` (
  `DB_ID` int unsigned DEFAULT NULL,
  `output_rank` int unsigned DEFAULT NULL,
  `output` int unsigned DEFAULT NULL,
  `output_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `output` (`output`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_regulatedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_regulatedBy` (
  `DB_ID` int unsigned DEFAULT NULL,
  `regulatedBy_rank` int unsigned DEFAULT NULL,
  `regulatedBy` int unsigned DEFAULT NULL,
  `regulatedBy_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulatedBy` (`regulatedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_regulationReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_regulationReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `regulationReference_rank` int unsigned DEFAULT NULL,
  `regulationReference` int unsigned DEFAULT NULL,
  `regulationReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulationReference` (`regulationReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_requiredInputComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_requiredInputComponent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `requiredInputComponent_rank` int unsigned DEFAULT NULL,
  `requiredInputComponent` int unsigned DEFAULT NULL,
  `requiredInputComponent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `requiredInputComponent` (`requiredInputComponent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_hasInteraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_hasInteraction` (
  `DB_ID` int unsigned DEFAULT NULL,
  `hasInteraction_rank` int unsigned DEFAULT NULL,
  `hasInteraction` int unsigned DEFAULT NULL,
  `hasInteraction_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasInteraction` (`hasInteraction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_reactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_reactionType` (
  `DB_ID` int unsigned DEFAULT NULL,
  `reactionType_rank` int unsigned DEFAULT NULL,
  `reactionType` int unsigned DEFAULT NULL,
  `reactionType_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reactionType` (`reactionType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_catalystActivity` (
  `DB_ID` int unsigned DEFAULT NULL,
  `catalystActivity_rank` int unsigned DEFAULT NULL,
  `catalystActivity` int unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityOnOtherCell` (
  `DB_ID` int unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int unsigned DEFAULT NULL,
  `entityOnOtherCell` int unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent`
--
DROP TABLE IF EXISTS `ReactionlikeEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `systematicName` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `catalystActivityReference` int unsigned DEFAULT NULL,
    `catalystActivityReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `normalReaction` int unsigned DEFAULT NULL,
    `normalReaction_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `isChimeric` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `systematicName` (`systematicName`(10)),
    KEY `catalystActivityReference` (`catalystActivityReference`),
    KEY `normalReaction` (`normalReaction`),
    KEY `isChimeric` (`isChimeric`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionType`
--
DROP TABLE IF EXISTS `ReactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionType` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceDatabase_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDatabase`
--
DROP TABLE IF EXISTS `ReferenceDatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `accessUrl` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `url` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `resourceIdentifier` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `accessUrl` (`accessUrl`(10)),
    KEY `url` (`url`(10)),
    KEY `resourceIdentifier` (`resourceIdentifier`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDNASequence`
--
DROP TABLE IF EXISTS `ReferenceDNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDNASequence` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceEntity_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_otherIdentifier` (
  `DB_ID` int unsigned DEFAULT NULL,
  `otherIdentifier_rank` int unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity`
--
DROP TABLE IF EXISTS `ReferenceEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `identifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `referenceDatabase` int unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceGeneProduct_2_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_chain` (
  `DB_ID` int unsigned DEFAULT NULL,
  `chain_rank` int unsigned DEFAULT NULL,
  `chain` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `chain` (`chain`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceGene` (
  `DB_ID` int unsigned DEFAULT NULL,
  `referenceGene_rank` int unsigned DEFAULT NULL,
  `referenceGene` int unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceTranscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceTranscript` (
  `DB_ID` int unsigned DEFAULT NULL,
  `referenceTranscript_rank` int unsigned DEFAULT NULL,
  `referenceTranscript` int unsigned DEFAULT NULL,
  `referenceTranscript_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceTranscript` (`referenceTranscript`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct`
--
DROP TABLE IF EXISTS `ReferenceGeneProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `_chainChangeLog` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `_chainChangeLog` (`_chainChangeLog`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceGroup_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGroup_2_otherIdentifier` (
  `DB_ID` int unsigned DEFAULT NULL,
  `otherIdentifier_rank` int unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceGroup_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGroup_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGroup`
--
DROP TABLE IF EXISTS `ReferenceGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGroup` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `formula` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `formula` (`formula`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceIsoform_2_isoformParent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform_2_isoformParent` (
  `DB_ID` int unsigned DEFAULT NULL,
  `isoformParent_rank` int unsigned DEFAULT NULL,
  `isoformParent` int unsigned DEFAULT NULL,
  `isoformParent_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `isoformParent` (`isoformParent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceIsoform`
--
DROP TABLE IF EXISTS `ReferenceIsoform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `variantIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `variantIdentifier` (`variantIdentifier`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceMolecule_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceMolecule_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceMolecule_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceMolecule_2_otherIdentifier` (
  `DB_ID` int unsigned DEFAULT NULL,
  `otherIdentifier_rank` int unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceMolecule`
--
DROP TABLE IF EXISTS `ReferenceMolecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceMolecule` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `formula` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `formula` (`formula`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceRNASequence_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence_2_referenceGene` (
  `DB_ID` int unsigned DEFAULT NULL,
  `referenceGene_rank` int unsigned DEFAULT NULL,
  `referenceGene` int unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceRNASequence`
--
DROP TABLE IF EXISTS `ReferenceRNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_comment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `comment_rank` int unsigned DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `comment` (`comment`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_description` (
  `DB_ID` int unsigned DEFAULT NULL,
  `description_rank` int unsigned DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `description` (`description`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_geneName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_geneName` (
  `DB_ID` int unsigned DEFAULT NULL,
  `geneName_rank` int unsigned DEFAULT NULL,
  `geneName` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `geneName` (`geneName`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_keyword` (
  `DB_ID` int unsigned DEFAULT NULL,
  `keyword_rank` int unsigned DEFAULT NULL,
  `keyword` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `keyword` (`keyword`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_secondaryIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_secondaryIdentifier` (
  `DB_ID` int unsigned DEFAULT NULL,
  `secondaryIdentifier_rank` int unsigned DEFAULT NULL,
  `secondaryIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondaryIdentifier` (`secondaryIdentifier`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceSequence_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_otherIdentifier` (
  `DB_ID` int unsigned DEFAULT NULL,
  `otherIdentifier_rank` int unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence`
--
DROP TABLE IF EXISTS `ReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `checksum` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `isSequenceChanged` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `sequenceLength` int unsigned DEFAULT NULL,
    `species` int unsigned NOT NULL,
    `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `checksum` (`checksum`(10)),
    KEY `isSequenceChanged` (`isSequenceChanged`(10)),
    KEY `sequenceLength` (`sequenceLength`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceTherapeutic_2_approvalSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_approvalSource` (
  `DB_ID` int unsigned DEFAULT NULL,
  `approvalSource_rank` int unsigned DEFAULT NULL,
  `approvalSource` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `approvalSource` (`approvalSource`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceTherapeutic_2_activeDrugIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_activeDrugIds` (
  `DB_ID` int unsigned DEFAULT NULL,
  `activeDrugIds_rank` int unsigned DEFAULT NULL,
  `activeDrugIds` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeDrugIds` (`activeDrugIds`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"ReferenceTherapeutic_2_prodrugIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_prodrugIds` (
  `DB_ID` int unsigned DEFAULT NULL,
  `prodrugIds_rank` int unsigned DEFAULT NULL,
  `prodrugIds` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `prodrugIds` (`prodrugIds`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceTherapeutic`
--
DROP TABLE IF EXISTS `ReferenceTherapeutic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `abbreviation` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `approved` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    `withdrawn` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `inn` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `abbreviation` (`abbreviation`(10)),
    KEY `approved` (`approved`),
    KEY `withdrawn` (`withdrawn`),
    KEY `inn` (`inn`(10)),
    KEY `type` (`type`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Regulation_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_activeUnit` (
  `DB_ID` int unsigned DEFAULT NULL,
  `activeUnit_rank` int unsigned DEFAULT NULL,
  `activeUnit` int unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Regulation_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_summation` (
  `DB_ID` int unsigned DEFAULT NULL,
  `summation_rank` int unsigned DEFAULT NULL,
  `summation` int unsigned DEFAULT NULL,
  `summation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation`
--
DROP TABLE IF EXISTS `Regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `activity` int unsigned DEFAULT NULL,
    `activity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `regulator` int unsigned NOT NULL,
    `regulator_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `activity` (`activity`),
    KEY `regulator` (`regulator`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegulationReference`
--
DROP TABLE IF EXISTS `RegulationReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegulationReference` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `regulation` int unsigned NOT NULL,
    `regulation_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `regulation` (`regulation`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReplacedResidue_2_psiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue_2_psiMod` (
  `DB_ID` int unsigned DEFAULT NULL,
  `psiMod_rank` int unsigned DEFAULT NULL,
  `psiMod` int unsigned DEFAULT NULL,
  `psiMod_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `psiMod` (`psiMod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplacedResidue`
--
DROP TABLE IF EXISTS `ReplacedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `coordinate` int unsigned DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Release`
--
DROP TABLE IF EXISTS `_Release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Release` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `releaseNumber` int unsigned NOT NULL,
    `releaseDate` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `releaseNumber` (`releaseNumber`),
    KEY `releaseDate` (`releaseDate`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RepeatedUnit`
--
DROP TABLE IF EXISTS `RepeatedUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RepeatedUnit` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `physicalEntity` int unsigned DEFAULT NULL,
    `physicalEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `physicalEntity` (`physicalEntity`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RepresentedPathway`
--
DROP TABLE IF EXISTS `RepresentedPathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RepresentedPathway` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `pathway` int unsigned DEFAULT NULL,
    `pathway_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `id` int unsigned DEFAULT NULL,
    `order` int unsigned DEFAULT NULL,
    `stoichiometry` int unsigned DEFAULT NULL,
    KEY `pathway` (`pathway`),
    KEY `id` (`id`),
    KEY `order` (`order`),
    KEY `stoichiometry` (`stoichiometry`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Requirement`
--
DROP TABLE IF EXISTS `Requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requirement` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RNADrug`
--
DROP TABLE IF EXISTS `RNADrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RNADrug` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SequenceOntology`
--
DROP TABLE IF EXISTS `SequenceOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequenceOntology` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `identifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `identifier` (`identifier`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `SimpleEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimpleEntity_2_compartment` (
  `DB_ID` int unsigned DEFAULT NULL,
  `compartment_rank` int unsigned DEFAULT NULL,
  `compartment` int unsigned DEFAULT NULL,
  `compartment_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SimpleEntity`
--
DROP TABLE IF EXISTS `SimpleEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimpleEntity` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `referenceEntity` int unsigned NOT NULL,
    `referenceEntity_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `species` int unsigned DEFAULT NULL,
    `species_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `referenceEntity` (`referenceEntity`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Species`
--
DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Species` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `abbreviation` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `abbreviation` (`abbreviation`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `StableIdentifier_2_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifier_2_history` (
  `DB_ID` int unsigned DEFAULT NULL,
  `history_rank` int unsigned DEFAULT NULL,
  `history` int unsigned DEFAULT NULL,
  `history_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `history` (`history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifier`
--
DROP TABLE IF EXISTS `StableIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifier` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `oldIdentifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `oldIdentifierVersion` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `released` enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `identifier` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `identifierVersion` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `oldIdentifier` (`oldIdentifier`(10)),
    KEY `oldIdentifierVersion` (`oldIdentifierVersion`(10)),
    KEY `released` (`released`),
    KEY `identifier` (`identifier`(10)),
    KEY `identifierVersion` (`identifierVersion`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `StableIdentifierHistory_2_historyStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierHistory_2_historyStatus` (
  `DB_ID` int unsigned DEFAULT NULL,
  `historyStatus_rank` int unsigned DEFAULT NULL,
  `historyStatus` int unsigned DEFAULT NULL,
  `historyStatus_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `historyStatus` (`historyStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifierHistory`
--
DROP TABLE IF EXISTS `StableIdentifierHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierHistory` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `identifier` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `identifierVersion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `identifier` (`identifier`(10)),
    KEY `identifierVersion` (`identifierVersion`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifierReleaseStatus`
--
DROP TABLE IF EXISTS `StableIdentifierReleaseStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierReleaseStatus` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `releaseNumber` int unsigned DEFAULT NULL,
    `status` int unsigned DEFAULT NULL,
    `status_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `releaseNumber` (`releaseNumber`),
    KEY `status` (`status`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Summation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation_2_literatureReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `literatureReference_rank` int unsigned DEFAULT NULL,
  `literatureReference` int unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Summation`
--
DROP TABLE IF EXISTS `Summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `text` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `text` (`text`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Taxon_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_crossReference` (
  `DB_ID` int unsigned DEFAULT NULL,
  `crossReference_rank` int unsigned DEFAULT NULL,
  `crossReference` int unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"Taxon_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_name` (
  `DB_ID` int unsigned DEFAULT NULL,
  `name_rank` int unsigned DEFAULT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Taxon`
--
DROP TABLE IF EXISTS `Taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `superTaxon` int unsigned DEFAULT NULL,
    `superTaxon_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `superTaxon` (`superTaxon`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TranscriptionalModification`
--
DROP TABLE IF EXISTS `TranscriptionalModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TranscriptionalModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TranslationalModification`
--
DROP TABLE IF EXISTS `TranslationalModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TranslationalModification` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `coordinate` int unsigned DEFAULT NULL,
    `psiMod` int unsigned NOT NULL,
    `psiMod_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    KEY `psiMod` (`psiMod`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `"_UpdateTracker_2_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UpdateTracker_2_action` (
  `DB_ID` int unsigned DEFAULT NULL,
  `action_rank` int unsigned DEFAULT NULL,
  `action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `action` (`action`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_UpdateTracker_2_updatedInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UpdateTracker_2_updatedInstance` (
  `DB_ID` int unsigned DEFAULT NULL,
  `updatedInstance_rank` int unsigned DEFAULT NULL,
  `updatedInstance` int unsigned DEFAULT NULL,
  `updatedInstance_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `updatedInstance` (`updatedInstance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UpdateTracker`
--
DROP TABLE IF EXISTS `_UpdateTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UpdateTracker` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `_release` int unsigned DEFAULT NULL,
    `_release_class` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    KEY `_release` (`_release`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `URL`
--
DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
    `uniformResourceLocator` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
    KEY `uniformResourceLocator` (`uniformResourceLocator`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;