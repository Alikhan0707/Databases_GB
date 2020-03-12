--Задание №1

SELECT 
  users.name,
  COUNT(users.name) as total
FROM 
  orders
JOIN
  users
ON
  users.id = orders.user_id
GROUP BY users.name;

--Задание №2

SELECT * 
FROM 
  products
JOIN
  catalogs 
ON
  products.catalog_id = catalogs.id;