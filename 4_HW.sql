
#Подсчитать количество групп, в которые вступил каждый пользователь.

SELECT COUNT(*), user_id 
FROM users_communities
GROUP BY user_id 

#Подсчитать количество пользователей в каждом сообществе.

SELECT COUNT(*), community_id  
FROM users_communities uc 
GROUP BY community_id 

#Пусть задан некоторый пользователь. Из всех пользователей соц. 
#сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT 
	COUNT(*) AS cnt,
	from_user_id,
	to_user_id 
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY cnt DESC

#* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..

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

#* Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT 
	COUNT(*) as cnt,
	p.gender 
FROM profiles as p
JOIN likes as l ON (
	p.user_id = l.user_id)
GROUP BY gender 
