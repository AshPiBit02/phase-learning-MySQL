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
 -- Create a view to show employees whose names start with 'S'
 CREATE VIEW emp_name_s AS SELECT emp_id,emp_name FROM employees WHERE emp_name LIKE 'S%';
 SELECT * FROM emp_name_s;
 -- Create a view to show employees with salary between 40000 and 60000.
 CREATE VIEW salary_range_10k_60k AS SELECT emp_id,emp_name,salary FROM employees
  WHERE salary>40000 AND salary<60000;--use 'WHERE salary BETWEEN 40000 AND 60000; when including range is required.
SELECT * FROM salary_range_10k_60k;
-- Create a view to show employees along with year of hire.
CREATE VIEW emp_hire_year AS SELECT emp_id,emp_name,YEAR(hire_date) AS hire_year FROM employees;
SELECT * FROM emp_hire_year;
-- Create a view to show department-wise maximum salary.
CREATE VIEW dept_high_salary AS SELECT department,MAX(salary) AS highest_salary FROM employees GROUP BY department;
SELECT * FROM dept_high_salary; 
-- Create a view to show employees with salary less than average salary.
CREATE VIEW less_than_avg_salary AS SELECT emp_id,emp_name,salary FROM employees
 WHERE salary <(SELECT AVG(salary) FROM employees );
SELECT * FROM less_than_avg_salary;
-- Create a view to show employees along with department name and location using INNER JOIN 
CREATE VIEW emp_dept_info AS SELECT e.emp_id,e.emp_name,e.department,d.location FROM employees e
INNER JOIN departments d ON e.department=d.dept_name;
SELECT * FROM emp_dept_info;
-- Create a view to show employees along with department name using LEFT JOIN.
CREATE VIEW emp_dept_infol AS SELECT e.emp_id,e.emp_name,e.department,d.location FROM employees e
LEFT JOIN departments d ON e.department=d.dept_name;
SELECT * FROM emp_dept_infol;
CREATE VIEW emp_before_2021 AS SELECT emp_id,emp_name FROM employees WHERE YEAR(hire_date)<2021;
SELECT * FROM emp_before_2021;
-- Create a view to show employees with salary greater than all HR employees.
CREATE VIEW emp_sal_more_than_HR_dept AS SELECT emp_id,emp_name,salary FROM employees
WHERE salary >( SELECT MAX(salary) FROM employees WHERE department IN ('HR'));
SELECT * FROM emp_sal_more_than_HR_dept;
-- Create a view to show employees with salary equal to the minimun salary in the company.
CREATE VIEW min_salary_emp AS SELECT emp_id,emp_name,salary FROM employees WHERE 
salary = (SELECT MIN(salary) FROM employees);
SELECT * FROM min_salary_emp;