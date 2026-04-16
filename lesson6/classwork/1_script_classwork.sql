


SELECT *
FROM employees e, departments d

-- ================ LEFT JOIN


SELECT *
FROM 
	employees e LEFT JOIN departments d ON e.department_id = d.id
	
	
SELECT *
FROM 	
	departments d  LEFT JOIN employees e ON e.department_id = d.id 
	
	
	
	
-- ================ RIGHT JOIN


SELECT *
FROM 
	employees e RIGHT JOIN departments d ON e.department_id = d.id
	
	
SELECT *
FROM 	
	departments d  RIGHT JOIN employees e ON e.department_id = d.id 
	

	


	
-- ================  JOIN


SELECT *
FROM 
	employees e JOIN departments d ON e.department_id = d.id
	
	
SELECT *
FROM 	
	departments d  JOIN employees e ON e.department_id = d.id 
	

	

-- ================ FULL JOIN


SELECT *
FROM 
	employees e FULL JOIN departments d ON e.department_id = d.id
	
	
SELECT *
FROM 	
	departments d FULL JOIN employees e ON e.department_id = d.id 
	


	
-- ================ CROSS JOIN


SELECT *
FROM 
	employees e CROSS JOIN departments d
	
	
SELECT *
FROM 	
	departments d CROSS JOIN employees e ;
	
	
	
	
	
	
	
------------------------------------------
--TASK
-- Вернуть количество сотрудников по должности
--|position_name|count

SELECT 
	p.title,
	COUNT(e.id)
FROM positions p LEFT JOIN employees e ON e.position_id = p.id
GROUP BY p.title, p.id





----------------------------
--TASK
-- Вернуть служащих которые родились в 1982 с информацией об их должности и отделе
-- |epm_id|emp_name|emp_birthday|position|department|

-- employees,departamenrs,positions

SELECT 
	e.id,
	e.name,
	e.birthday,
	ISNULL(p.title,'___')													AS[Position],
	ISNULL(d.title,'___')													AS[Department] 
FROM employees e 
	LEFT JOIN positions p  ON e.position_id = p.id
	LEFT JOIN departments d ON e.department_id = d.id 
WHERE YEAR(e.birthday) = 1982 
ORDER BY e.birthday DESC








-------------------------------------------------
-- TASK
-- Для каждого отдела вывести полседнюю дату приема сотрудника
--|department|hire_date|
SELECT 
	d.title 														AS[Department],
	ISNULL(CONVERT(varchar(16),MAX(e.hire_date),104),'---')			AS[Hire_date]
FROM 
	departments d LEFT JOIN employees e ON d.id = e.department_id 
GROUP BY d.title, d.id 




-------------------------------------------------
-- TASK
-- Для каждого отдела вывести последнего принятого сотрудника
--|department|hire_date|

SELECT 
	d.title 														AS[Department],
	MAX(IIF(e.hire_date = MAX(e.hire_date ), e.name, ' '))
FROM 
	departments d LEFT JOIN employees e ON d.id = e.department_id 
GROUP BY d.title, d.id 


SELECT
  d.id,
  d.title,
  ISNULL(e.name, '')
FROM employees e
  JOIN (
      SELECT
        MAX(id) maxEmpId
      FROM employees
      GROUP BY department_id
    ) lastEmp ON e.id = lastEmp.maxEmpId
  RIGHT JOIN departments d ON e.department_id = d.id;








