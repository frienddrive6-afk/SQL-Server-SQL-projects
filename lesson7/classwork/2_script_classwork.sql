



--TASK
--Показать пользователей который создавали альбомы



SELECT 
	u.id,
	u.nickname 
FROM albums a 
	LEFT JOIN users u ON a.user_id  = u.id 
GROUP BY u.id, u.nickname 




--EXISTS / NOT EXISTS
SELECT 
	u.nickname 
FROM users u 
WHERE EXISTS (
	SELECT u.id 
	FROM albums a 
	WHERE a.user_id = u.id
)



SELECT 
	u.nickname 
FROM users u 
WHERE NOT EXISTS (
	SELECT u.id 
	FROM albums a 
	WHERE a.user_id = u.id
)









--TASK
--Показать пользователей у которых более > 1 альбома

SELECT 
	u.nickname 
FROM users u 
WHERE (
	SELECT COUNT(a.id) 
	FROM albums a 
	WHERE a.user_id = u.id
 ) > 1

--Ради тренеровки

 

SELECT 
	u.nickname 
FROM users u 
WHERE EXISTS(
	SELECT
		a.user_id
	FROM albums a 
	WHERE a.user_id = u.id
	GROUP BY a.user_id
	HAVING COUNT(a.user_id ) > 1
)




-- ALL / ANY / IN

--TASK
-- Вывести пользователей у который есть альбомы с рейтингом 5

SELECT
	u.id,u.email 
FROM users u
WHERE EXISTS (
	SELECT
		a.id
	FROM albums a 
	WHERE a.user_id = u.id AND  a.rate = 5
)




SELECT
	u.id,u.email 
FROM users u
WHERE u.id IN (
	SELECT a.id
	FROM albums a 
	WHERE a.rate = 5
)





SELECT
	u.id,u.email 
FROM users u
WHERE u.id = ANY(
	SELECT a.id
	FROM albums a 
	WHERE a.rate = 5
)





--TASK
--









