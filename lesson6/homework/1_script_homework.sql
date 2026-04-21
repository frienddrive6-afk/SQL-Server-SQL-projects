--1. Для каждого сотрудника вывести его ФИО и ФИО его непосредственного руководителя.
--| Employee_Name   | Manager_Name     | Department    |


SELECT
	e.first_name + ' ' + e.last_name  AS [Employer_name],
	m.first_name + ' ' + m.last_name  AS [Manager_name],
	d.title AS [Department]
FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.id
LEFT JOIN departments d ON e.department_id  = d.id 



--2. Найти все отделы, в которых нет ни одного сотрудника.
--| Department_ID | Department_Title |


SELECT 
    d.id AS [Department_ID], 
    d.title AS [Department_Title]
FROM departments AS d
LEFT JOIN employees AS e ON d.id = e.department_id
WHERE e.id IS NULL;


--3. Вывести детальную статистику по отделам: название отдела, количество сотрудников, суммарная зарплата, средняя зарплата.
--| Department    | Employee_Count | Total_Salary | Avg_Salary |

SELECT 
    d.title 					AS [Department],
    COUNT(e.id) 				AS [Employee_Count],
    SUM(ISNULL(e.salary, 0)) 	AS [Total_Salary],
    AVG(ISNULL(e.salary, 0)) 	AS [Avg_Salary]
FROM departments AS d
LEFT JOIN employees AS e ON d.id = e.department_id
GROUP BY d.title;




--4. Для каждой должности вывести минимальную, среднюю и максимальную зарплату, а также количество сотрудников.
--| Position   | Employee_Count | Min_Salary | Avg_Salary | Max_Salary |

SELECT 
    p.title 					AS [Position],
    COUNT(e.id) 				AS [Employee_Count],
    MIN(ISNULL(e.salary, 0)) 	AS [Min_Salary],
    AVG(ISNULL(e.salary, 0)) 	AS [Avg_Salary],
    MAX(ISNULL(e.salary, 0)) 	AS [Max_Salary]
FROM positions AS p
LEFT JOIN employees AS e ON p.id = e.position_id
GROUP BY p.title;












