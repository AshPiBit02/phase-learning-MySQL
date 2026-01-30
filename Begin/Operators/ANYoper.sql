#ANY operator(allows comparison with any one of the values in the subquery)
#The comparison is typically used with operator like =,>, , ,>=,<=,<>
-- Syntax: SELECT column1,column2,... FROM table_name WHERE column_name operator ANY (subquery)
CREATE TABLE Workers (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);
CREATE TABLE Training (
    train_id INT PRIMARY KEY,
    emp_id INT,
    course_name VARCHAR(50),
    year INT
);
INSERT INTO workers VALUES
(101, 'Ramesh', 'Finance', 50000, 'Kathmandu'),
(102, 'Sita', 'HR', 45000, 'Pokhara'),
(103, 'Hari', 'IT', 60000, 'Lalitpur'),
(104, 'Gita', 'Finance', 55000, 'Bhaktapur');
INSERT INTO Training VALUES
(1, 101, 'Taxation', 2025),
(2, 102, 'HR Analytics', 2024),
(3, 103, 'Machine Learning', 2025),
(4, 104, 'Finance Basics', 2025);
-- Employees whose salary is greater than ANY Finance department salary
SELECT emp_id,emp_name,department,salary FROM workers WHERE salary > ANY
 (SELECT salary FROM workers WHERE department='Finance');
 -- Employees who attended ANY traning in 2025
 SELECT emp_id,emp_name,department,city FROM workers WHERE emp_id = ANY
  (SELECT emp_id FROM training WHERE year=2024);
  -- Employees whose department matches ANY course_name
  SELECT emp_id,emp_name,department FROM workers WHERE department = ANY (SELECT course_name FROM training );
  -- Employees whose salary is less than ANY IT department salary
  SELECT emp_id,emp_name,department,salary FROM workers WHERE salary < ANY
   (SELECT salary FROM workers WHERE department='IT');
-- Employees whose city matches ANY employee trained in Machine Learning
SELECT emp_id,emp_name,city FROM workers WHERE emp_id = ANY
 (SELECT emp_id FROM training WHERE course_name='Machine Learning');
-- show employees whose emp_id is eqaul to ANY emp_id of those trained in 'Finance Basics'
SELECT emp_id,emp_name FROM workers WHERE emp_id = ANY 
(SELECT emp_id FROM training WHERE course_name='Finance Basics');
-- Find employees whose salary is greater than ANY salary of employees from kathmandu
SELECT emp_id,emp_name,salary,city FROM workers WHERE salary > ANY
 (SELECT salary FROM workers WHERE city='Kathmandu');
 -- Display employees whose emp_id matches ANY of those trained in 'Taxation'
 SELECT emp_id,emp_name FROM workers WHERE emp_id = ANY
 (SELECT emp_id FROM training WHERE course_name='Taxation');
--List employees whose salary is less than ANY salary of employees from Pokhara
SELECT emp_id,emp_name,salary,city FROM workers WHERE salary < ANY 
(SELECT salary FROM workers WHERE city='Pokhara' );
