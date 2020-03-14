ALTER TABLE media 
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT media_media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types (id);
   
ALTER TABLE friendship 
  ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users (id),
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses (id);

ALTER TABLE likes
  ADD CONSTRAINT likes_user_id
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT likes_target_id
    FOREIGN KEY (target_id) REFERENCES users (id),
  ADD CONSTRAINT likes_target_type_id
    FOREIGN KEY (target_type_id) REFERENCES target_types (id);
   
ALTER TABLE communities
  ADD CONSTRAINT communities_media_id
    FOREIGN KEY (media_id) REFERENCES media (id);

ALTER TABLE communities_users 
  ADD CONSTRAINT communities_users_user_id
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT communities_users_community_id
    FOREIGN KEY (community_id) REFERENCES communities (id);
   
ALTER TABLE posts
  ADD CONSTRAINT posts_media_id
    FOREIGN KEY (media_id) REFERENCES media (id),
  ADD CONSTRAINT posts_user_id
    FOREIGN KEY (user_id) REFERENCES users (id);


