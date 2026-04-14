





SELECT 
	'const_string',
	COUNT(*)							AS[Общее количество],
	COUNT(e.id)							AS[Количество не NULL id],
	COUNT(DISTINCT e.department_id)		AS[Количество не NULL уникальных department_id]
FROM employees AS e 