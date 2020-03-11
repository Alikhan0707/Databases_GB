CREATE TABLE users_new (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO 
  users_new
SELECT 
  NULL, name, birthday_at, 
  CAST(CONCAT(
   CAST(SUBSTRING_INDEX(created_at, ' ', 1) AS DATE), ' ',
   CAST(SUBSTRING_INDEX(created_at, ' ', -1) AS TIME) 
  ) AS DATETIME),
  CAST(CONCAT(
   CAST(SUBSTRING_INDEX(updated_at, ' ', 1) AS DATE), ' ',
   CAST(SUBSTRING_INDEX(updated_at, ' ', -1) AS TIME) 
  ) AS DATETIME) 
FROM users;

TRUNCATE TABLE users; 

ALTER TABLE users_new RENAME users;

SELECT * FROM storehouses_products WHERE value > 0 ORDER BY value;

SELECT FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25)) as average_age FROM users;

SELECT 
  COUNT(*) AS total, 
  WEEKDAY(INTERVAL EXTRACT(YEAR FROM NOW()) YEAR + birthday) AS day_of_week
FROM users GROUP BY day_of_week;