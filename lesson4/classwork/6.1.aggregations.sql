

--COUNT(*)
--COUNT(<expression>)
--COUNT(DISNINCT <expression>)
--SUM(<expression>)
--AVG(<expression>)
--MIN(<expression>)
--MAX(<expression>)
--...



SELECT 
	'const_string',
	COUNT(*)											AS [Общее количество записей],
	COUNT(e.department_id)								AS [КОличество не NULL значений в столбце department_id],
	COUNT(DISTINCT e.department_id )					AS [ Количество уникальных не NULL значений],
	MAX(e.bonus_percent )								AS [Размер максимального поцента бонуса],
	SUM(e.salary  / 100 * e.bonus_percent )				AS [Сумма денег на бонусы],
	AVG(e.salary  / 100 * e.bonus_percent )				AS [Средняя сумма бонуса]
FROM employees AS e 
WHERE e.department_id = 3




SELECT 
	SUM(e.salary),
	AVG(e.salary),
	ISNULL(SUM(e.salary), 0),
	ISNULL(AVG(e.salary), 0)
FROM employees AS e 
WHERE e.department_id = 100














































