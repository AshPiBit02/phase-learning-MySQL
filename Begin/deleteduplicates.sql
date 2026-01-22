CREATE TABLE Employees(Employee_ID int AUTO_INCREMENT PRIMARY KEY,Name VARCHAR(40),Department VARCHAR(40));
ALTER TABLE Employees AUTO_INCREMENT=101;--for default id values
INSERT INTO Employees(Name,Department) VALUES('Martin','HR'),('Bob','Sales'),
('Martin','HR'),('Charlie','Marketing'),('Diana','Sales');
SELECT * FROM employees; 
--to delete duplicate rows in a table we use delete comman
--those records which are not int the smallest emp_ids group get deleted from the employees table
 --select the smallest emp_ids for each unique group(name and department)
DELETE FROM Employees
WHERE Employee_ID NOT IN ( 
    SELECT Employee_ID FROM (
        SELECT MIN(Employee_ID) AS Employee_ID
        FROM Employees
        GROUP BY Name, Department
    ) AS t
);
SELECT * FROM employees;
SELECT Name,Department,COUNT(*) FROM Employees GROUP BY Name,Department HAVING COUNT(*)>1;--COUNT(*) counts the number of duplicate records
