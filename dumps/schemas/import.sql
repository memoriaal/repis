-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: import
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `import`
--


USE `import`;
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

