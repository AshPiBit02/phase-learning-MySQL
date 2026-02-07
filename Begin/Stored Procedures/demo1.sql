USE CampusStoreDB;
-- 1. Fetch all orders place by Sita
DELIMITER $$
CREATE PROCEDURE Order_by_Name(IN cust_name VARCHAR(50))
BEGIN
SELECT * FROM Order WHERE customer_name=cust_name;
END $$
DELIMITER ;
CALL Order_by_Name('Sita');
--2. Find all orders where qunatity>10
DROP PROCEDURE IF EXISTS  order_By_quantity ;
DELIMITER $$
CREATE PROCEDURE order_By_quantity(IN quant INT)
BEGIN
SELECT * FROM Orders WHERE quantity > quant;
END $$
DELIMITER ;
CALL order_By_quantity(10);

--3.Get the total number of orders from Pokhara.

-- 4. Show all orders placed in September 2023.

-- 5. Find the highest priced product ordered.

-- 6. List customers who bought Rice.

-- 7. Calculate the total sales amount.
-- 8. Find the average price of products ordered.
-- 9. Show orderes placed by customers from ordered.
-- 10. Get all orderes where price < 500.
-- 11. Find the top 5 most expensive orders.
-- 12. Show customers who were placed in 2023.
-- 13. Count how many orders were place in 2023.
-- 14. Find the earliest order date.
-- 15. Show all orders of Coffee.
-- 16. Get the total quantity of Milk sold.
-- 17. Find customers who ordered products in Octorber 2023.
-- 18. Show orders wher city= chitwan and product_name=Juice.
-- 19. Find the maximum quantity ordered in a single order.
-- 20. Show all orders sorted by order_date DESC.
-- 21. Get the sum of sales for each city.
-- 22. Find customers who ordered Butter or Cheese.
-- 23. Show orders where price BETWEEN 200 and 1000.
-- 24. List distinct product names ordered.
-- 25. Find customers who ordered on 2023-12-15.




