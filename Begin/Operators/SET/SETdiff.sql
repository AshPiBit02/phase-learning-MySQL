# EXCEPT(Set Difference)
 -- returns the rows from the first SELECT statement that are not present in the second SELECT statements.
 -- Syntax: SELECT column1,column2,.... FROM table1 EXCEPT SELECT column1,column2,... FROM table2.
 -- Find destinations that are in Local_Tourism but not in internation_tourism
 SELECT destination FROM local_tourism EXCEPT SELECT destination FROM international_tourism;
 -- Find categories that exits in Local_tourism but not in international_tourism
 SELECT category FROM local_tourism EXCEPT SELECT category FROM international_tourism;
 -- Find destinations taht extis in international_tourism but not in local_tourism;
 SELECT destination FROM international_tourism EXCEPT SELECT destination FROM local_tourism;
 -- Find destinations with  more than 10,000 visitors in Local_tourism but not in international_tourism.
 SELECT destination FROM local_tourism WHERE visitors>10000 EXCEPT 
 SELECT destination FROM international_tourism;
