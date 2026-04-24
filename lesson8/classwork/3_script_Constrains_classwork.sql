

-- == PRIMARY KEY == 
--Не допускается NULL + значения уникальны


--Определение при обьявлении столбца
CREATE TABLE units(
	id int PRIMARY KEY,
	title varchar(32)
);


--Определение вне обьявлении столбца
CREATE TABLE units(
	id int,
	title varchar(32),
	
	CONSTRAINT PK_units_id PRIMARY KEY(id) 
);



--Определение вне обьявлении столбца составного PRIMARY KEY
CREATE TABLE units(
	id int,
	path varchar(256),
	title varchar(32),
	
	CONSTRAINT PK_units_id_path PRIMARY KEY(id,path),
--	PRIMARY KEY(id,path)
);



--Добавление PRIMARY KEY после создания таблици
CREATE TABLE units(
	id int NOT NULL,
	title varchar(32),
);

ALTER TABLE units
ADD CONSTRAINT PK_units_id_path PRIMARY KEY(id)



DROP TABLE units;
































