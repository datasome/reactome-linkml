--
-- Table structure for table `@TABLE_NAME@`
--
DROP TABLE IF EXISTS `@TABLE_NAME@`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@TABLE_NAME@` (
    @TABLE_CONTENT@
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
