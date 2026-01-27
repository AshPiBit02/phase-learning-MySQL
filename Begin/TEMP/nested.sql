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

