

-- ==== FOREING KEY === --
--Допускаются только значения из любого  другого столбца



CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
);





INSERT INTO users(email,role_id)
VALUES('v@m.c', 1)

INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);


--ERROR
--INSERT INTO users(email,role_id)
--VALUES
--	('d@m.c', 333);


DELETE FROM roles 
WHERE id = 2;





DROP TABLE users;
DROP TABLE roles;









-- ===========================================

CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
--    	ON DELETE NO ACTION       -- работает по умолчанию
    	ON DELETE CASCADE
);


INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);

DELETE FROM roles
WHERE id = 3;



DROP TABLE users;
DROP TABLE roles;



--================================================








CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON DELETE SET NULL
);




INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);


DELETE FROM roles
WHERE id = 3;




DROP TABLE users;
DROP TABLE roles;




-- =============================


CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL DEFAULT(2), -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON DELETE SET DEFAULT
);


INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);





DELETE FROM roles
WHERE id = 3;




DROP TABLE users;
DROP TABLE roles;



--=============================================











--========= UPDATE ============




-- ===========================================

CREATE TABLE roles(
    id int PRIMARY KEY NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON UPDATE NO ACTION       -- работает по умолчанию
);


INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);

DELETE FROM roles
WHERE id = 3;



DROP TABLE users;
DROP TABLE roles;







-- ===========================================

CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON UPDATE CASCADE
);


INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);

DELETE FROM roles
WHERE id = 3;



DROP TABLE users;
DROP TABLE roles;



--================================================








CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NULL, -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON UPDATE SET NULL
);




INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);


DELETE FROM roles
WHERE id = 3;




DROP TABLE users;
DROP TABLE roles;




-- =============================


CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL DEFAULT(2), -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON UPDATE SET DEFAULT
);


INSERT INTO roles (title)
VALUES ('author'),
		('admin'),
		('guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);





DELETE FROM roles
WHERE id = 3;




DROP TABLE users;
DROP TABLE roles;



--=============================================












CREATE TABLE roles(
    id int PRIMARY KEY NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    email varchar(32) NOT NULL,
    role_id int NOT NULL DEFAULT(2), -- Добавлена запятая
    
    CONSTRAINT FK_users_role FOREIGN KEY(role_id) REFERENCES roles(id)
    	ON DELETE SET DEFAULT
    	ON UPDATE CASCADE
);




INSERT INTO roles (id, title)
VALUES 	(1, 'author'),
		(2, 'admin'),
		(3, 'guest');


		
INSERT INTO users(email,role_id)
VALUES
	('v@m.c', 3),
	('a@m.c', 1),
	('x@m.c', 3);




UPDATE roles
SET id = 333
WHERE id = 3;


DROP TABLE users;
DROP TABLE roles;




-- ================  NOT NULL =========================
-- Отсуцтвее значений NULL



CREATE TABLE permissions (
	id 				int			 PRIMARY KEY IDENTITY(1,1) 		NOT NULL,
	title			varchar(32)									NOT NULL,
	description		varchar(128)								NULL
);


INSERT INTO permissions (title)
VALUES ('read_config');



-- Добавление
UPDATE permissions
SET description = 'no_description'
WHERE description IS NULL;

ALTER TABLE permissions 
ALTER COLUMN description varchar(128) NOT NULL;


-- Удаление
ALTER TABLE permissions 
ALTER COLUMN description varchar(128) NULL;


DROP TABLE permissions;




-- == UNIQUE ==
-- Не допускает дубликатов



CREATE TABLE roles(
    id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    title varchar(64) NOT NULL
);

CREATE TABLE users(
    id 				int 					IDENTITY(1, 1)						 NOT NULL,
    email 			varchar(32) 												 NOT NULL,
    role_id 		int 														 NOT NULL,
    username		varchar(64)													 NOT NULL									
    
    CONSTRAINT PK_users_id 			PRIMARY KEY(id),
    CONSTRAINT FK_users_role 		FOREIGN KEY(role_id) REFERENCES roles(id),
    CONSTRAINT UQ_users_email 		UNIQUE(email)
);




-- Добавление
ALTER TABLE roles
ADD CONSTRAINT UQ_rolse_title UNIQUE(title);




-- Удаление
ALTER TABLE roles
DROP CONSTRAINT UQ_rolse_title;










-- ========= CHECK ======


CREATE  TABLE  productse (
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title varchar(128) NOT NULL,
	
--	price decimal(10,2) CHECK(price > 0)
	
	price decimal(10,2),
	
	CONSTRAINT CK_products_price CHECK(price > 0)
	
);

DROP TABLE productse;



--    =============

CREATE  TABLE  productse (
	id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	title varchar(128) NOT NULL,
	
	price decimal(10,2)		NOT NULL,
	discount_prise decimal(10,2) NOT NULL,
	
	CONSTRAINT CK_products_price CHECK(price > 0),
	CONSTRAINT CK_products_dicount_prise
		CHECK(discount_prise > 0 AND discount_prise < price)
	
	
);










