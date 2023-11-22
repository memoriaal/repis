-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: repis
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER `desktop_BI` BEFORE INSERT ON `desktop` FOR EACH ROW proc_label:BEGIN

    IF NEW.created_by = '' THEN
      SET NEW.created_by = user();
    END IF;

    SET @new_code = UPPER(IF(NEW.kirjekood = '', NEW.persoon, NEW.kirjekood));

    IF @new_code IN ('EMI', 'TS', 'R4-1', 'KR') THEN
      SET NEW.persoon = '',
          NEW.kirjekood = repis.desktop_next_id(@new_code),
          NEW.allikas = @new_code;

    ELSEIF @new_code = '0' THEN
      SET @ik = repis.desktop_next_id('Persoon');
      SET NEW.persoon = @ik,
          NEW.kirjekood = @ik,
          NEW.allikas = 'Persoon';

    ELSEIF NEW.allikas IS NULL AND user() != 'queue@localhost' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2,    task,              params, created_by)
      VALUES                           (NEW.persoon, NEW.kirjekood, 'desktop_collect', NULL,   NEW.created_by);
      IF @new_code LIKE 'PR-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'PR';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_PR_import', NULL,   NEW.created_by);
      ELSEIF @new_code LIKE 'RK-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'RK';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_RK_import', NULL,   NEW.created_by);
      ELSEIF @new_code LIKE 'RR-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'RR';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_RR_import', NULL,   NEW.created_by);
      END IF;

    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER `desktop_BU` BEFORE UPDATE ON `desktop` FOR EACH ROW proc_label:BEGIN

    DECLARE msg TEXT;

    -- can change only owned records
      IF  OLD.created_by != user()
        AND user() != 'queue@localhost'
        AND user() != 'event_scheduler@localhost'
        THEN
        SELECT concat_ws('\n'
          , 'Mängi oma liivakastis!'
          , user()
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- no meddling
      SET NEW.created_by = OLD.created_by;
      SET NEW.allikas = OLD.allikas;
      SET NEW.jutt = IF(OLD.jutt = ' - - - ', ' - - - ', NEW.jutt);

    -- cant change the identifier
      IF  NEW.kirjekood != OLD.kirjekood THEN
        SELECT concat_ws('\n'
          , 'Kirjekoode ei saa muuta.'
          , 'Mitte kuidagi ei saa.'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- cant remove person from record
      IF NEW.persoon != OLD.persoon AND NEW.persoon = '' THEN
        SELECT concat_ws('\n'
          , 'Kirjelt ei saa persooni ära võtta.'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- cant assign person to another person
      IF NEW.persoon != OLD.persoon AND OLD.kirjekood = OLD.persoon THEN
        -- SELECT concat_ws('\n'
        --   , 'Nimekuju kirjet ei saa isikust lahutada.'
        -- ) INTO msg;
        -- SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
        SET NEW.eesnimi = '';
        SET NEW.perenimi = '';
        SET NEW.emanimi = '';
        SET NEW.isanimi = '';
        SET NEW.sünd = '';
        SET NEW.surm = '';
        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2,  task,                   params, created_by)
        VALUES                           (OLD.persoon, NEW.persoon, 'desktop_join_persons', '',     user());
        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,                    params, created_by)
        VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh',    '1',   user());

        LEAVE proc_label;
      END IF;

    -- cant change almost anything but person for original records
      IF OLD.allikas NOT IN ('EMI', 'TS', 'Persoon', 'KR')
        AND user() != 'michelek@localhost'
        AND user() != 'queue@localhost'
        AND user() != 'event_scheduler@localhost'
        AND ( NEW.kirjekood != OLD.kirjekood OR
              NEW.perenimi != OLD.perenimi OR
              NEW.eesnimi != OLD.eesnimi OR
              NEW.isanimi != OLD.isanimi OR
              NEW.emanimi != OLD.emanimi OR
              NEW.sünd != OLD.sünd OR
              NEW.sünnikoht != OLD.sünnikoht OR
              NEW.surm != OLD.surm OR
              NEW.surmakoht != OLD.surmakoht OR
              NEW.matmisaeg != OLD.matmisaeg OR
              NEW.elukoht != OLD.elukoht OR
              NEW.matmiskoht != OLD.matmiskoht OR
              NEW.`surma põhjus` != OLD.`surma põhjus` OR
              NEW.jutt != OLD.jutt OR
              NEW.välisviide != OLD.välisviide OR
              NEW.kirje != OLD.kirje) THEN
        SELECT concat_ws('\n'
          , 'Registri kirjetel saab muuta ainult persooni koodi!'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;


    --
    -- Update desktop silts'n'lipiks
    --
    IF NEW.lipik IS NOT NULL THEN
      INSERT IGNORE INTO repis.desk_lipikud (desktop_id, lipik)
      VALUES (NEW.id, NEW.lipik);
      IF row_count() = 0 THEN
        DELETE FROM repis.desk_lipikud WHERE desktop_id = NEW.id AND lipik = NEW.lipik;
      END IF;

      SELECT GROUP_CONCAT(dl.lipik SEPARATOR '; ') INTO @lipikud
      FROM repis.desk_lipikud dl
      WHERE dl.desktop_id = NEW.id;

      SET NEW.lipikud = IFNULL(@lipikud, '');
      SET NEW.lipik = NULL;
    END IF;

    IF NEW.silt IS NOT NULL THEN
      INSERT IGNORE INTO repis.desk_sildid (desktop_id, silt)
      VALUES (NEW.id, NEW.silt);
      IF row_count() = 0 THEN
        DELETE FROM repis.desk_sildid WHERE desktop_id = NEW.id AND silt = NEW.silt;
      END IF;

      SELECT GROUP_CONCAT(ds.silt SEPARATOR '; ') INTO @sildid
      FROM repis.desk_sildid ds
      WHERE ds.desktop_id = NEW.id;

      SET NEW.sildid = IFNULL(@sildid, '');
      SET NEW.silt = NULL;
    END IF;


    --
    -- Prefill names'n'dates'n'kirje of new EMI
    --
    IF     OLD.allikas IN ('EMI', 'KR')
       AND OLD.persoon = '' AND NEW.persoon != '' THEN
      IF     NEW.perenimi  = '' AND NEW.eesnimi   = ''
         AND NEW.isanimi   = '' AND NEW.emanimi   = ''
         AND NEW.sünd      = '' AND NEW.surm      = ''
         AND NEW.sünnikoht = '' AND NEW.surmakoht = '' THEN
            SET @perenimi = '', @eesnimi = ''
               , @isanimi = '', @emanimi = ''
               , @sünd = '', @surm = ''
               , @sünnikoht = '', @surmakoht = ''
               , @kirje = '', @allikas = '';
            SELECT k.perenimi, k.eesnimi
                 , k.isanimi, k.emanimi
                 , k.sünd, k.surm
                 , k.sünnikoht, k.surmakoht
                 , k.kirje, k.allikas
              INTO @perenimi, @eesnimi
                 , @isanimi, @emanimi
                 , @sünd, @surm
                 , @sünnikoht, @surmakoht
                 , @kirje, @allikas
              FROM repis.desktop k
             WHERE k.kirjekood = NEW.persoon;

            SET NEW.perenimi = @perenimi, NEW.eesnimi = @eesnimi,
                NEW.isanimi = @isanimi, NEW.emanimi = @emanimi,
                NEW.sünd = @sünd, NEW.surm = @surm,
                NEW.sünnikoht = @sünnikoht, NEW.surmakoht = @surmakoht;

      END IF;
    END IF;


    --
    -- Recalculate current record
    --
    IF OLD.allikas IN ('EMI', 'Persoon') THEN
      SET NEW.kirje =
        concat_ws('. ',
          repis.desktop_person_text(
              NEW.perenimi, NEW.eesnimi,
              NEW.isanimi, NEW.emanimi,
              NEW.sünd, NEW.surm,
              NEW.sünnikoht, NEW.surmakoht
            ) COLLATE utf8_estonian_ci,
          if(NEW.jutt IN('', ' - - - '), NULL, NEW.jutt)
        )
      ;
    END IF;


    --
    -- Request recalculation for person that gave away record
    --
    IF NEW.persoon != OLD.persoon AND OLD.persoon != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (OLD.persoon, NULL,       'desktop_NK_refresh', '1',   user());
    END IF;


    --
    -- Request recalculation for affected person(s)
    --

    IF NEW.persoon != '' THEN
      SET @refresh_requested = 0;

      IF NEW.persoon != OLD.persoon AND @refresh_requested = 0 THEN
        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
        VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh', '2.1',   user());
        SET @refresh_requested = 1;
      END IF;

      IF (  NEW.eesnimi != OLD.eesnimi
         OR NEW.perenimi != OLD.perenimi
         OR NEW.isanimi != OLD.isanimi
         OR NEW.emanimi != OLD.emanimi
         OR NEW.sünd != OLD.sünd
         OR NEW.sünnikoht != OLD.sünnikoht
         OR NEW.surm != OLD.surm
         OR NEW.surmakoht != OLD.surmakoht
         )
         AND NEW.allikas != 'Persoon' AND @refresh_requested = 0 THEN
            INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
            VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh', '2.2',   user());
            SET @refresh_requested = 1;
      END IF;

    END IF;

    --
    -- Request recalculation for person with changed status
    --
    IF NEW.EkslikKanne != OLD.EkslikKanne
       OR NEW.Kustuta != OLD.Kustuta
       OR NEW.Peatatud != OLD.Peatatud
       OR NEW.EiArvesta != OLD.EiArvesta THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (OLD.persoon, NULL,       'desktop_NK_refresh', '3',   user());
    END IF;



    --
    -- Clean desktop
    --
    IF NEW.valmis = 'Untsus' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (NULL,        NULL,       'desktop_flush', NULL,   user());


    --
    -- Save and clean desktop
    --
    ELSEIF NEW.valmis = 'Valmis' THEN

      -- Save new persons if any
      INSERT INTO repis.kirjed (
        persoon, kirjekood, kirje, legend, perenimi, eesnimi,
        isanimi, emanimi, sünd, sünnikoht, surm, surmakoht, allikas,
        matmisaeg, elukoht, matmiskoht, `surma põhjus`,
        välisviide, EkslikKanne, Peatatud, EiArvesta,
        created_at, created_by,
        KirjePersoon)
      SELECT d.persoon, d.kirjekood, d.kirje, d.legend, d.perenimi, d.eesnimi,
             d.isanimi, d.emanimi, d.sünd, d.sünnikoht, d.surm, d.surmakoht, d.allikas,
             d.matmisaeg, d.elukoht, d.matmiskoht, d.`surma põhjus`,
             d.välisviide, d.EkslikKanne, d.Peatatud, d.EiArvesta,
             now(), SUBSTRING_INDEX(user(), '@', 1),
             repis.desktop_person_text(
                d.perenimi, d.eesnimi,
                d.isanimi, d.emanimi,
                d.sünd, d.surm,
                d.sünnikoht, d.surmakoht
              )
      FROM repis.desktop d
      LEFT JOIN repis.kirjed k ON k.kirjekood = d.kirjekood
      WHERE k.persoon IS NULL
      AND d.persoon = d.kirjekood
      AND d.created_by = user();

      -- Save new records to new persons if any
      INSERT INTO repis.kirjed (
        persoon, kirjekood, kirje, legend, perenimi, eesnimi,
        isanimi, emanimi, sünd, sünnikoht, surm, surmakoht, allikas,
        matmisaeg, elukoht, matmiskoht, `surma põhjus`,
        välisviide, EkslikKanne, Peatatud, EiArvesta,
        created_at, created_by,
        KirjePersoon,
        kirjeJutt)
      SELECT d.persoon, d.kirjekood, d.kirje, d.legend, d.perenimi, d.eesnimi,
             d.isanimi, d.emanimi, d.sünd, d.sünnikoht, d.surm, d.surmakoht, d.allikas,
             d.matmisaeg, d.elukoht, d.matmiskoht, d.`surma põhjus`,
             d.välisviide, d.EkslikKanne, d.Peatatud, d.EiArvesta,
             now(), SUBSTRING_INDEX(user(), '@', 1),
             if(d.allikas IN ('EMI', 'TS'),
                  repis.desktop_person_text(
                    d2.perenimi, d2.eesnimi,
                    d2.isanimi, d2.emanimi,
                    d2.sünd, d2.surm,
                    d2.sünnikoht, d2.surmakoht
                  ),
                  NULL
               ),
             if(d.allikas IN ('EMI', 'TS'), d.jutt, NULL)
      FROM repis.desktop d
      LEFT JOIN repis.kirjed k ON k.kirjekood = d.kirjekood
      LEFT JOIN repis.desktop d2 ON d2.kirjekood = d.persoon
      WHERE k.kirjekood IS NULL
      AND d.persoon != d.kirjekood
      AND d.created_by = user();


      -- Update changed silts'n'lipiks
      DELETE kl FROM repis.v_kirjelipikud kl
      RIGHT JOIN repis.desktop d ON d.kirjekood = kl.kirjekood
      WHERE d.created_by = user();
      --
      DELETE ks FROM repis.v_kirjesildid ks
      RIGHT JOIN repis.desktop d ON d.kirjekood = ks.kirjekood
      WHERE d.created_by = user();
      --
      INSERT INTO repis.v_kirjelipikud (kirjekood, lipik)
      SELECT d.kirjekood, dl.lipik
      FROM repis.desk_lipikud dl
      RIGHT JOIN repis.desktop d ON d.id = dl.desktop_id
      WHERE d.created_by = user()
        AND dl.lipik IS NOT NULL;
      --
      INSERT INTO repis.v_kirjesildid (kirjekood, silt)
      SELECT d.kirjekood, dl.silt
      FROM repis.desk_sildid dl
      RIGHT JOIN repis.desktop d ON d.id = dl.desktop_id
      WHERE d.created_by = user()
        AND dl.silt IS NOT NULL;


      -- Update changed persons
      UPDATE repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
      LEFT JOIN repis.desktop d2 ON d2.kirjekood = d.persoon
      SET k.persoon = d.persoon,
          k.lipikud = repis.func_kirjelipikud(k.kirjekood),
          k.sildid = repis.func_kirjesildid(k.kirjekood),
          k.kirje = d.kirje, k.legend = d.legend,
          k.perenimi = d.perenimi, k.eesnimi = d.eesnimi,
          k.isanimi = d.isanimi, k.emanimi = d.emanimi,
          k.sünd = d.sünd, k.sünnikoht = d.sünnikoht, 
			 k.surm = d.surm, k.surmakoht = d.surmakoht, 
			 k.allikas = d.allikas, k.matmisaeg = d.matmisaeg, 
          k.elukoht = d.elukoht, k.matmiskoht = d.matmiskoht, 
          k.`surma põhjus` = d.`surma põhjus`,
          k.välisviide = d.välisviide, k.EkslikKanne = d.EkslikKanne,
          k.Peatatud = d.Peatatud,
          k.EiArvesta = d.EiArvesta,
          k.updated_at = now(), updated_by = SUBSTRING_INDEX(user(), '@', 1),
          k.KirjePersoon = if(d.allikas IN ('EMI', 'TS'),
               repis.desktop_person_text(
                 d2.perenimi, d2.eesnimi,
                 d2.isanimi, d2.emanimi,
                 d2.sünd, d2.surm,
                 d2.sünnikoht, d2.surmakoht
               ),
               NULL
            ),
          k.kirjeJutt = if(d.allikas IN ('EMI', 'TS'), d.jutt, NULL)
      WHERE d.created_by = user();


      -- Remove deleted records
      UPDATE repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
                                AND d.created_by = user()
                                AND d.Kustuta = '!'
      SET k.persoon = NULL;

      DELETE k FROM repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
                                AND d.created_by = user()
                                AND d.Kustuta = '!';

      -- Clean desktop
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (NULL,        NULL,       'desktop_flush', NULL,   user());
    END IF;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER repis.emaisalaud_BI BEFORE INSERT ON repis.emaisalaud FOR EACH ROW
  proc_label:BEGIN

    DECLARE msg TEXT;
    SET @ema = NULL;
    SET @isa = NULL;
    SET @kasuema = NULL;
    SET @kasuisa = NULL;
    SET @abikaasa = NULL;

    IF IFNULL(NEW.persoon, '') = '' THEN
      SELECT concat_ws('\n'
        , 'Alusta persooni koodiga'
        , USER()
        , NEW.created_by
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.created_by IS NULL THEN
      SET NEW.created_by = USER();
    END IF;

    SET NEW.kirjed = repis.func_persoonikirjed(NEW.persoon);

    SET @s_id = NULL;
    SET @s_kirjed = NULL;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'ema';
    SET NEW.ema = IFNULL(@s_id, ''), NEW.emakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'isa';
    SET NEW.isa = IFNULL(@s_id, ''), NEW.isakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'kasuema';
    SET NEW.kasuema = IFNULL(@s_id, ''), NEW.kasuemakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'kasuisa';
    SET NEW.kasuisa = IFNULL(@s_id, ''), NEW.kasuisakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'abikaasa';
    SET NEW.abikaasa = IFNULL(@s_id, ''), NEW.abikaasakirjed = @s_kirjed;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER repis.emaisalaud_AI AFTER INSERT ON repis.emaisalaud FOR EACH ROW
  proc_label:BEGIN

    INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,                 params, created_by)
    VALUES                           (NEW.persoon, NULL,       'raamatupere2emaisa', '',     NEW.created_by);

    if NEW.ema != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.ema,     NEW.created_by);
    END IF;
    if NEW.isa != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.isa,     NEW.created_by);
    END IF;
    if NEW.abikaasa != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.abikaasa,NEW.created_by);
    END IF;
    IF NEW.kasuema != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.kasuema, NEW.created_by);
    END IF;
    IF NEW.kasuisa != '' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.kasuisa, NEW.created_by);
    END IF;

    INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2, task, params, created_by)
    SELECT NULL AS kirjekood1, NULL AS kirjekood2, 'add2emaisa' AS task, persoon AS params, NEW.created_by AS created_by
      FROM repis.sugulased ei
     WHERE ei.sugulane = NEW.persoon;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER repis.emaisalaud_BU BEFORE UPDATE ON repis.emaisalaud FOR EACH ROW
  proc_label:BEGIN

    DECLARE msg TEXT;

    IF NEW.persoon != OLD.persoon THEN
      SELECT concat_ws('\n'
        , 'Foo! \n Ära muuda siin persooni koodi!'
        , USER()
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.ema = OLD.persoon OR NEW.isa = OLD.persoon OR NEW.abikaasa = OLD.persoon OR
       NEW.kasuema = OLD.persoon OR NEW.kasuisa = OLD.persoon THEN
      SELECT concat_ws('\n'
        , 'Foo! \n Ei ole enda sugulane ju!'
        , USER()
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.ema = 'E' THEN
      SET NEW.ema = repis.emadisad_next_id('E');
    END IF;
    IF NEW.isa = 'I' THEN
      SET NEW.isa = repis.emadisad_next_id('I');
    END IF;

    IF NEW.ema = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'ema'
        AND sugulane = OLD.ema AND persoon = OLD.persoon;
    END IF;
    IF NEW.isa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'isa'
        AND sugulane = OLD.isa AND persoon = OLD.persoon;
    END IF;
    IF NEW.kasuema = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'kasuema'
        AND sugulane = OLD.kasuema AND persoon = OLD.persoon;
    END IF;
    IF NEW.kasuisa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'kasuisa'
        AND sugulane = OLD.kasuisa AND persoon = OLD.persoon;
    END IF;
    IF NEW.abikaasa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'abikaasa'
        AND (  sugulane IN (SELECT k0.kirjekood FROM repis.kirjed k0 WHERE OLD.abikaasa regexp k0.kirjekood) AND persoon  = OLD.persoon
            OR persoon  IN (SELECT k0.kirjekood FROM repis.kirjed k0 WHERE OLD.abikaasa regexp k0.kirjekood) AND sugulane = OLD.persoon
            );
    END IF;

    SET NEW.emakirjed = repis.func_persoonikirjed(NEW.ema);
    SET NEW.isakirjed = repis.func_persoonikirjed(NEW.isa);
    SET NEW.abikaasakirjed = repis.func_persoonikirjed(NEW.abikaasa);
    SET NEW.kasuemakirjed = repis.func_persoonikirjed(NEW.kasuema);
    SET NEW.kasuisakirjed = repis.func_persoonikirjed(NEW.kasuisa);

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER repis.emaisalaud_AU AFTER UPDATE ON repis.emaisalaud FOR EACH ROW
  proc_label:BEGIN

    IF NEW.ema != OLD.ema THEN
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'ema', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.ema REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.ema = k0.kirjekood;
    END IF;
    IF NEW.isa != OLD.isa THEN
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'isa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.isa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.isa = k0.kirjekood;
    END IF;
    IF NEW.abikaasa != OLD.abikaasa THEN
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'abikaasa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.abikaasa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT k0.persoon, 'abikaasa', NEW.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.abikaasa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      -- VALUES                           (NEW.abikaasa, NEW.abikaasa, 'emaisalaud_replace', '',     NEW.created_by);
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.abikaasa regexp k0.kirjekood OR OLD.abikaasa regexp k0.kirjekood;
    END IF;
    IF NEW.kasuisa != OLD.kasuisa THEN
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'kasuisa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.kasuisa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.kasuisa regexp k0.kirjekood;
    END IF;
    IF NEW.kasuema != OLD.kasuema THEN
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'kasuema', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.kasuema REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.kasuema regexp k0.kirjekood;
    END IF;

    IF NEW.A = 'Valmis' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2, task,               params, created_by)
      VALUES                           (NULL,       NULL,       'emaisalaud_flush', '',     NEW.created_by);
    END IF;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`queue`@`localhost`*/ /*!50003 TRIGGER `kirjed_BI` BEFORE INSERT ON `kirjed` FOR EACH ROW proc_label:BEGIN

    DECLARE msg VARCHAR(2000);

    IF NEW.created_by != SUBSTRING_INDEX(user(), '@', 1) 
       AND NEW.created_by != 'michelek@localhost'
		 AND false THEN
      SELECT concat_ws(user(), '\n'
        , 'Kirjeid saab lisada ainult töölaualt.'
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;
    
    if NEW.persoon = '0'
    then
      SELECT LPAD(MAX(persoon)+1, 10, 0) INTO @new_persoon FROM repis.kirjed;
      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_persoon;
      SET NEW.allikas = 'Persoon';
    END if;

    if 'emi' IN (NEW.persoon, NEW.kirjekood)
    then
      SELECT MAX(persoon) INTO @new_persoon FROM repis.kirjed;
      SELECT CONCAT('EMI-', lpad(RIGHT(MAX(kirjekood), 6)+1, 6, '0')) 
		  INTO @new_kirjekood 
		  FROM repis.kirjed 
		 WHERE allikas = 'EMI';

      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_kirjekood;
      SET NEW.allikas = 'EMI';
    END if;

    if 'ts' IN (NEW.persoon, NEW.kirjekood)
    then
      SELECT MAX(persoon) INTO @new_persoon FROM repis.kirjed;
      SELECT CONCAT('TS-', lpad(RIGHT(MAX(kirjekood), 7)+1, 7, '0')) 
		  INTO @new_kirjekood
		  FROM repis.kirjed 
		 WHERE allikas = 'TS';

      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_kirjekood;
      SET NEW.allikas = 'TS';
    END if;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `kirjed_AI` AFTER INSERT ON `kirjed` FOR EACH ROW proc_label:BEGIN

	INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
	VALUES (NEW.persoon, '', 'proc_NK_refresh');
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`localhost`*/ /*!50003 TRIGGER `kirjed_BU` BEFORE UPDATE ON `kirjed` FOR EACH ROW proc_label:BEGIN

    DECLARE msg VARCHAR(2000);

    IF current_user() NOT IN ('michelek@localhost', 'ylle@localhost', 'queue@localhost') THEN
      SELECT concat_ws(current_user(), '\n'
        , 'Kirjeid saab muuta ainult töölaual.'
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF OLD.persoon = OLD.kirjekood AND OLD.persoon <> NEW.persoon AND 1 THEN
      INSERT INTO repis.z_queue (task, params)
		VALUES ('repis.merge_persons', CONCAT("'", NEW.persoon, "', '", OLD.persoon, "'"));
      -- SET NEW.persoon = OLD.persoon;
    END IF;

    IF NEW.allikas = 'EMI' THEN
      SET NEW.kirje = concat_ws('. ', 
                                if(NEW.KirjePersoon = '', NULL, NEW.KirjePersoon), 
                                if(NEW.kirjeJutt = '', NULL, NEW.kirjeJutt));
    END IF;

    IF NEW.allikas = 'TS' THEN
      SET NEW.KirjePersoon = repis.func_TS_KirjePersoon(NEW.kirjekood);
      SET NEW.kirje = concat_ws('. ', 
                                if(NEW.KirjePersoon = '', NULL, NEW.KirjePersoon), 
                                if(NEW.kirjeJutt = '', NULL, NEW.kirjeJutt));
    END IF;

    IF NEW.allikas = 'ELK' THEN
      SET NEW.kirje = func_person_text(NEW.kirjekood);
    END IF;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `kirjed_AU` AFTER UPDATE ON `kirjed` FOR EACH ROW proc_label:BEGIN

	if false then
	  leave proc_label;
	END if;

	if NEW.persoon   <> OLD.persoon
	OR NEW.kirje     <> OLD.kirje
	OR NEW.Eesnimi   <> OLD.Eesnimi
	OR NEW.Perenimi  <> OLD.Perenimi
	OR NEW.Emanimi   <> OLD.Emanimi
	OR NEW.Isanimi   <> OLD.Isanimi
	OR NEW.Sünd      <> OLD.Sünd
	OR NEW.Surm      <> OLD.Surm
	OR NEW.Sünnikoht <> OLD.Sünnikoht
	OR NEW.Surmakoht <> OLD.Surmakoht
	OR NEW.EiArvesta <> OLD.EiArvesta
	OR NEW.Peatatud  <> OLD.Peatatud
	OR NEW.pub_emem     <> OLD.pub_emem
	OR NEW.pub_kivi     <> OLD.pub_kivi
	OR NEW.pub_wwiiref  <> OLD.pub_wwiiref
	OR NEW.pub_evo      <> OLD.pub_evo
	OR NEW.pub_isPerson <> OLD.pub_isPerson
	OR NEW.updated_at <> OLD.updated_at
	THEN

		INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
		VALUES (NEW.persoon, '', 'proc_NK_refresh');
		-- CALL repis.proc_NK_refresh(NEW.persoon);
		
		IF NEW.persoon <> OLD.persoon THEN
			INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
			VALUES (OLD.persoon, '', 'proc_NK_refresh');
			--	CALL proc_NK_refresh(OLD.persoon);
		END IF;

	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `kirjed_BD` BEFORE DELETE ON `kirjed` FOR EACH ROW BEGIN
 if FALSE then
 
	if OLD.allikas = 'RK' then
		UPDATE import.repr_kart rk SET rk.persoon = NULL WHERE rk.isikukood = OLD.kirjekood;
	ELSEIF OLD.allikas = 'RR' then
		UPDATE import.rahvastikuregister rr SET rr.persoon = NULL WHERE rr.kirjekood = OLD.kirjekood;
	ELSEIF OLD.allikas = 'RPT' then
		UPDATE import.pensionitoimikud pt SET pt.persoon = NULL WHERE pt.kirjekood = OLD.kirjekood;
	END if;

 END if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `kirjed_AD` AFTER DELETE ON `kirjed` FOR EACH ROW proc_label:BEGIN

		INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
		VALUES (OLD.persoon, '', 'proc_NK_refresh');
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `sugulased_after_insert` AFTER INSERT ON `sugulased` FOR EACH ROW BEGIN

	CALL pub.2pub(new.persoon);
	CALL pub.2pub(new.sugulane);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`michelek`@`127.0.0.1`*/ /*!50003 TRIGGER `sugulased_after_update` AFTER UPDATE ON `sugulased` FOR EACH ROW BEGIN

	CALL pub.2pub(new.persoon);
	CALL pub.2pub(new.sugulane);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'repis'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `backup` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`michelek`@`localhost`*/ /*!50106 EVENT `backup` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-19 02:00:00' ON COMPLETION PRESERVE ENABLE DO CALL aruanded.memoriaal_ee() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `process_queue` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`michelek`@`127.0.0.1`*/ /*!50106 EVENT `process_queue` ON SCHEDULE EVERY 1 SECOND STARTS '2022-05-16 22:00:00' ON COMPLETION PRESERVE ENABLE DO CALL repis.process_queue() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 17:42:04
