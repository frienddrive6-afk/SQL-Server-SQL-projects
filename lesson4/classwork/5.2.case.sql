

--form 1


--CASE
--	WHEN <condition_1> THEN <value_1>
--	....
--	WHEN <condition_n> THEN <value_n>
--	
--	[ELSE <defult_value>]
--	
--END






--form 2


--CASE <value>
--	WHEN <case_value> THEN <vlue_1>
--	....
--	WHEN <case_value> THEN <vlue_n>
--	
--	[ELSE defult_value]
--	
--	
--END






-- IIf

--IIF(<condition>,<value_if_true>,<value_if_false>)







-- |email|salary|evaluation|

--SELECT
--	e.email												AS [Email],
--	e.salary											AS [Salay],
--	CASE
--		WHEN e.salary >= 3000 THEN 'salary >= 3000'
--		WHEN e.salary >= 2000 THEN 'salary >= 2000'
--		ELSE 'salary < 2000'
--	END 												AS[Evaluation_1],
--	CASE
--		WHEN e.salary >= 3000 THEN 'salary >= 3000'
--		WHEN e.salary >= 2000 THEN 'salary >= 2000'
--	END 												AS[Evaluation_2]
--FROM employees AS e 




-- Разщитать размер премии по принципу: if(30%), accounting(10%), other(5%)
-- |id|name|salary|department_id|percent|amount|

SELECT 
	e.id													AS [Id],
	e.name													AS [Name],
	e.department_id,
	CASE e.department_id 
		WHEN 3 THEN '30%'
		WHEN 2 THEN '10%'
		ELSE '5%'
	END														AS [Parcent],
	ISNULL(e.salary, 0) / 100 *
		CASE e.department_id 
			WHEN 3 THEN 30
			WHEN 2 THEN 10
			ELSE  5
		END														AS [Amount]
FROM employees AS e 







SELECT
  e.id, e.email , e.salary,
  IIF(e.salary >= 2500, 'OK', 'not OK'),
  CASE WHEN e.salary >= 2500 THEN 'OK' ELSE 'not OK' END
FROM employees AS e



SELECT 
	e.id, e.name, e.email,
	CASE 
		WHEN e.department_id  IN (1,2) THEN 'A'
		WHEN e.department_id = 3 THEN
			CASE e.position_id
				WHEN 3 THEN 'B-1'
				WHEN 4 THEN 'B-2'
			END
		ELSE 'C'
	END
FROM employees AS e 






-- Отсортировать сотрудников по приоритету получения зарплаты
-- <= 2500
-- > 2500
--Отсортировать в каждой "группе" (части списка) по полю name


SELECT 
	e.id, e.name, e.salary
FROM employees AS e 
ORDER BY 
	CASE WHEN e.salary <= 2500 THEN 'A' ELSE 'B' END,
	name;

SELECT 
	e.id, e.name, e.salary,
	CASE WHEN e.salary <= 2500 THEN 'A' ELSE 'B' END
FROM employees AS e 
ORDER BY 
	CASE WHEN e.salary <= 2500 THEN 'A' ELSE 'B' END,
	name;
	








