--Добавление ролей
INSERT INTO roles (title) 
VALUES 
    (N'Admin'), 
    (N'Teacher'), 
    (N'Student');



-- Добавление предметов
INSERT INTO subjects (title) 
VALUES 
    (N'Базы данных (SQL)'), 
    (N'Программирование C#'), 
    (N'Веб-технологии (HTML/CSS)');


--Создание груп
INSERT INTO groups (title, status) 
VALUES 
    (N'P42', 1), -- 1 - активна
    (N'P43', 1);


-- Время когда могут проводится пары
INSERT INTO schedule_items (number, item_start, item_end, status) 
VALUES 
    (1, '09:00:00', '10:30:00', 1),
    (2, '10:40:00', '12:10:00', 1),
    (3, '12:40:00', '14:10:00', 1);




-- Права доступа
INSERT INTO permissions (title) 
VALUES 
    (N'view_all_grades'),   -- Видеть все оценки
    (N'edit_schedule'),     -- Править расписание
    (N'upload_homework');   -- Загружать ДЗ





    
    
    
    
    
    
    
    
    
    
--Добавление пользователей  
INSERT INTO users (email, hash) 
VALUES 
    ('admin@mystat.com', 'hash_admin_123'),  
    ('teacher_ivanov@mystat.com', 'hash_qwerty'), 
    ('student_petrov@mail.com', 'hash_111'),   
    ('student_sidorov@mail.com', 'hash_222'),  
    ('student_vlasova@mail.com', 'hash_333');   
   
    
    
    
 
    
-- Пользователь .... явзляется учитлем
INSERT INTO teachers (id, first_name, last_name) 
VALUES (2, N'Иван', N'Иванов');

-- Пользователи .... являтся студентами
INSERT INTO students (id, first_name, last_name) 
VALUES 
    (3, N'Петр', N'Петров'),
    (4, N'Сидор', N'Сидоров'),
    (5, N'Анна', N'Власова');
    



-- Указание статуса в связующей таблице
INSERT INTO role_user (user_id, role_id) 
VALUES 
    (1, 1), -- Админ
    (2, 2), -- Учитель
    (3, 3), (4, 3), (5, 3); -- студенты




    
INSERT INTO group_student (group_id, student_id, status) 
VALUES 
    (1, 3, 1), 
    (1, 4, 1), 
    (1, 5, 1);




-- На данных что уже есть была создана пара

INSERT INTO pairs (pair_date, schedule_item_id, subject_id, theme, teacher_id, teacher_status) 
VALUES 
    ('2026-05-20', 1, 1, N'Введение в JOIN', 2, 1); 




-- Группа связана с парой
INSERT INTO groups_pair (group_id, pair_id) VALUES (1, 1);



-- Група связана с студентом
INSERT INTO pair_student (pair_id, student_id, status, is_online) 
VALUES 
    (1, 3, 1, 0),
    (1, 4, 1, 0),
    (1, 5, 0, 0); 



--Выставление оценок студентам
INSERT INTO pair_grades (pair_student_id, val, val_type) 
VALUES 
    (1, 12, 1),
    (2, 10, 1);


-- По паре была создано Дз
INSERT INTO homeworks (pair_id, title, description, deadline_date) 
VALUES 
    (1, N'Практика по JOIN', N'Написать 5 запросов к базе такси', '2026-05-27');




-- Выдача прав
INSERT INTO permission_role (role_id, permission_id) 
VALUES 
    (1, 1), (1, 2), (1, 3), 
    (2, 1), (2, 2),         
    (3, 3);                 




--ещё студенты
INSERT INTO users (email, hash) 
VALUES 
    ('teacher_petrova@mystat.com', 'h_6'), 
    ('teacher_sidorov@mystat.com', 'h_7'), 
    ('student_ivanova@mail.com', 'h_8'),   
    ('student_kuznetsov@mail.com', 'h_9'),
    ('student_popov@mail.com', 'h_10'),    
    ('student_smirnov@mail.com', 'h_11');  




-- Учителя
INSERT INTO teachers (id, first_name, last_name) 
VALUES 
    (6, N'Мария', N'Петрова'),
    (7, N'Алексей', N'Сидоров');

-- Студенты
INSERT INTO students (id, first_name, last_name) 
VALUES 
    (8, N'Елена', N'Иванова'),
    (9, N'Игорь', N'Кузнецов'),
    (10, N'Олег', N'Попов'),
    (11, N'Артем', N'Смирнов');




-- Роли
INSERT INTO role_user (user_id, role_id) 
VALUES (6, 2), (7, 2), (8, 3), (9, 3), (10, 3), (11, 3);

-- Группы (Группа 1 - P42, Группа 2 - P43)
INSERT INTO group_student (group_id, student_id, status) 
VALUES 
    (1, 8, 1),   -- Елена в P42 (теперь там 4 человека)
    (2, 9, 1),   -- Игорь в P43
    (2, 10, 1),  -- Олег в P43
    (2, 11, 1);  -- Артем в P43




-- + пары
INSERT INTO pairs (pair_date, schedule_item_id, subject_id, theme, teacher_id, teacher_status) 
VALUES 
    ('2026-05-21', 1, 1, N'Агрегатные функции', 2, 1),
    ('2026-05-21', 2, 1, N'Группировка GROUP BY', 2, 1),
    ('2026-05-22', 1, 2, N'Классы и объекты', 6, 1),
    ('2026-05-22', 2, 2, N'Наследование в C#', 6, 1),
    ('2026-05-23', 1, 1, N'Подзапросы', 2, 1),
    ('2026-05-23', 2, 1, N'Представления (Views)', 2, 1),
    ('2026-05-24', 1, 2, N'Интерфейсы', 6, 1),
    ('2026-05-24', 2, 2, N'Делегаты и события', 6, 1),
    ('2026-05-25', 1, 3, N'Основы HTML', 7, 1),
    ('2026-05-25', 2, 3, N'Теги и атрибуты', 7, 1);






-- Группа P42 (ID 1) учит SQL (пары 2, 3, 6, 7)
INSERT INTO groups_pair (group_id, pair_id) VALUES (1, 2), (1, 3), (1, 6), (1, 7);
-- Группа P43 (ID 2) учит C# (пары 4, 5, 8, 9) и HTML (10, 11)
INSERT INTO groups_pair (group_id, pair_id) VALUES (2, 4), (2, 5), (2, 8), (2, 9), (2, 10), (2, 11);





-- ДЗ для SQL (Пара 2)
INSERT INTO homeworks (pair_id, title, description, deadline_date) 
VALUES (2, N'Запросы с SUM/AVG', N'Посчитать зарплаты', '2026-06-01'); -- HW ID 2

-- ДЗ для C# (Пара 4)
INSERT INTO homeworks (pair_id, title, description, deadline_date) 
VALUES (4, N'Создание классов', N'Описать класс Car', '2026-06-02'); -- HW ID 3

-- Решения (Студенты сдают ДЗ)
INSERT INTO homeworks_solutions (homework_id, student_id, student_comment, grade) 
VALUES 
    (2, 3, N'Сделал всё!', 12),     -- Петров (P42) сдал SQL на 12
    (2, 4, N'Сложно было', 8),      -- Сидоров (P42) сдал SQL на 8
    (3, 9, N'Готово', 11),          -- Кузнецов (P43) сдал C# на 11
    (3, 10, N'Не понял наследование', 4); -- Попов (P43) сдал C# на 4



























