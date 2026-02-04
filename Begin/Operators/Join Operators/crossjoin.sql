#CROSS JOIN
-- returns the cartesian product of two tables
-- Syntax: SELECT column_names FROM table1 CROSS JOIN table2;
-- List all possible tea_snack parings
SELECT f.flavor_name,s.snack_name FROM Tea_Flavors f CROSS JOIN Snacks s;
-- If you add a new snack(say Cake), how many rows will the CROSS JOIN output now
INSERT INTO Snacks VALUES('S4','Cake');
SELECT f.flavor_name,s.snack_name FROM Tea_Flavors f CROSS JOIN Snacks s;
-- filter the CROSS JOIN to only show pairs where the tea is Herbal tea
SELECT f.flavor_name,s.snack_name FROM Tea_Flavors f CROSS JOIN Snacks s 
WHERE f.flavor_name='Herbal Tea';