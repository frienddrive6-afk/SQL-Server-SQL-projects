




--  РАСПИСАНИЕ 
CREATE TABLE schedule_items(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	number tinyint NOT NULL,
	item_start time NOT NULL,
	item_end time NOT NULL,
	status tinyint DEFAULT(0) NOT NULL

);


--  ПРЕДМЕТЫ
CREATE TABLE subjects(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(256) NOT NULL,
	deleted_at datetime NULL
	
	
);


--  ГРУППЫ
CREATE TABLE groups (
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(128) NOT NULL,
	status tinyint DEFAULT(0) NOT NULL
	
);


-- roles
--permissions
--role_user
--permissio_user
--permission_role


-- РОЛИ
CREATE TABLE roles(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(64) UNIQUE NOT NULL
);

-- ПРАВА
CREATE TABLE permissions(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(64) UNIQUE NOT NULL
);



-- ПОЛЬЗОВАТЕЛИ
CREATE TABLE users(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	email varchar(32) UNIQUE NOT NULL,
	hash char(256) NOT NULL,
	deleted_at datetime NULL

);


--  ПРОМЕЖУТОЧНАЯ ТАБЛИЦА ДОСТУПА
CREATE TABLE role_user(
	user_id int NOT NULL,
	role_id int NOT NULL,
	
	CONSTRAINT PK_user_role PRIMARY KEY(user_id, role_id),
	
	CONSTRAINT FK_ru_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT FK_ru_role FOREIGN KEY(role_id) REFERENCES roles(id) ON DELETE CASCADE
);


--  ПРОМЕЖУТОЧНАЯ ТАБЛИЦА ДОСТУПА
CREATE TABLE permission_role(
	role_id int NOT NULL,
	permission_id int NOT NULL,
	
	CONSTRAINT PK_permission_role PRIMARY KEY(role_id, permission_id),
	
	CONSTRAINT FK_pr_role FOREIGN KEY(role_id) REFERENCES roles(id) ON DELETE CASCADE,
	CONSTRAINT FK_pr_permission FOREIGN KEY(permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);

--  ПРОМЕЖУТОЧНАЯ ТАБЛИЦА ДОСТУПА
CREATE TABLE permission_user(
	user_id int NOT NULL,
	permission_id int NOT NULL,
	
	CONSTRAINT PK_permission_user PRIMARY KEY(user_id, permission_id),
	
	CONSTRAINT FK_pu_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT FK_pu_permission FOREIGN KEY(permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);



--  ПЕРСОНАЛИИ
CREATE TABLE teachers(
	id int PRIMARY KEY NOT NULL,	
	first_name nvarchar(32) NOT NULL,
	last_name nvarchar(32) NOT NULL,
	-- .....
	
	CONSTRAINT FK_teacher_user FOREIGN KEY(id) REFERENCES users(id)
);



CREATE TABLE students(
	id int PRIMARY KEY NOT NULL,	
	first_name nvarchar(32) NOT NULL,
	last_name nvarchar(32) NOT NULL,
	-- .....
	
	CONSTRAINT FK_student_user FOREIGN KEY(id) REFERENCES users(id)
);





--  ПАРЫ
CREATE TABLE pairs(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	pair_date date NOT NULL,
	schedule_item_id int NOT NULL,
	subject_id int NOT NULL,
	theme nvarchar(256) NOT NULL,
	teacher_id int,
	teacher_status tinyint,    -- online / offline
	
	
	CONSTRAINT FK_pairs_schedule_item FOREIGN KEY(schedule_item_id) REFERENCES schedule_items(id),
	CONSTRAINT FK_pairs_subjects FOREIGN KEY(subject_id) REFERENCES subjects(id),
	CONSTRAINT FK_pairs_teacher FOREIGN KEY(teacher_id) REFERENCES teachers(id)
);







--  СВЯЗИ ГРУПП 
CREATE TABLE groups_pair(
	group_id int NOT NULL,
	pair_id int NOT NULL,

	
	CONSTRAINT PK_group_pair PRIMARY KEY (group_id,pair_id),
	
	CONSTRAINT FK_groups_pair_group FOREIGN KEY(group_id) REFERENCES groups(id),
	CONSTRAINT FK_groups_pair_pairs FOREIGN KEY(pair_id) REFERENCES pairs(id)
);

--  СВЯЗИ СТУДЕНТОВ
CREATE TABLE group_student (
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	group_id int NOT NULL,
	student_id int NOT NULL,
	
	status tinyint DEFAULT(0) NOT NULL,
	
	
	CONSTRAINT FK_groups_group_student FOREIGN KEY(group_id) REFERENCES groups(id),
	CONSTRAINT FK_groups_student FOREIGN KEY(student_id) REFERENCES students(id)

);





-- ПОСЕЩАЕМОСТЬ
CREATE TABLE pair_student (
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	pair_id int NOT NULL,
	student_id int NOT NULL,
	status tinyint DEFAULT(0) NOT NULL,   -- присуцтвуетб опоздплб отсуцтвует
	is_online bit DEFAULT(0) NOT NULL,
	comment nvarchar(256) NULL,
	
	
	
	CONSTRAINT FK_pair_pair_student FOREIGN KEY(pair_id) REFERENCES pairs(id),
	CONSTRAINT FK_pair_student_student FOREIGN KEY(student_id) REFERENCES students(id)

);




--   ОЦЕНКИ ЗА УРОК
CREATE TABLE pair_grades(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	pair_student_id int NOT NULL,
	val tinyint NOT NULL,
	val_type tinyint NOT NULL,    -- Классная / контрольная / тематическая оценка

	CONSTRAINT CK_pair_grades_range CHECK(val >= 1 AND val <= 12),
	CONSTRAINT FK_pair_grades_pair_student FOREIGN KEY(pair_student_id) REFERENCES pair_student(id),
);






--  ДОМАШНИЕ ЗАДАНИЯ 
CREATE TABLE homeworks(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	pair_id int NOT NULL,
	title nvarchar(256) NOT NULL,
	description nvarchar(512) NOT NULL,
	task_file_url nvarchar(512) NULL,
	deadline_date datetime NOT NULL,
	
	CONSTRAINT FK_homeworks_pairs FOREIGN KEY(pair_id) REFERENCES pairs(id)
);


--  ПРОМЕЖУТАЧНАЯ ТАБЛИЦА ДЛЯ ДЗ
CREATE TABLE homeworks_solutions(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	homework_id int NOT NULL,
	student_id int NOT NULL,
	solution_file_url nvarchar(512) NULL,
	student_comment nvarchar(512) NULL,
	upload_date datetime DEFAULT(GETDATE()) NOT NULL,
	
	grade tinyint NULL,
	teacher_comment nvarchar(512) NULL,
	check_date datetime NULL,
	
	CONSTRAINT CK_homework_grade CHECK(grade >= 1 AND grade <= 12),
	CONSTRAINT FK_solutions_homework FOREIGN KEY(homework_id ) REFERENCES homeworks(id),
	CONSTRAINT FK_solutions_student FOREIGN KEY(student_id) REFERENCES students(id),
	CONSTRAINT UQ_student_homework UNIQUE(homework_id, student_id)

);








































