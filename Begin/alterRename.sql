ALTER Table Customer RENAME TO Buyers;--customer changes to buyers
ALTER Table Buyers RENAME COLUMN FirstName TO FName;--changes colum name
ALTER TABLE Buyers ADD University varchar(50);--adds new attribute to the table
SELECT * FROM buyers;
ALTER Table buyers RENAME TO Students;
ALTER Table students MODIFY COLUMN FName VARCHAR(40);--varchar(50) changes to varchar(40)
SELECT * FROM students;
CREATE Table Learner(id INT PRIMARY KEY,name VARCHAR(40),age INT ,email VARCHAR(40),phone_no VARCHAR(15));
INSERT INTO learner VALUES(1,'Amit',20,'amit@gmail.com','9898989898');
INSERT INTO learner VALUES(2,'Rahul',22,'rahul@gmail.com','9998989898');
INSERT INTO learner VALUES(3,'Priya',20,'priya@gmail.com','9899989898');
INSERT INTO learner VALUES(4,'Sonia',20,'sonia@gmail.com','9899899898');
INSERT INTO learner VALUES(5,'Kiran',20,'kiran@gmail.com','9898499898');
SELECT * FROM learner;
ALTER TABLE learner RENAME COLUMN name TO First_Name;
SELECT * FROM learner;
ALTER Table learner RENAME TO learner_details;
SELECT * FROM learner_details;
ALTER TABLE learner_details ADD marks INT;
ALTER TABLE learner_details MODIFY COLUMN phone_no BIGINT;
ALTER TABLE learner_details MODIFY COLUMN marks DECIMAL(8,2);
SELECT * FROM learner_details;
--Removing a column
ALTER TABLE learner_details DROP COLUMN marks;
SELECT * FROM learner_details;
ALTER TABLE learner_details MODIFY age int DEFAULT 18;--all learners age becomes 18
SELECT * FROM learner_details;


