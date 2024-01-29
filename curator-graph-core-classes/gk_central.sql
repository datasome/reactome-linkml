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
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `referenceSequence` int(10) unsigned DEFAULT NULL,
    `referenceSequence_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `referenceSequence` (`referenceSequence`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Affiliation_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Affiliation`
--
DROP TABLE IF EXISTS `Affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `address` mediumtext COLLATE utf8_unicode_ci,
    KEY `address` (`address`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Anatomy`
--
DROP TABLE IF EXISTS `Anatomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anatomy` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `BlackBoxEvent_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent_2_authored` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `authored_rank` int(10) unsigned DEFAULT NULL,
  `authored` int(10) unsigned DEFAULT NULL,
  `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `BlackBoxEvent_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `BlackBoxEvent_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `BlackBoxEvent_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `BlackBoxEvent_2_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent_2_input` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `input_rank` int(10) unsigned DEFAULT NULL,
  `input` int(10) unsigned DEFAULT NULL,
  `input_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `input` (`input`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlackBoxEvent`
--
DROP TABLE IF EXISTS `BlackBoxEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `templateEvent` int(10) unsigned DEFAULT NULL,
    `templateEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `releaseDate` date NOT NULL,
    KEY `templateEvent` (`templateEvent`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    KEY `releaseDate` (`releaseDate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Book_2_chapterAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book_2_chapterAuthors` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `chapterAuthors_rank` int(10) unsigned DEFAULT NULL,
  `chapterAuthors` int(10) unsigned DEFAULT NULL,
  `chapterAuthors_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `chapterAuthors` (`chapterAuthors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Book`
--
DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `ISBN` mediumtext COLLATE utf8_unicode_ci,
    `chapterTitle` mediumtext COLLATE utf8_unicode_ci,
    `pages` mediumtext COLLATE utf8_unicode_ci,
    `year` int(10) NOT NULL,
    `publisher` int(10) unsigned DEFAULT NULL,
    `publisher_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `ISBN` (`ISBN`(10)),
    KEY `chapterTitle` (`chapterTitle`(10)),
    KEY `pages` (`pages`(10)),
    KEY `year` (`year`),
    KEY `publisher` (`publisher`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CandidateSet_2_hasCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet_2_hasCandidate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasCandidate_rank` int(10) unsigned DEFAULT NULL,
  `hasCandidate` int(10) unsigned DEFAULT NULL,
  `hasCandidate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasCandidate` (`hasCandidate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CandidateSet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet_2_hasMember` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasMember_rank` int(10) unsigned DEFAULT NULL,
  `hasMember` int(10) unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateSet`
--
DROP TABLE IF EXISTS `CandidateSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CatalystActivity_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity_2_activeUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `activeUnit_rank` int(10) unsigned DEFAULT NULL,
  `activeUnit` int(10) unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivity`
--
DROP TABLE IF EXISTS `CatalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `activity` int(10) unsigned DEFAULT NULL,
    `activity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `physicalEntity` int(10) unsigned NOT NULL,
    `physicalEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `activity` (`activity`),
    KEY `physicalEntity` (`physicalEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivityReference`
--
DROP TABLE IF EXISTS `CatalystActivityReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivityReference` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `catalystActivity` int(10) unsigned NOT NULL,
    `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `catalystActivity` (`catalystActivity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_RNAMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_RNAMarker` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `RNAMarker_rank` int(10) unsigned DEFAULT NULL,
  `RNAMarker` int(10) unsigned DEFAULT NULL,
  `RNAMarker_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `RNAMarker` (`RNAMarker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_markerReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_markerReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `markerReference_rank` int(10) unsigned DEFAULT NULL,
  `markerReference` int(10) unsigned DEFAULT NULL,
  `markerReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `markerReference` (`markerReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_proteinMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_proteinMarker` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `proteinMarker_rank` int(10) unsigned DEFAULT NULL,
  `proteinMarker` int(10) unsigned DEFAULT NULL,
  `proteinMarker_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `proteinMarker` (`proteinMarker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Cell_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cell`
--
DROP TABLE IF EXISTS `Cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cell` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `organ` int(10) unsigned DEFAULT NULL,
    `organ_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `tissueLayer` int(10) unsigned DEFAULT NULL,
    `tissueLayer_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `tissue` int(10) unsigned NOT NULL,
    `tissue_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `organ` (`organ`),
    KEY `tissueLayer` (`tissueLayer`),
    KEY `tissue` (`tissue`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CellDevelopmentStep_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellDevelopmentStep_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellDevelopmentStep`
--
DROP TABLE IF EXISTS `CellDevelopmentStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellDevelopmentStep` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `tissue` int(10) unsigned DEFAULT NULL,
    `tissue_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `input` int(10) unsigned NOT NULL,
    `input_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `output` int(10) unsigned NOT NULL,
    `output_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `tissue` (`tissue`),
    KEY `input` (`input`),
    KEY `output` (`output`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CellLineagePath_2_hasEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellLineagePath_2_hasEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasEvent_rank` int(10) unsigned DEFAULT NULL,
  `hasEvent` int(10) unsigned DEFAULT NULL,
  `hasEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasEvent` (`hasEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellLineagePath`
--
DROP TABLE IF EXISTS `CellLineagePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellLineagePath` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `tissue` int(10) unsigned DEFAULT NULL,
    `tissue_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `tissue` (`tissue`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CellType_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellType_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellType`
--
DROP TABLE IF EXISTS `CellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellType` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ChemicalDrug`
--
DROP TABLE IF EXISTS `ChemicalDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChemicalDrug` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Compartment`
--
DROP TABLE IF EXISTS `Compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compartment` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_hasComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_hasComponent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasComponent_rank` int(10) unsigned DEFAULT NULL,
  `hasComponent` int(10) unsigned DEFAULT NULL,
  `hasComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasComponent` (`hasComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_includedLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_includedLocation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `includedLocation_rank` int(10) unsigned DEFAULT NULL,
  `includedLocation` int(10) unsigned DEFAULT NULL,
  `includedLocation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `includedLocation` (`includedLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_entityOnOtherCell` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Complex_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex`
--
DROP TABLE IF EXISTS `Complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `stoichiometryKnown` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `isChimeric` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT 'False',
    KEY `stoichiometryKnown` (`stoichiometryKnown`),
    KEY `isChimeric` (`isChimeric`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ControlledVocabulary_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlledVocabulary`
--
DROP TABLE IF EXISTS `ControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext COLLATE utf8_unicode_ci,
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ControlReference_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlReference_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlReference`
--
DROP TABLE IF EXISTS `ControlReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlReference` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `CrosslinkedResidue_2_secondCoordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrosslinkedResidue_2_secondCoordinate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondCoordinate_rank` int(10) unsigned DEFAULT NULL,
  `secondCoordinate` int(10) DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondCoordinate` (`secondCoordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CrosslinkedResidue`
--
DROP TABLE IF EXISTS `CrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrosslinkedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `modification` int(10) unsigned DEFAULT NULL,
    `modification_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DatabaseIdentifier_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseIdentifier`
--
DROP TABLE IF EXISTS `DatabaseIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `identifier` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DatabaseObject_2_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseObject_2_modified` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `modified_rank` int(10) unsigned DEFAULT NULL,
  `modified` int(10) unsigned DEFAULT NULL,
  `modified_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseObject`
--
DROP TABLE IF EXISTS `DatabaseObject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseObject` (
    `DB_ID` int(10) NOT NULL AUTO_INCREMENT,
    `_displayName` mediumtext COLLATE utf8_unicode_ci,
    `_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created` int(10) unsigned DEFAULT NULL,
    `created_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `stableIdentifier` int(10) unsigned DEFAULT NULL,
    `stableIdentifier_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `_displayName` (`_displayName`(10)),
    KEY `_timestamp` (`_timestamp`),
    KEY `created` (`created`),
    KEY `stableIdentifier` (`stableIdentifier`),
    KEY `_class` (`_class`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDBAUTO_INCREMENT=9859833  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataModel`
--
DROP TABLE IF EXISTS `DataModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataModel` (
    `thing` text COLLATE utf8_unicode_ci,
    `thing_class` enum('SchemaClass','SchemaClassAttribute','Schema') COLLATE utf8_unicode_ci DEFAULT NULL,
    `property_name` text COLLATE utf8_unicode_ci,
    `property_value` text COLLATE utf8_unicode_ci,
    `property_value_type` enum('INTEGER','SYMBOL','STRING','INSTANCE','SchemaClass','SchemaClassAttribute') COLLATE utf8_unicode_ci DEFAULT NULL,
    `property_value_rank` int(10) unsigned DEFAULT '0',
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DefinedSet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefinedSet_2_hasMember` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasMember_rank` int(10) unsigned DEFAULT NULL,
  `hasMember` int(10) unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DefinedSet`
--
DROP TABLE IF EXISTS `DefinedSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefinedSet` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_deletedInstanceDB_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_deletedInstanceDB_ID` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `deletedInstanceDB_ID_rank` int(10) unsigned DEFAULT NULL,
  `deletedInstanceDB_ID` int(10) DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `deletedInstanceDB_ID` (`deletedInstanceDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_deletedInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_deletedInstance` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `deletedInstance_rank` int(10) unsigned DEFAULT NULL,
  `deletedInstance` int(10) unsigned DEFAULT NULL,
  `deletedInstance_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `deletedInstance` (`deletedInstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_replacementInstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_replacementInstances` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `replacementInstances_rank` int(10) unsigned DEFAULT NULL,
  `replacementInstances` int(10) unsigned DEFAULT NULL,
  `replacementInstances_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `replacementInstances` (`replacementInstances`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_Deleted_2_replacementInstanceDB_IDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_replacementInstanceDB_IDs` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `replacementInstanceDB_IDs_rank` int(10) unsigned DEFAULT NULL,
  `replacementInstanceDB_IDs` int(10) DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `replacementInstanceDB_IDs` (`replacementInstanceDB_IDs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Deleted`
--
DROP TABLE IF EXISTS `_Deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `curatorComment` mediumtext COLLATE utf8_unicode_ci,
    `reason` int(10) unsigned DEFAULT NULL,
    `reason_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `curatorComment` (`curatorComment`(10)),
    KEY `reason` (`reason`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeletedControlledVocabulary`
--
DROP TABLE IF EXISTS `DeletedControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedControlledVocabulary` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_DeletedInstance_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_DeletedInstance_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DeletedInstance`
--
DROP TABLE IF EXISTS `_DeletedInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_DeletedInstance` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `class` text COLLATE utf8_unicode_ci,
    `deletedInstanceDB_ID` int(10) unsigned DEFAULT NULL,
    `deletedStableIdentifier` int(10) unsigned DEFAULT NULL,
    `deletedStableIdentifier_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `name` text COLLATE utf8_unicode_ci,
    KEY `class` (`class`(10)),
    KEY `deletedInstanceDB_ID` (`deletedInstanceDB_ID`),
    KEY `deletedStableIdentifier` (`deletedStableIdentifier`),
    KEY `name` (`name`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_authored` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `authored_rank` int(10) unsigned DEFAULT NULL,
  `authored` int(10) unsigned DEFAULT NULL,
  `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Depolymerisation_2_requiredInputComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation_2_requiredInputComponent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_rank` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `requiredInputComponent` (`requiredInputComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Depolymerisation`
--
DROP TABLE IF EXISTS `Depolymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `catalystActivity` int(10) unsigned DEFAULT NULL,
    `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `releaseDate` mediumtext COLLATE utf8_unicode_ci,
    KEY `catalystActivity` (`catalystActivity`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    KEY `releaseDate` (`releaseDate`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Disease_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Disease`
--
DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Drug_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Drug_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug_2_disease` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `disease_rank` int(10) unsigned DEFAULT NULL,
  `disease` int(10) unsigned DEFAULT NULL,
  `disease_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Drug`
--
DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `referenceEntity` int(10) unsigned NOT NULL,
    `referenceEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `referenceEntity` (`referenceEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DrugActionType_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugActionType_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DrugActionType`
--
DROP TABLE IF EXISTS `DrugActionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugActionType` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntityFunctionalStatus_2_functionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus_2_functionalStatus` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `functionalStatus_rank` int(10) unsigned DEFAULT NULL,
  `functionalStatus` int(10) unsigned DEFAULT NULL,
  `functionalStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `functionalStatus` (`functionalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityFunctionalStatus`
--
DROP TABLE IF EXISTS `EntityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `diseaseEntity` int(10) unsigned NOT NULL,
    `diseaseEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `normalEntity` int(10) unsigned DEFAULT NULL,
    `normalEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `diseaseEntity` (`diseaseEntity`),
    KEY `normalEntity` (`normalEntity`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntitySet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_hasMember` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasMember_rank` int(10) unsigned DEFAULT NULL,
  `hasMember` int(10) unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet`
--
DROP TABLE IF EXISTS `EntitySet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `isOrdered` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `isOrdered` (`isOrdered`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntityWithAccessionedSequence_2_hasModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence_2_hasModifiedResidue` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue_rank` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasModifiedResidue` (`hasModifiedResidue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `EntityWithAccessionedSequence_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityWithAccessionedSequence`
--
DROP TABLE IF EXISTS `EntityWithAccessionedSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `endCoordinate` int(10) DEFAULT '-1',
    `startCoordinate` int(10) DEFAULT '1',
    `referenceEntity` int(10) unsigned NOT NULL,
    `referenceEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `species` int(10) unsigned NOT NULL,
    `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `endCoordinate` (`endCoordinate`),
    KEY `startCoordinate` (`startCoordinate`),
    KEY `referenceEntity` (`referenceEntity`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_disease` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `disease_rank` int(10) unsigned DEFAULT NULL,
  `disease` int(10) unsigned DEFAULT NULL,
  `disease_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_precedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_precedingEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `precedingEvent_rank` int(10) unsigned DEFAULT NULL,
  `precedingEvent` int(10) unsigned DEFAULT NULL,
  `precedingEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `precedingEvent` (`precedingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_inferredFrom` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredFrom_rank` int(10) unsigned DEFAULT NULL,
  `inferredFrom` int(10) unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_orthologousEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_orthologousEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `orthologousEvent_rank` int(10) unsigned DEFAULT NULL,
  `orthologousEvent` int(10) unsigned DEFAULT NULL,
  `orthologousEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `orthologousEvent` (`orthologousEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_reviewed` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `reviewed_rank` int(10) unsigned DEFAULT NULL,
  `reviewed` int(10) unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_internalReviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_internalReviewed` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `internalReviewed_rank` int(10) unsigned DEFAULT NULL,
  `internalReviewed` int(10) unsigned DEFAULT NULL,
  `internalReviewed_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `internalReviewed` (`internalReviewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_negativePrecedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_negativePrecedingEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `negativePrecedingEvent_rank` int(10) unsigned DEFAULT NULL,
  `negativePrecedingEvent` int(10) unsigned DEFAULT NULL,
  `negativePrecedingEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `negativePrecedingEvent` (`negativePrecedingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_structureModified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_structureModified` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `structureModified_rank` int(10) unsigned DEFAULT NULL,
  `structureModified` int(10) unsigned DEFAULT NULL,
  `structureModified_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `structureModified` (`structureModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_authored` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `authored_rank` int(10) unsigned DEFAULT NULL,
  `authored` int(10) unsigned DEFAULT NULL,
  `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_revised` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `revised_rank` int(10) unsigned DEFAULT NULL,
  `revised` int(10) unsigned DEFAULT NULL,
  `revised_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Event_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_summation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `summation_rank` int(10) unsigned DEFAULT NULL,
  `summation` int(10) unsigned DEFAULT NULL,
  `summation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--
DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `_doRelease` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `releaseStatus` mediumtext COLLATE utf8_unicode_ci,
    `evidenceType` int(10) unsigned DEFAULT NULL,
    `evidenceType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `reviewStatus` int(10) unsigned DEFAULT NULL,
    `reviewStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `previousReviewStatus` int(10) unsigned DEFAULT NULL,
    `previousReviewStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `definition` mediumtext COLLATE utf8_unicode_ci,
    `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `releaseDate` date DEFAULT NULL,
    KEY `_doRelease` (`_doRelease`),
    KEY `releaseStatus` (`releaseStatus`(10)),
    KEY `evidenceType` (`evidenceType`),
    KEY `reviewStatus` (`reviewStatus`),
    KEY `previousReviewStatus` (`previousReviewStatus`),
    KEY `definition` (`definition`(10)),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    KEY `releaseDate` (`releaseDate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EvidenceType`
--
DROP TABLE IF EXISTS `EvidenceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ExternalOntology_2_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_synonym` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `synonym_rank` int(10) unsigned DEFAULT NULL,
  `synonym` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `synonym` (`synonym`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ExternalOntology_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ExternalOntology_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology`
--
DROP TABLE IF EXISTS `ExternalOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext COLLATE utf8_unicode_ci,
    `identifier` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `definition` (`definition`(10)),
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FailedReaction_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FailedReaction`
--
DROP TABLE IF EXISTS `FailedReaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Figure`
--
DROP TABLE IF EXISTS `Figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Figure` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `url` mediumtext COLLATE utf8_unicode_ci,
    KEY `url` (`url`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentDeletionModification`
--
DROP TABLE IF EXISTS `FragmentDeletionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentDeletionModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentInsertionModification`
--
DROP TABLE IF EXISTS `FragmentInsertionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentInsertionModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `coordinate` int(10) DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentModification`
--
DROP TABLE IF EXISTS `FragmentModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `endPositionInReferenceSequence` int(10) DEFAULT NULL,
    `startPositionInReferenceSequence` int(10) DEFAULT NULL,
    KEY `endPositionInReferenceSequence` (`endPositionInReferenceSequence`),
    KEY `startPositionInReferenceSequence` (`startPositionInReferenceSequence`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentReplacedModification`
--
DROP TABLE IF EXISTS `FragmentReplacedModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentReplacedModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `alteredAminoAcidFragment` mediumtext COLLATE utf8_unicode_ci,
    KEY `alteredAminoAcidFragment` (`alteredAminoAcidFragment`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FrontPage_2_frontPageItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage_2_frontPageItem` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `frontPageItem_rank` int(10) unsigned DEFAULT NULL,
  `frontPageItem` int(10) unsigned DEFAULT NULL,
  `frontPageItem_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `frontPageItem` (`frontPageItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FrontPage`
--
DROP TABLE IF EXISTS `FrontPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatus`
--
DROP TABLE IF EXISTS `FunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatus` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `functionalStatusType` int(10) unsigned DEFAULT NULL,
    `functionalStatusType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `structuralVariant` int(10) unsigned DEFAULT NULL,
    `structuralVariant_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `functionalStatusType` (`functionalStatusType`),
    KEY `structuralVariant` (`structuralVariant`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `FunctionalStatusType_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatusType`
--
DROP TABLE IF EXISTS `FunctionalStatusType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `definition` mediumtext COLLATE utf8_unicode_ci,
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeneticallyModifiedResidue`
--
DROP TABLE IF EXISTS `GeneticallyModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneticallyModifiedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GenomeEncodedEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenomeEncodedEntity_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenomeEncodedEntity`
--
DROP TABLE IF EXISTS `GenomeEncodedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenomeEncodedEntity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `species` int(10) unsigned DEFAULT NULL,
    `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess`
--
DROP TABLE IF EXISTS `GO_BiologicalProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `accession` mediumtext COLLATE utf8_unicode_ci,
    `definition` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_componentOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_componentOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `componentOf_rank` int(10) unsigned DEFAULT NULL,
  `componentOf` int(10) unsigned DEFAULT NULL,
  `componentOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `componentOf` (`componentOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_hasPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_hasPart` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasPart_rank` int(10) unsigned DEFAULT NULL,
  `hasPart` int(10) unsigned DEFAULT NULL,
  `hasPart_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasPart` (`hasPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_surroundedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_surroundedBy` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `surroundedBy_rank` int(10) unsigned DEFAULT NULL,
  `surroundedBy` int(10) unsigned DEFAULT NULL,
  `surroundedBy_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `surroundedBy` (`surroundedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_CellularComponent_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent`
--
DROP TABLE IF EXISTS `GO_CellularComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `accession` mediumtext COLLATE utf8_unicode_ci,
    `definition` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_MolecularFunction_2_ecNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_ecNumber` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `ecNumber_rank` int(10) unsigned DEFAULT NULL,
  `ecNumber` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `ecNumber` (`ecNumber`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `GO_MolecularFunction_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction`
--
DROP TABLE IF EXISTS `GO_MolecularFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `accession` mediumtext COLLATE utf8_unicode_ci,
    `definition` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `accession` (`accession`(10)),
    KEY `definition` (`definition`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GroupModifiedResidue`
--
DROP TABLE IF EXISTS `GroupModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupModifiedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `modification` int(10) unsigned NOT NULL,
    `modification_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InstanceEdit_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit_2_author` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `author_rank` int(10) unsigned DEFAULT NULL,
  `author` int(10) unsigned DEFAULT NULL,
  `author_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstanceEdit`
--
DROP TABLE IF EXISTS `InstanceEdit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `note` mediumtext COLLATE utf8_unicode_ci,
    `_applyToAllEditedInstances` mediumtext COLLATE utf8_unicode_ci,
    KEY `dateTime` (`dateTime`),
    KEY `note` (`note`(10)),
    KEY `_applyToAllEditedInstances` (`_applyToAllEditedInstances`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InteractionEvent_2_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InteractionEvent_2_partners` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `partners_rank` int(10) unsigned DEFAULT NULL,
  `partners` int(10) unsigned DEFAULT NULL,
  `partners_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `partners` (`partners`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InteractionEvent`
--
DROP TABLE IF EXISTS `InteractionEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InteractionEvent` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_equivalentTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_equivalentTo` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `equivalentTo_rank` int(10) unsigned DEFAULT NULL,
  `equivalentTo` int(10) unsigned DEFAULT NULL,
  `equivalentTo_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `equivalentTo` (`equivalentTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_secondReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_secondReferenceSequence` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence_rank` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondReferenceSequence` (`secondReferenceSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InterChainCrosslinkedResidue`
--
DROP TABLE IF EXISTS `InterChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IntraChainCrosslinkedResidue`
--
DROP TABLE IF EXISTS `IntraChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IntraChainCrosslinkedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LiteratureReference`
--
DROP TABLE IF EXISTS `LiteratureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LiteratureReference` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `journal` text COLLATE utf8_unicode_ci,
    `pages` mediumtext COLLATE utf8_unicode_ci,
    `pubMedIdentifier` int(10) DEFAULT NULL,
    `volume` int(10) DEFAULT NULL,
    `year` int(10) DEFAULT NULL,
    KEY `journal` (`journal`(10)),
    KEY `pages` (`pages`(10)),
    KEY `pubMedIdentifier` (`pubMedIdentifier`),
    KEY `volume` (`volume`),
    KEY `year` (`year`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `MarkerReference_2_cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarkerReference_2_cell` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `cell_rank` int(10) unsigned DEFAULT NULL,
  `cell` int(10) unsigned DEFAULT NULL,
  `cell_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `cell` (`cell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MarkerReference`
--
DROP TABLE IF EXISTS `MarkerReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarkerReference` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `marker` int(10) unsigned DEFAULT NULL,
    `marker_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `marker` (`marker`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ModifiedNucleotide`
--
DROP TABLE IF EXISTS `ModifiedNucleotide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedNucleotide` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `coordinate` int(10) DEFAULT NULL,
    `modification` int(10) unsigned NOT NULL,
    `modification_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    KEY `modification` (`modification`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ModifiedResidue`
--
DROP TABLE IF EXISTS `ModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeGeneExpressionRegulation`
--
DROP TABLE IF EXISTS `NegativeGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeGeneExpressionRegulation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `NegativePrecedingEvent_2_precedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEvent_2_precedingEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `precedingEvent_rank` int(10) unsigned DEFAULT NULL,
  `precedingEvent` int(10) unsigned DEFAULT NULL,
  `precedingEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `precedingEvent` (`precedingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativePrecedingEvent`
--
DROP TABLE IF EXISTS `NegativePrecedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEvent` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `comment` text COLLATE utf8_unicode_ci,
    `reason` int(10) unsigned DEFAULT NULL,
    `reason_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `comment` (`comment`(10)),
    KEY `reason` (`reason`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativePrecedingEventReason`
--
DROP TABLE IF EXISTS `NegativePrecedingEventReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativePrecedingEventReason` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeRegulation`
--
DROP TABLE IF EXISTS `NegativeRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeRegulation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NonsenseMutation`
--
DROP TABLE IF EXISTS `NonsenseMutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NonsenseMutation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ontology`
--
DROP TABLE IF EXISTS `Ontology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ontology` (
    `ontology` longblob,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `OtherEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherEntity_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OtherEntity`
--
DROP TABLE IF EXISTS `OtherEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherEntity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Pathway_2_hasEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_hasEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasEvent_rank` int(10) unsigned DEFAULT NULL,
  `hasEvent` int(10) unsigned DEFAULT NULL,
  `hasEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasEvent` (`hasEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pathway`
--
DROP TABLE IF EXISTS `Pathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `doi` text COLLATE utf8_unicode_ci,
    `hasEHLD` text COLLATE utf8_unicode_ci,
    `isCanonical` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `normalPathway` int(10) unsigned DEFAULT NULL,
    `normalPathway_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `lastUpdatedDate` text COLLATE utf8_unicode_ci,
    KEY `doi` (`doi`(10)),
    KEY `hasEHLD` (`hasEHLD`(10)),
    KEY `isCanonical` (`isCanonical`),
    KEY `normalPathway` (`normalPathway`),
    KEY `lastUpdatedDate` (`lastUpdatedDate`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PathwayDiagram_2_representedPathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram_2_representedPathway` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `representedPathway_rank` int(10) unsigned DEFAULT NULL,
  `representedPathway` int(10) unsigned DEFAULT NULL,
  `representedPathway_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `representedPathway` (`representedPathway`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayDiagram`
--
DROP TABLE IF EXISTS `PathwayDiagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `width` int(10) DEFAULT NULL,
    `height` int(10) DEFAULT NULL,
    `storedATXML` longblob,
    KEY `width` (`width`),
    KEY `height` (`height`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_affiliation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `affiliation_rank` int(10) unsigned DEFAULT NULL,
  `affiliation` int(10) unsigned DEFAULT NULL,
  `affiliation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `affiliation` (`affiliation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Person_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person`
--
DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `firstname` mediumtext COLLATE utf8_unicode_ci,
    `initial` mediumtext COLLATE utf8_unicode_ci,
    `project` mediumtext COLLATE utf8_unicode_ci,
    `surname` mediumtext COLLATE utf8_unicode_ci,
    `url` mediumtext COLLATE utf8_unicode_ci,
    KEY `firstname` (`firstname`(10)),
    KEY `initial` (`initial`(10)),
    KEY `project` (`project`(10)),
    KEY `surname` (`surname`(10)),
    KEY `url` (`url`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredTo` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredTo_rank` int(10) unsigned DEFAULT NULL,
  `inferredTo` int(10) unsigned DEFAULT NULL,
  `inferredTo_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredTo` (`inferredTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredFrom` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredFrom_rank` int(10) unsigned DEFAULT NULL,
  `inferredFrom` int(10) unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_reviewed` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `reviewed_rank` int(10) unsigned DEFAULT NULL,
  `reviewed` int(10) unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_cellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_cellType` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `cellType_rank` int(10) unsigned DEFAULT NULL,
  `cellType` int(10) unsigned DEFAULT NULL,
  `cellType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `cellType` (`cellType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_revised` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `revised_rank` int(10) unsigned DEFAULT NULL,
  `revised` int(10) unsigned DEFAULT NULL,
  `revised_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_summation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `summation_rank` int(10) unsigned DEFAULT NULL,
  `summation` int(10) unsigned DEFAULT NULL,
  `summation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `PhysicalEntity_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_disease` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `disease_rank` int(10) unsigned DEFAULT NULL,
  `disease` int(10) unsigned DEFAULT NULL,
  `disease_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity`
--
DROP TABLE IF EXISTS `PhysicalEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `systematicName` mediumtext COLLATE utf8_unicode_ci,
    `goCellularComponent` int(10) unsigned DEFAULT NULL,
    `goCellularComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `authored` int(10) unsigned DEFAULT NULL,
    `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `definition` mediumtext COLLATE utf8_unicode_ci,
    KEY `systematicName` (`systematicName`(10)),
    KEY `goCellularComponent` (`goCellularComponent`),
    KEY `authored` (`authored`),
    KEY `definition` (`definition`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_repeatedUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_repeatedUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `repeatedUnit_rank` int(10) unsigned DEFAULT NULL,
  `repeatedUnit` int(10) unsigned DEFAULT NULL,
  `repeatedUnit_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `repeatedUnit` (`repeatedUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymer_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymer`
--
DROP TABLE IF EXISTS `Polymer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `maxUnitCount` int(10) DEFAULT NULL,
    `minUnitCount` int(10) DEFAULT NULL,
    KEY `maxUnitCount` (`maxUnitCount`),
    KEY `minUnitCount` (`minUnitCount`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Polymerisation_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymerisation`
--
DROP TABLE IF EXISTS `Polymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveGeneExpressionRegulation`
--
DROP TABLE IF EXISTS `PositiveGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveGeneExpressionRegulation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveRegulation`
--
DROP TABLE IF EXISTS `PositiveRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveRegulation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProteinDrug`
--
DROP TABLE IF EXISTS `ProteinDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProteinDrug` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PsiMod`
--
DROP TABLE IF EXISTS `PsiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PsiMod` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `label` text COLLATE utf8_unicode_ci,
    KEY `label` (`label`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Publication_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication_2_author` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `author_rank` int(10) unsigned DEFAULT NULL,
  `author` int(10) unsigned DEFAULT NULL,
  `author_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publication`
--
DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `title` mediumtext COLLATE utf8_unicode_ci,
    KEY `title` (`title`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Reaction_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reaction`
--
DROP TABLE IF EXISTS `Reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `reverseReaction` int(10) unsigned DEFAULT NULL,
    `reverseReaction_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `reverseReaction` (`reverseReaction`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityFunctionalStatus` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus_rank` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityFunctionalStatus` (`entityFunctionalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_regulatedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_regulatedBy` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `regulatedBy_rank` int(10) unsigned DEFAULT NULL,
  `regulatedBy` int(10) unsigned DEFAULT NULL,
  `regulatedBy_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulatedBy` (`regulatedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_regulationReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_regulationReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `regulationReference_rank` int(10) unsigned DEFAULT NULL,
  `regulationReference` int(10) unsigned DEFAULT NULL,
  `regulationReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulationReference` (`regulationReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_hasInteraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_hasInteraction` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasInteraction_rank` int(10) unsigned DEFAULT NULL,
  `hasInteraction` int(10) unsigned DEFAULT NULL,
  `hasInteraction_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasInteraction` (`hasInteraction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_reactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_reactionType` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `reactionType_rank` int(10) unsigned DEFAULT NULL,
  `reactionType` int(10) unsigned DEFAULT NULL,
  `reactionType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reactionType` (`reactionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_input` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `input_rank` int(10) unsigned DEFAULT NULL,
  `input` int(10) unsigned DEFAULT NULL,
  `input_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `input` (`input`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_output` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `output_rank` int(10) unsigned DEFAULT NULL,
  `output` int(10) unsigned DEFAULT NULL,
  `output_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `output` (`output`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityOnOtherCell` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReactionlikeEvent_2_requiredInputComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_requiredInputComponent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_rank` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `requiredInputComponent` (`requiredInputComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent`
--
DROP TABLE IF EXISTS `ReactionlikeEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `systematicName` mediumtext COLLATE utf8_unicode_ci,
    `catalystActivityReference` int(10) unsigned DEFAULT NULL,
    `catalystActivityReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `normalReaction` int(10) unsigned DEFAULT NULL,
    `normalReaction_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `isChimeric` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT 'False',
    KEY `systematicName` (`systematicName`(10)),
    KEY `catalystActivityReference` (`catalystActivityReference`),
    KEY `normalReaction` (`normalReaction`),
    KEY `isChimeric` (`isChimeric`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionType`
--
DROP TABLE IF EXISTS `ReactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionType` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceDatabase_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDatabase`
--
DROP TABLE IF EXISTS `ReferenceDatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `accessUrl` mediumtext COLLATE utf8_unicode_ci,
    `url` mediumtext COLLATE utf8_unicode_ci,
    `resourceIdentifier` text COLLATE utf8_unicode_ci,
    KEY `accessUrl` (`accessUrl`(10)),
    KEY `url` (`url`(10)),
    KEY `resourceIdentifier` (`resourceIdentifier`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDNASequence`
--
DROP TABLE IF EXISTS `ReferenceDNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDNASequence` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceEntity_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_otherIdentifier` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `otherIdentifier_rank` int(10) unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity`
--
DROP TABLE IF EXISTS `ReferenceEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `identifier` mediumtext COLLATE utf8_unicode_ci,
    `referenceDatabase` int(10) unsigned NOT NULL,
    `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `identifier` (`identifier`(10)),
    KEY `referenceDatabase` (`referenceDatabase`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_chain` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `chain_rank` int(10) unsigned DEFAULT NULL,
  `chain` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `chain` (`chain`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceGene` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceGene_rank` int(10) unsigned DEFAULT NULL,
  `referenceGene` int(10) unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceTranscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceTranscript` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceTranscript_rank` int(10) unsigned DEFAULT NULL,
  `referenceTranscript` int(10) unsigned DEFAULT NULL,
  `referenceTranscript_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceTranscript` (`referenceTranscript`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct`
--
DROP TABLE IF EXISTS `ReferenceGeneProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `_chainChangeLog` mediumtext COLLATE utf8_unicode_ci,
    KEY `_chainChangeLog` (`_chainChangeLog`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGroup`
--
DROP TABLE IF EXISTS `ReferenceGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGroup` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `formula` mediumtext COLLATE utf8_unicode_ci,
    KEY `formula` (`formula`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceIsoform_2_isoformParent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform_2_isoformParent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `isoformParent_rank` int(10) unsigned DEFAULT NULL,
  `isoformParent` int(10) unsigned DEFAULT NULL,
  `isoformParent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `isoformParent` (`isoformParent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceIsoform`
--
DROP TABLE IF EXISTS `ReferenceIsoform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `variantIdentifier` mediumtext COLLATE utf8_unicode_ci,
    KEY `variantIdentifier` (`variantIdentifier`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceMolecule`
--
DROP TABLE IF EXISTS `ReferenceMolecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceMolecule` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `formula` mediumtext COLLATE utf8_unicode_ci,
    KEY `formula` (`formula`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceRNASequence_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence_2_referenceGene` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceGene_rank` int(10) unsigned DEFAULT NULL,
  `referenceGene` int(10) unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceRNASequence`
--
DROP TABLE IF EXISTS `ReferenceRNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceSequence_2_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_comment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `comment_rank` int(10) unsigned DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `comment` (`comment`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceSequence_2_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_description` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `description_rank` int(10) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `description` (`description`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceSequence_2_geneName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_geneName` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `geneName_rank` int(10) unsigned DEFAULT NULL,
  `geneName` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `geneName` (`geneName`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceSequence_2_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_keyword` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `keyword_rank` int(10) unsigned DEFAULT NULL,
  `keyword` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `keyword` (`keyword`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceSequence_2_secondaryIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_secondaryIdentifier` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondaryIdentifier_rank` int(10) unsigned DEFAULT NULL,
  `secondaryIdentifier` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondaryIdentifier` (`secondaryIdentifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence`
--
DROP TABLE IF EXISTS `ReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `checksum` mediumtext COLLATE utf8_unicode_ci,
    `isSequenceChanged` mediumtext COLLATE utf8_unicode_ci,
    `sequenceLength` int(10) DEFAULT NULL,
    `species` int(10) unsigned DEFAULT NULL,
    `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `checksum` (`checksum`(10)),
    KEY `isSequenceChanged` (`isSequenceChanged`(10)),
    KEY `sequenceLength` (`sequenceLength`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceTherapeutic_2_approvalSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_approvalSource` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `approvalSource_rank` int(10) unsigned DEFAULT NULL,
  `approvalSource` text COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `approvalSource` (`approvalSource`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceTherapeutic_2_activeDrugIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_activeDrugIds` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `activeDrugIds_rank` int(10) unsigned DEFAULT NULL,
  `activeDrugIds` text COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeDrugIds` (`activeDrugIds`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReferenceTherapeutic_2_prodrugIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_prodrugIds` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `prodrugIds_rank` int(10) unsigned DEFAULT NULL,
  `prodrugIds` text COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `prodrugIds` (`prodrugIds`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceTherapeutic`
--
DROP TABLE IF EXISTS `ReferenceTherapeutic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `abbreviation` text COLLATE utf8_unicode_ci,
    `approved` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `withdrawn` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `inn` text COLLATE utf8_unicode_ci,
    `type` text COLLATE utf8_unicode_ci,
    KEY `abbreviation` (`abbreviation`(10)),
    KEY `approved` (`approved`),
    KEY `withdrawn` (`withdrawn`),
    KEY `inn` (`inn`(10)),
    KEY `type` (`type`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Regulation_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_activeUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `activeUnit_rank` int(10) unsigned DEFAULT NULL,
  `activeUnit` int(10) unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation`
--
DROP TABLE IF EXISTS `Regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `activity` int(10) unsigned DEFAULT NULL,
    `activity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `regulator` int(10) unsigned DEFAULT NULL,
    `regulator_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
    `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `activity` (`activity`),
    KEY `regulator` (`regulator`),
    KEY `goBiologicalProcess` (`goBiologicalProcess`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegulationReference`
--
DROP TABLE IF EXISTS `RegulationReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegulationReference` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `regulation` int(10) unsigned DEFAULT NULL,
    `regulation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `regulation` (`regulation`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ReplacedResidue_2_psiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue_2_psiMod` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `psiMod_rank` int(10) unsigned DEFAULT NULL,
  `psiMod` int(10) unsigned DEFAULT NULL,
  `psiMod_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `psiMod` (`psiMod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplacedResidue`
--
DROP TABLE IF EXISTS `ReplacedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `coordinate` int(10) DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Release`
--
DROP TABLE IF EXISTS `_Release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Release` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `releaseNumber` int(10) DEFAULT NULL,
    `releaseDate` mediumtext COLLATE utf8_unicode_ci,
    KEY `releaseNumber` (`releaseNumber`),
    KEY `releaseDate` (`releaseDate`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Requirement`
--
DROP TABLE IF EXISTS `Requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requirement` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReviewStatus`
--
DROP TABLE IF EXISTS `ReviewStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReviewStatus` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RNADrug`
--
DROP TABLE IF EXISTS `RNADrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RNADrug` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SequenceOntology`
--
DROP TABLE IF EXISTS `SequenceOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequenceOntology` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `SimpleEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimpleEntity_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SimpleEntity`
--
DROP TABLE IF EXISTS `SimpleEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimpleEntity` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `referenceEntity` int(10) unsigned DEFAULT NULL,
    `referenceEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `species` int(10) unsigned DEFAULT NULL,
    `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `referenceEntity` (`referenceEntity`),
    KEY `species` (`species`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Species`
--
DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Species` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `abbreviation` text COLLATE utf8_unicode_ci,
    KEY `abbreviation` (`abbreviation`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `StableIdentifier_2_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifier_2_history` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `history_rank` int(10) unsigned DEFAULT NULL,
  `history` int(10) unsigned DEFAULT NULL,
  `history_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `history` (`history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifier`
--
DROP TABLE IF EXISTS `StableIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifier` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `oldIdentifier` mediumtext COLLATE utf8_unicode_ci,
    `oldIdentifierVersion` mediumtext COLLATE utf8_unicode_ci,
    `released` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
    `identifier` mediumtext COLLATE utf8_unicode_ci,
    `identifierVersion` mediumtext COLLATE utf8_unicode_ci,
    KEY `oldIdentifier` (`oldIdentifier`(10)),
    KEY `oldIdentifierVersion` (`oldIdentifierVersion`(10)),
    KEY `released` (`released`),
    KEY `identifier` (`identifier`(10)),
    KEY `identifierVersion` (`identifierVersion`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `StableIdentifierHistory_2_historyStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierHistory_2_historyStatus` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `historyStatus_rank` int(10) unsigned DEFAULT NULL,
  `historyStatus` int(10) unsigned DEFAULT NULL,
  `historyStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `historyStatus` (`historyStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifierHistory`
--
DROP TABLE IF EXISTS `StableIdentifierHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierHistory` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `identifier` text COLLATE utf8_unicode_ci,
    `identifierVersion` text COLLATE utf8_unicode_ci,
    KEY `identifier` (`identifier`(10)),
    KEY `identifierVersion` (`identifierVersion`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifierReleaseStatus`
--
DROP TABLE IF EXISTS `StableIdentifierReleaseStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifierReleaseStatus` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `releaseNumber` int(10) DEFAULT NULL,
    `status` enum('EXISTS','CREATED','INCREMENTED','REPLACEMENT','ORTHO') COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `releaseNumber` (`releaseNumber`),
    KEY `status` (`status`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Summation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Summation`
--
DROP TABLE IF EXISTS `Summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `text` mediumtext COLLATE utf8_unicode_ci,
    KEY `text` (`text`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Taxon_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Taxon_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Taxon`
--
DROP TABLE IF EXISTS `Taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `superTaxon` int(10) unsigned DEFAULT NULL,
    `superTaxon_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `superTaxon` (`superTaxon`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TranscriptionalModification`
--
DROP TABLE IF EXISTS `TranscriptionalModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TranscriptionalModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TranslationalModification`
--
DROP TABLE IF EXISTS `TranslationalModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TranslationalModification` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `coordinate` int(10) DEFAULT NULL,
    `psiMod` int(10) unsigned DEFAULT NULL,
    `psiMod_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `coordinate` (`coordinate`),
    KEY `psiMod` (`psiMod`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `_UpdateTracker_2_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UpdateTracker_2_action` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `action_rank` int(10) unsigned DEFAULT NULL,
  `action` text COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `action` (`action`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UpdateTracker`
--
DROP TABLE IF EXISTS `_UpdateTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UpdateTracker` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `_release` int(10) unsigned DEFAULT NULL,
    `_release_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    `updatedInstance` int(10) unsigned DEFAULT NULL,
    `updatedInstance_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    KEY `_release` (`_release`),
    KEY `updatedInstance` (`updatedInstance`),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `URL`
--
DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL` (
    `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
    `uniformResourceLocator` mediumtext COLLATE utf8_unicode_ci,
    KEY `uniformResourceLocator` (`uniformResourceLocator`(10)),
    PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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