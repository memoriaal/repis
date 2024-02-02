-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: aruanded
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `aruanded`
--


USE `aruanded`;

--
-- Temporary table structure for view `ainult12SM`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirje`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `Surm`,
  1 AS `Lipikud`,
  1 AS `Sildid`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Allikas`,
  1 AS `Nimekiri`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend`,
  1 AS `created_at`,
  1 AS `created_by`,
  1 AS `updated_at`,
  1 AS `updated_by`,
  1 AS `KirjePersoon`,
  1 AS `KirjeJutt` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ainult12SM_leiud`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `kirjed`,
  1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirje`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `Surm`,
  1 AS `Lipikud`,
  1 AS `Sildid`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Allikas`,
  1 AS `Nimekiri`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend`,
  1 AS `created_at`,
  1 AS `created_by`,
  1 AS `updated_at`,
  1 AS `updated_by`,
  1 AS `KirjePersoon`,
  1 AS `KirjeJutt` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `allkirjastatud_nimekiri_2018_11_16`
--

CREATE TABLE `allkirjastatud_nimekiri_2018_11_16` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `asukohad`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `nimetus`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `eesnimeta_persoonid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirje`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `Sünnikoht`,
  1 AS `Surm`,
  1 AS `Surmakoht`,
  1 AS `Lipikud`,
  1 AS `Sildid`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Allikas`,
  1 AS `Nimekiri`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend`,
  1 AS `KirjePersoon`,
  1 AS `KirjeJutt`,
  1 AS `Elukoht`,
  1 AS `Surma põhjus`,
  1 AS `Matmiskoht`,
  1 AS `Matmisaeg`,
  1 AS `pub_emem`,
  1 AS `pub_kivi`,
  1 AS `pub_wwiiref`,
  1 AS `pub_evo`,
  1 AS `pub_mv`,
  1 AS `pub_isPerson`,
  1 AS `created_at`,
  1 AS `created_by`,
  1 AS `updated_at`,
  1 AS `updated_by` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emanimed`
--

CREATE TABLE `emanimed` (
  `nimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`nimi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `endised_kivikirjed`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `K_kirjekood`,
  1 AS `K_perenimi`,
  1 AS `K_eesnimi`,
  1 AS `K_sünd`,
  1 AS `K_surm`,
  1 AS `persoon`,
  1 AS `kommentaar`,
  1 AS `Tagasiside` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `episoodid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `liik`,
  1 AS `asukoht`,
  1 AS `Asukoha liik`,
  1 AS `persoon`,
  1 AS `kirjed` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `hermafrodiidid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `nimi`,
  1 AS `mehenimi`,
  1 AS `naisenimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `päring` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `kirjed_hpat`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirje`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `Surm`,
  1 AS `Matmisaeg`,
  1 AS `Sünnikoht`,
  1 AS `Elukoht`,
  1 AS `Matmiskoht`,
  1 AS `Lipikud`,
  1 AS `Sildid`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Allikas`,
  1 AS `Nimekiri`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend`,
  1 AS `created_at`,
  1 AS `created_by`,
  1 AS `updated_at`,
  1 AS `updated_by`,
  1 AS `KirjePersoon`,
  1 AS `KirjeJutt` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kirjekoodid`
--

CREATE TABLE `kirjekoodid` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `kiviraamat`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `eesnimi`,
  1 AS `perenimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `aadress`,
  1 AS `Tagasiside` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kyyditatud_sakslased`
--

CREATE TABLE `kyyditatud_sakslased` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `liidetud_kivid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjed` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lisatahvlid_2020`
--

CREATE TABLE `lisatahvlid_2020` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `kirje` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Tahvel` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `nimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `aastad` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memo_ru_perenimed`
--

CREATE TABLE `memo_ru_perenimed` (
  `perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `metsavennad`
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
  1 AS `kirjed` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mitu_raamatuperet`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `raamatupered`,
  1 AS `cnt` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `muutunud_kivikirjed`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `K_kirjekood`,
  1 AS `K_perenimi`,
  1 AS `K_eesnimi`,
  1 AS `K_sünd`,
  1 AS `K_surm`,
  1 AS `persoon`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `kommentaar`,
  1 AS `Tagasiside` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `nimeraamat`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `nimi`,
  1 AS `mehenimi`,
  1 AS `naisenimi`,
  1 AS `isanimi`,
  1 AS `emanimi` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `pensionitoimikud`
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
  1 AS `kirjed` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `persoonikirjed`
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
  1 AS `sildid`,
  1 AS `lipikud` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `persoonikoodid`
--

CREATE TABLE `persoonikoodid` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `persoonikoodid_2021_01_06`
--

CREATE TABLE `persoonikoodid_2021_01_06` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `persoonikoodid_copy`
--

CREATE TABLE `persoonikoodid_copy` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `segased_sood`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `Nkirje`,
  1 AS `N`,
  1 AS `Mkirje`,
  1 AS `M` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `statistika`
--

CREATE TABLE `statistika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isikuid_baasis` mediumint(7) unsigned DEFAULT 0,
  `isikuid_veebis` mediumint(7) unsigned DEFAULT 0,
  `e_memoriaalil` mediumint(7) unsigned DEFAULT 0,
  `põgenikke` mediumint(7) unsigned DEFAULT 0,
  `PRga_põgenikke` mediumint(7) unsigned DEFAULT NULL,
  `kivis` mediumint(7) unsigned DEFAULT 0,
  `sünd_teadmata` int(11) DEFAULT NULL,
  `aeg` datetime NOT NULL DEFAULT current_timestamp(),
  `kommentaar` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `topelt_kivikirjed`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `repis.func_persoonikirjed(k0.persoon)` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `uued_kivikirjed`
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
  1 AS `persoonikirjed` */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `aruanded`
--

USE `aruanded`;

--
-- Final view structure for view `ainult12SM`
--


--
-- Final view structure for view `ainult12SM_leiud`
--


--
-- Final view structure for view `asukohad`
--


--
-- Final view structure for view `eesnimeta_persoonid`
--


--
-- Final view structure for view `endised_kivikirjed`
--


--
-- Final view structure for view `episoodid`
--


--
-- Final view structure for view `hermafrodiidid`
--


--
-- Final view structure for view `kirjed_hpat`
--


--
-- Final view structure for view `kiviraamat`
--


--
-- Final view structure for view `liidetud_kivid`
--


--
-- Final view structure for view `metsavennad`
--


--
-- Final view structure for view `mitu_raamatuperet`
--


--
-- Final view structure for view `muutunud_kivikirjed`
--


--
-- Final view structure for view `nimeraamat`
--


--
-- Final view structure for view `pensionitoimikud`
--


--
-- Final view structure for view `persoonikirjed`
--


--
-- Final view structure for view `segased_sood`
