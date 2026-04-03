CREATE TABLE p42_copany_bd.dbo.employees (
	id int IDENTITY(1000,1) NOT NULL,
	name nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	birthday date NULL,
	email nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	position_id int NULL,
	department_id int NULL,
	hire_date date DEFAULT sysdatetime() NOT NULL,
	manager_id int NULL,
	last_name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	first_name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	middle_name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	salary float NULL,
	bonus_percent float NULL,
	extra_percent float NULL,
	CONSTRAINT PK_Employees PRIMARY KEY (id),
	CONSTRAINT UQ_Employees_Email UNIQUE (email),
	CONSTRAINT FK_Employees_DepartmentID FOREIGN KEY (department_id) REFERENCES p42_copany_bd.dbo.departments(id),
	CONSTRAINT FK_Employees_ManagerID FOREIGN KEY (manager_id) REFERENCES p42_copany_bd.dbo.employees(id),
	CONSTRAINT FK_Employees_PositionID FOREIGN KEY (position_id) REFERENCES p42_copany_bd.dbo.positions(id)
);

INSERT INTO p42_copany_bd.dbo.employees (id,name,birthday,email,position_id,department_id,hire_date,manager_id,last_name,first_name,middle_name,salary,bonus_percent,extra_percent) VALUES
	 (1000,N'Иванов И.И.','1955-02-19',N'i.ivanov@mail.com',2,1,'2023-11-15',NULL,N'Иванов',N'Иван',N'Иванович',5000.0,50.0,NULL),
	 (1001,N'Петров П.П.','1983-12-03',N'p.petrov@mail.com',3,3,'2023-11-15',1003,N'Петров',N'Петр',N'Петрович',1500.0,15.0,NULL),
	 (1002,N'Сидоров С.С.','1976-06-07',N's.sidorov@mail.com',1,1,'2023-11-15',1001,N'Сидоров',N'Сидор',NULL,2500.0,NULL,20.0),
	 (1003,N'Андреев А.А.','1982-04-17',N'a.andreev@mail.com',4,3,'2023-11-15',1001,N'Андреев',N'Андрей',NULL,2000.0,30.0,NULL),
	 (2004,N'Brus W','1982-10-10',N'brus_w@mail.com',4,3,'2023-11-21',NULL,N'Willis',N'Brus',NULL,2000.0,10.0,NULL);

