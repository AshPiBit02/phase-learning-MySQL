# UNION
-- combines the results of multiple SELECT statements into a single set.
-- removes duplicate rows from the final output.
-- Syntax: SELECT column1,column2,... FROM table1 UNION SELECT column1,column2,... FROM table2;


-- List all destinations(local + International) without duplicates.
SELECT * FROM local_tourism UNION SELECT * FROM international_tourism;
-- List all categories across both tables.
SELECT category FROM local_tourism UNION SELECT category FROM international_tourism;
-- Show all destinations including duplicates(so overlaps like Pokhara appear twice)
SELECT destination FROM local_tourism UNION ALL SELECT destination FROM international_tourism;
-- Count total rows returned when using UNION ALL vs UNION
SELECT COUNT(*) AS total_rows_using_union FROM (SELECT destination,category,visitors FROM local_tourism
UNION ALL SELECT destination,category,visitors FROM international_tourism) AS combined_all;
SELECT COUNT(*) AS total_rows_using_union_all FROM (SELECT destination,category,visitors FROM local_tourism
UNION SELECT destination,category,visitors FROM international_tourism) AS combined_unique;
-- List all destinations where category is 'Heritage' from both tables.
SELECT * FROM  local_tourism WHERE category IN ('Heritage') UNION
SELECT * FROM  international_tourism WHERE category IN ('Heritage');
-- List all destinations with visitors greater than 10,000 for both tables.
SELECT destination FROM  local_tourism WHERE visitors>10000 UNION
SELECT destination FROM  international_tourism WHERE visitors>10000;
