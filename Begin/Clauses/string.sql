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
(2,'Bob Thapa','bob_thapa@yahoo.cpm','Kathmandu'),(3,'Charlie Gurung','charlie@outlook.com','Pokhara'),
(4,'Diana Karki','diana.karki@gmail.com','Biratnagar')
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

