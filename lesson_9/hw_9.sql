-- Задание №1.1

START TRANSACTION;

	INSERT INTO sample.users SELECT id, name, birthday_at, created_at, updated_at FROM shop.users WHERE id = 1;
	DELETE FROM shop.users WHERE id = 1;

COMMIT;

-- Задание №1.2

CREATE VIEW full_products (product_name, catalog_name)
  AS SELECT  
    products.name,
    catalogs.name AS catalog_name
    FROM products 
    LEFT JOIN catalogs 
      ON products.catalog_id = catalogs.id;
     
SELECT * FROM full_products;

-- Задание №3.1

SELECT hello();

-- Задание №3.2

INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
	(NULL, NULL, 1000, 1);

