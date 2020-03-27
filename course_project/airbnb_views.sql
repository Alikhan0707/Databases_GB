CREATE VIEW ads_for_users 
  AS SELECT 
       ads.id,
       ads.user_id AS host_id,
       CONCAT(users.first_name, ' ', users.last_name) AS host_fullname,
       ads.heading,
       CONCAT(countries.name, ', ', 
         cities.name, ', ', 
         ads.street, ', ', 
         ads.house_number, ', ', 
         ads.apartment_number) AS address,
       houses_types.name AS house_type,
       ads.price,
       ads.check_in,
       ads.checkout,
       ads.updated_at AS free_from
       FROM ads
         LEFT JOIN cities 
           ON cities.id = ads.city_id 
         LEFT JOIN countries 
           ON countries.id = ads.country_id
         LEFT JOIN houses_types 
           ON houses_types.id = ads.house_type_id 
         LEFT JOIN users
           ON users.id = ads.user_id 
       WHERE is_active = TRUE;
      
CREATE VIEW profiles_data
  AS SELECT
       ads.id,
       CONCAT(users.first_name, ' ', users.last_name) AS fullname,
       profile_types.name AS profile_type,
       reviews.body AS review_body,
       CONCAT(countries.name, ', ', cities.name) AS `from`,
       users.created_at AS since
       FROM profiles
         LEFT JOIN users
           ON profiles.user_id = users.id
         LEFT JOIN cities
           ON profiles.city_id = cities.id
         LEFT JOIN countries
           ON profiles.country_id = countries.id
         LEFT JOIN media
           ON media.id = profiles.photo_id
         LEFT JOIN ads
           ON ads.user_id = profiles.user_id 
         LEFT JOIN reviews
           ON reviews.ad_id = ads.id
         LEFT JOIN profile_types
           ON profiles.profile_type = profile_types.id
         WHERE ads.id IS NOT NULL;
       
