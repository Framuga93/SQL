SELECT firstname 
FROM users
GROUP BY firstname 

SELECT COUNT(*)
FROM profiles 
WHERE (birthday + INTERVAL 35 YEAR) < NOW()

SELECT COUNT(*)
FROM friend_requests
GROUP BY status 

SELECT COUNT(*),initiator_user_id 
FROM friend_requests
GROUP BY initiator_user_id 

SELECT *
FROM communities
WHERE name LIKE '_____'