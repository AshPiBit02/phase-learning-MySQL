#String(are the sequences of characters enclosed in single quotes)
-- SQL provies variety of built-in functions/operations to manipulate strings,including concat,search,pattern matching.
-- i. LENGTH(): returns the number of characters in the string
--  SELECT LENGTH('string');
-- ii. CONCAT(): concatenate multiple stiring into single string
--  SELECT CONCAT('string1','string2,'',...);
-- iii. SUBSTRING(): extract the portion of the string
--   SELECT SUBSTRING(string,starting_position,length)
-- iv. UPPER() and LOWER(): converts upper to lower case and lower to uppercase
--   SELECT UPPER(string);
--   SELECT LOWER(string);
-- v. LOCATE(): search for a substring and returns the position of the substring
--  LOCATE(substring,string,start);search substring in string from given start 
--  LOCATE(substring,string);search for substring in sting from the starting first position of the string.
-- PATTER MATCHING IN STRING(is typically using the 'LIKE' along with wildcard characters
--  to search for specific pattern in the string data)
-- i. Percent(%): represent zero or more charaters
-- ii. Underscore(_): represent exactly one character
#i.Percent(%):
-- SELECT column FROM table_name WHERE column LIKE 'x%'; will match any values in column that starts with 'x'
-- SELECT column FROM table_name WHERE column LIKE '%x'; will match any values in column that ends with 'x'
-- SELECT column FROM table_name WHERE column LIKE '%x%'; will match any values in column that x anywhere in column's data
#ii. Underscore(_):
-- SELECT column FROM table_name WHERE column LIKE 'x_y'; will match any values in column that starts with x ,
-- ends with y and conatins single charater between them
-- SELECT column FROM table_name WHERE column LIKE 'x__y'; will match any values in column that starts with x ,
-- ends with y and conatins two charater between them
-- SELECT column FROM table_name WHERE column LIKE '_x'; will match any values in column that ends with x ,
-- and conatins any single charater at start
-- SELECT column FROM table_name WHERE column LIKE 'x_'; will match any values in column that starts with x ,
-- and conatins any single charater at end

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(20),
    email VARCHAR(40),
    city VARCHAR(50)
);
INSERT INTO users VALUES(1,'Alice Sharma','alice@gmail.com','Pokhara'),
(2,'Bob Thapa','bob_thapa@yahoo.com','Kathmandu'),(3,'Charlie Gurung','charlie@outlook.com','Pokhara'),
(4,'Diana Karki','dianakarki@gmail.com','Biratnagar');
-- find the number of characters in each user's full_name;
SELECT LENGTH(full_name) FROM users; 
-- combine full_name and email into one string called contactInFo
SELECT CONCAT(full_name,email) AS ContactInfo FROM users;
-- Extract the domain name(e.g. gmail,yahoo) from each user's email.
SElECT full_name,SUBSTRING(email,LOCATE('@',email)+1,
       LOCATE('.',email,LOCATE('@',email))-LOCATE('@',email)-1)
        AS domain_name FROM Users;
-- covert all city names to uppercase.
SELECT UPPER(city) FROM users;
--cover all full_name values to lowercase
SELECT LOWER(full_name) FROM users;
-- find the users whose email ends with gmail.com
SELECT full_name FROM Users WHERE email LIKE '%gmail.com';
-- find the users whose full_name starts with D
SELECT full_name FROM users WHERE full_name LIKE 'D%';
-- Use % to find whose email contains @gmail.
SELECT full_name,email FROM users WHERE email LIKE '%@gmail%';
-- USE (_) to find users whose email has exactly one character before @
SELECT full_name,email FROM users WHERE email LIKE '_@';
-- Exract the first 5 characters of full_name,convert then to uppercase and filters only users whose email contains outlook
SELECT full_name,UPPER(SUBSTRING(full_name,1,5)) AS short_name,email FROM users WHERE email LIKE '%outlook%';
-- find all users whose full_name length is greater than 10 charaters
SELECT full_name FROM users WHERE LENGTH(full_name)>10;
-- Create a new column that shows "Name(City)" for each user.
SELECT user_id,email,CONCAT(full_name,'(',city,')') AS name_city FROM users;
-- extract the first 3 letter of each city
SELECT city,SUBSTRING(city,1,3) AS short_city FROM users;
-- Extract everything after @ in the email
SELECT email,SUBSTRING(email,LOCATE('@',email)+1) AS full_domain FROM users;
-- Extract only the top_level domain(like com)
SELECT email,SUBSTRING(email,LOCATE('.',email)+1) AS full_domain FROM users;
-- convert city name to uppercase and order then alphabetically
SELECT full_name,UPPER(city) AS city_upper FROM USERS ORDER BY city_upper ASC;
INSERT INTO users VALUES(5,'Juj knight','juj_knight@gmail.com','Chandrapur');
-- Find users whose email contains an underscore(_)
SELECT full_name,email FROM USERS WHERE email LIKE '%\_%'; -- / tells SQL treat the next 
-- character as literal(must contain a value ), not special, if we don't use \ it will return all the 
--+email since % can be zero and _ says any one charater
-- 
-- Display the first 4 characters of full_name in uppercase, followed by the domain of their email
SELECT full_name,email,CONCAT(UPPER(SUBSTRING(full_name,1,4)),SUBSTRING(email,LOCATE('@',email)+1)) AS name_domain FROM users;
-- FInd all users whose full_name length is greater than 5 and whose email contains gmail
SELECT full_name,email FROM users WHERE LENGTH(full_name)>5 AND email LIKE '%gmail%';
-- Show "CITY: Full_name" for all users, but only if their city start with B
SELECT CONCAT(UPPER(city),': ',full_name) AS city_user FROM users WHERE city LIKE "B%";



