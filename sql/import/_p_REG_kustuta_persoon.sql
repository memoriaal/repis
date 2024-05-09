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

    -- Check input parameters. Both should be exactly 10 characters long
    IF in_kirjekood IS NULL OR in_persoon IS NULL THEN
        SET msg = concat('REG_kustuta_persoon: ', 'Input parameters cannot be NULL');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    IF LENGTH(in_kirjekood) <> 10 OR LENGTH(in_persoon) <> 10 THEN
        SET msg = concat('REG_kustuta_persoon: ', 'Input parameters must be exactly 10 characters long');
        call repis.log_msg(in_kirjekood, msg, 'error');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;


    -- Set the source according to prefix of in_kirjekood
    IF in_kirjekood LIKE 'PR-%' THEN
        SET @source = 'pereregister';
    ELSEIF in_kirjekood LIKE 'RR-%' THEN
        SET @source = 'rahvastikuregister';
    ELSE
        SET msg = concat('REG_kustuta_persoon: ', 'Kirjekood olgu RR või PR oma: ', in_kirjekood);
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

        -- Build the SQL statement
        -- Set persoon = NULL for all rows with kirjekood = in_kirjekood
        SET @stmt = CONCAT(
            'UPDATE IGNORE ', tbl_name, 
            ' SET persoon = NULL',
            ' WHERE ', @source, ' = ''', in_kirjekood, 
            ''' AND persoon = ''', in_persoon, ''';'
        );

        -- Prepare and execute the SQL statement
        PREPARE stmt FROM @stmt;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

    END LOOP;

END