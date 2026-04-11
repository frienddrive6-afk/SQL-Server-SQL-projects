

--Задача 1
SELECT
	e.last_name,
	e.first_name,
	e.salary,
	CASE
		WHEN e.salary >= 2000 THEN 'high'
		WHEN e.salary >=1600 THEN 'medium'
		ELSE 'low'
	END													AS [evaluation]
FROM employees AS e
WHERE e.department_id = 3
ORDER BY e.salary DESC








--Задача 2
SELECT 
	e.last_name,
	e.first_name,
	e.email,
	e.birthday 
FROM employees AS e 
WHERE e.email LIKE '%.com' AND LOWER(e.last_name) LIKE N'%о%' AND YEAR(e.birthday) >= 1982 AND YEAR(e.birthday) <= 1983



--Задача 3
SELECT 
	e.name,
	e.salary,
	IIF(e.bonus_percent IS NOT NULL, 'has bonus', 'no bonus') 																	AS[bonus_status]
FROM employees AS e 
WHERE e.salary >= 1500 AND e.salary <=2000



--Задача 4
SELECT TOP 2 WITH TIES
	e.last_name,
	e.first_name,
	e.department_id,
	e.salary
FROM employees AS e 
WHERE e.department_id IN (1, 3)
ORDER BY e.salary DESC



--Задача 5
SELECT 
	CONCAT(e.last_name,' ',e.first_name,' ',ISNULL(e.middle_name,'')) 								AS [full_name],
	e.salary + (e.salary / 100 * ISNULL(e.bonus_percent,0))											AS [salary_with_bonus]
FROM employees AS e 




--Задача 6
SELECT
	COUNT(*)								AS [total_employees],
	COUNT(*) - COUNT(e.bonus_percent)		AS [total_with_bonus],
	MAX(e.salary)							AS [max_salary],
	MIN(e.salary)							AS [min_salary],
	AVG(e.salary)							AS [avg_salary],
	SUM(e.salary)							AS[total_salary_fund]
FROM employees AS e 




--Задача 7
SELECT 
	COUNT(*)									AS [it_count],
	COUNT(DISTINCT e.department_id)				AS [it_unique_departments],
	SUM(e.salary / 100 * e.bonus_percent)		AS [it_total_bonus],
	AVG(e.salary) 								AS [it_avg_salary] 
FROM employees AS e 
WHERE e.department_id  = 3




--Задача 8
SELECT TOP 3
	CASE
		WHEN e.salary <= 2000 THEN 'A'
		ELSE 'B'
	END,
	e.last_name,
	e.first_name,
	e.salary 
FROM employees AS e
ORDER BY 
	CASE
		WHEN e.salary <= 2000 THEN 'A'
		ELSE 'B'
	END,
	e.last_name 

	
	
--Задача 9
SELECT
	e.last_name,
	e.first_name,
	e.birthday,
	DATEDIFF(year, e.birthday, GETDATE())
FROM employees AS e 
WHERE DATEDIFF(year, e.birthday, GETDATE()) > 40
ORDER BY DATEDIFF(year, e.birthday, GETDATE()) DESC



--Задача 10
SELECT
	SUM(e.salary + e.salary / 100 * COALESCE(e.bonus_percent ,e.extra_percent ,0)) 				AS [total_fund],
	COUNT(*)																					AS [employees_count],
	AVG(e.salary + e.salary / 100 * COALESCE(e.bonus_percent ,e.extra_percent ,0))				AS [avg_payment]
FROM employees AS e 
WHERE e.department_id NOT IN(4, 5)









