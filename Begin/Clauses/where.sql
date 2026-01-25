#WHERE clause(used to filter recors based on specific conditions,can be applied to a SELECT,UPDATE,DELETE,or INSERT)
CREATE TABLE CitizenRegistry (
    reg_code INT PRIMARY KEY,
    person_tag VARCHAR(50),
    mail_handle VARCHAR(100),
    township VARCHAR(40),
    years_old INT,
    contact_line VARCHAR(20),
    dwelling_note VARCHAR(120)
);
INSERT INTO CitizenRegistry 
(reg_code, person_tag, mail_handle, township, years_old, contact_line, dwelling_note) 
VALUES
(101, 'Ramesh Adhikari', 'ramesh@himalmail.com', 'Lamjung', 26, '9811111111', 'Near suspension bridge'),
(102, 'Sita Bhandari', 'sita_b@cloudpost.org', 'Baglung', 34, NULL, 'Beside old temple'),
(103, 'Kiran Shrestha', 'kiran@mountain.net', 'Gorkha', 19, '9822222222', NULL),
(104, 'Maya Gurung', 'maya.g@riverflow.com', 'Parbat', 41, NULL, 'Close to bazaar'),
(105, 'Dipesh KC', 'dipesh@valleyhub.io', 'Tanahun', 29, '9833333333', 'Opposite bus park');
-- show all employees whose age is grater than 30;
SELECT reg_code, person_tag
FROM citizenregistry  
WHERE years_old>30;
-- show all users from 'Pokhara' and whose age is above 25;
SELECT * FROM citizenregistry WHERE township='Parbat' AND years_old>25; 
-- find customers who are not from 'Kathmandu'
SELECT * FROM citizenregistry WHERE NOT township = 'Kathmandu';
-- Find all citizens whose mail_handle ends with .com
SELECT reg_code,person_tag FROM citizenregistry WHERE mail_handle LIKE '%.com';
-- show citizens whose touwnship contains 'ung'.
SELECT reg_code,person_tag,township FROM citizenregistry WHERE township LIKE '%ung%';
-- Show citizends whose contact_line is missing 
SELECT reg_code,person_tag FROM citizenregistry WHERE contact_line IS NULL;
-- Display citizens whose dwelling_note is present 
SELECT reg_code,person_tag FROM citizenregistry WHERE dwelling_note IS NOT NULL;
-- find citizens whose age is greater than 25, township starts with T and mail_handle is not from gmail.com
SELECT reg_code,person_tag FROM citizenregistry WHERE years_old>25 AND
 township LIKE 'T%' AND  NOT (mail_handle LIKE '%gmail.com');
 -- create a column that shows "CODE:person_tage" for all citizens, but only if their age is less than 30;
 SELECT CONCAT(reg_code,':',person_tag) AS code_person_tag FROM citizenregistry WHERE years_old<30;
 -- Mask the email so only the first 3 characters of mail_handle are shown followed by ***
 SELECT CONCAT(SUBSTRING(mail_handle,1,3),'***',SUBSTRING(mail_handle,LOCATE('@',mail_handle))) 
 AS masked_email FROM citizenregistry;
 