


-- ============ ORDER BY =============


SELECT 
	e.last_name,
	e.first_name,
	e.salary 
FROM employees AS e
ORDER BY last_name;





SELECT 
	e.last_name,
	e.first_name,
	e.salary 
FROM employees AS e
ORDER BY last_name DESC;




SELECT 
	e.last_name,
	e.first_name,
	e.salary 
FROM employees AS e
ORDER BY e.salary , e.last_name;




SELECT 
	e.last_name,
	e.first_name
FROM employees AS e
ORDER BY e.salary;




-- ============== TOP ================


SELECT TOP 3
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS e
ORDER BY e.salary;




SELECT TOP 50 PERCENT
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS e
ORDER BY e.salary;




-- Вернуть первых 3х пользователей с наименьшим зарплатой

-- :-((((
SELECT TOP 3
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS  e
ORDER BY e.salary;


-- :-)))
SELECT TOP 3
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS  e
ORDER BY e.salary, id;



-- Вернуть первых 2х пользователей с наименьшим зарплатой

-- :-((((
SELECT TOP 2
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS  e
ORDER BY e.salary;



SELECT TOP 2 WITH TIES
	e.id,
	e.last_name,
	e.first_name,
	e.salary
FROM employees AS  e
ORDER BY e.salary;





SELECT 
	e.first_name,
	e.last_name 
FROM employees AS e
ORDER BY CONCAT(e.first_name ,e.last_name)



-- ==============================


SELECT 
	CONCAT(e.first_name,e.last_name)					AS [full_name]
FROM employees AS e
ORDER BY full_name;



SELECT DISTINCT 
	e.last_name,
	e.first_name,
	e.salary 
FROM employees AS e
ORDER BY e.last_name;



SELECT 
	e.bonus_percent 
FROM employees AS e
ORDER BY ISNULL(e.bonus_percent,1000) ;




-- Выбрать 2 минимальные зарплаты
SELECT DISTINCT TOP 2
	e.salary
FROM employees AS e
ORDER BY e.salary;













