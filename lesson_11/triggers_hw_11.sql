DELIMITER //

CREATE TRIGGER users_logs AFTER INSERT ON users
FOR EACH ROW BEGIN 
	INSERT INTO logs (table_name, name, creted_at)
	  VALUES
	  ('users', NEW.name, NEW.created_at);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER catalogs_logs AFTER INSERT ON catalogs
FOR EACH ROW BEGIN 
	INSERT INTO logs (table_name, name, creted_at)
	  VALUES
	  ('catalogs', NEW.name, NOW());
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER products_logs AFTER INSERT ON products
FOR EACH ROW BEGIN 
	INSERT INTO logs (table_name, name, creted_at)
	  VALUES
	  ('products', NEW.name, NEW.created_at);
END//

DELIMITER ;