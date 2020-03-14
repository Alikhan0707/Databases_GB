SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

--Задание №2

SELECT 
  users.id, 
  CONCAT(first_name, ' ', last_name) AS owner,
  TIMESTAMPDIFF(YEAR, profiles.birthday, NOW()) AS age,
  COUNT(likes.id) AS total_likes
  FROM users
    JOIN profiles 
      ON users.id = profiles.user_id 
    JOIN likes
      ON profiles.user_id = likes.target_id
  GROUP BY users.id
  ORDER BY age, total_likes DESC
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
  CONCAT(first_name, ' ', last_name),
  MIN(TIMESTAMPDIFF(DAY, likes.created_at, NOW())) AS last_like,
  MIN(TIMESTAMPDIFF(DAY, messages.created_at, NOW())) AS last_message
  FROM users
    JOIN profiles 
      ON users.id = profiles.user_id
    JOIN likes 
      ON profiles.user_id = likes.user_id
    JOIN messages 
      ON profiles.user_id = messages.from_user_id
  GROUP BY users.id
  ORDER BY last_like DESC, last_message DESC;
 

