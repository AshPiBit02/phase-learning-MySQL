#IN Operator( used to filter results based on whether a value exists in a specificed subquery results)
-- It is often used in the WHERE clause.
-- Syntax: SELECT column_name FROM table_name WHERE column_name IN (value1,value2,....);
-- or SELECT column_name FROM table_name WHERE  column_name IN (subquery);
CREATE TABLE ProjectLog (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    project VARCHAR(30),
    salary INT
);
INSERT INTO ProjectLog VALUES
(201, 'Sunita Sharma', 'HR', 'Kathmandu', 'PayrollSys', 48000),
(202, 'Anil Thapa', 'HR', 'Pokhara', 'RecruitApp', 52000),
(203, 'Ramesh Adhikari', 'IT', 'Kathmandu', 'WebPortal', 60000),
(204, 'Sarita Rai', 'IT', 'Lalitpur', 'DataWarehouse', 65000),
(205, 'Maya Gurung', 'IT', 'Pokhara', 'AIEngine', 80000),
(206, 'Dipesh KC', 'Finance', 'Biratnagar', 'AuditTool', 55000),
(207, 'Kiran Shrestha', 'Finance', 'Kathmandu', 'TaxCalc', 70000),
(208, 'Sita Bhandari', 'HR', 'Kathmandu', 'PayrollSys', 46000);
-- List employees who work in either HR or Finance
SELECT emp_id,emp_name,department FROM projectlog WHERE department IN ('HR','Finance');
-- Find employees who live in kathmandu or pokhara
SELECT * FROM projectlog WHERE city IN('Kathmandu','Pokhara');
-- Show employees working on PayrollSys or AuditTool projects
SELECT * FROM projectlog WHERE project IN ('PayrollSys','AuditTool');
-- List employees whose salary matches any salary of IT department employees.
SELECT emp_id,emp_name,department,salary FROM projectlog WHERE salary IN 
(SELECT salary FROM projectlog WHERE department='IT');
-- Find employees whose department is among those with more than 2 employees
SELECT emp_id,emp_name,department FROM projectlog WHERE 
department IN (SELECT department FROM projectlog GROUP BY department HAVING COUNT(*)>2);
-- Find employees whose city is among cities where Finance employees live.
SELECT emp_id,emp_name,city FROM projectlog WHERE city IN (SELECT city 
FROM projectlog WHERE department IN ('Finance'));
-- Find employees whose project is among those handled by HR department
SELECT emp_id,emp_name,department,project FROM projectlog WHERE project
 IN (SELECT DISTINCT project FROM projectlog WHERE department IN ('HR'));
 -- Show employees whose names are in the set ('Sita Bhandari','Dipesh KC','Maya Gurung')
 SELECT emp_id,emp_name,department, city FROM projectlog WHERE emp_name IN
  ('Sita Bhandari','Dipesh KC','Maya Gurung');
-- List employees whose city is among cities where finance employees live but not HR Employees 
SELECT emp_id,emp_name,department,city FROM projectlog WHERE city IN (SELECT DISTINCT city
 FROM projectlog WHERE department IN ('Finance')) AND city NOT IN (SELECT DISTINCT city 
 FROM projectlog WHERE department IN ('HR'));
 -- Show employees whose salary is among the top 3 highest salaries in the table
 SELECT emp_id,emp_name,department,salary FROM projectlog WHERE salary IN 
 (SELECT DISTINCT salary FROM projectlog ORDER BY salary DESC LIMIT 3 );-- Works on latest versions 
 -- Find employees whose department is among departments that have employees in kathmandu
 SELECT emp_id,emp_name,department,city FROM projectlog WHERE department 
 IN (SELECT DISTINCT department FROM projectlog WHERE city IN ('Kathmandu')); 
 -- List employees whose project is among projects assigned to employees earning more than 60,000.
 SELECT emp_id,emp_name,department,project,salary FROM projectlog WHERE project IN 
 (SELECT DISTINCT project FROM projectlog WHERE Salary>60000);
 -- Show employees whose city is among cities where employees from multiple departments(more than one) live.
 SELECT emp_id,emp_name,department,city FROM projectlog WHERE city IN ( SELECT city
  FROM projectlog GROUP BY city HAVING COUNT(DISTINCT department)>1);

CREATE TABLE TrainingLog (
    emp_id INT,
    course_name VARCHAR(50),
    completion_year INT,
    PRIMARY KEY (emp_id, course_name)
);
INSERT INTO TrainingLog VALUES
(201, 'Leadership', 2024),
(202, 'RecruitmentTech', 2025),
(203, 'Web Security', 2025),
(204, 'Data Analytics', 2024),
(205, 'Machine Learning', 2025),
(206, 'Finance Audit', 2023),
(207, 'Taxation Law', 2025),
(208, 'HR Compliance', 2024);
-- Employees from projectLog whose emp_id is in TrainingLog For 2025 courses
SELECT emp_id,emp_name FROM projectlog WHERE emp_id IN (SELECT emp_id 
FROM traininglog WHERE completion_year IN ('2025'));
-- Employees from projectlog whose emp_id is in TrainingLog for Finance/Tax related courses.
SELECT emp_id,emp_name FROM projectlog WHERE emp_id IN (SELECT emp_id FROM traininglog 
WHERE course_name LIKE '%Finance%' OR course_name LIKE '%Tax%');
-- Employees from projectlog whose emp_id is not in TrainingLog for 2024
SELECT emp_id,emp_name FROM projectlog WHERE emp_id NOT IN (SELECT emp_id 
FROM traininglog WHERE completion_year IN ('2024'));
-- Employees from projectlog whose emp_id is in TrainingLog for Machine Learining or Data Analytics
SELECT emp_id,emp_name FROM projectlog WHERE emp_id IN (SELECT emp_id FROM traininglog 
WHERE course_name IN ('Machine Learning','Data Analytics'));
-- Employees from projectLog whose salary is in the set of salaries of employees trained in 2025
SELECT emp_id,emp_name,salary FROM projectlog WHERE emp_id IN (SELECT emp_id 
FROM traininglog WHERE completion_year IN ('2025'));