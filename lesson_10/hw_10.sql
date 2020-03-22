-- Задание №1
-- Предлагается проиндексировать столбцы 
-- to_user_id, from_user_id таблицы messages 
-- user_id таблицы friendship
-- user_id таблицы posts
-- т.к. к этим таблицам по-моему мнению будет наибольшее количество запросов

CREATE INDEX messages_to_user_id_from_user_id ON messages(to_user_id, from_user_id);
CREATE INDEX friendship_user_id_friend_id_idx ON friendship(user_id);
CREATE INDEX posts_user_id ON posts(user_id);

-- Задание 2

SELECT DISTINCT 
  c.name, 
  COUNT(cu.user_id) OVER () / (SELECT COUNT(id) FROM communities) AS average_count_users,
  MIN(TIMESTAMPDIFF(YEAR, p.birthday, NOW())) OVER w AS youngest_user_age,
  MAX(TIMESTAMPDIFF(YEAR, p.birthday, NOW())) OVER w AS oldest_user_age,
  COUNT(cu.user_id) OVER w AS total_users_in_community,
  COUNT(u.id) OVER () AS total_users_in_system,
  COUNT(cu.user_id) OVER w / COUNT(u.id) OVER() * 100 AS `%%`
  FROM communities c
    JOIN communities_users cu
      ON c.id = cu.community_id
	JOIN users u
      ON cu.user_id = u.id
	JOIN profiles p
      ON u.id = p.user_id
      WINDOW w AS (PARTITION BY c.id );
      



