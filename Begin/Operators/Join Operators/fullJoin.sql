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

-- Show all libraries and donations, including unmatched ones.
SELECT l.lib_id,l.library_name,d.donation_id,d.donor_name FROM libraries l LEFT JOIN book_donations d ON l.lib_id=d.lib_id
UNION
SELECT l.lib_id,l.library_name,d.donation_id,d.donor_name FROM libraries l RIGHT JOIN book_donations d ON l.lib_id=d.lib_id;
-- Which donors gave books to non_existent libraries?
SELECT d.donation_id,d.donor_name FROM book_donations d LEFT JOIN libraries l ON d.lib_id=l.lib_id
WHERE l.lib_id IS NULL;
-- Which libraries exits but have no donations?
SELECT l.lib_id,l.library_name FROM libraries l LEFT JOIN book_donations d ON l.lib_id=d.lib_id
WHERE d.donation_id IS NULL;

-- List all musicians and concerts, even if some don't match.
SELECT m.musician_id,m.musician_name,m.instrument,c.concert_id,c.concert_name FROM musicians m 
LEFT JOIN concerts c ON m.musician_id=c.musician_id 
UNION
SELECT m.musician_id,m.musician_name,m.instrument,c.concert_id,c.concert_name FROM musicians m 
RIGHT JOIN concerts c ON m.musician_id=c.musician_id ;
-- Which concert had no musician?
SELECT c.concert_id,c.concert_name FROM concerts c LEFT JOIN musicians m ON c.musician_id=m.musician_id
WHERE m.musician_id IS NULL;
-- Which musicians haven't perfomed in any concert?
SELECT m.musician_id,m.musician_name FROM concerts c RIGHT JOIN musicians m ON c.musician_id=m.musician_id
WHERE c.concert_id IS NULL;

