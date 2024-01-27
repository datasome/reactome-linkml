DROP TABLE IF EXISTS `"@CLAZZ@_2_@ATTRIBUTE@`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@CLAZZ@_2_@ATTRIBUTE@` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `@ATTRIBUTE@_rank` int(10) unsigned DEFAULT NULL,
  `@ATTRIBUTE@` @MYSQL_TYPE@,
  KEY `DB_ID` (`DB_ID`),
  KEY `@ATTRIBUTE@` (`@ATTRIBUTE@`@DISPLAY_WIDTH@)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;