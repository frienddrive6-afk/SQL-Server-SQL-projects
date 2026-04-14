

--Задача 1
--Вывести список сотрудников из IT-отдела (department_id = 3), у которых зарплата больше 1500
--evaluation	Оценка через CASE: >= 2000 → 'high', >= 1600 → 'medium', иначе → 'low'
--Отсортировать по salary по убыванию
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
--Найти всех сотрудников, у которых:
--email заканчивается на .com
--фамилия содержит букву «о» (любой регистр)
--год рождения — 1982 или 1983
SELECT 
	e.last_name,
	e.first_name,
	e.email,
	e.birthday 
FROM employees AS e 
WHERE e.email LIKE '%.com' AND LOWER(e.last_name) LIKE N'%о%' AND YEAR(e.birthday) >= 1982 AND YEAR(e.birthday) <= 1983



--Задача 3
--Вывести сотрудников, у которых:
--зарплата в диапазоне от 1500 до 2500 (включительно)
--bonus_percent равен NULL
--bonus_status	Через IIF: IS NOT NULL → 'has bonus', иначе → 'no bonus'
SELECT 
	e.name,
	e.salary,
	IIF(e.bonus_percent IS NOT NULL, 'has bonus', 'no bonus') 																	AS[bonus_status]
FROM employees AS e 
WHERE e.salary >= 1500 AND e.salary <=2000



--Задача 4
--Вывести ТОП-2 сотрудников с наибольшей зарплатой из отделов с id = 1, 3 (administration и it). 
--Использовать TOP WITH TIES, чтобы включить всех с одинаковой зарплатой.
SELECT TOP 2 WITH TIES
	e.last_name,
	e.first_name,
	e.department_id,
	e.salary
FROM employees AS e 
WHERE e.department_id IN (1, 3)
ORDER BY e.salary DESC



--Задача 5
--Сформировать полное ФИО сотрудников (last_name + first_name + middle_name), 
--обрабатывая NULL-значения. Вывести только тех, у кого middle_name IS NULL.
--full_name	last_name + ' ' + first_name + ' ' + middle_name (NULL → '')
--salary_with_bonus	salary + bonus
SELECT 
	CONCAT(e.last_name,' ',e.first_name,' ',ISNULL(e.middle_name,'')) 								AS [full_name],
	e.salary + (e.salary / 100 * ISNULL(e.bonus_percent,0))											AS [salary_with_bonus]
FROM employees AS e 




--Задача 6
--Подсчитать для всей таблицы employees:
--total_employees	Общее кол-во сотрудников
--total_with_bonus	Кол-во сотрудников с ненулевым bonus_percent
--max_salary	Максимальная зарплата
--min_salary	Минимальная зарплата
--avg_salary	Средняя зарплата (округлить до 2 знаков)
--total_salary_fund	Сумма всех зарплат
SELECT
	COUNT(*)								AS [total_employees],
	COUNT(*) - COUNT(e.bonus_percent)		AS [total_with_bonus],
	MAX(e.salary)							AS [max_salary],
	MIN(e.salary)							AS [min_salary],
	AVG(e.salary)							AS [avg_salary],
	SUM(e.salary)							AS[total_salary_fund]
FROM employees AS e 




--Задача 7
--Для сотрудников из IT-отдела (department_id = 3) подсчитать:
--it_count	Кол-во сотрудников
--it_unique_departments	Кол-во уникальных department_id (проверка, должно быть 1)
--it_total_bonus	Сумма бонусов (salary / 100 * bonus_percent), для NULL — 0
--it_avg_salary	Средняя зарплата
SELECT 
	COUNT(*)									AS [it_count],
	COUNT(DISTINCT e.department_id)				AS [it_unique_departments],
	SUM(e.salary / 100 * e.bonus_percent)		AS [it_total_bonus],
	AVG(e.salary) 								AS [it_avg_salary] 
FROM employees AS e 
WHERE e.department_id  = 3




--Задача 8
--Вывести ТОП-3 сотрудников с наименьшей зарплатой. Отсортировать так, чтобы сотрудники с 
--salary <= 2000 шли первыми, а остальные — после. Внутри группы сортировать по last_name.
--priority_group	'A' если <= 2000, 'B' иначе
--last_name	Фамилия
--first_name	Имя
--salary	Зарплата
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
--Вычислить возраст каждого сотрудника (на текущую дату) по полю birthday. Вывести только тех, кому больше 40 лет.
--last_name	Фамилия
--first_name	Имя
--birthday	Дата рождения
--age	Возраст
--Отсортировать по возрасту по убыванию
SELECT
	e.last_name,
	e.first_name,
	e.birthday,
	DATEDIFF(year, e.birthday, GETDATE())
FROM employees AS e 
WHERE DATEDIFF(year, e.birthday, GETDATE()) > 40
ORDER BY DATEDIFF(year, e.birthday, GETDATE()) DESC



--Задача 10
--Подсчитать общий фонд оплаты труда с учётом бонусов для сотрудников, у которых department_id NOT IN (4, 5)
-- — т.е. не Реклама и не Логистика. Формула для каждого: salary + salary/100 * COALESCE(bonus_percent, extra_percent, 0)
--total_fund	Общая сумма
--employees_count	Кол-во сотрудников
--avg_payment	Средняя выплата
SELECT
	SUM(e.salary + e.salary / 100 * COALESCE(e.bonus_percent ,e.extra_percent ,0)) 				AS [total_fund],
	COUNT(*)																					AS [employees_count],
	AVG(e.salary + e.salary / 100 * COALESCE(e.bonus_percent ,e.extra_percent ,0))				AS [avg_payment]
FROM employees AS e 
WHERE e.department_id NOT IN(4, 5)









