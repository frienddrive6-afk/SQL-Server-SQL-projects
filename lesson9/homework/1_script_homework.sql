

CREATE TABLE customers(
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	phone varchar(15) NOT NULL UNIQUE,
	name nvarchar(100) NOT NULL
);


CREATE TABLE drivers(
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name nvarchar(100) NOT NULL,
	rating int NOT NULL DEFAULT 5,
	
	CONSTRAINT CK_rating CHECK (rating >= 1 AND rating <= 5)
);

CREATE TABLE riders (
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	customer_id int NOT NULL,
	driver_id int NOT NULL,
	price decimal(10,2) NOT NULL,
	
	CONSTRAINT FK_riders_customers FOREIGN KEY(customer_id) REFERENCES customers(id)
		ON DELETE CASCADE,
	CONSTRAINT FK_rides_driver FOREIGN KEY (driver_id) REFERENCES drivers(id) 
        ON DELETE NO ACTION,
      
    CONSTRAINT CK_price CHECK (price > 0)

);