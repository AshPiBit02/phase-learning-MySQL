#The SELECT clause are used to specify which column or expression to retrieve from the dataabase.
-- i. Selecting specific columns(attributes)
-- SELECT column1,column2,... FROM table_name;(will return only the given colums)
-- ii. Selecting all columns
--  SELECT * FROM table_name;
-- iii. Alias for columns(keyword as AS can be used to assign an alias to column or expression)
--  SELECT column1 AS column2,column3 FROM table_name;(will return only the column1 and column3 from the table but column1 will be named as column2)
-- iv. Select distinct values(keyword 'DISTINCT' is used ot remove duplicate rows from the result set)
-- SELECT DISTINCT column1,column2,... FROM table_name;
-- v. Using Expression or calculations(used with expression or calculation such as arithmetic operators or string manipulations)
--  SELECT column1,column2=column2*1.5 AS new_table_name FROM original_table_name;
-- vi. Selecting using Aggregate functions(aggregate functions perform a calculation on a set values and return a single result)
-- a.COUNT(); counts the number of rows that match a specified condition
--  SELECT COUNT(*) FROM table_name;
-- b. SUM(); will return the total sum of a numeric column
-- SELECt SUM(column_name) FROM table_name;
-- c. AVG(); returns mean of thte values in a numeric column
-- SELECT AVG(column_name) FROM table_name;
-- d. MIN(); returns the smallest value in a column
--  SELECT MIN(column_name) FROM table_name;
-- e. MAX(); returns the largest value in a column.
-- SELECT MAX(column_name) FROM table_name;

--   Implementations ---
CREATE TABLE Customers(CustomerID INT PRIMARY KEY AUTO_INCREMENT,FirstName VARCHAR(20),LastName VARCHAR(20),Age INT ,City VARCHAR(20),PurchaseAmount DECIMAL(10,2));
INSERT INTO Customers(FirstName,LastName,Age,City,PurchaseAmount) VALUES ('Alice','Smith',30,'Pokhara',2500),
('Bob','Johnson',25,'Kathmandu',1800),('Charlie','Lee',32,'Pokhara',2500),
('Diana','Patel',22,'Biratnagar',3000),('Alice','Smith',30,'Pokhara',2500);
-- Selecting specific columns(FirstName and City)
SELECT FirstName,City FROM Customers;
-- Selecting all columns
SELECT * FROM Customers;
-- Using Aliases
SELECT FirstName AS NAME, PurchaseAmount AS AmountSpent FROM customers;
-- Using Expressions or Calculations
SELECT FirstName,PurchaseAmount+500 AS AdjustedAmount FROM customers;
-- Selecting DISTINCT Values
SELECT DISTINCT FirstName,LastName,Age,City,PurchaseAmount FROM customers;
--Using Aggregate functions
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) AS PokharaCustomrs FROM customers WHERE City='Pokhara';
SELECT COUNT(DISTINCT City) AS DistinctCities FROM Customers;
UPDATE customers SET Age=32 WHERE CustomerID=2;--Bob's age will become 32 and below query will return 1
SELECT COUNT(DISTINCT City) AS DistinctCities FROM Customers WHERE Age>30;

