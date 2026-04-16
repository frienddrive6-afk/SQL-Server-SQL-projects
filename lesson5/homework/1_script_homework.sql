



--1. Вывести статистику по каждому отделу: количество сотрудников, суммарную, среднюю, минимальную и максимальную зарплаты. Результат отсортировать по убыванию суммарной зарплаты.
--| Department_ID | Employee_Count | Total_Salary | Avg_Salary |  | Max_Salary |
SELECT
	e.department_id					AS [Department_ID],
	COUNT(*)						AS [Employee_Count],
	SUM(ISNULL(e.salary,0))					AS [Total_Salary],
	AVG(ISNULL(e.salary,0))					AS [Avg_Salary],
	MIN(ISNULL(e.salary,0))					AS [Min_Salary],
	MAX(ISNULL(e.salary,0))					AS [Max_Salary]
FROM employees AS e 
GROUP BY e.department_id
ORDER BY Total_Salary DESC



--2. Вывести статистику распределения сотрудников по годам рождения: количество сотрудников, количество задействованных отделов и среднюю зарплату для каждого года рождения.
--| Birth_Year | Employee
SELECT
	YEAR(e.birthday),
	COUNT(*) AS Employee_Count,
	COUNT(DISTINCT e.department_id) AS Departments_Count,
	AVG(ISNULL(e.salary,0))
FROM employees AS e
GROUP BY YEAR(e.birthday)




--3. Выявить руководителей и подсчитать количество их непосредственных подчиненных, среднюю зарплату подчиненных и общую зарплату подчиненных.
--| Manager_ID | Subordinates_Count | Avg_Subordinate_Salary | Total_Subordinates_Salary |
SELECT 
	e.manager_id					AS [Manager_ID],
	COUNT(*)						AS [Subordinates_Count],
	AVG(ISNULL(e.salary,0))					AS [Avg_Subordinate_Salary],
	SUM(ISNULL(e.salary,0))					AS [Total_Subordinates_Salary]
FROM employees AS e
WHERE e.manager_id IS NOT NULL
GROUP BY e.manager_id


--4. Проанализировать сотрудников по стажу работы (в годах). Вывести количество сотрудников, среднюю зарплату и количество сотрудников с бонусами для каждого года стажа.
--| Years_Worked | Employee_Count | Avg_Salary | Employees_With_Bonus |

SELECT 
	DATEDIFF(year, e.hire_date, GETDATE())					AS [Years_Worked],
	COUNT(*)												AS [Employee_Count],
	AVG(ISNULL(e.salary,0))									AS [Avg_Salary],
	COUNT(CASE WHEN e.bonus_percent > 0 THEN 1 END)			AS [Employees_With_Bonus]
FROM employees AS e
GROUP BY DATEDIFF(year, e.hire_date, GETDATE())
ORDER BY [Years_Worked] DESC


