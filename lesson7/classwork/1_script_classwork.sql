



--TASK
--Посчитать количество сотрудников по каждому отделу для каждой должности
--|department|position|count|

SELECT 
	d.title  AS[Department],
	p.title  AS[Position],
	COUNT(e.id)
FROM 
	departments d 
	CROSS JOIN positions p
	LEFT JOIN employees e ON e.position_id = p.id AND e.department_id = d.id 
GROUP BY d.id, d.title, p.id, p.title 




--TASK

--Посчитать количество сотрудников по всем должностям
SELECT 
	p.title,
	COUNT(e.id) AS [Count]
FROM 
	positions p LEFT JOIN employees e ON e.position_id = p.id 
GROUP BY p.id,p.title 





SELECT
	p.title,
	(
		SELECT 
			COUNT(id)
		FROM employees e 
		WHERE e.position_id = p.id
	) AS [Count]
FROM 
	positions p;










--TASK
-- Для каждого отдела выбрать сотрудника у которого зарплата боьше чем зарплата каждого сотрудника этого отдела


SELECT
	d.id,
	d.title,
	MAX(e.salary)
FROM departments d 
	LEFT JOIN employees e ON e.department_id = d.id 
GROUP BY d.id, d.title 



SELECT
	d.title,
	ISNULL(e.name,'---'),
	ISNULL(e.salary,0)
FROM departments d 
	LEFT JOIN employees e ON e.department_id = d.id 
WHERE e.salary >= ALL (
	SELECT 
		e2.salary 
	FROM employees e2 
	WHERE e2.id <> e.id 
		AND e2.department_id = e.department_id
		AND e2.salary IS NOT NULL
)
















































