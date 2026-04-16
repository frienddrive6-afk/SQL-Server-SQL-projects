





SELECT 
	'const_string',
	COUNT(*)							AS[Общее количество],
	COUNT(e.id)							AS[Количество не NULL id],
	COUNT(DISTINCT e.department_id)		AS[Количество не NULL уникальных department_id]
FROM employees AS e 
GROUP BY e.department_id




SELECT 
	'const_string',
	e.position_id,
	e.department_id,
	COUNT(*)							AS[Общее количество],
	COUNT(e.id)							AS[Количество не NULL id],
	COUNT(DISTINCT e.department_id)		AS[Количество не NULL уникальных department_id]
FROM employees AS e 
GROUP BY e.position_id, e.department_id







-- Посчитать количество сотрудников родившихся в одинаковые года
SELECT
	YEAR(e.birthday)				AS[год рождения],
	COUNT(e.id)						AS[Количество]
FROM employees AS e 
WHERE e.birthday IS NOT NULL
GROUP BY YEAR(e.birthday)




-- По каждому отделу посчитать: 
--количество задейстовованых должностей
--количество сотрудников
--сумму зарплаты
--среднюю зарплату
--|Отдел|Количество должностей|Количество служащих|Сумма зарплаты|Средня зарплата|
SELECT 
	CASE e.department_id
		WHEN 1 THEN 'Administation'
		WHEN 2 THEN 'Accounting'
		WHEN 3 THEN 'IT'
		ELSE 'Other'
	END												AS[Отдел],
	COUNT(DISTINCT e.position_id )					AS[Количество должностей],
	COUNT(e.id)										AS[Количество служащих],
	SUM(e.salary)									AS[Сумма зарплаты],
	AVG(e.salary)									AS[Средня зарплата]
FROM employees AS e 
GROUP BY e.department_id








-- Получить сводную таблицу в разрезе отделов
-- посчитать сумарную зарплатув разбивке по должностям
SELECT
	CASE e.department_id
		WHEN 1 THEN 'Administation'
		WHEN 2 THEN 'Accounting'
		WHEN 3 THEN 'IT'
		ELSE 'Other'
	END 																		AS[Department],
	SUM(CASE WHEN e.position_id = 1 THEN ISNULL(e.salary, 0) ELSE 0 END)		AS[Bookers],
	SUM(CASE WHEN e.position_id = 2 THEN ISNULL(e.salary, 0) ELSE 0 END)		AS[director],
	SUM(CASE WHEN e.position_id = 3 THEN ISNULL(e.salary, 0) ELSE 0 END)		AS[developer],
	SUM(CASE WHEN e.position_id = 4 THEN ISNULL(e.salary, 0) ELSE 0 END)		AS[teamlead],
	AVG(e.salary)
FROM employees AS e 
GROUP BY e.department_id
ORDER BY Department DESC 



-- ================== HAVING ===========




SELECT
	e.department_id,
	SUM(e.salary) AS [salary_sum]
FROM employees AS e 
GROUP BY e.department_id 
HAVING SUM(e.salary ) > 6000 AND COUNT(e.id)



SELECT
	e.department_id,
	SUM(e.salary) AS [salary_sum]
FROM employees AS e 	
WHERE e.department_id = 3
GROUP BY e.department_id 
--HAVING e.department_id = 3      



SELECT *
FROM employees AS e
WHERE e.department_id =3
























