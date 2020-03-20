DELIMITER //

CREATE TRIGGER valid_product_name_desc BEFORE INSERT ON products 
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
		SIGNAL SQLSTATE '45000' 
		  SET MESSAGE_TEXT = 'INCERT canceled, you can't `insert` `into` `table` `null` `values`';
	END IF;
END//