-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: import
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `import`
--


USE `import`;

--
-- Table structure for table `49_kyyd_vab`
--

CREATE TABLE `49_kyyd_vab` (
  `emi_id` int(11) DEFAULT NULL,
  `isikukood` char(63) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  KEY `emi_id` (`emi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `49kyyd_mittesurnud_lapsed`
--

CREATE TABLE `49kyyd_mittesurnud_lapsed` (
  `jrk` int(11) NOT NULL,
  `emi_id` int(11) DEFAULT NULL,
  `isikukood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` varchar(4000) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lipik` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`jrk`),
  KEY `persoon` (`persoon`),
  KEY `emi_id` (`emi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `NS_ohvrid`
--

CREATE TABLE `NS_ohvrid` (
  `publitseerida` tinyint(4) DEFAULT NULL,
  `kirjekood` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `EMI juut` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `JM` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MR` varchar(110) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Salo` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perekonnanimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `p. variandid` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SCHŠ` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `e. variandid` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sugu` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg teine võimalus` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Rahvus` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Andmebaasid` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Viited` varchar(190) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Pereregister` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kommentaarid` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kodakondsus` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vahistamine` varchar(80) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Otsus` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Otsustaja` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kinnitamine` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kinnitaja` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surnud` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surmakoht` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Asjaolud` varchar(220) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Amet` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Süüdistus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Partei` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perekonnaseis` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Haridus` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Märkused` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjandus` varchar(180) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Juurdlustoimik` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `R14-R16`
--

CREATE TABLE `R14-R16` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekonnanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `prkn-variandid` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesn-variandid` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isan-variandid` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pseud jm nimevariandid` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `surm` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `s/a-variandid` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `allikad` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci NOT NULL,
  `sünnikoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `elukoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`),
  KEY `pereregister` (`pereregister`),
  KEY `persoon` (`persoon`),
  KEY `sünd` (`sünd`),
  KEY `surm` (`surm`),
  KEY `sünnikoht` (`sünnikoht`),
  KEY `elukoht` (`elukoht`),
  KEY `perekonnanimi` (`perekonnanimi`,`prkn-variandid`) USING BTREE,
  KEY `eesnimi` (`eesnimi`,`eesn-variandid`) USING BTREE,
  KEY `isanimi` (`isanimi`,`isan-variandid`) USING BTREE,
  CONSTRAINT `FK_R14-R16_repis.kirjed` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pereregister` FOREIGN KEY (`pereregister`) REFERENCES `pereregister` (`isikukood`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

DECLARE _source VARCHAR(50) DEFAULT 'R14_R16_BU';

if true then

  -- midagi ei muutunud - midagi ei tee
  if  ifnull(OLD.persoon,'') = ifnull(NEW.persoon,'')
  AND ifnull(OLD.pereregister,'') = ifnull(NEW.pereregister,'') then
    leave proc_label;
  END if;

  -- muutus pereregister aga uut persooni ei lisatud
  if ( NEW.persoon IS NULL
    OR ifnull(OLD.persoon,'') = ifnull(NEW.persoon,'') )
  AND NEW.pereregister IS NOT NULL
  AND ifnull(OLD.pereregister,'') <> NEW.pereregister then
    SET @prsn = NULL;
    SELECT persoon INTO @prsn
	 FROM import.pereregister 
	 WHERE isikukood = NEW.pereregister;
	 if @prsn IS NOT NULL then
	   SET NEW.persoon = @prsn;
	 END if;
  END if;

  -- muutus persoon aga uut pereregistrit ei lisatud
  if ( NEW.pereregister IS NULL 
    OR ifnull(OLD.pereregister,'') = ifnull(NEW.pereregister,'') )
  AND NEW.persoon IS NOT NULL
  AND ifnull(OLD.persoon,'') <> NEW.persoon then
    SET @prkood = NULL;
    SELECT isikukood INTO @prkood
	 FROM import.pereregister 
	 WHERE persoon = NEW.persoon
	 ORDER BY id desc
	 LIMIT 1;
	 if @prkood IS NOT NULL then
      SET NEW.pereregister = @prkood;
    END if;
  END if;

  if ifnull(OLD.persoon,'') <> ifnull(NEW.persoon,'') then
--     CALL repis.log_msg('OLD.persoon', OLD.persoon, _source);
--     CALL repis.log_msg('NEW.persoon', NEW.persoon, _source);
	  if OLD.persoon IS NOT NULL then
	    DELETE IGNORE FROM repis.kirjed
	    WHERE kirjekood = OLD.kirjekood;
	  END if;
	
	  if NEW.persoon IS NOT NULL then
	    DELETE IGNORE FROM repis.kirjed
	    WHERE kirjekood = NEW.kirjekood;
	
	     INSERT IGNORE INTO repis.kirjed
		    ( persoon, kirjekood, Kirje
	       , Perenimi, Eesnimi, Isanimi, Sugu
	       , Sünd, Sünnikoht, Surm
			 , Allikas )
	     VALUES
	       ( NEW.persoon, NEW.kirjekood, NEW.kirje
	       , NEW.perekonnanimi, NEW.eesnimi, NEW.isanimi, NEW.sugu
	       , NEW.sünd, NEW.sünnikoht, NEW.surm
	       , 'R14-R16' );
	  END if;
  END if;
  
--  CALL repis.log_msg('NEW.pereregister', NEW.pereregister, _source);
  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;


END if;
END */;;
DELIMITER ;

--
-- Table structure for table `RR_paring_28092021`
--

CREATE TABLE `RR_paring_28092021` (
  `syk.id` smallint(6) NOT NULL,
  `markus` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Toimik` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `Perenimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `Eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `Sünd` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirje` varchar(100) COLLATE utf8_estonian_ci NOT NULL,
  `paragrahv` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `RRisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RReesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RRperenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muueesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muuperenimi` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` char(1) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isikustaatustxt` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synniaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synnikoht` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmaaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `foo` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `aa_eesnimed`
--

CREATE TABLE `aa_eesnimed` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi5` varchar(5) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi4` varchar(4) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi3` varchar(3) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`,`eesnimi`),
  KEY `kirjekood` (`kirjekood`),
  KEY `eesnimi` (`eesnimi`),
  KEY `eesnimi5` (`eesnimi5`),
  KEY `eesnimi4` (`eesnimi4`),
  KEY `eesnimi3` (`eesnimi3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `aa_perenimed`
--

CREATE TABLE `aa_perenimed` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi5` varchar(5) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi4` varchar(4) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi3` varchar(3) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`,`perenimi`),
  KEY `kirjekood` (`kirjekood`),
  KEY `perenimi` (`perenimi`),
  KEY `perenimi5` (`perenimi5`),
  KEY `perenimi4` (`perenimi4`),
  KEY `perenimi3` (`perenimi3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `aa_synd`
--

CREATE TABLE `aa_synd` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd7` char(7) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd4` char(4) COLLATE utf8_estonian_ci DEFAULT NULL,
  KEY `kirjekood` (`kirjekood`),
  KEY `sünd` (`sünd`),
  KEY `sünd7` (`sünd7`),
  KEY `sünd4` (`sünd4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `abez`
--

CREATE TABLE `abez` (
  `Isikukood` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Kirje` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Perenimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Eesnimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Isanimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Seos` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Attn` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Sünd` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Aadress` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Algne kirje` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Nimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `abistamiskomitee`
--

CREATE TABLE `abistamiskomitee` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `failinimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `vt.failinimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `endised_perenimed` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `teised_eesnimed` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünnikoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `ra` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `acknowledgement`
--

CREATE TABLE `acknowledgement` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL DEFAULT 0,
  `ack` varchar(255) DEFAULT NULL,
  `ack_for` varchar(255) DEFAULT NULL,
  `ack_dte` date DEFAULT NULL,
  `ack_nte` text DEFAULT NULL,
  `ack_src` text DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

--
-- Table structure for table `album_academicum`
--

CREATE TABLE `album_academicum` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi_orig` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `teised_eesnimed` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi_orig` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `teised_perenimed` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünnikoht` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `elulugu` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `viited` varchar(130) COLLATE utf8_estonian_ci NOT NULL,
  `RA_id` int(11) NOT NULL,
  `matrikli_nr` int(11) NOT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon` (`persoon`),
  KEY `sünd` (`sünd`),
  KEY `surm` (`surm`),
  KEY `sünnikoht` (`sünnikoht`),
  KEY `surmakoht` (`surmakoht`),
  KEY `isanimi` (`isanimi`),
  KEY `pereregister` (`pereregister`),
  KEY `eesnimi_orig` (`eesnimi_orig`) USING BTREE,
  KEY `perenimi_orig` (`perenimi_orig`) USING BTREE,
  KEY `eesnimi` (`eesnimi`),
  KEY `teised_eesnimed` (`teised_eesnimed`),
  KEY `perenimi` (`perenimi`),
  KEY `teised_perenimed` (`teised_perenimed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

DECLARE _source VARCHAR(50) DEFAULT 'album_academicum_BU';

if true then

  -- midagi ei muutunud - midagi ei tee
  if  ifnull(OLD.persoon,'') = ifnull(NEW.persoon,'')
  AND ifnull(OLD.pereregister,'') = ifnull(NEW.pereregister,'') then
    leave proc_label;
  END if;

  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;

  if OLD.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = OLD.kirjekood;
  END if;

  if NEW.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = NEW.kirjekood;

    CALL import.import_AA(NEW.persoon, NEW.kirjekood);
  END if;
  
  if     NEW.persoon IS NOT NULL 
     AND NEW.pereregister IS NULL 
	  AND OLD.pereregister IS NULL then
	 SET @pr_kood = NULL;
    SELECT isikukood INTO @pr_kood
	   FROM import.pereregister WHERE persoon = NEW.persoon
		LIMIT 1;
	 IF @pr_kood IS NOT NULL then
	 	SET NEW.pereregister = @pr_kood;
	 END if;
  END if;

END if;  
END */;;
DELIMITER ;

--
-- Table structure for table `alpha`
--

CREATE TABLE `alpha` (
  `sort` char(3) NOT NULL DEFAULT '',
  `symbol` varchar(4) NOT NULL DEFAULT '',
  `parent` tinyint(1) NOT NULL DEFAULT 0,
  KEY `i` (`sort`,`symbol`,`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `count` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

--
-- Table structure for table `el_kart`
--

CREATE TABLE `el_kart` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi_orig` varchar(60) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi` varchar(60) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `sünniaeg` varchar(40) COLLATE utf8_estonian_ci NOT NULL,
  `sünnikoht` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `surmakoht` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `SündISO` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünd2ISO` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `SurmISO` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `7a. Abikaasa eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `7b. Abikaasa perekonnanimi` varchar(40) COLLATE utf8_estonian_ci NOT NULL,
  `8. Lapsed` varchar(80) COLLATE utf8_estonian_ci NOT NULL,
  `9. Elukoht Eestis` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  `Märkused` varchar(60) COLLATE utf8_estonian_ci NOT NULL,
  `Säilik` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `Kaader` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `Viit` varchar(170) COLLATE utf8_estonian_ci NOT NULL,
  `Probleem` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `sisetusjärjekorra nr.` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `eesperesünd` (`perenimi_orig`,`eesnimi`,`SündISO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='Eestist lahkunute kartoteek koos (Vello Salo, Fred Puss)';
DELIMITER ;;
	if true then
	   IF NEW.persoon = '0' THEN
	   	SELECT LPAD(MAX(persoon)+1, 10, '0') FROM repis.kirjed INTO @new_persoon;
	   	INSERT INTO repis.kirjed (persoon, kirjekood, allikas)
	   	VALUES (@new_persoon, @new_persoon, 'persoon');
	   	SET NEW.persoon = @new_persoon;
	   END IF;

	   IF length(NEW.persoon) = 10 THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	
	   IF NEW.persoon IS NULL THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NULL
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	END if;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_ELK(NEW.persoon, NEW.kirjekood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.kirjekood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Temporary table structure for view `el_kart_view`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `pereregister`,
  1 AS `kirm`,
  1 AS `kirjekood`,
  1 AS `perenimi_orig`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `sünniaeg`,
  1 AS `sünnikoht`,
  1 AS `SündISO`,
  1 AS `Sünd2ISO`,
  1 AS `7a. Abikaasa eesnimi`,
  1 AS `7b. Abikaasa perekonnanimi`,
  1 AS `8. Lapsed`,
  1 AS `9. Elukoht Eestis`,
  1 AS `Märkused`,
  1 AS `Säilik`,
  1 AS `Kaader`,
  1 AS `Viit`,
  1 AS `Probleem`,
  1 AS `sisetusjärjekorra nr.` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `eraf`
--

CREATE TABLE `eraf` (
  `leidandmed` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pealkiri` text COLLATE utf8_estonian_ci NOT NULL,
  `piirdaatumid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Säilik1985` char(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`leidandmed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `eraf_nimistu`
--

CREATE TABLE `eraf_nimistu` (
  `toimik` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `fond_id` int(11) unsigned NOT NULL,
  `Fond` varchar(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimistu` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Säilik2002` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Säilik1985` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Pealkiri` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Arhiiviviide` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kommentaar` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Viide` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `arreteeritud` enum('','Arreteeritud') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surm` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `maakond` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu` enum('','M','N') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `toimiku_liik` enum('','juurdlustoimik','järelevalvetoimik','tagaotsimistoimik') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`toimik`),
  KEY `perenimiC` (`perenimiC`,`eesnimiC`,`emanimiC`,`isanimiC`),
  KEY `eesnimiC` (`eesnimiC`),
  KEY `persoon` (`persoon`),
  KEY `Säilik2002` (`Säilik2002`),
  KEY `Säilik1985` (`Säilik1985`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `eraf_nimistu_v`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `toimik`,
  1 AS `persoon`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `emanimi`,
  1 AS `isanimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `kirje`,
  1 AS `kirjed`,
  1 AS `pealkiri` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `eraf_nimistu_vastetega`
--

CREATE TABLE `eraf_nimistu_vastetega` (
  `toimik` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Fond` varchar(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimistu` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Säilik2002` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Säilik1985` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Pealkiri` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Arhiiviviide` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kommentaar` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Viide` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `arreteeritud` enum('','Arreteeritud') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surm` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `maakond` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu` enum('','M','N') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `toimiku_liik` enum('','juurdlustoimik','järelevalvetoimik','tagaotsimistoimik') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`toimik`),
  KEY `perenimiC` (`perenimiC`,`eesnimiC`,`emanimiC`,`isanimiC`),
  KEY `eesnimiC` (`eesnimiC`),
  KEY `persoon` (`persoon`),
  KEY `Säilik2002` (`Säilik2002`),
  KEY `Säilik1985` (`Säilik1985`),
  KEY `Arhiiviviide` (`Arhiiviviide`),
  CONSTRAINT `eraf_nimistu_vastetega_ibfk_1` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `eraf_toimikunumbrid`
--

CREATE TABLE `eraf_toimikunumbrid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fond` varchar(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `nimistu` enum('','1','2') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `säilik` varchar(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `vana_nr` varchar(15) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `pealkiri` varchar(102) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Index 2` (`säilik`,`vana_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `erisurmaaktid`
--

CREATE TABLE `erisurmaaktid` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `nimekirjafail` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sündo` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmo` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `u_sünniaasta` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `vanus` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `arreteeritud1` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `arreteeritud2` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `laager` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmapõhjus` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `maakond` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünnikoht` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `akt` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `aktiaasta` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `aktinumber` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muuinfo` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `erisurmaaktid.bak`
--

CREATE TABLE `erisurmaaktid.bak` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Nimekirjafail` char(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `pr_kood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `repr_kaart` char(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emanimi` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` char(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surma_põhjus` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `viimane_elukoht` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `laagri_nimi` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surma_koht` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `matmise_koht` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `märkused` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `erisurmaaktid_kivita`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `emem_b`,
  1 AS `sildid`,
  1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `nimekirjafail`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `isanimi`,
  1 AS `sündo`,
  1 AS `surmo`,
  1 AS `u_sünniaasta`,
  1 AS `vanus`,
  1 AS `arreteeritud1`,
  1 AS `arreteeritud2`,
  1 AS `laager`,
  1 AS `surmakoht`,
  1 AS `surmapõhjus`,
  1 AS `maakond`,
  1 AS `sünnikoht`,
  1 AS `akt`,
  1 AS `aktiaasta`,
  1 AS `aktinumber`,
  1 AS `muuinfo` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `f12sm`
--

CREATE TABLE `f12sm` (
  `perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoonikirje` varchar(2000) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `haridustöötajad`
--

CREATE TABLE `haridustöötajad` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünd` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünnikoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surm` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surmakoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kirjed` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `cl` varchar(50) COLLATE utf8_estonian_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='Koostatud 2022-12-12 repis''e baasil, sest Eli Pilve nikerdab doktoritööd sel teemal; temalt peab kunagi siia infot tagasi ka tulema.';

--
-- Table structure for table `hiidlased`
--

CREATE TABLE `hiidlased` (
  `ID` int(11) DEFAULT NULL,
  `Perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `EestistatudNimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikuupäev` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SKPUKJ` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Küla` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Amet` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eestiperenimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `hpat`
--

CREATE TABLE `hpat` (
  `Nr` int(4) unsigned NOT NULL,
  `Isikukood` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `seos` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `emi_id` int(11) unsigned DEFAULT NULL,
  `nimekuju` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `kirjekood` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `Kirje` varchar(2000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Perenimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PnVariandid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Eesnimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EnVariandid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Isanimi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `InVariandid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sünd` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Vanus` enum('','18','23','27','28','30','42') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Sünniaasta` int(4) unsigned DEFAULT NULL,
  `Kuu` int(2) unsigned DEFAULT NULL,
  `Päev` int(2) unsigned DEFAULT NULL,
  `S-maa` enum('','Kaukaasia','Läti','Leedu','Soome','Ukraina','Eesti','Venemaa') CHARACTER SET utf8 DEFAULT '',
  `S-maakond` enum('','?','H','J','L','Pä','Pe','S','T','Va','Vil','Vir','Võ') CHARACTER SET utf8 DEFAULT '',
  `S-koht` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `E-maa` enum('','?','E','Läti','NL','NL ?') CHARACTER SET utf8 DEFAULT '',
  `E-maakond` enum('','#','-','?','H','J','L','Pä','Pe','S','T','Va','Vil','Vir','Võ') CHARACTER SET utf8 DEFAULT '',
  `E-koht` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Üksus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Kohustus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Auaste` enum('','-','1. järgu madrus','alampolkovnik','kapral','kapten','kursant','leitnant','ltn','madrus','major','nooremkomandör','nooremleitnant','noorempolitruk','nooremseersant','politruk','rm','seersant','vanemleitnant','vanempolitruk','vanemseersant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Rahvus` enum('','e','isur','j','lätlane','leedukas','mustlane','poolakas','rootslane','sks','ukrainlane','v','valgevenelane') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Töökoht` tinytext CHARACTER SET utf8 NOT NULL,
  `Amet` tinytext CHARACTER SET utf8 NOT NULL,
  `Amet EV ajal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Üksusesse astumise aeg ja asjaolud` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Eluloolised märkused` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Märkused` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Lahkumine teenistusest` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Haavatud/ langenud/ teadmata kadunud` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Evakueerumine` enum('','ev','ev (h)') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Surma asjaolud` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Karistus` enum('','ex','ex ?','juurdlus','kz','kz ?','vabastati süüdistusest') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `R1728nimekirjad` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `R 1` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `SD, OK` enum('','x','x ?','x?') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ERAF` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Muud arhiiviviited` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Kirajnduseviide` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ONK viide` enum('','x') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `VIIDE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Jt` varchar(46) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Kirajnduseviide2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Surmakoht` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Haridus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Perekonnaseis` enum('','a','lahutatud','lesk','v','vabaabielu') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Parteilisus` enum('','-','ei võetud','ELKNÜ','esitanud sooviavalduse','heideti välja valetamise pärast','kand','kand 1939','kand 1940','kand 1941','kand 1942','liige','liige 1907','liige 1913','liige 1917','liige 1919','liige 1920','liige 1923','liige 1924','liige 1925','liige 1926','liige 1929','liige 1930','liige 1931','liige 1933','liige 1938','liige 1939','liige 1940','liige 1941 augustist septembrini','liige 1942','liige v ELKNÜ','pioneer','välja heisetud') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `SÜÜDISTUSEST` text CHARACTER SET utf8 DEFAULT NULL,
  `kahtlusseos` char(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `hukatud_41_44`
--

CREATE TABLE `hukatud_41_44` (
  `nr` int(11) DEFAULT NULL,
  `perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` char(23) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` char(23) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimiC` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  KEY `c_fields` (`eesnimiC`,`perenimiC`,`isanimiC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `jeh`
--

CREATE TABLE `jeh` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sugu` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht arreteerimise ajal` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vanus küüdit. ajal` int(11) DEFAULT NULL,
  `Elukoht küüdituses` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eriotsus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vabanemine` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `JT` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Nimemuutus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünd` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surm` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vanus surres
(või praegu)` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surma koht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kivi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Muu info` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Arhiiviviide` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `AIS` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Geni` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `kirmus4`
--

CREATE TABLE `kirmus4` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ID` char(9) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `SDI` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi_orig` varchar(60) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi` varchar(80) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi_orig` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `muid isikuid kaardil` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `eesperesünd` (`perenimi`,`eesnimi`,`sünd`) USING BTREE,
  KEY `persoon` (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='Eesti Kirjandusmuuseum, Kultuurilooline arhiiv, fond 381 (Eesti Komitee), Eesti põgenike kartoteek.';
DELIMITER ;;
	if true then
	   IF NEW.persoon = '0' THEN
	   	SELECT LPAD(MAX(persoon)+1, 10, '0') FROM repis.kirjed INTO @new_persoon;
	   	INSERT INTO repis.kirjed (persoon, kirjekood, allikas)
	   	VALUES (@new_persoon, @new_persoon, 'persoon');
	   	SET NEW.persoon = @new_persoon;
	   END IF;

	   IF length(NEW.persoon) = 10 THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	
	   IF NEW.persoon IS NULL THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NULL
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	END if;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_KIRM(NEW.persoon, NEW.kirjekood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.kirjekood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Table structure for table `krossi_metsavennad`
--

CREATE TABLE `krossi_metsavennad` (
  `Kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SünniaegISO` char(44) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SurmaaegISO` char(44) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Hüüdnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Auaste` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SünniVald` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SünniMaakond` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surmaaeg` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Langemise/vangistamise koht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SurmaVald` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SurmaMaakond` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vangilaager` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elulugu` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Allikad` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `orig_ID` char(8) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `krossi_metsavennad_X_repis`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `orig_id`,
  1 AS `Kirjekood`,
  1 AS `EMI_Persoon`,
  1 AS `EMI_kkood`,
  1 AS `PR_kkood`,
  1 AS `KIVI_kkood`,
  1 AS `EMI_perenimi`,
  1 AS `EMI_eesnimi`,
  1 AS `EMI_isanimi`,
  1 AS `EMI_emanimi`,
  1 AS `EMI_sünd`,
  1 AS `EMI_surm`,
  1 AS `EMI_kirjed`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `SünniaegISO`,
  1 AS `SurmaaegISO`,
  1 AS `Hüüdnimi`,
  1 AS `Auaste`,
  1 AS `Sünniaeg`,
  1 AS `Sünnikoht`,
  1 AS `SünniVald`,
  1 AS `SünniMaakond`,
  1 AS `Surmaaeg`,
  1 AS `Langemise/vangistamise koht`,
  1 AS `SurmaVald`,
  1 AS `SurmaMaakond`,
  1 AS `Vangilaager`,
  1 AS `Elulugu`,
  1 AS `Allikad` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `leinakuulutused`
--

CREATE TABLE `leinakuulutused` (
  `nr` smallint(6) NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `neiupõlvenimed` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünnikoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `permalink` varchar(70) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`nr`),
  UNIQUE KEY `kirjekood` (`kirjekood`),
  KEY `persoon` (`persoon`),
  KEY `pereregister` (`pereregister`),
  KEY `perenimi` (`perenimi`),
  KEY `eesnimi` (`eesnimi`),
  KEY `sünd` (`sünd`),
  KEY `sünnikoht` (`sünnikoht`),
  KEY `surm` (`surm`),
  KEY `surmakoht` (`surmakoht`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='UPDATE leinakuulutused SET kirjekood = CONCAT("VELK-",LPAD(nr, 5, "0"));';
DELIMITER ;;

  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;

  if OLD.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = OLD.kirjekood;
  END if;

  if NEW.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = NEW.kirjekood;

    CALL import.import_VELK(NEW.persoon, NEW.kirjekood);
  END if;
  
  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;
  
  if     NEW.persoon IS NOT NULL 
     AND NEW.pereregister IS NULL 
	  AND OLD.pereregister IS NULL then
	 SET @pr_kood = NULL;
    SELECT isikukood INTO @pr_kood
	   FROM import.pereregister WHERE persoon = NEW.persoon
		LIMIT 1;
	 IF @pr_kood IS NOT NULL then
	 	SET NEW.pereregister = @pr_kood;
	 END if;
  END if;
  
END */;;
DELIMITER ;

--
-- Table structure for table `lisakivid_l17_l20`
--

CREATE TABLE `lisakivid_l17_l20` (
  `persoon` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `kirje` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `surm` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjed` text COLLATE utf8_estonian_ci NOT NULL,
  `Välja` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `PR` tinyint(4) DEFAULT NULL,
  `TS` tinyint(4) DEFAULT NULL,
  `RR` tinyint(4) DEFAULT NULL,
  `EMI` tinyint(4) DEFAULT NULL,
  `Σ` tinyint(4) DEFAULT NULL,
  `Sildid` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  `Tahvel` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `kirjekood` varchar(10) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `matmispaigad`
--

CREATE TABLE `matmispaigad` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Perenimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT '',
  `Eesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT '',
  `SÜNNIAEG` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SURMAAEG` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `KÜÜDITAMISEAEGNE ELUKOHT` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MATMISPAIK` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MÄLESTUSMÄRK` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `KÜÜDITATUD/ARRETEERITUD/PERELE JÄRELE LÄINUD VMS` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MÄRKUS` varchar(555) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kontrollitud` varchar(555) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ALLIKAS` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MATMISPAIGA ASUKOHT` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `OBLAST/KRAI` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RAJOON` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `G-MAPS` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon` (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memo_ru`
--

CREATE TABLE `memo_ru` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `est12jrk` smallint(5) unsigned DEFAULT NULL,
  `nimi` varchar(472) COLLATE utf8_estonian_ci NOT NULL,
  `sünniaasta` char(4) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` enum('M','N') COLLATE utf8_estonian_ci DEFAULT NULL,
  `rahvus` varchar(23) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Осуждён` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ISO_reab` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ISO_arest` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ISO_prig` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `sünniaasta` (`sünniaasta`),
  KEY `rahvus` (`rahvus`),
  KEY `persoon` (`persoon`),
  CONSTRAINT `persoon` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memo_ru_html`
--

CREATE TABLE `memo_ru_html` (
  `person` mediumint(8) unsigned NOT NULL,
  `repr` tinyint(3) unsigned NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `E` enum('','E','V-O','perenimi') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `fullname` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Год рождения` varchar(85) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Возраст` varchar(3) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Образование` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Состав семьи` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Члены семьи` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Место рождения` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Место проживания` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Адрес` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Работа` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Социальное происхождение` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Реабилитирована` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Реабилитирован` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Основание реабилитации` varchar(1000) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Дата реабилитации` varchar(24) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Национальность` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Партийность` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Дата ареста` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Обстоятельства ареста` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Обвинение` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Приговор` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Изменение приговора` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Осуждён` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Осуждена` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Дата осуждения` varchar(24) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Подданство` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Расстрелян` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Расстреляна` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Мера пресечения` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Изменение меры пресечения` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Умерла в местах заключения` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Умер в местах заключения` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Комментарий` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Архивное дело` varchar(1000) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Источник` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`person`,`repr`) USING BTREE,
  UNIQUE KEY `kirjekood` (`kirjekood`),
  KEY `sünnikoht` (`Место рождения`),
  KEY `rahvus` (`Национальность`),
  KEY `Дата ареста` (`Дата ареста`),
  KEY `Дата осуждения` (`Дата осуждения`),
  KEY `name` (`fullname`) USING BTREE,
  KEY `E-key` (`E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memo_ru_perenimed`
--

CREATE TABLE `memo_ru_perenimed` (
  `perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_evo`
--

CREATE TABLE `memoriaal_evo` (
  `Kirje` varchar(55) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Auaste` enum('','k-adm','kapellmeister','kin','kin-ltn','kin-mjr','kol','kol-ltn','kpt','kpt-ltn','kpt-mjr','lpn','ltn','m-kpt','m-ltn','mjr','n-ltn','sjv ametnik','sjv arst','v-ltn') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimi` varchar(55) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `VR` enum('','VR I/1','VR I/1, II/2, II/3','VR I/1, III/1','VR I/2','VR I/2, II/2','VR I/2, II/2, II/3','VR I/2, II/3','VR I/3','VR I/3, II/2','VR I/3, II/2, II/3','VR I/3, II/3','VR I/3, II/3, III/3','VR II/2, II/3','VR II/3','VR II/3, III/3') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünd` int(4) unsigned NOT NULL,
  `Surm` int(4) unsigned DEFAULT NULL,
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `attn` varchar(25) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Persoon`) USING BTREE,
  CONSTRAINT `FK_memoriaal_evo_repis.kirjed` FOREIGN KEY (`Persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_evo_full`
--

CREATE TABLE `memoriaal_evo_full` (
  `Auaste` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Persoon` char(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjekood` char(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vabadusrist` enum('','VR I/1','VR I/1, II/2, II/3','VR I/1, III/1','VR I/2','VR I/2, II/2','VR I/2, II/2, II/3','VR I/2, II/3','VR I/3','VR I/3 ja II/3','VR I/3, II/2','VR I/3, II/2, II/3','VR I/3, II/3','VR I/3, II/3, III/3','VR I/3.','VR II/2 ja II/3','VR II/2, II/3','VR II/3','VR II/3, III/3') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaasta` smallint(4) unsigned DEFAULT NULL,
  `Perekonnanimed` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimed` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surmaaasta` smallint(4) unsigned DEFAULT NULL,
  `Sünnikoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikp` varchar(19) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Elukoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Hukkumisaasta` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surm` varchar(43) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surmakoht` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Arreteerimine` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Tribunal` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `OtsuseKuupäev` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Paragrahv` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Otsus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Märkused` text COLLATE utf8_estonian_ci NOT NULL,
  `Tsaariarmee` text COLLATE utf8_estonian_ci NOT NULL,
  `Vabadussõda` text COLLATE utf8_estonian_ci NOT NULL,
  `EVkaitsevägi` text COLLATE utf8_estonian_ci NOT NULL,
  `Punaarmee` text COLLATE utf8_estonian_ci NOT NULL,
  `SaksaArmee` text COLLATE utf8_estonian_ci NOT NULL,
  `Liik` text COLLATE utf8_estonian_ci NOT NULL,
  `Märkus` text COLLATE utf8_estonian_ci NOT NULL,
  `Koondkirje` text COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_kivitahvlid`
--

CREATE TABLE `memoriaal_kivitahvlid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kirje` varchar(47) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `nimi` varchar(35) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `aastad` char(11) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tahvel` char(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tiib` enum('A','B','L') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'A',
  `tahvlinr` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `tulp` tinyint(1) unsigned NOT NULL,
  `rida` tinyint(2) unsigned NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `search` (`kirje`),
  KEY `kirjekood` (`kirjekood`),
  KEY `persoon` (`persoon`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_kivitahvlid_A166_uus`
--

CREATE TABLE `memoriaal_kivitahvlid_A166_uus` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `kirje` varchar(43) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `nimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `aastad` char(11) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tahvel` char(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tiib` enum('A','B','L') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'A',
  `tahvlinr` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `tulp` tinyint(1) unsigned NOT NULL,
  `rida` tinyint(2) unsigned NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_kivitahvlid_A166_vana`
--

CREATE TABLE `memoriaal_kivitahvlid_A166_vana` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `kirje` varchar(43) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `nimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `aastad` char(11) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tahvel` char(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tiib` enum('A','B','L') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'A',
  `tahvlinr` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `tulp` tinyint(1) unsigned NOT NULL,
  `rida` tinyint(2) unsigned NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `memoriaal_kivitahvlid_A79`
--

CREATE TABLE `memoriaal_kivitahvlid_A79` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kirje` varchar(43) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `nimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `aastad` char(11) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tahvel` char(5) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tiib` enum('A','B','L') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'A',
  `tahvlinr` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `tulp` tinyint(1) unsigned NOT NULL,
  `rida` tinyint(2) unsigned NOT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `search` (`kirje`),
  KEY `persoon` (`persoon`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `mu15_1`
--

CREATE TABLE `mu15_1` (
  `nr` int(11) DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sildid` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `lipikud` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada_sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada_lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada_sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada_lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `mu16`
--

CREATE TABLE `mu16` (
  `nr` int(11) DEFAULT NULL,
  `persoon` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `praegused sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `praegused lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `mu17`
--

CREATE TABLE `mu17` (
  `nr` int(11) DEFAULT NULL,
  `persoon` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `praegused sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `praegused lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lisada lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada sildid` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eemaldada lipikud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `mu18`
--

CREATE TABLE `mu18` (
  `nr` int(11) NOT NULL,
  `emi_id` int(11) DEFAULT NULL,
  `isikukood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `arr 49 asumisel` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `arr enne 49 küüd` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `arr pärast 49 küüd` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`nr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `pensionitoimikud`
--

CREATE TABLE `pensionitoimikud` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Toimik` varchar(7) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perenimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünd` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surm` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `Kirje` varchar(200) COLLATE utf8_estonian_ci DEFAULT NULL,
  `paragrahv` enum('ReprS §2 lg1','ReprS §2 lg1 p1','ReprS §2 lg1 p1,11','ReprS §2 lg1 p1,2','ReprS §2 lg1 p1,3','ReprS §2 lg1 p1,3,11','ReprS §2 lg1 p1,4','ReprS §2 lg1 p1,4,9','ReprS §2 lg1 p1,5','ReprS §2 lg1 p1,6','ReprS §2 lg1 p1,7','ReprS §2 lg1 p1,7,11','ReprS §2 lg1 p1,8','ReprS §2 lg1 p1,9','ReprS §2 lg1 p10','ReprS §2 lg1 p11','ReprS §2 lg1 p12','ReprS §2 lg1 p2','ReprS §2 lg1 p2,1','ReprS §2 lg1 p2,11','ReprS §2 lg1 p2,3','ReprS §2 lg1 p2,3,6','ReprS §2 lg1 p2,5','ReprS §2 lg1 p2,5,7','ReprS §2 lg1 p2,6','ReprS §2 lg1 p2,7','ReprS §2 lg1 p2,8','ReprS §2 lg1 p2,9','ReprS §2 lg1 p3','ReprS §2 lg1 p3,10','ReprS §2 lg1 p3,11','ReprS §2 lg1 p3,1','ReprS §2 lg1 p3,2','ReprS §2 lg1 p3,5','ReprS §2 lg1 p3,7','ReprS §2 lg1 p3,8','ReprS §2 lg1 p3,9','ReprS §2 lg1 p4','ReprS §2 lg1 p4,5','ReprS §2 lg1 p4,6','ReprS §2 lg1 p4,9','ReprS §2 lg1 p5','ReprS §2 lg1 p5,11','ReprS §2 lg1 p5,2','ReprS §2 lg1 p5,3','ReprS §2 lg1 p5,3,11','ReprS §2 lg1 p5,6','ReprS §2 lg1 p5,7','ReprS §2 lg1 p6','ReprS §2 lg1 p7','ReprS §2 lg1 p7,5','ReprS §2 lg1 p8','ReprS §2 lg1 p8,9','ReprS §2 lg1 p9','ReprS §2 lg2','ReprS §2 lg2 p2','ReprS §2 lg2 p3','ReprS §2 lg2 p5','ReprS §2 lg2 p6','ReprS §2 lg2 p9','ReprS §4 lg1','ReprS §2 lg1 p3,1,11') COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmaaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synnikoht` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synniaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isikustaatustxt` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` char(1) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muuperenimi` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muueesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RRperenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RReesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RRisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon` (`persoon`),
  KEY `Sünd` (`Sünd`,`Eesnimi`),
  KEY `Eesnimi` (`Eesnimi`,`Sünd`),
  KEY `pt-pr` (`Perenimi`,`Sünd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;
	if true then
	   IF length(NEW.persoon) = 10
		THEN
	      UPDATE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	
	   IF NEW.persoon in ('?', '') THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NULL
	      WHERE kirjekood = NEW.kirjekood;
	  	END if;
   END IF;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_RPT(NEW.persoon, NEW.kirjekood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.kirjekood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Table structure for table `pereregister`
--

CREATE TABLE `pereregister` (
  `id` int(11) unsigned NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isikukood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_perenimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünniaasta` smallint(4) unsigned DEFAULT NULL,
  `surm` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isa_kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `isa_eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isa_synniaasta` smallint(4) unsigned DEFAULT NULL,
  `ema_kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `ema_eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `ema_synniaasta` smallint(4) unsigned DEFAULT NULL,
  `raamatu_omavalitsus` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `koite_nr` int(11) DEFAULT NULL,
  `lk_nr` int(11) DEFAULT NULL,
  `isik_perenimi_endine1` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_perenimi_endine2` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_perenimi_endine3` varchar(22) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_perenimi_endine4` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_eesnimi_endine1` varchar(31) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_eesnimi_endine2` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_sugu` enum('','mees','naine') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_synnipaev` char(2) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_synnikuu` enum('','01','02','03','04','05','06','07','08','09','10','11','12') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_synniaasta` char(4) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_synnikoht` varchar(51) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_synniriik` varchar(52) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_surmapaev` char(2) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_surmakuu` enum('','01','02','03','04','05','06','07','08','09','10','11','12') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_surmaaasta` char(4) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_surmakoht` varchar(53) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_surmariik` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_perenimiW` varchar(30) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isik_eesnimiW` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isa_eesnimiW` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `ema_eesnimiW` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`isikukood`),
  KEY `pr-pt` (`isik_perenimi`,`sünd`),
  KEY `ema` (`ema_kirjekood`),
  KEY `isa` (`isa_kirjekood`),
  KEY `sünniaasta` (`sünniaasta`),
  KEY `ema sünniaasta` (`ema_synniaasta`),
  KEY `isa sünniaasta` (`isa_synniaasta`),
  KEY `fk_pr_persoon` (`persoon`),
  KEY `isiku nimed` (`isik_eesnimi`,`isik_perenimi`,`sünniaasta`),
  KEY `ema nimed` (`ema_eesnimi`,`isik_perenimi`,`ema_synniaasta`),
  KEY `isa nimed` (`isa_eesnimi`,`isik_perenimi`,`isa_synniaasta`),
  KEY `idix` (`id`),
  KEY `surm` (`surm`),
  CONSTRAINT `ema` FOREIGN KEY (`ema_kirjekood`) REFERENCES `pereregister` (`isikukood`),
  CONSTRAINT `fk_pr_persoon` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`),
  CONSTRAINT `isa` FOREIGN KEY (`isa_kirjekood`) REFERENCES `pereregister` (`isikukood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;
	if true then
	   IF NEW.persoon = '0' THEN
	   	SELECT LPAD(MAX(persoon)+1, 10, '0') FROM repis.kirjed INTO @new_persoon;
	   	INSERT INTO repis.kirjed (persoon, kirjekood, allikas)
	   	VALUES (@new_persoon, @new_persoon, 'persoon');
	   	SET NEW.persoon = @new_persoon;
	   END IF;

	   IF length(NEW.persoon) = 10 THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.isikukood;
	   END IF;
	
	   IF NEW.persoon IS NULL AND OLD.persoon IS NOT NULL THEN
	      UPDATE repis.kirjed SET persoon = '0000000000'
  	      WHERE kirjekood = NEW.isikukood;
	      DELETE IGNORE FROM repis.kirjed
	      WHERE kirjekood = NEW.isikukood;
	   END IF;

   END IF;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_PR(NEW.persoon, NEW.isikukood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.isikukood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Table structure for table `pr_eesnimed`
--

CREATE TABLE `pr_eesnimed` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi5` varchar(5) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi4` varchar(4) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi3` varchar(3) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`,`eesnimi`) USING BTREE,
  KEY `kirjekood` (`kirjekood`) USING BTREE,
  KEY `eesnimi` (`eesnimi`) USING BTREE,
  KEY `eesnimi5` (`eesnimi5`) USING BTREE,
  KEY `eesnimi4` (`eesnimi4`) USING BTREE,
  KEY `eesnimi3` (`eesnimi3`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `pr_perenimed`
--

CREATE TABLE `pr_perenimed` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi5` varchar(5) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi4` varchar(4) COLLATE utf8_estonian_ci NOT NULL,
  `perenimi3` varchar(3) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`,`perenimi`) USING BTREE,
  KEY `kirjekood` (`kirjekood`) USING BTREE,
  KEY `perenimi` (`perenimi`) USING BTREE,
  KEY `perenimi5` (`perenimi5`) USING BTREE,
  KEY `perenimi4` (`perenimi4`) USING BTREE,
  KEY `perenimi3` (`perenimi3`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `pr_synd`
--

CREATE TABLE `pr_synd` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd7` char(7) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd4` char(4) COLLATE utf8_estonian_ci DEFAULT NULL,
  KEY `kirjekood` (`kirjekood`) USING BTREE,
  KEY `sünd` (`sünd`) USING BTREE,
  KEY `sünd7` (`sünd7`) USING BTREE,
  KEY `sünd4` (`sünd4`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `r62_mittekyyd`
--

CREATE TABLE `r62_mittekyyd` (
  `nr` int(11) DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` varchar(4000) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Lipik` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Silt` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `r86_triib`
--

CREATE TABLE `r86_triib` (
  `Jrk` int(11) DEFAULT NULL,
  `Eesnimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perenimi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `R86 Aastad` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `R86 surm` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Persooni surm` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Täpne vaste` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoonikood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Allikad` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `uus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `duplikaadiJrk` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kordus` int(11) DEFAULT NULL,
  `R9|10|11` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MR` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kivi` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `S-O` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vabanenud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Põhjenda` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `LMSS` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MR Põhjendus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MK Põhjendus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `rahvastikuregister`
--

CREATE TABLE `rahvastikuregister` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `seos` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünnikoht` varchar(200) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(200) COLLATE utf8_estonian_ci DEFAULT NULL,
  `allikas` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `allika_id` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `ema_eesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ema_perenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isa_eesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isa_perenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon` (`persoon`),
  KEY `sünd` (`sünd`,`surm`),
  KEY `perenimi` (`perenimi`,`isanimi`),
  KEY `perenimi_2` (`perenimi`,`surm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;
    DECLARE last_id INT;
    SELECT MAX(CAST(RIGHT(kirjekood, 7) AS UNSIGNED)) INTO last_id FROM rahvastikuregister;
    SET NEW.kirjekood = CONCAT('RR-', LPAD(last_id + 1, 7, '0'));
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
	   IF length(NEW.persoon) = 10
		THEN
	      UPDATE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.kirjekood;
	   END IF;
	
	   IF NEW.persoon in ('?', '') THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NULL
	      WHERE kirjekood = NEW.kirjekood;
	  	END if;
   END IF;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_RR(NEW.persoon, NEW.kirjekood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.kirjekood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Table structure for table `repr_kart`
--

CREATE TABLE `repr_kart` (
  `id` int(19) unsigned NOT NULL AUTO_INCREMENT,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isikukood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `PERENIMI` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `EESNIMI` varchar(36) COLLATE utf8_estonian_ci DEFAULT '',
  `ISANIMI` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `EMANIMI` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg` varchar(10) COLLATE utf8_estonian_ci DEFAULT '',
  `SA` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surm` varchar(27) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Muude_toimikute_nrd` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `syyd_ppkkaa` char(8) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kirje` varchar(150) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `otmetki` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `pudru` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Arreteerimiskuupäev` varchar(19) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Süüdimõistmiskuupäev` varchar(21) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Кем осужден / küüditamisotsuse tegija` text CHARACTER SET utf8 DEFAULT NULL,
  `nachalo sroka` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Deporteerimiskuupäev` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vabanemiskuupäev` varchar(21) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `F` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `I` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `O` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SUGU` enum('','M','N') COLLATE utf8_estonian_ci DEFAULT '',
  `sünniriik` enum('','Armeenia','Aserbaidžaan','Austraalia','Austria','Baškiiria','Bavaaria','Brasiilia','Eesti','Gruusia','Hiina','Holland','Inglismaa','Jaapan','Jugoslaavia','Kasahhia','Kreeka','Läti','Moldova','NSVL','Poola','Rootsi','Rumeenia','Saksamaa','Silesia','Soome','Tatari','Tšehoslovakkia','Turkmeenia','Ukraina','Ungari','USA','Valgevene','Venemaa','Preisi','Kabardiinid','Saksoonia') CHARACTER SET utf8 DEFAULT '',
  `NSV, ANSV, oblast, krai, kubermang, kond` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sünnilinn, vald, rajoon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `muu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `riik` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NSV, ANSV, oblast, krai, kubermang, maakond` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `eluk. linn, vald, rajoon` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `alev, küla, tänav, maja, talu, korter, muu` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `sots staatus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prof spets` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `töökoht` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `part` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nac` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `kodakondsus` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'nac',
  `küüditamise alus` text CHARACTER SET utf8 DEFAULT NULL,
  `st st uk, §§` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `kartochka zapolnena` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Täitmise kuupäev` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `organ` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `otdel` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `31` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `№№ del sl` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Sõrmejälg` enum('','jah','1991','ei','21','3','5','7967-э','арх сл 4256','Арх.12697','л д 37496','Сл.н.д.3988') CHARACTER SET utf8 DEFAULT '',
  `Läbikriipsutamine` enum('','1','11','12.03.79','1900/01/01','1900/01/02','1993','1996','2','21975','3','?','suur punane diagonaalkriips') CHARACTER SET utf8 DEFAULT '',
  `Templid dakt` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Kp. tempel` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Kohtuistung` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `§§` enum('','109','17-51-1a','17-58-1a','17-58-1a, 51 sankts','17-58-1а','17-59-3, 182 lg. 1','182 lg 1','182 lg.1','182 lg2','193-10a','193-7 punkt g','1946/12/20','54-1-a','54-1b','58-10 lg 1','58-10 lg 2','58-10 lg 2, 58-2','58-10 lg. 1','58-10 lg. 2','58-10 lg.1','58-12','58-1a','58-1a (inimene oli juba surnud)','58-1a, 58-11','58-1a, 58-11, 58-14','58-1a, 58-9, 58-11','58-1a, ENSV ÜN Presiidiumi seadlus 19.4.43 par. 2','58-1a, NSV Liidu ÜN Presiidiumi seadlus 19.04.1943','58-1a, NSV Liidu ÜN Presiidiumi seadlus 19.04.1943.','58-1a, NSVL ÜN Presiidiumi seadlus 19.04.43','58-1b','58-1b, ENSV ÜN Presiidiumi 19.04.1943. a. seadlus','58-3','58-3, "s sanktsii 58-2"','58-8','58-9','581a','61 lg. 3, 62 lg. 2','7-35 arvatavasti','CT. 7-35','ei','ei?','ENSV ÜN Presiidiumi seadlus 19.04.1943 par. 2','NSVL ÜN Presiidiumi seadlus 4.6.1947','oli surnud otsuse ajal','Ukr 54-1b, 54-10 lg. 2') CHARACTER SET utf8 DEFAULT '',
  `Cт ст УК §§ 34` enum('','"','.','1943/01/27','1945/05/22','1948/12/21','1993','28.08.45','?','Указ от 19.04.1943 к ВМН','х') CHARACTER SET utf8 DEFAULT '',
  `7_34` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `17-58-1a` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `19-58-1b` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `58-1a` enum('','"','.','?','ü','vabadusekaotus','x','х','х х)','х1','х2','хг','хч') CHARACTER SET utf8 DEFAULT '',
  `58-1b` enum('','"','5','?','x','ПП 2','ПП 3','ПП 5','ПП2','ПП3','ПП5','ПП№','х') CHARACTER SET utf8 DEFAULT '',
  `58-2` enum('','"','""','?','?х','x','БК','КИ','х','х2','хп10') CHARACTER SET utf8 DEFAULT '',
  `58-3` enum('','"','?','?х','х','х1','ха') CHARACTER SET utf8 DEFAULT '',
  `58-4` enum('','"','?','Muuhulgas tõmbas vahistamisel katki ühe nõukogude juhi pildi.','Osales kolme NKGB-töötaja (üks Meri jt) likvideerimisel','x','х','х10') CHARACTER SET utf8 DEFAULT '',
  `58-6` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `58-8` text CHARACTER SET utf8 DEFAULT NULL,
  `58-9` enum('','x') CHARACTER SET utf8 DEFAULT '',
  `58-10/     lg 1 või 1` enum('','"','0','58-10ч.2','?','?х','Eesti, ITK-1','Eesti, ITK-3','Eesti, ITK-5','Eesti, OLP-2','Eesti, OLP-7','Hark, ITK-1','Harku ITK-1','Harku, ITK-1','Kirovi obl., vangla nr 1, 19.01. suunatud Vjatlagi','Kombinaat nr 7 ehitus','Kombinaat nr 7 ehitus, LO 4 OITK MJ ESSR','Narva LO-4','Narva, ITL-907','Narva, LO 4','Narva, LO-4','Narva, OLP-4','Narva, OPL-4','OLP-4','Pärnu , Vangla nr 6','Pärnu, Vangla nr 6','Rakvere, Vangla nr 5','Saksamaa, Liegniz, hospital nr 1922','Sillamäe LO 7','Sillamäe, ITL-907','Sillamäe, LO-7','Sillamäe, OLP-7','Tallin, Vangla nr 1','Tallinn, ITK-5','Tallinn, ITK-6','Tallinn, tapivangla','Tallinn, Vangl nr 1','Tallinn, Vangla 1','Tallinn, Vangla nr 1','Tallinn, Vanla nr 1','Tallinn,m Vangla nr 1','Tallinn. Vangla nr. 1','Tallnna vabariiklik haigla','Tartu, Vangla nr 3','Valga ITK-5','Valga, ITK-5','Valga, OLP-5','Vasalemma OLP 2','Vasalemma, LO-2','Vasalemma, LP-2','Vasalemma, OLP-2','Viljandi, Vangla nr 7','Võru, Vangla nr 10','Võru, Vangla nr 8','x','х','х ч.1','х1','х1, 2','х1, х2','х1,2','х1;х2','х1и2','х2','х2,1','х3','ха','хч1','хч2','ч.1') CHARACTER SET utf8 DEFAULT '',
  `58-11` enum('','"','?','?х','Harku, ITK-1','Rakvere, Vangla nr 5','x','х','х1','х2','х4','ха') CHARACTER SET utf8 DEFAULT '',
  `58-12` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `58-13` enum('','"','0.0.46','1945/05/25','1945/06/03','1945/06/04','1945/08/02','1945/10/10','1946/01/26','1946/03/26','1946/04/26','1946/07/05','1946/12/07','1947/07/30','1948/01/16','1948/08/06','1949/03/04','1949/06/06','?','surnud','x','х','х2','х?') CHARACTER SET utf8 DEFAULT '',
  `59-2` enum('','"','"в"','"в"ч1','17-59-3','7','?','в-ч1','вх1','вч1','вч2','х','х "в" ч 1','х"в"ч1','х1','х2','ха','хв','хв ч 1','хв ч1','хв-1','хв1','хвч1','хч1') CHARACTER SET utf8 DEFAULT '',
  `60, lg 2` enum('','"','1990/01/04','1990/07/17','?','в','х') CHARACTER SET utf8 DEFAULT '',
  `182, lg0` enum('','"','1','17-182','?','х','х1','х2','хе','хч2') CHARACTER SET utf8 DEFAULT '',
  `193-17а` enum('','"','1941 aasta augustist alates oli Tallinna 3. politseijaoskonna ülem, toimikus foto vanemast east erariietes','7г','?','Möisteti koos naisega spekuleerimise eest süüdi 30.11.45, karistati 7 vabkaotus, paragrahvid 109 ja 107','Mõisteti süüdi valeraha tegemise kavatsuses ja vargusele kaasa aitamises.','Oli Jõelähtme vallavanaem','Oli septembrist 1943 kuni maini 1944 Kiviõli koonduslaagri komandant','Tappis 26.3.45 Murastes Karl Kooriku ja tema perekonna (naine ja kolm last). Oli makaitses, SS-is ja Soome armees.','Tappis Aime Köst''i','Toimikus Peeter Kose (1908) ametiühingu pilet','Varastas miilitsavolinikult jalgratta','Varjas ennast, omas saksa automaati','Võltsis toidukaarte','Конец срока - 03.05.54','Конец срока 04.12.55','х','штамп: 22.04.74') CHARACTER SET utf8 DEFAULT '',
  `145 ч.2` enum('','"','84','?','AL','AŠ','HR','IP','KH','LF','LM','MŠ','MV','TH','VK','КХ','х') CHARACTER SET utf8 DEFAULT '',
  `Muud §§` text CHARACTER SET utf8 DEFAULT NULL,
  `Esialgne karistus` enum('','10388','10723','10978','11124','1118','11211','11696','11761','11981','12744','13283','13877','14085','15204','15324','1623','16898','16915','17436','17744','17829','19634','19759','19988','20246','20270','21310','22738','22745','25','25195','25365','26766','27007','27820','30225','32750','32856','33127','33172','34649','34852','35457','35720','36363','37545','38329','39002','39231','39933','40074','40321','40782','43316','43390','43451','44973','45304','45565','47221','47763','48695','4915','50710','50766','50875','5283','58','7938','8015','8022','8648','9501','9689','9832','9874','988','mahalaskmine','ВМН','ИТЛ 25','ИТЛ 25?','ИТЛ25') CHARACTER SET utf8 DEFAULT '',
  `Срок,  režiim` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Lõplik karistus (kui erineb esialgsest)` enum('','0013-0014','0027-0028','0079-0080','0163-0164','0215-0216','0338-0339','0385-0386','0391-0392','0421-0422','0429-0430','0519-0520','0570-0571','0635-36','0699-0700','0716-0717','0771-0772','0827-0828','0832-33','0843-0844','0873-0874','0938-0939','0944-45','10','115','1162-63','1239-1240','1241-1242','1299-1300','1319-1320','1393-1394','1403-1404','1406-1407','1409-1410','1467-1468','1501-1502','1552-1553','1569-1570','1621-1622','1639-40','1737-1738','1758-1759','1781-1782','1786-87','1788-1789','1900','1908-09','2018-2019','2027-2028','2034-2035','2043-44','2079','2091-2092','21','2117-2118','2118-2119','2160','2163-2164','2174-2175','2177-2178','2253-2256','2319','2372-2373','2402-2403','25','252-253','2543-2544','3590','4171','4255','459-460','5128-5129','750','846-847','997-998','ei','IMGP3966-67','KAO-KV1229-1230','MAK-MEO2427-28','MAK-MEO2441-42','vabadusekaotus','ВМН') CHARACTER SET utf8 DEFAULT '',
  `ПП` enum('',' "',' ПП 3',' ПП3',' ПП5','"','""','"ПП 3','1 г','1942/12/17','2','3','4','5','5?','?','??','?ПП3','?ПП5','teine pool puudub','«','«»','б/ПП','без пп','БК','БП','БПП','ВМН','дата смерти?','ИИ 5','ИТЛ','ИТЛ 10','итл 25','ИТЛ 5','ИТЛ25','ИТЛ3','ИТЛ8','к','КИ','ЛС 10','П 3','П 5','П/П 3','П/П 5','П/П?','П3','П5','пп','ПП "','ПП 1','ПП 10','пп 2','ПП 3','ПП 3КИ','пп 4','пп 5','пп 5 л 8','ПП 5л','ПП 5лет','ПП 6','ПП ?','ПП%','ПП-3 г.','ПП-5','ПП1','ПП2','ПП3','ПП3 г.','ПП3года','ПП4','ПП5','ПП5?','ПП5лет','ПП6','ПП6лет','ПП8','ПП?','ПП№','ШофП 3','№') CHARACTER SET utf8 DEFAULT '',
  `КИ / БК` enum('',' "',' БК',' КИ','"','""','"К','2','?','??','«','Без КИ за отсутствием такового','би','бк','К','К ден.суммы 100 руб.','К денег в сумме 1268 руб','К денег в сумме 431 руб.','К денежных сумм - 742 рубля','К изъятого оружия','К ценностей','К часов','к"','К/ценносте','КБ','ки','КИ (заочно)','КИ и оружия','КИ им.часов','КИ оружия','КМ','конф денег в сумме 770 р','П','ПП 5','ПП5','СК','СП','част.КИ','№') CHARACTER SET utf8 DEFAULT '',
  `dopolnitelnije meri` text CHARACTER SET utf8 DEFAULT NULL,
  `Märkus küüditamise kohta` text CHARACTER SET utf8 DEFAULT NULL,
  `Hukkamiskoht/surmakoht` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Hukkaja organ` enum('','..','1.9.47','6.6.49','?..','ENSV NKGB/MGB komandant','Harku, ITK-1','NSVL MVD','NSVL NKGB/MGB','PBL "Smerši" VLO komandant','PõhBL MGB VLO komandant') CHARACTER SET utf8 DEFAULT '',
  `Hukkamisele viidud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Asumiselt vabastatud` varchar(50) COLLATE utf8_estonian_ci DEFAULT '',
  `Rehabiliteerimiskuupäev` varchar(60) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Vorm` enum('','"','1','13','14','16','1?','1x','1б','1г','1д','1к','1м/о','1мо','1н','1х','2','3','4','4м/о','5','7','?','A','K','x','«','А','аг роз','аг уч','аг учет','Аг.дело','аг/учет','Аген.учет','Агент','Агент.дело','Агент.уч.','Агент.учет','агентурная','Агентурное дело','Агентурный учет','АОР','арх справка №3/1263 от 04.95г','архивная справка','и','к','карта','кулак','м/о','м/о ?','МО','Муфта','н','нелегал','отметка','пр 13','роз','Роз.дело','Роз.дело.','Роз.кар.','Роз.Карт.','розыск','розыскн','розыскная','с/п','СП','справка','телефонограма','требование','требование,1х','уч к-ка','х','чн') CHARACTER SET utf8 DEFAULT '',
  `Märkused1` text CHARACTER SET utf8 DEFAULT NULL,
  `Sisestaja` enum('','AAL','AJ','AL','AŠ','HR','IP','KH','LF','LF?','LM','MŠ','MV','TH','VK','АК','КХ','МV','МС','Н') CHARACTER SET utf8 DEFAULT '',
  `Allikas` varchar(76) CHARACTER SET utf8 DEFAULT '',
  `Jrknr` varchar(5) CHARACTER SET utf8 DEFAULT '',
  `85` enum('','1','10','11','12','13','14','2','3','4','5','6','7','8','9','mittepoliitiline??') CHARACTER SET utf8 DEFAULT '',
  `Nr` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `Probleemid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Mementol olemas?` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Märkused2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Arreteerimise tunnus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Küüditamise tunnus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Muu represseerimise tunnus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Represseerimiseaeg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Naasmise tunnus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Naasmise aeg` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Dokumendiliik` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IJRK` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `K-Kausta number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Aadress küüditamise ajal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `K Lehekülje number` int(4) unsigned DEFAULT NULL,
  `K Number` int(4) unsigned DEFAULT NULL,
  `Otsus küüditamise kohta` enum('','1','2','3','5') CHARACTER SET utf8 DEFAULT '',
  `Otsuse kuupäev` varchar(8) CHARACTER SET utf8 DEFAULT '',
  `Küüditamise koht 3` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Arr Kausta number` tinyint(3) unsigned DEFAULT NULL,
  `Lehekülg` tinyint(3) unsigned DEFAULT NULL,
  `Number` tinyint(2) unsigned DEFAULT NULL,
  `Aadress arreteerimise ajal` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `Mitu aastat asumisel` varchar(2) CHARACTER SET utf8 DEFAULT '',
  `Kinnipidamiskoht1` enum('','0','Narva vangla','Pärnu','Pärnu vangla','Tallinn','Tallinn, Patarei vangla','Tallinna Patarei vangla','Tallinna vangla','Tallinna vangla nr.1','Tartu','Tartu vangla','Vasalemma','Viljandi') CHARACTER SET utf8 DEFAULT '',
  `Kinnipidamiskoht2` enum('','0','Harju mk. Kloostri v. Rummu k.','Tallinna vangla') CHARACTER SET utf8 DEFAULT '',
  `Kinnipidamiskoht3` enum('','0') CHARACTER SET utf8 DEFAULT '',
  `Arreteeritu naasmise tunnus` enum('','Surnud','Surnud eeluurimisel','Surnud vanglas (laagris)','Vabanenud') CHARACTER SET utf8 DEFAULT '',
  `Arreteerimisdokumendi liik` enum('','Arhiivimaterjalid','Prokuratuuri materjalid','Ülemkohtu materjalid') CHARACTER SET utf8 DEFAULT '',
  `Kat` enum('ERAF.12SM','ERAF.12SM mitterelevantne','ERAF.12SM mitterelevantne?','H','Kaart "represseeritute kartoteegist"','Korduv','Memento 12','Memento 3','Mitterelevantne kirje') CHARACTER SET utf8 DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `user` varchar(50) COLLATE utf8_estonian_ci DEFAULT 'user()',
  `EesnimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `PerenimiC` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isikukood` (`isikukood`),
  KEY `EesnimiC` (`EesnimiC`,`PerenimiC`),
  KEY `persoon` (`persoon`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;
	if true then
	   IF NEW.persoon = '0' THEN
	   	SELECT LPAD(MAX(persoon)+1, 10, '0') FROM repis.kirjed INTO @new_persoon;
	   	INSERT INTO repis.kirjed (persoon, kirjekood, allikas)
	   	VALUES (@new_persoon, @new_persoon, 'persoon');
	   	SET NEW.persoon = @new_persoon;
	   END IF;

	   IF length(NEW.persoon) = 10 THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NEW.persoon
	      WHERE kirjekood = NEW.isikukood;
	   END IF;
	
	   IF NEW.persoon IS NULL THEN
	      UPDATE IGNORE repis.kirjed
	      SET persoon = NULL
	      WHERE kirjekood = NEW.isikukood;
	   END IF;
	END if;
END */;;
DELIMITER ;
DELIMITER ;;
	if true then
		if NEW.persoon <> IFNULL(OLD.persoon, 'NULL')
		then
	  		CALL import.import_RK(NEW.persoon, NEW.isikukood);
	  		CALL repis.proc_NK_refresh(NEW.persoon, NEW.isikukood);
	  	END if;
  	END if;
END */;;
DELIMITER ;

--
-- Table structure for table `rk_toimikud`
--

CREATE TABLE `rk_toimikud` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `toimikuNr` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  KEY `Index 1` (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `rr_v66rsil_surnud`
--

CREATE TABLE `rr_v66rsil_surnud` (
  `jrk` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `confidence` tinyint(1) DEFAULT NULL,
  `perenimi` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `synniriiktxt` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synnikoht` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surm` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surmariiktxt` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimiC` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimiC` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`),
  KEY `rr_kohad2` (`synnikoht`,`surmakoht`),
  KEY `eesnimi` (`eesnimi`,`perenimi`),
  KEY `isikukood` (`isikukood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `swedish_death_index`
--

CREATE TABLE `swedish_death_index` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `id` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `forename` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surname` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `maidenname` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `born` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `countryofbirth` enum('Est','Rus','Lat','') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `dead` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `placeofdeath` varchar(80) COLLATE utf8_estonian_ci DEFAULT NULL,
  `martialstatus` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `sex` enum('M','N') COLLATE utf8_estonian_ci DEFAULT NULL,
  `lines` text COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon` (`persoon`),
  KEY `pereregister` (`pereregister`),
  KEY `surname_forename` (`surname`,`forename`),
  KEY `forename_maidenname` (`maidenname`,`forename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

  if OLD.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = OLD.kirjekood;
  END if;

  if NEW.persoon IS NOT NULL then
    DELETE IGNORE FROM repis.kirjed
    WHERE kirjekood = NEW.kirjekood;

    CALL import.import_SDI(NEW.persoon, NEW.kirjekood);
  END if;
  
  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;

  if     NEW.persoon IS NOT NULL 
     AND NEW.pereregister IS NULL 
	  AND OLD.pereregister IS NULL then
	 SET @pr_kood = NULL;
    SELECT isikukood INTO @pr_kood
	   FROM import.pereregister WHERE persoon = NEW.persoon
		LIMIT 1;
	 IF @pr_kood IS NOT NULL then
	 	SET NEW.pereregister = @pr_kood;
	 END if;
  END if;
  
END */;;
DELIMITER ;

--
-- Table structure for table `vanglasurmad`
--

CREATE TABLE `vanglasurmad` (
  `sakk` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `toimik` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `nimekirjafail` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `teatise_fail` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lk_nr` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pr_kood` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `repr_kaart` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünniaeg` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmaaeg` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surma_põhjus` varchar(150) COLLATE utf8_estonian_ci DEFAULT NULL,
  `viimane_elukoht` varchar(80) COLLATE utf8_estonian_ci DEFAULT NULL,
  `laagri_nimi` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surma_koht` varchar(120) COLLATE utf8_estonian_ci DEFAULT NULL,
  `matmise_koht` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `märkused` text COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `ve_lk`
--

CREATE TABLE `ve_lk` (
  `nr` smallint(6) NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekonnanimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimed` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `neiupõlvenimed` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sünnikoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surm` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `permalink` varchar(70) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`nr`),
  KEY `pereregister` (`pereregister`),
  KEY `persoon` (`persoon`),
  KEY `perekonnanimi_eesnimed` (`perekonnanimi`,`eesnimed`),
  CONSTRAINT `FK_ve_lk_pereregister` FOREIGN KEY (`pereregister`) REFERENCES `pereregister` (`isikukood`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `wp_msyne_koonduslaager`
--

CREATE TABLE `wp_msyne_koonduslaager` (
  `ExcelId` int(11) NOT NULL,
  `Sugu` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Perenimi1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Perenimi2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `AltPerenimi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synninimi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Isanimi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Eesnimi1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Eesnimi2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Eesnimi3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `AltEesnimi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SynniDaatum` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synnikuupaev` int(11) NOT NULL,
  `Synnikuu` int(11) NOT NULL,
  `Synniaasta` int(11) NOT NULL,
  `AltSynniDaatum` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synnimaa` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SynnilinnMaakond` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synnivald` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synnikyla` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synnikoht` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Elukoht` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MuudAndmed` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vanginumber` int(11) NOT NULL,
  `AltVanginumber` int(11) NOT NULL,
  `Elukutse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Syydistus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TranspordiNimekiri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Markused` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERAViide` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `VahistamiseAeg` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLStutthofiSaabumiseAeg` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `VangiNumberKLStutthofis` int(11) NOT NULL,
  `AltVangiNumberKLStutthofis` int(11) NOT NULL,
  `Surmaaeg` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SurmaPohjus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Surmakoht` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLStutthofistYleviimiseAeg` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLStutthofistYleviidudKuhu` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vabastatud` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Markused2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `StutthofiViideAMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Kaartkataloog` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLBuchenwaldiSaabumiseAeg` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `VanginumberKLBuchenwaldis` int(11) NOT NULL,
  `SurnudKLBuchenwaldis` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLBuchenwaldiViide` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLBuchenvaldiMarkused` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLBuchenwaldistYleViidudKuhu` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `KLBuchenwaldistYleViidudMillal` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TeisedLaagrid` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Current Database: `import`
--

USE `import`;

--
-- Final view structure for view `el_kart_view`
--


--
-- Final view structure for view `eraf_nimistu_v`
--


--
-- Final view structure for view `erisurmaaktid_kivita`
--


--
-- Final view structure for view `krossi_metsavennad_X_repis`
--


