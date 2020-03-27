CREATE DATABASE airbnb;
USE airbnb;

CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL,
	phone_number VARCHAR(120) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (email),
	UNIQUE KEY (phone_number)
);

CREATE TABLE profiles (
	user_id INT UNSIGNED NOT NULL,
	gender CHAR(1),
	birthday DATE,
	city_id INT UNSIGNED,
	country_id INT UNSIGNED,
	photo_id INT UNSIGNED,
	emergency_contact VARCHAR(120),
	id_card_scan_id INT UNSIGNED,
	profile_type INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE countries (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (name)
);

CREATE TABLE cities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	country_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (name, country_id)
);

CREATE TABLE profile_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (name)
);

CREATE TABLE payments (
	user_id INT UNSIGNED NOT NULL,
	token VARCHAR(255),
	bonuses INT UNSIGNED,
	currency_id INT UNSIGNED NOT NULL,
	bank_account VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	UNIQUE KEY (bank_account),
	UNIQUE KEY (token)
);

CREATE TABLE currencies (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	abbreviation CHAR(4),
	country_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (abbreviation, country_id)
);

CREATE TABLE media (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	media_type_id INT UNSIGNED NOT NULL,
	url VARCHAR(255),
	`size` INT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE media_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (name)
);

CREATE TABLE rates (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	ad_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE ads (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	heading TEXT,
	city_id INT UNSIGNED NOT NULL,
	country_id INT UNSIGNED NOT NULL,
	street VARCHAR(255),
	house_number INT UNSIGNED,
	apartment_number INT UNSIGNED,
	check_in TIME,
	checkout TIME,
	is_active BOOLEAN,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE houses_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(120),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (id, name)
);

CREATE TABLE about_house (
	ad_id INT UNSIGNED NOT NULL,
	max_guests INT UNSIGNED NOT NULL,
	beds INT UNSIGNED NOT NULL,
	bedrooms INT UNSIGNED NOT NULL,
	bathrooms INT UNSIGNED NOT NULL
);

CREATE TABLE amenities (
	ad_id INT UNSIGNED NOT NULL,
	kitchen BOOLEAN,
	free_parking_on_premises BOOLEAN,
	wifi BOOLEAN,
	cable_tv BOOLEAN,
	smoke_alarm BOOLEAN,
	carbon_monoxide_alarm BOOLEAN,
	air_conditioning BOOLEAN,
	hot_water BOOLEAN,
	pool BOOLEAN,
	cooking_basics BOOLEAN,
	cleaning_before_checkout BOOLEAN
);

CREATE TABLE ads_media (
	ad_id INT UNSIGNED NOT NULL,
	media_type_id INT UNSIGNED NOT NULL,
	url VARCHAR(255),
	`size` INT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	ad_id INT UNSIGNED NOT NULL,
	check_in DATE,
	checkout DATE,
	guests INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

DROP TABLE orders;

CREATE TABLE reviews (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	ad_id INT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY (id, user_id, ad_id)
);

CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  is_important TINYINT(1) DEFAULT NULL,
  is_delivered TINYINT(1) DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  read_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE logs (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	table_name VARCHAR(255) NOT NULL,
	table_id INT UNSIGNED NOT NULL,
	created_at DATETIME
);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT profiles_city_id_fk
    FOREIGN KEY (city_id) REFERENCES cities (id),
  ADD CONSTRAINT profiles_country_id_fk
    FOREIGN KEY (country_id) REFERENCES countries (id),
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media (id),
  ADD CONSTRAINT profiles_id_card_scan_id_fk
    FOREIGN KEY (id_card_scan_id) REFERENCES media (id),
  ADD CONSTRAINT profiles_profile_type_fk
    FOREIGN KEY (profile_type) REFERENCES profile_types (id);
 
ALTER TABLE payments
  ADD CONSTRAINT payments_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT payments_currency_id_fk
    FOREIGN KEY (currency_id) REFERENCES currencies (id);

ALTER TABLE cities
  ADD CONSTRAINT cities_country_id_fk
    FOREIGN KEY (country_id) REFERENCES countries (id);
 
ALTER TABLE media
  ADD CONSTRAINT meadi_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT meadi_media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types (id);

ALTER TABLE ads
  ADD CONSTRAINT ads_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT ads_city_id_fk
    FOREIGN KEY (city_id) REFERENCES cities (id),
  ADD CONSTRAINT ads_country_id_fk
    FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE ads
    ADD CONSTRAINT ads_house_type_id_fk
      FOREIGN KEY (house_type_id) REFERENCES houses_types (id);
      
ALTER TABLE about_house
  ADD CONSTRAINT about_house_ad_id
    FOREIGN KEY (ad_id) REFERENCES ads (id);
 
ALTER TABLE amenities
  ADD CONSTRAINT amenities_ad_id
    FOREIGN KEY (ad_id) REFERENCES ads (id);
    
ALTER TABLE ads_media
  ADD CONSTRAINT ads_media_ad_id
    FOREIGN KEY (ad_id) REFERENCES ads (id),
  ADD CONSTRAINT ads_media_media_type_id
    FOREIGN KEY (media_type_id) REFERENCES media_types (id);
   
ALTER TABLE orders 
  ADD CONSTRAINT orders_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT orders_ad_id
    FOREIGN KEY (ad_id) REFERENCES ads (id);
    
ALTER TABLE rates 
  ADD CONSTRAINT rates_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT rates_ad_id
    FOREIGN KEY (ad_id) REFERENCES ads (id);

ALTER TABLE reviews 
  ADD CONSTRAINT reviews_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id),
  ADD CONSTRAINT reviews_ad_id_fk
    FOREIGN KEY (ad_id) REFERENCES ads (id);

ALTER TABLE messages 
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users (id),
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users (id);
   
    
CREATE INDEX profiles_user_id_birthday_city_country_id_card_scan_id_idx 
          ON profiles (user_id, birthday, city_id, country_id, id_card_scan_id);

CREATE INDEX payments_user_id_bonuses_currency_id_idx 
          ON payments (user_id, bonuses, currency_id);
   
CREATE INDEX media_user_id_media_type_id_idx 
          ON media (user_id, media_type_id);
          
CREATE INDEX rates_user_id_ad_id_idx 
          ON rates (user_id, ad_id);
          
CREATE INDEX ads_user_id_city_id_country_id_idx 
          ON ads (user_id, city_id, country_id);

CREATE INDEX ads_media_ad_id_media_type_id_idx 
          ON ads_media (ad_id, media_type_id);

CREATE INDEX orders_user_id_ad_id_idx 
          ON orders (user_id, ad_id);

ALTER TABLE ads ADD COLUMN house_type INT UNSIGNED NOT NULL AFTER apartment_number;
ALTER TABLE ads ADD COLUMN price INT(5) UNSIGNED NOT NULL AFTER house_type;

ALTER TABLE ads RENAME COLUMN house_type TO house_type_id;

UPDATE ads SET house_type = FLOOR(1 + RAND() * 3);
UPDATE ads SET price = FLOOR(1 + RAND() * 1000);

UPDATE messages SET from_user_id = FLOOR(1 + RAND() * 200) WHERE from_user_id = to_user_id;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

