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
