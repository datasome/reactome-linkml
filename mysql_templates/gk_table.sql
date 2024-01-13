--
-- Table structure for table `@TABLE_NAME@`
--
DROP TABLE IF EXISTS `@TABLE_NAME@`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@TABLE_NAME@` (
    `DB_ID` int unsigned NOT NULL DEFAULT '0',
@TABLE_CONTENT@
    PRIMARY KEY (`DB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;