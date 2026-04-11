

SELECT DISTINCT 
	e.department_id 
FROM 
	employees AS e;
G0;


SELECT 
	e.id														AS[id],
	e.name														AS[Name],
	e.salary													AS[Salry],
	ISNULL(e.salary * (e.bonus_percent / 100), 0) 				AS [bonus amount]
FROM 
	employees AS e;
GO;