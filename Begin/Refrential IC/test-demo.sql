CREATE TABLE table1(person_id INT PRIMARY KEY,name VARCHAR(30) NOT NULL,city VARCHAR(30));
CREATE TABLE table2(profession_id INT PRIMARY KEY,person_id INT,Profession 
VARCHAR(20),Qualification VARCHAR(30),
FOREIGN KEY(person_id) REFERENCES table1(person_id) ON UPDATE CASCADE ON DELETE CASCADE);
DROP TABLE table2;
INSERT INTO table1 VALUES(1002,'Aashish','Pokhara');
INSERT INTO table1 VALUES(1023,'Kdfha','Kathmandu');
INSERT INTO table1 VALUES(1053,'Kafka','Bjosh');
INSERT INTO table2 VALUES(2230,1002,'Computer Engineer','Graduate');
INSERT INTO table2 VALUES(2233,1023,'afer4','efaefe');
INSERT INTO table2 VALUES(2231,1053,'fasdf','afd');
SELECT * FROM table1;
SELECT * FROM table2;
UPDATE table1 SET person_id=1003 WHERE person_id=1002; -- the change can be automatically seen
DELETE FROM table1 WHERE name='Kdfha';
