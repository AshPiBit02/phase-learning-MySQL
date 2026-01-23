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
