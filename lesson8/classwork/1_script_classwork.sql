


-- ================= INSERT ========


-- INSERT [INTO] <tabele> [<fields ....> ] VALUES (<values>);
-- INSERT [INTO] <tabele> [<fields ....> ] SELECT ...


INSERT INTO albums (title, creation_date, user_id,rate)
VALUES ('p42',GETDATE(),10,1);



INSERT INTO albums (title, creation_date, user_id,rate)
VALUES 
	('p42a',GETDATE(),10,1),
	('p42b',GETDATE(),10,1),
	('p42c',GETDATE(),10,1),
	('p42d',GETDATE(),10,1),
	('p42e',GETDATE(),10,1);



-- ERROR
--INSERT INTO albums (title, creation_date,rate)
--VALUES ('p42',GETDATE(),1);

	
--ERROR
--INSERT INTO albums (id,title, creation_date, user_id,rate)
--VALUES (5000,'p42',GETDATE(),10,1);
	


SET IDENTITY_INSERT albums ON;

INSERT INTO albums (id,title, creation_date, user_id,rate)
VALUES (5000,'p42xxxxxx',GETDATE(),10,1);


SET IDENTITY_INSERT albums OFF;

	
	
	
--Вернуть при вставке значение id
INSERT INTO albums (title, creation_date, user_id,rate)
OUTPUT inserted.id
VALUES ('p42_xxxx',GETDATE(),10,1);





CREATE TABLE dbo.users_log (
    nick NVARCHAR(50) NULL,
    email_address NVARCHAR(50) NULL
);






INSERT INTO users_log (nick, email_address)
	SELECT
		nickname,email
	FROM users 
	WHERE email LIKE 'c%'
	ORDER BY email;









--CTE (Commor Table Expression)


WITH src AS (
	SELECT  u.nickname, u.email 
	FROM users u
	WHERE email LIKE 'd%'
	);

	
INSERT INTO users_log (nick, email_address)
SELECT nickname, email
FROM src;






-- ======== UPDATE =====


UPDATE albums 
SET rate = 12
WHERE id = 5001;




UPDATE albums 
SET rate = 2
WHERE rate = 1


UPDATE albums 
SET deleted_at = GETDATE()
WHERE id = 5001;




-- ============== DELETE ==============

-- Отчистка таблици без сброса счетчика IDENTITY
DELETE FROM users_log 

-- Отчистка таблици со сброса счетчика IDENTITY значение seed (обычно это ноль)
TRUNCATE TABLE albums ;




DELETE FROM albums  
WHERE id = 5000;

































