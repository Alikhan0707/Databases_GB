SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
USE vk;
--Задание №2

SELECT 
  users.id,
  likes.target_type_id, 
  CONCAT(first_name, ' ', last_name) AS owner,
  TIMESTAMPDIFF(YEAR, profiles.birthday, NOW()) AS age,
  COUNT(likes.id) AS total_likes
  FROM users
    JOIN profiles 
      ON users.id = profiles.user_id 
    JOIN likes
      ON profiles.user_id = likes.target_id
  WHERE likes.target_type_id = 2
  GROUP BY users.id
  ORDER BY age, total_likes
  LIMIT 10;

--Задание №3
 
SELECT 
  profiles.gender,
  COUNT(likes.user_id) AS total_likes
  FROM likes
    JOIN profiles
      ON likes.user_id = profiles.user_id 
  GROUP BY profiles.gender
  ORDER BY total_likes DESC;
    
--Задание №4

SELECT 
  users.id,
  CONCAT(first_name, ' ', last_name) AS owner,
  MIN(TIMESTAMPDIFF(DAY, likes.created_at, NOW())) AS last_like,
  MIN(TIMESTAMPDIFF(DAY, messages.created_at, NOW())) AS last_message
  FROM users
    LEFT JOIN profiles 
      ON users.id = profiles.user_id
    LEFT JOIN likes 
      ON profiles.user_id = likes.user_id
    LEFT JOIN messages 
      ON profiles.user_id = messages.from_user_id
  GROUP BY likes.user_id
  ORDER BY last_like DESC, last_message DESC
  LIMIT 10;
 
SELECT * FROM likes;
