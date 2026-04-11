


SELECT e.id,e.name, e.salary 
FROM employees AS e
--WHERE e.last_name  LIKE N'%ов'
--WHERE e.last_name LIKE N'%ре%'
--WHERE e.email LIKE N'%.com'
--WHERE e.email LIKE '%.c__'
--WHERE e.email LIKE '%.[cbr]__'
--WHERE e.email LIKE '%.[^a-c]__'
--WHERE e.email LIKE '%.!%__' ESCAPE '!'
WHERE LOWER(e.email) LIKE '%.pro'





-- ================== DATE / TIME functions

DECLARE @year int = 1982;

SELECT *
FROM employees AS e 
WHERE YEAR(e.birthday) = @year


-- Отобрать пользователей у которых сегодня др
DECLARE @now datetime = GETDATE();

SELECT *
FROM employees AS e 
WHERE MONTH(e.birthday) = MONTH(@now) AND DAY(e.birthday) = DAY(@now)





DECLARE @d date = '20260409'
--SELECT @d
SELECT DATEDIFF(year, @d, GETDATE())



-- Вывести возраст служащих
SELECT 
	e.id,
	e.name,
	DATEDIFF(year, e.birthday, GETDATE()) 				AS [age]
FROM employees AS e 





SELECT CONVERT(DATE,'20260409', 103);



