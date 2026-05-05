





CREATE TABLE schedule_items(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	number tunyint NOT NULL,
	item_start time NOT NULL,
	item_end time NOT NULL,
	status tinyint DEFAULT(0) NOT NULL

);


CREATE TABLE subjects(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(256) NOT NULL,
	deleted_at datetime NULL
	
	
);

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

CREATE TABLE roles(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(64) UNIQUE NOT NULL
);

CREATE TABLE permissions(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title nvarchar(64) UNIQUE NOT NULL,
);




CREATE TABLE users(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	email varchar(32) UNIQUE NOT NULL,
	hash char(256) NOT NULL,
	deleted_at datetime NULL

);


CREATE TABLE role_user(
	user_id int NOT NULL,
	role_id int NOT NULL,
	
	CONSTRAINT PK_user_role PRIMARY KEY(user_id, role_id),
	
	CONSTRAINT FK_ru_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT FK_ru_role FOREIGN KEY(role_id) REFERENCES roles(id) ON DELETE CASCADE
);



CREATE TABLE permission_role(
	role_id int NOT NULL,
	permission_id int NOT NULL,
	
	CONSTRAINT PK_permission_role PRIMARY KEY(role_id, permission_id),
	
	CONSTRAINT FK_pr_role FOREIGN KEY(role_id) REFERENCES roles(id) ON DELETE CASCADE,
	CONSTRAINT FK_pr_permission FOREIGN KEY(permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);


CREATE TABLE permission_user(
	user_id int NOT NULL,
	permission_id int NOT NULL,
	
	CONSTRAINT PK_permission_user PRIMARY KEY(user_id, permission_id),
	
	CONSTRAINT FK_pu_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT FK_pu_permission FOREIGN KEY(permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);




CREATE TABLES teachers(
	id int PRIMARY KEY NOT NULL,	
	first_name nvarchar(32) NOT NULL,
	last_name nvarchar(32) NOT NULL,

	
	CONSTRAINT FK_teacher_user FOREIGN KEY(id) REFERENCES users(id)
);





CREATE TABLE pairs(
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	pair_date date NOT NULL,
	schedule_item_id int NOT NULL,
	subject_id NOT NULL,
	theme nvarchar(256) NOT NULL,
	
	
	
	CONSTRAINT FK_pairs_schedule_item FOREIGN KEY(schedule_item_id) REFERENCES schedule_items(id),
	CONSTRAINT FK_pairs_subjects FOREIGN KEY(subject_id) REFERENCES subject_id(id),
);








CREATE TABLE groups_pair(
	group_id int NOT NULL,
	pair_id int NOT NULL,

	
	CONSTRAINT PK_group_pair PRIMARY KEY (group_id,pair_id),
	
	CONSTRAINT FK_groups_pair_group FOREIGN KEY(group_id) REFERENCES groups(id),
	CONSTRAINT FK_groups_pair_pairs FOREIGN KEY(pair_id) REFERENCES pairs(id)
);




















































