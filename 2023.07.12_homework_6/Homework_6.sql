DROP FUNCTION IF EXISTS convert_seconds;
DELIMITER //
CREATE FUNCTION convert_seconds(
    seconds INT
) RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds_result INT;
    DECLARE result VARCHAR(100);

    SET days = seconds DIV 86400;
    SET seconds = seconds MOD 86400;
    SET hours = seconds DIV 3600;
    SET seconds = seconds MOD 3600;
    SET minutes = seconds DIV 60;
    SET seconds_result = seconds MOD 60;

    SET result = CONCAT(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', seconds_result, ' seconds');
    
    RETURN result;
END;
	
SELECT convert_seconds(123456);



DELIMITER //

CREATE PROCEDURE pnumbers()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE numbers VARCHAR(100) DEFAULT '';
    
    WHILE counter <= 10 DO
        IF counter % 2 = 0 THEN
            IF numbers = '' THEN
                SET numbers = CAST(counter AS CHAR);
            ELSE
                SET numbers = CONCAT(numbers, ', ', CAST(counter AS CHAR));
            END IF;
        END IF;
        
        SET counter = counter + 1;
    END WHILE;
    
    SELECT numbers;
END //

DELIMITER ;

CALL pnumbers();
