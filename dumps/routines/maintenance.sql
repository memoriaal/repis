-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: maintenance
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `maintenance`
--


USE `maintenance`;

--
-- Dumping routines for database 'maintenance'
--
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `persoon_aa_vs_pr`()
BEGIN

  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT pr.isikukood, aa.persoon
  FROM import.pereregister pr
  LEFT JOIN import.album_academicum aa ON aa.pereregister = pr.isikukood
  WHERE aa.persoon IS NOT null
  AND pr.persoon IS NULL
  ;  
  UPDATE import.pereregister pr
  RIGHT JOIN tmp.tmp tmp ON tmp.isikukood = pr.isikukood
  SET pr.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND pr.persoon IS NULL
  ;
  
  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT aa.kirjekood, pr.persoon
  FROM import.album_academicum aa
  LEFT JOIN import.pereregister pr ON aa.pereregister = pr.isikukood
  WHERE pr.persoon IS NOT null
  AND aa.persoon IS null
  ;
  UPDATE import.album_academicum aa
  RIGHT JOIN tmp.tmp tmp ON tmp.kirjekood = aa.kirjekood
  SET aa.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND aa.persoon IS null
  ;
  
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `persoon_lk_vs_pr`()
BEGIN

  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT pr.isikukood, lk.persoon
  FROM import.pereregister pr
  LEFT JOIN import.leinakuulutused lk ON lk.pereregister = pr.isikukood
  WHERE lk.persoon IS NOT null
  AND pr.persoon IS NULL
  ;  
  UPDATE import.pereregister pr
  RIGHT JOIN tmp.tmp tmp ON tmp.isikukood = pr.isikukood
  SET pr.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND pr.persoon IS NULL
  ;
  
  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT lk.kirjekood, pr.persoon
  FROM import.leinakuulutused lk
  LEFT JOIN import.pereregister pr ON lk.pereregister = pr.isikukood
  WHERE pr.persoon IS NOT null
  AND lk.persoon IS null
  ;
  UPDATE import.leinakuulutused lk
  RIGHT JOIN tmp.tmp tmp ON tmp.kirjekood = lk.kirjekood
  SET lk.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND lk.persoon IS null
  ;
  
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `persoon_pr_vs_kirjed`()
BEGIN

-- pereregistrikirjed kirjetes (repis.kirjed), persoon tagasi toomata
  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT pr.isikukood, kk.persoon
  FROM import.pereregister pr
  LEFT JOIN repis.kirjed kk ON kk.allikas = 'pr' and kk.kirjekood = pr.isikukood
  WHERE kk.persoon IS NOT null
  AND pr.persoon IS NULL
  ;  
  UPDATE import.pereregister pr
  RIGHT JOIN tmp.tmp tmp ON tmp.isikukood = pr.isikukood
  SET pr.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND pr.persoon IS NULL
  ;
  
  CREATE OR REPLACE TABLE tmp.tmp 
  SELECT lk.kirjekood, pr.persoon
  FROM import.leinakuulutused lk
  LEFT JOIN import.pereregister pr ON lk.pereregister = pr.isikukood
  WHERE pr.persoon IS NOT null
  AND lk.persoon IS null
  ;
  UPDATE import.leinakuulutused lk
  RIGHT JOIN tmp.tmp tmp ON tmp.kirjekood = lk.kirjekood
  SET lk.persoon = tmp.persoon
  WHERE tmp.persoon IS NOT null
  AND lk.persoon IS null
  ;
  
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `populate_sugu`()
BEGIN

 UPDATE repis.kirjed k0
-- SELECT * FROM  repis.kirjed k0
right join
(
  SELECT persoon, GROUP_CONCAT(distinct Sugu) sugu
  FROM repis.kirjed
  WHERE persoon > 0
  GROUP BY persoon
  HAVING LENGTH(sugu) > 1
) sood 
ON sood.persoon = k0.persoon
SET k0.Sugu = RIGHT(sood.sugu,1)
WHERE sood.sugu LIKE ',%'
;

UPDATE repis.kirjed k0
-- SELECT * FROM  repis.kirjed k0
right join
(
  SELECT persoon, GROUP_CONCAT(distinct Sugu) sugu
  FROM repis.kirjed
  WHERE persoon > 0
  GROUP BY persoon
  HAVING LENGTH(sugu) > 1
) sood 
ON sood.persoon = k0.persoon
 SET k0.Sugu = LEFT(sood.sugu,1)
WHERE sood.sugu LIKE '%,'
;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `trim_spaces`()
BEGIN

    update repis.kirjed
    set perenimi = trim(eesnimi)
    where eesnimi regexp "^ | $"
    ;
    update repis.kirjed
    set perenimi = trim(perenimi)
    where perenimi regexp "^ | $"
    ;
    update repis.kirjed
    set emanimi = trim(emanimi)
    where emanimi regexp "^ | $"
    ;
    update repis.kirjed
    set isanimi = trim(isanimi)
    where isanimi regexp "^ | $"
    ;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `update_wwiiref`(
	IN `in_persoon` CHAR(10)
)
BEGIN

  SELECT persoon 
  INTO @real_persoon 
  FROM repis.kirjed 
  WHERE kirjekood = in_persoon;

  SELECT MAX(pub_wwiiref)
  INTO @is_ref
  FROM repis.kirjed
  WHERE persoon = @real_persoon
  
  UPDATE repis.kirjed
  SET pub_wwiiref = @is_ref
  WHERE kirjekood = in_persoon;

END ;;
DELIMITER ;

