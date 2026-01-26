USE test_db;
CREATE TABLE Customer(customer_id INT PRIMARY KEY,FirstName varchar(50),
SecondName VARCHAR(50),Country VARCHAR(50),Age INT CHECK(Age>=0 AND Age<=99),Phone VARCHAR(10));
SELECT* FROM Customer;
-- Data insertion
INSERT INTO Customer VALUES (1,'Luca','Bianchi','Italy',23,'xxxxxxxxxx');
INSERT INTO Customer VALUES (2,'Aiko','Tanaka','Japan',21,'xxxxxxxxxx');
INSERT INTO Customer VALUES (3,'Carlos','Gomez','Spain',24,'xxxxxxxxxx');
INSERT INTO Customer VALUES (4,'Sofia','Muller','Germany',22,'xxxxxxxxxx');
INSERT INTO Customer VALUES (5,'Ethan','Johnson','USA',25,'xxxxxxxxxx');
SELECT* FROM Customer;
--Creating a new table from existing table
CREATE TABLE subCustomer AS SELECT customer_id, FirstName,SecondName FROM Customer;
SELECT * FROM subcustomer;
CREATE TABLE sub1Customer AS SELECT * FROM Customer;-- use of * coplies all the record into new table
SELECT * FROM sub1customer;
--If we attempt to create a new table and that table table already exists then sql return error 
-- to avoid this we use CREATE TABLE IF NOT EXISTS table_name(...)
CREATE Table IF NOT EXISTS Customer(id int ,name varchar(50));--will not be created since customer table already exists
--To view the structure of created table we use DESC table_name command;
DESC customer;
DROP TABLE IF EXISTS supplier;--drops the table if it exists
--to create temporary table we use TEMPORARY key word
--temporary tables are used to store intermediate results for a session without affecting permanent data



