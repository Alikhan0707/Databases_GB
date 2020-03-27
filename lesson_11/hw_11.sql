-- Задание №1.1

CREATE TABLE logs (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	table_name VARCHAR(100),
	name VARCHAR(255),
	creted_at DATETIME,
	PRIMARY KEY (id)
) ENGINE = Archive;