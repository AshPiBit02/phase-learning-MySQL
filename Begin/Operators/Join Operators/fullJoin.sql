# FULL OUTER JOIN
-- returns all records from the left table and right table
-- if there is no match, the result is NULL on the both side of the table.
-- MySQL does not support FULL OUTER JOIN directily. It can be simulated using a combination of LEFT and RIGHT JOIN with UNION
-- Sytax: SELECT columns FROM table1 FULL OUTER JOIN table2 ON table1.column_name=table2.column_name;