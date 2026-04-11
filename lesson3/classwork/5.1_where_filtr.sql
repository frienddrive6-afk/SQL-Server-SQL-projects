


SELECT 
	e.id,
	e.last_name,
	e.first_name,
	e.salary,
	e.department_id
FROM employees AS e
WHERE e.department_id  = 3
ORDER BY e.last_name, e.first_name, e.id;




-- Вывести информацию о пользователях из IT отдтала с их абсолютным выражением бонуса
SELECT 
	e.id,
	e.email,
	ISNULL(e.salary, 0) / 100 * e.bonus_percent  				AS [amount]
FROM employees AS e
--WHERE e.bonus_percent >= 0 AND e.bonus_percent IS NOT NULL;
--WHERE NOT(e.bonus_percent < 0 OR e.bonus_percent IS NULL);
WHERE (ISNULL(e.bonus_percent, 0) != 0 AND e.bonus_percent >= 0)
	AND e.department_id = 3
ORDER BY amount DESC;





-- ================== BETWEEN IN LIKE =======



SELECT e.id, e.name, e.salary 
FROM employees AS e
--WHERE e.salary  >= 2000 AND e.salary <= 3000
--WHERE e.salary  BETWEEN 2000 AND 3000
--WHERE e.salary BETWEEN  2000 AND 3000
--	AND e.department_id = 3
--WHERE e.department_id = 3 OR e.department_id = 4
--WHERE e.department_id  IN (3,4)
--WHERE e.department_id NOT IN (3, 4)
--WHERE e.department_id IN (3, 4, NULL)                                --   :-(((
--WHERE e.department_id IN (3, 4) OR e.department_id IS NULL			 --   :-))))
WHERE ISNULL(e.department_id, -1) IN (3, 4, -1) 					  -- :-)





--    %		_	__x		[abc]	%.[abc]om	[^abc] 	[a-c]	[^a-c] 	
SELECT e.id,e.name, e.salary 
FROM employees AS e
WHERE e.name LIKE N'Сид%'










