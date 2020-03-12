SELECT * FROM likes;

-- Задание №2
SELECT 
   COUNT(user_id) AS total,
   (SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) FROM profiles WHERE profiles.user_id = likes.user_id) AS age
  FROM likes 
  GROUP BY user_id 
  ORDER BY age
  LIMIT 10;
  
SELECT * FROM profiles;

-- Задание №3
SELECT
   COUNT(user_id) as total,
   (SELECT gender FROM profiles WHERE profiles.user_id = likes.user_id) AS gender
  FROM likes
  GROUP BY gender
  ORDER BY total;
  
-- Задание №4
SELECT * FROM media;
SELECT * FROM messages;

SELECT
  COUNT(user_id) AS total,
  (SELECT 
     TIMESTAMPDIFF(DAY, updated_at , NOW())
    FROM profiles 
    WHERE profiles.user_id = likes.user_id) AS profile_age,
  (SELECT 
     MAX(TIMESTAMPDIFF(DAY, created_at, NOW())) AS last_mes
    FROM messages 
    WHERE messages.from_user_id = likes.user_id
    GROUP BY from_user_id) AS last_message
  FROM likes
  GROUP BY user_id 
  ORDER BY last_message DESC
  LIMIT 10;