CREATE TABLE p42_intro_db.dbo.books (
	id int IDENTITY(1,1) NOT NULL,
	title nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	author nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	publication_year smallint NOT NULL,
	genre nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	pages_count smallint NULL,
	price decimal(38,2) NOT NULL
);
GO;

INSERT INTO p42_intro_db.dbo.books (id,title,author,publication_year,genre,pages_count,price) VALUES
	 (1,N'Мастер и Маргарита',N'Михаил Булгаков',1966,N'Классика',480,550.00),
	 (2,N'Гарри Поттер',N'Дж. Роулинг',1997,N'Фэнтези',320,700.50),
	 (3,N'Сказки',N'Братья Гримм',1812,NULL,NULL,300.00),
	 (4,N'Алгоритмы',N'Томас Кормен',2009,N'Учебник',1200,2500.00);
