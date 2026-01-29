#RENAME(renaming is done for columns, tables or derived results to make then easier to understand or work with)
-- i. Renaming table(using AS)
--    SELECT column1,column2,... FROM table_name AS new_table_name;
-- ii. Renaming columns(using AS)
--    SELECT column_name AS new_column_name ,columns... FROM table_name;
-- iii.  Renaming derived columns or tables(using AS)
--   SELECT column1, column2,column2+(something) AS new_column2 FROM table_name;
-- iv. Renaming a table permanently 
--   ALTER TABLE table_name RENAME TO new_table_name;
-- v. Renaming a column permanently
--   ALTER TABLE table_name RENAME COLUMN column_name TO new_name;

#Implementation
CREATE TABLE Staffs (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);
INSERT INTO Staffs (EmpID, FirstName, LastName, Age, Salary, Department) VALUES
(101, 'Alice', 'Sharma', 28, 50000.00, 'HR'),
(102, 'Bob', 'Thapa', 32, 60000.00, 'IT'),
(103, 'Charlie', 'Gurung', 26, 55000.00, 'Finance'),
(104, 'Diana', 'Karki', 30, 62000.00, 'IT');
--Rename the table Staff to worker temporarily as select FirstName, Salary;
SELECT FirstName,Salary FROM Staffs AS Workers;

-- Rename the column salary to Income in a query
SELECT EmpID,FirstName,LastName,Age,Salary AS Income, Department FROM Staffs;

-- Rename multiple columns: FirstName to Name , Department to Dept
SELECT FirstName AS Name , Department AS Dept FROM staffs AS Name_Dept;

-- Rename a derived columns: show salary+5000 AS BONUS SALARY
SELECT EmpID,FirstName,Salary,Salary+5000 AS SalarywithBonus FROM staffs; 

--Permanent renaming using ALTER
--permanentyly renaem the table Staffs to Team
ALTER TABLE Staffs RENAME TO Team;
SELECT * FROM team;
-- permanently rename the column department to division
ALTER TABLE Team RENAME COLUMN Department TO Division;
SELECT * FROM Team;
-- Renames the table to Workforce
ALTER TABLE Team RENAME TO Workforce;
-- Renames Salary to Pay
ALTER TABLE workforce RENAME COLUMN Salary TO Pay;
SELECT * FROM workforce;
SELECT EmpID,FirstName,Pay,Pay+10000 AS AdjustedPay FROM workforce;
SELECT EmpID,FirstName FROM Workforce WHERE Division='IT';
