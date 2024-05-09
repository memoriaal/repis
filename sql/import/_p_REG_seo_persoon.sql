BEGIN

    -- Declare variables to hold table name and SQL statement
    DECLARE done INT DEFAULT FALSE;
    DECLARE tbl_name CHAR(64);
    DECLARE stmt VARCHAR(255);
    DECLARE msg VARCHAR(255);

    -- Cursor declaration to iterate over import tables
    DECLARE cur1 CURSOR FOR
    SELECT concat('imp.',table_name)
    FROM information_schema.tables tb
    where tb.TABLE_SCHEMA = 'imp'
    and tb.TABLE_NAME not in ('pereregister','rahvastikuregister');

    -- Declare continue handler to exit the loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Check input parameters. 
    -- in_kirjekood must be exactly 10 characters long
    -- in_old_persoon must be exactly 10 characters long or NULL
    -- in_new_persoon must be exactly 10 characters long or NULL
    -- Both old and new persoon cannot be NULL at the same time
    IF in_kirjekood IS NULL THEN
        SET msg = concat('REG_seo_persoon: ', 'Kirjekood ei saa olla NULL');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    IF LENGTH(in_kirjekood) <> 10 THEN
        SET msg = concat('REG_seo_persoon: ', 'Kirjekood peab olema täpselt 10 tähemärki pikk');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    IF LENGTH(in_old_persoon) <> 10 AND in_old_persoon IS NOT NULL THEN
        SET msg = concat('REG_seo_persoon: ', 'Vana persoon peab olema täpselt 10 tähemärki pikk või NULL');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    IF LENGTH(in_new_persoon) <> 10 AND in_new_persoon IS NOT NULL THEN
        SET msg = concat('REG_seo_persoon: ', 'Uus persoon peab olema täpselt 10 tähemärki pikk või NULL');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    IF in_old_persoon IS NULL AND in_new_persoon IS NULL THEN
        SET msg = concat('REG_seo_persoon: ', 'Vana ja uus persoon ei saa olla NULL samal ajal');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;


    -- Set the source according to prefix of in_kirjekood
    IF in_kirjekood LIKE 'PR-%' THEN
        SET @source = 'pereregister';
    ELSEIF in_kirjekood LIKE 'RR-%' THEN
        SET @source = 'rahvastikuregister';
    ELSE
        SET msg = concat('REG_seo_persoon: ', 'Kirjekood olgu RR või PR oma: ', in_kirjekood);
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;

    -- Open the cursor
    OPEN cur1;

    -- Loop through all tables in the database
    read_loop: LOOP

        -- Fetch the table name
        FETCH cur1 INTO tbl_name;

        -- Exit the loop if no more tables
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Build the SQL statements
        IF in_new_persoon is null then
            -- Remove from repis.kirjed all rows with kirjekood = in_kirjekood
            DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;
            
            -- Set persoon = NULL for all rows with source = in_kirjekood
            SET @stmt = CONCAT(
                'UPDATE IGNORE ', tbl_name, 
                ' SET persoon = NULL',
                ' WHERE ', @source, ' = ''', in_kirjekood, 
                ''' AND persoon = ''', in_old_persoon, ''';'
            );
            PREPARE stmt FROM @stmt;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        ELSEIF in_old_persoon is null then
            -- import source = in_kirjekood
            if @source = 'pereregister' then
                CALL imp.import_pereregister(in_kirjekood);
            ELSEIF @source = 'rahvastikuregister' then
                CALL imp.import_rahvastikuregister(in_kirjekood);
            END IF;

            -- Set persoon = in_new_persoon for all rows with source = in_kirjekood
            SET @stmt = CONCAT(
                'UPDATE IGNORE ', tbl_name, 
                ' SET persoon = ''', in_new_persoon, '''',
                ' WHERE ', @source, ' = ''', in_kirjekood, ''';'
            );
            PREPARE stmt FROM @stmt;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        ELSE
            -- Remove from repis.kirjed all rows with kirjekood = in_kirjekood
            DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;
            -- import source = in_kirjekood
            if @source = 'pereregister' then
                CALL imp.import_pereregister(in_kirjekood);
            ELSEIF @source = 'rahvastikuregister' then
                CALL imp.import_rahvastikuregister(in_kirjekood);
            END IF;

            -- Set persoon = in_new_persoon for all rows with source = in_kirjekood
            SET @stmt = CONCAT(
                'UPDATE IGNORE ', tbl_name, 
                ' SET persoon = ''', in_new_persoon, '''',
                ' WHERE ', @source, ' = ''', in_kirjekood, ''';'
            );
            PREPARE stmt FROM @stmt;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;           
        end if;

    END LOOP;

END