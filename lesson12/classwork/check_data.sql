-- 1. Посмотреть всех пользователей и их хэши
SELECT id, email, hash FROM users;

-- 2. Список ролей
SELECT * FROM roles;

-- 3. Список всех студентов (ФИО)
SELECT id, first_name, last_name FROM students;

-- 4. Список всех преподавателей
SELECT id, first_name, last_name FROM teachers;

-- 5. Кто какую роль имеет?
SELECT 
    u.email, 
    r.title AS role_name
FROM users u
JOIN role_user ru ON u.id = ru.user_id
JOIN roles r ON ru.role_id = r.id;

-- 6. Студенты и их группы
SELECT 
	s.id,
    s.first_name + ' ' + s.last_name AS student_name,
    g.title AS group_name
FROM students s
JOIN group_student gs ON s.id = gs.student_id
JOIN groups g ON gs.group_id = g.id;

-- 7. Расписание пар (Предмет - Учитель - Дата)
SELECT 
    p.pair_date,
    sub.title AS subject_name,
    t.last_name AS teacher_name,
    p.theme
FROM pairs p
JOIN subjects sub ON p.subject_id = sub.id
JOIN teachers t ON p.teacher_id = t.id
ORDER BY p.pair_date;

-- 8. Проверка ДЗ (К какой паре какое ДЗ)
SELECT 
    h.title AS homework_title,
    p.theme AS lesson_theme,
    h.deadline_date
FROM homeworks h
JOIN pairs p ON h.pair_id = p.id;

















-- ============================================================



--Завуч хочет видеть список всех групп и количество реально учащихся в них студентов.
SELECT 
	g.title 				AS [group name],
	COUNT(gs.student_id ) 	AS [total students]
FROM groups g
LEFT JOIN group_student gs  ON g.id = gs.group_id
GROUP BY g.title 






--Учебная часть хочет список ФИО студентов, которые отсутствовали ('2026-05-20').
SELECT
	s.last_name + ' ' + s.first_name  		AS [student_name],
	p.theme,
	ps.comment 
FROM pair_student ps 
JOIN students s ON ps.student_id = s.id
JOIN pairs p ON ps.pair_id = p.id
WHERE ps.status = 0 AND p.pair_date = '2026-05-20'





--Найти студентов, которые не сдали ни одного решения ни на одно ДЗ.

SELECT 
    s.last_name, s.first_name
FROM students s
LEFT JOIN homeworks_solutions hs ON s.id = hs.student_id
WHERE hs.id IS NULL;




--Посчитать среднюю оценку за классную работу по каждому предмету

SELECT 
    sub.title AS subject_name,
    AVG(pg.val) AS avg_grade
FROM subjects sub
JOIN pairs p ON sub.id = p.subject_id
JOIN pair_student ps ON p.id = ps.pair_id
JOIN pair_grades pg ON ps.id = pg.pair_student_id
GROUP BY sub.title;



--Сколько пар провел каждый преподаватель за всё время?

SELECT 
    t.last_name,
    COUNT(p.id) AS pairs_count
FROM teachers t
LEFT JOIN pairs p ON t.id = p.teacher_id
GROUP BY t.last_name;


--Вывести "ведомость" для конкретной пары (ID = 1): ФИО студента, присутствие, оценка за урок.


SELECT 
    s.last_name + ' ' + s.first_name AS student,
    CASE WHEN ps.status = 1 THEN N'Был' ELSE N'НЕТ' END AS attendance,
    ISNULL(CAST(pg.val AS VARCHAR), '-') AS grade
FROM pairs p
JOIN groups_pair gp ON p.id = gp.pair_id
JOIN group_student gs ON gp.group_id = gs.group_id
JOIN students s ON gs.student_id = s.id
LEFT JOIN pair_student ps ON p.id = ps.pair_id AND s.id = ps.student_id
LEFT JOIN pair_grades pg ON ps.id = pg.pair_student_id
WHERE p.id = 1;



--Найти 3-х студентов с самым высоким средним баллом (учитывая и оценки за пары, и за ДЗ).

SELECT TOP 3
    s.last_name,
    AVG(hs.grade) as avg_hw_grade
FROM students s
JOIN homeworks_solutions hs ON s.id = hs.student_id
GROUP BY s.last_name
ORDER BY avg_hw_grade DESC;



--Вывести email-ы всех пользователей, у которых через роль есть право 'edit_schedule'.

SELECT DISTINCT u.email
FROM users u
JOIN role_user ru ON u.id = ru.user_id
JOIN permission_role pr ON ru.role_id = pr.role_id
JOIN permissions p ON pr.permission_id = p.id
WHERE p.title = 'edit_schedule';




--Показать группы, где средняя посещаемость ниже 80%.


SELECT 
    g.title,
    AVG(CAST(ps.status AS FLOAT)) * 100 AS attendance_percentage
FROM groups g
JOIN group_student gs ON g.id = gs.group_id
JOIN pair_student ps ON gs.student_id = ps.student_id
GROUP BY g.title
HAVING AVG(CAST(ps.status AS FLOAT)) < 0.8;



--Вывести список ДЗ, по которым крайний срок (deadline) прошел, а проверенных решений (где grade IS NULL) больше половины.
SELECT 
    h.title,
    h.deadline_date
FROM homeworks h
JOIN homeworks_solutions hs ON h.id = hs.homework_id
WHERE h.deadline_date < GETDATE()
GROUP BY h.title, h.deadline_date
HAVING COUNT(CASE WHEN hs.grade IS NULL THEN 1 END) > (COUNT(hs.id) / 2);






















