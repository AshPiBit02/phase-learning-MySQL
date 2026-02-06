-- Create a view to display all employees' names and salaries.
CREATE VIEW emp_name_salary AS SELECT emp_name,salary FROM employees;
SELECT * FROM emp_name_salary;
-- Create a view to show employees working in the IT department.
CREATE VIEW emp_name_dept AS SELECT emp_id,emp_name,department FROM employees WHERE department IN ('IT');
SELECT * FROM emp_name_dept;
-- Create a view to show employees earning more than 50,000.
CREATE VIEW highEarner_emp AS SELECT emp_id,emp_name FROM employees WHERE salary>50000;
SELECT * FROM highEarner_emp;
-- Create a view to display employee name, department, and location (joining Employees and departments)
CREATE VIEW emp_dept_location AS SELECT e.emp_id,e.emp_name,e.department,d.location
FROM employees e INNER JOIN 
departments d ON e.department=d.dept_name;
SELECT * FROM emp_dept_location;
-- Create a view to show employees hired ater 2020
CREATE VIEW emp_after_2020 AS SELECT emp_id,emp_name,hire_date FROM employees WHERE YEAR(hire_date)>2020;
SELECT * FROM emp_after_2020;
-- Create a view to calculate average salary by department.
CREATE VIEW avg_dept_salary AS SELECT department,AVG(salary) AS avg_salary FROM employees GROUP BY department;
SELECT * FROM avg_dept_salary; 
DROP VIEW avg_dept_salary;
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(10,2);
-- Create a view to list employees in Finanance department with salary above 60,000
CREATE VIEW emp_finance_above_60000 AS SELECT emp_id,emp_name
 FROM employees WHERE department IN ('Finance') AND salary>60000;
 SELECT * FROM emp_finance_above_60000;
 -- Create a view to show only employee name
 CREATE VIEW employee_names AS SELECT emp_name FROM employees ;
 SELECT * FROM employee_names;
 -- Create a view to show employees sorted by salary descending.
 CREATE VIEW sorted_by_salary_desc AS SELECT emp_id,emp_name,salary FROM employees ORDER BY salary DESC;
 SELECT * FROM sorted_by_salary_desc;
 -- Create a view to show employees along with their department location
 CREATE VIEW emp_dept_loc AS SELECT e.emp_id,e.emp_name,e.department,d.location FROM employees
 e INNER JOIN departments d ON e.department=d.dept_name;
 SELECT * FROM emp_dept_loc;
