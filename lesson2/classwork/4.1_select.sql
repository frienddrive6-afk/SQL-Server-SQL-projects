--USE p42_company_db;

--SELECT *
--FROM employees; 


--SELECT 'vasia';



SELECT 
	'VASIA',
	'120',
	'vasia@gmail.com';



SELECT 
	5000 / 1 * 12,
	SIN(0) + COS(0),
	SYSUTCDATETIME();



SELECT 
	123 / 10,
	123.0 / 10,
	123 / 10.0;



SELECT 
	id,
	id / 10,
	CAST(id as float) / 100,
	id / 100.0
FROM 
	employees;



SELECT *
FROM employees;



SELECT id, name, birthday, email, position_id
FROM employees;



SELECT 
	e.id
FROM 
	employees AS e;




SELECT 
	e.last_name  + ' ' + e.first_name 	AS [full_name],
	e.hire_date 						AS [Дата приема на роботу],
	e.salary 							AS [Зарплата]
FROM
	employees AS e; 




SELECT 
	e.last_name + ' ' + e.middle_name 							AS [full_name],
	ISNULL(e.last_name, '') + ' ' + ISNULL(e.middle_name, '' )		AS[nullble_Full_name],
	CONCAT(e.last_name,' ',e.middle_name )
FROM 
	employees AS e; 




SELECT 
	e.id,
	e.name,
	e.salary / 100 * e.bonus_percent                     										AS[bonus_sum_!],
	ISNULL(e.salary, 0) / 100 * ISNULL(e.bonus_percent, e.extra_percent )                     	AS[bonus_sum_2],
	COALESCE(e.salary, 0) / 100 * COALESCE(e.bonus_percent, e.extra_percent, 0)					AS[bonus_sum_3]
FROM 
	employees AS e; 




------ DISTINCT ------




SELECT DISTINCT
	e.department_id 
FROM
	employees AS e;



SELECT DISTINCT
	e.department_id,
	e.position_id 
FROM
	employees AS e;


SELECT 
	I
FROM
	employees AS e;





