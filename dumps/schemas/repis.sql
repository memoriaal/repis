-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: repis
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `repis`
--


USE `repis`;

--
-- Temporary table structure for view `RR_kanded`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `id`,
  1 AS `ToimikId`,
  1 AS `persoon`,
  1 AS `Kirjed`,
  1 AS `Eesnimi`,
  1 AS `Perenimi`,
  1 AS `Isanimi`,
  1 AS `Surm`,
  1 AS `Sugu`,
  1 AS `Surmakoht`,
  1 AS `Rahvus`,
  1 AS `Märkus`,
  1 AS `Alusdokument`,
  1 AS `xml` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `RR_kanded_xml`
--

CREATE TABLE `RR_kanded_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `xml` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `_deprecated_emadisad`
--

CREATE TABLE `_deprecated_emadisad` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `ema` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `abikaasa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuema` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuisa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `updated_by` varchar(40) COLLATE utf8_estonian_ci NOT NULL DEFAULT '-',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persoon`),
  KEY `ema` (`ema`),
  KEY `isa` (`isa`),
  KEY `abikaasa` (`abikaasa`),
  KEY `kasuema` (`kasuema`),
  KEY `kasuisa` (`kasuisa`),
  CONSTRAINT `_deprecated_emadisad_ibfk_1` FOREIGN KEY (`persoon`) REFERENCES `kirjed` (`kirjekood`),
  CONSTRAINT `_deprecated_emadisad_ibfk_4` FOREIGN KEY (`abikaasa`) REFERENCES `kirjed` (`kirjekood`),
  CONSTRAINT `_deprecated_emadisad_ibfk_5` FOREIGN KEY (`kasuema`) REFERENCES `kirjed` (`kirjekood`),
