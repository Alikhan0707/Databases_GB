DELIMITER //

CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW 
BEGIN
	INSERT INTO logs (table_name, table_id, creted_at)
	  VALUES
	  ('users', NEW.id, NEW.created_at);
END

DELIMITER ;

DELIMITER //

CREATE TRIGGER ads_log AFTER INSERT ON ads
FOR EACH ROW 
BEGIN
	INSERT INTO logs (table_name, table_id, creted_at)
	  VALUES
	  ('ads', NEW.id, NEW.created_at);
END

DELIMITER ;

DELIMITER //

CREATE TRIGGER orders_log AFTER INSERT ON orders
FOR EACH ROW 
BEGIN
	INSERT INTO logs (table_name, table_id, creted_at)
	  VALUES
	  ('orders', NEW.id, NEW.created_at);
END

DELIMITER ;