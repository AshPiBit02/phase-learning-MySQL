# FULL OUTER JOIN
-- returns all records from the left table and right table
-- if there is no match, the result is NULL on the both side of the table.
-- MySQL does not support FULL OUTER JOIN directily. It can be simulated using a combination of LEFT and RIGHT JOIN with UNION
-- Sytax: SELECT columns FROM table1 FULL OUTER JOIN table2 ON table1.column_name=table2.column_name;

-- List all farmers and stalls, even if some don't match
SELECT f.farmer_name,s.stall_name FROM farmers f LEFT JOIN market_stalls s ON f.farmer_id=s.farmer_id UNION
SELECT f.farmer_name,s.stall_name FROM farmers f RIGHT JOIN market_stalls s ON f.farmer_id=s.farmer_id;
-- Which stall exits without farmers?
SELECT s.stall_id,s.stall_name FROM market_stalls s LEFT JOIN farmers f ON
s.farmer_id=f.farmer_id WHERE f.farmer_id IS NULL;
-- Which farmers grow crops but don't have stalls?
SELECT f.farmer_id,f.farmer_name FROM farmers f LEFT JOIN market_stalls s ON f.farmer_id=s.farmer_id
WHERE f.crop IS NOT NULL AND s.farmer_id IS NULL;

