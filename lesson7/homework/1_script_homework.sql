

--1. Вывести пользователей, имеющих максимальное количество альбомов (включая возможных нескольких пользователей с одинаковым максимальным числом альбомов).
--| user_nickname| albums_count |
SELECT TOP 1 WITH TIES
    u.id,
    u.nickname,
    COUNT(a.id) 			AS album_count
FROM users u
LEFT JOIN albums a ON u.id = a.user_id
GROUP BY u.id, u.nickname
ORDER BY COUNT(a.id) DESC;




--2. Найти всех пользователей, у которых нет ни одного альбома.
--| id | nickname |

SELECT 
	u.id,
	u.nickname,
	(
		SELECT
			COUNT(*)
		FROM albums a 
		WHERE a.user_id = u.id
	)
FROM users u  
WHERE(
	SELECT
		COUNT(*)
	FROM albums a 
	WHERE a.user_id = u.id
) = 0;





--3. Вывести альбомы с рейтингом выше среднего значения рейтинга всех альбомов.
--| id | title | rate |

DECLARE @VAG_rate_albums int = (
	SELECT
		AVG(a.rate)
	FROM albums a 
);
--SELECT @VAG_rate_albums
SELECT
	a.id,
	a.title,
	a.rate
FROM albums a 
WHERE a.rate > @VAG_rate_albums





--4. Найти пользователей, у которых есть альбомы, не содержащие ни одного изображения.
--| id | nickname | empty_albums |


SELECT 
    u.id, 
    u.nickname,
    (SELECT COUNT(*) 
     FROM albums a 
     WHERE a.user_id = u.id 
       AND a.id NOT IN (SELECT i.album_id FROM images i)) AS empty_albums
FROM users u
WHERE u.id IN (
    SELECT a.user_id
    FROM albums a
    WHERE a.id NOT IN (SELECT album_id FROM images)
);





--5. Для каждого альбома вывести самое свежее изображение (по дате публикации).
--| alb_title| img_title | max_publish_date |


SELECT 
    a.title 				AS [alb_title], 
    i.title 				AS [img_title], 
    i.publish_date			AS [max_publish_date]
FROM images i
JOIN albums a ON i.album_id = a.id
WHERE i.publish_date = (
    SELECT MAX(i2.publish_date)
    FROM images i2
    WHERE i2.album_id = i.album_id
)
ORDER BY a.title;







