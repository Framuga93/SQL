USE vk;

DROP TABLE IF EXISTS video;
CREATE TABLE video(
	id SERIAL,
	name VARCHAR(100),
	upload_date DATETIME DEFAULT NOW(),
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);



#DROP TABLE IF EXISTS group_chat;
#CREATE TABLE group_chat(
#	id SERIAL;
#);
#
#CREATE TABLE group_chat_mesg LIKE messaages;
#ALTER TABLE group_chat_mesg
#MODIFY COLUMN to_user_id to_group_chat_id;
#FOREIGN KEY (to_group_chat_id) REFERENCES group_chat(id);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
	id SERIAL,
	name VARCHAR(100) NOT NULL
);

ALTER TABLE profiles ADD COLUMN city_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_city_id
FOREIGN KEY (city_id) REFERENCES cities(id);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	body VARCHAR(250),
	post_date DATETIME DEFAULT NOW()
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);


INSERT INTO users VALUES
('1', 'Alex', 'Smith', 'lex@example.org', '9374071116'),
('2', 'Carlos', 'Diego', 'carlos@example.org', '9374046516'),
('3', 'Boris', 'Elcin', 'elcin@example.org', '93740234234'),
('4', 'Albert', 'Enshtein', 'h2o@example.org', '93723412376'),
('5', 'Vladimir', 'Putin', 'Russia@example.org', '974656564758'),
('6', 'Dmitrii', 'Medvedev', 'ruissia@example.org', '97867876978'),
('7', 'Vladimir', 'Gjerenovski', 'LDPR@example.org', '9234354253'),
('8', 'Leonid', 'Agutin', 'Agotushka@example.org', '91239085732'),
('9', 'Stas', 'Boretski', 'stason666@example.org', '91231534543'),
('10', 'Bruno', 'Mars', 'MARS@example.org', '912314511233')
;

INSERT INTO cities VALUES
('1','Mocsow'),
('2','Saint_Peterburg'),
('3','Kazan'),
('4','Bryansk§'),
('5','Smolensk'),
('6','Yarosla§vl'),
('7','Sibir'),
('8','Antalya'),
('9','Osetia'),
('10','Chechnya'),
('1','Tver')
;
