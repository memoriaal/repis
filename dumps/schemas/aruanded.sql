-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
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
