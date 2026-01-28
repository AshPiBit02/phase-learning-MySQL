#Nested Querirs/ Sub Queries/ Inner Queries( a query embedded within another SQL query)
CREATE TABLE EmployeeLog (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(30)
);
INSERT INTO EmployeeLog 
(emp_id, emp_name, department, salary, hire_date, city) 
VALUES
(101, 'Ramesh Adhikari', 'IT', 60000, '2022-03-15', 'Pokhara'),
(102, 'Sita Bhandari', 'HR', 45000, '2023-01-10', 'Kathmandu'),
(103, 'Kiran Shrestha', 'Finance', 70000, '2021-07-20', 'Pokhara'),
(104, 'Maya Gurung', 'IT', 80000, '2020-11-05', 'Chitwan'),
(105, 'Dipesh KC', 'Finance', 55000, '2022-09-12', 'Kathmandu'),
(106, 'Anil Thapa', 'HR', 48000, '2023-05-01', 'Pokhara'),
(107, 'Sarita Rai', 'IT', 62000, '2021-12-25', 'Kathmandu');


-- find employees whose salary is greater than the average salary of all employees
SELECT emp_name,salary FROM employeelog WHERE salary > (SELECT AVG(salary) FROM employeelog) ;
-- List departments where the maximum salary is greater than the overall average salary
SELECT department,MAX(salary) AS max_salary FROM employeelog GROUP BY department HAVING MAX(salary)>
(SELECT AVG(salary) FROM employeelog);
-- Show employees hired after the earliest hire date in the IT department
SELECT emp_name,department,hire_date FROM employeelog WHERE department='IT' AND hire_date >(SELECT 
MIN(hire_date)FROM employeelog WHERE department='IT');
-- display employees whose salary is higher than the salary of 'Sita Bhandari'
SELECT emp_id,emp_name,salary FROM employeelog WHERE salary>(SELECT salary FROM 
employeelog WHERE emp_name='Sita Bhandari');
-- Find department where the average salary is greater than the average salary salary of HR department
SELECT department,AVG(salary) AS avg_dept_salary FROM employeelog GROUP BY department
HAVING AVG(salary)>(SELECT AVG(salary) FROM employeelog WHERE department='HR');
--List employees whose city is the name as the city of the highest-paid employee.
SELECT emp_id,emp_name,salary,city FROM employeelog WHERE city=(SELECT city
 FROM employeelog WHERE salary=(SELECT MAX(salary) FROM employeelog));
 -- Show employees whose salary is greater than the salary of at least one Finance employee
 SELECT emp_name,salary FROM employeelog WHERE salary>(SELECT MIN(salary) 
 FROM employeelog WHERE department='Finance');
-- Find employees whose salary is less than all salaries in IT department
SELECT emp_id,emp_name,department,salary FROM employeelog WHERE salary<(SELECT MIN(salary)
FROM employeelog WHERE department='IT');
-- Display departments where the number of employees exceeds the number of employees in HR
SELECT department, COUNT(*) AS emp_count FROM employeelog GROUP BY department HAVING COUNT(*)>
(SELECT COUNT(*) FROM employeelog WHERE department='HR');
-- List employees whose names start with the same letter as the employee with the lowest salary
SELECT emp_id,emp_name,department,salary FROM employeelog WHERE
 LEFT(emp_name,1)=(SELECT LEFT(emp_name,1) FROM employeelog WHERE 
 salary=(SELECT MIN(salary) FROM employeelog));
 -- Find employees whose names contain the same substring as the highest-paid employee's name
 SELECT emp_id,emp_name,department,salary FROM employeelog WHERE
  emp_name LIKE (SELECT CONCAT('%',SUBSTRING(emp_name,1,3),'%') FROM employeelog 
  WHERE salary=(SELECT MAX(salary) FROM employeelog));
  -- List employees whose names are longer than the average length of names in the HR department
  SELECT emp_name,LENGTH(emp_name) AS name_length FROM employeelog WHERE
   LENGTH(emp_name)>(SELECT AVG(LENGTH(emp_name)) FROM employeelog WHERE department='HR');
-- show employees whose names end with the same last letter as the lowest-paid employee's name
SELECT emp_id,emp_name FROM employeelog WHERE RIGHT(emp_name,1)=(SELECT RIGHT(emp_name,1)
 FROM employeelog WHERE salary=(SELECT MIN(salary) FROM employeelog));
 -- Display employees whose names are alphabetically greater than the name of the earliest hired employee
 SELECT emp_id,emp_name FROM employeelog WHERE emp_name>(SELECT emp_name 
 FROM employeelog WHERE hire_date=(SELECT MIN(hire_date) FROM employeelog)) ;
 -- Find departments where the average salary is greater than the average salary of employees whose names start with 'A'
 SELECT department,AVG(salary) AS avg_dept_salary FROM employeelog GROUP BY department
 HAVING AVG(salary)>(SELECT AVG(salary) FROM employeelog WHERE emp_name LIKE 'A%') ;
 -- List empolyees whose city name length is greater than the average city name length across all employees.
 SELECT emp_id,emp_name,city, LENGTH(city) AS city_len FROM employeelog
  WHERE LENGTH(city)>(SELECT AVG(LENGTH(city)) FROM employeelog);
  -- Show employees whose names, when converted to uppercase, match the uppercase version of the lowest-paid employee's name
  SELECT emp_id,emp_name,salary FROM employeelog WHERE UPPER(emp_name)=(SELECT UPPER(emp_name) FROM 
  employeelog WHERE salary=(SELECT MIN(salary) FROM employeelog));
  -- Find employees whose names contain the same first two letters as the employee with the maximun salary
  SELECT emp_id,emp_name,salary FROM employeelog WHERE emp_name LIKE (SELECT CONCAT(SUBSTRING(emp_name,1,2),'%')
  FROM employeelog WHERE salary=(SELECT MAX(salary) FROM employeelog));
  -- List departments where the number of employees with names starting with 'S' exceeds the number of employees in HR.
  SELECT department,COUNT(*) AS emp_count FROM employeelog WHERE emp_name LIKE 'S%' GROUP BY 
  department HAVING COUNT(*)>(SELECT COUNT(*) FROM employeelog WHERE department='HR');
# Correlated Subqueries(a type of subquery where the inner query depends on the outer query)
-- Syntax: SELECT outer_column FROM outer_table WHERE outer_column=(SELECT inner_column FROM inner_table WHERE
--         inner_coldition AND outer_column = inner_column);
-- List employees whose salay is greater  than the average salary of their own department
SELECT e.emp_id,e.emp_name,e.salary,e.department FROM employeelog e
 WHERE e.salary>(SELECT AVG(salary) FROM employeelog WHERE department=e.department);
 -- show employees whose name length is greater than the average name length of their department
 SELECT e.emp_name,e.department,LENGTH(e.emp_name) AS name_len FROM employeelog e WHERE LENGTH(e.emp_name)>(SELECT
  AVG(LENGTH(emp_name)) FROM employeelog WHERE department=e.department );
-- Find employees who where hired after the earliest hire date in their department.
SELECT e.emp_id,e.emp_name,e.department,e.hire_date FROM employeelog e WHERE 
e.hire_date>(SELECT MIN(hire_date) FROM employeelog WHERE department=e.department);
-- Display employees whose names start with the same first letter as the lowest-paid employee in their department.
SELECT e.emp_id,e.emp_name,e.department FROM employeelog e WHERE LEFT(e.emp_name,1)=(SELECT LEFT(emp_name,1) FROM employeelog
WHERE department=e.department AND 
salary=(SELECT MIN(salary) FROM employeelog WHERE department=e.department));
-- List employees who live in city where the number of employees exceeds the number of employees in their department.
SELECT e.emp_id,e.emp_name,e.city FROM employeelog e WHERE (SELECT COUNT(*) FROM employeelog 
WHERE city=e.city)>(SELECT COUNT(*) FROM employee WHERE department=e.department);
-- Show employees whose salary is equal to the maximum salary in their department.
SELECT e.emp_id,e.emp_name,e.department,e.salary FROM employeelog e WHERE 
e.salary=(SELECT MAX(salary) FROM employeelog WHERE department=e.department);
-- Find employees whose uppercase name matches the uppercase version of the shortest name in their department.
SELECT e.emp_id,e.emp_name,e.department FROM employeelog e WHERE UPPER(e.emp_name)=(SELECT UPPER(emp_name) 
FROM employeelog WHERE department=e.department ORDER BY LENGTH(emp_name) ASC LIMIT 1);
