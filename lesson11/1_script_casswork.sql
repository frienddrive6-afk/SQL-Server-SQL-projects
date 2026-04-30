



-- ============= Не класические случаи ============



CREATE TABLE categories (
	id int PRIMARY KEY IDENTITY(1,1 ) NOT NULL,
	title varchar(64) NOT NULL,
	parent_id int NULL,
	
	CONSTRAINT FR_categories_parent FOREIGN KEY(parent_id) REFERENCES categories(id)
);

INSERT INTO categories(title, parent_id)
VALUES
	('A', NULL),
	('B', NULL),
	('C', NULL);


INSERT INTO categories(title, parent_id)
VALUES
	('A11', 1),
	('A12', 1),
	('A13', 1);

--DELETE FROM categories
--WHERE parent_id = 1;


-----------------------------------------




CREATE TABLE humans(
	id int PRIMARY KEY IDENTITY(1,1 ) NOT NULL,
	username varchar(64) NOT NULL,
	email varchar(32) NOT NULL,
	age tinyint NULL
);




CREATE TABLE subscribes(
	author_id int NOT NULL,
	subscriber_id int NOT NULL,
	
	CONSTRAINT PK_subscribes PRIMARY KEY(author_id,subscriber_id),
	
	CONSTRAINT FK_subscribes_author FOREIGN KEY(author_id ) REFERENCES humans(id),
	CONSTRAINT FK_subscribes_subscriber FOREIGN KEY(subscriber_id) REFERENCES humans(id),
	
	CONSTRAINT CK_self_subscribe CHECK(author_id <> subscriber_id)
);


INSERT INTO humans(username, email, age)
VALUES
	('vasia','vasia@mail.com', 23),
	('petya','petya@mail.com', 31),
	('dima','dima@mail.com', 25),
	('kolya','kolya@mail.com', 19);



INSERT INTO subscribes(author_id, subscriber_id)
VALUES
	(1, 2),
	(1, 3),
	(2, 1),
	(3, 1);






















