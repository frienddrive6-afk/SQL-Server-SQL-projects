CREATE TABLE subjects(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	title nvarchar(256) NOT NULL,
	daleted_at datetime NULL
);


CREATE TABLE groups(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	title nvarchar(128) NOT NULL,
	status tinyint NOT NULL
);