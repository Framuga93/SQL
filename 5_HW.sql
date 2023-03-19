#Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
CREATE OR REPLACE VIEW likes_under_18 AS
SELECT 
	COUNT(*) AS cnt,
	m.user_id,
	p.birthday 
FROM media AS m
JOIN likes AS l ON (
	l.media_id = m.id )
JOIN profiles AS p ON (
	m.user_id = p.user_id) 
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < 18
GROUP BY m.user_id 

#Выведите данные, используя написанное представление [SELECT]
SELECT *
FROM likes_under_18

#Удалите представление [DROP VIEW]
DROP VIEW likes_under_18