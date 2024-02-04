-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
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
  CONSTRAINT `_deprecated_emadisad_ibfk_6` FOREIGN KEY (`kasuisa`) REFERENCES `kirjed` (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `a_kirjed`
--

CREATE TABLE `a_kirjed` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Kirjed` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `a_lipikud`
--

CREATE TABLE `a_lipikud` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Lipikud` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `a_persoonid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `kirjed`,
  1 AS `lipikud`,
  1 AS `sildid`,
  1 AS `kommentaar` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `a_sildid`
--

CREATE TABLE `a_sildid` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Sildid` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `allikad`
--

CREATE TABLE `allikad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nonPerson` bit(1) NOT NULL DEFAULT b'0',
  `isFilter` bit(1) NOT NULL DEFAULT b'0',
  `Allikas` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Nimetus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kood` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `Lühend` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Avaldatud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Nimekiri` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeid allikas` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeid imporditud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeldus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Andmeväljad` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kommentaar` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `prioriteetPerenimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetEesnimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetIsanimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetEmanimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetSünd` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetSurm` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetKirje` int(5) unsigned NOT NULL DEFAULT 10000,
  `Küüdiaasta` char(4) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Kood`),
  KEY `Index 2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `asukohad`
--

CREATE TABLE `asukohad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nimetus` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Liik` enum('','Administratiivüksus','Vangilaager','Vangla','Asumispaik','Laager','Alias') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'Administratiivüksus',
  `Alamliik` enum('','ANSV','krai','kreis','küla','vald','linn','NSV','oblast','rajoon') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimekuju` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Originaalnimi` varchar(250) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kirjeldus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Asukoht` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nimetus` (`Nimetus`,`Liik`,`Asukoht`,`Alamliik`) USING BTREE,
  KEY `asukohad_ibfk_1` (`Asukoht`),
  CONSTRAINT `asukohad_ibfk_1` FOREIGN KEY (`Asukoht`) REFERENCES `asukohad` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_lipikud`
--

CREATE TABLE `c_lipikud` (
  `lipik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `selgitus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`lipik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_seoseliigid`
--

CREATE TABLE `c_seoseliigid` (
  `seoseliik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu` enum('','M','N') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu_1` enum('','M','N','=','X') COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1M` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1N` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1X` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`seoseliik`),
  KEY `seoseliik_1` (`seoseliik_1M`),
  KEY `seoseliik_1N` (`seoseliik_1N`),
  KEY `seoseliik_1X` (`seoseliik_1X`),
  CONSTRAINT `c_seoseliigid_ibfk_1` FOREIGN KEY (`seoseliik_1M`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `c_seoseliigid_ibfk_2` FOREIGN KEY (`seoseliik_1N`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `c_seoseliigid_ibfk_3` FOREIGN KEY (`seoseliik_1X`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_sildid`
--

CREATE TABLE `c_sildid` (
  `silt` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `selgitus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`silt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `value` int(10) unsigned NOT NULL DEFAULT 0,
