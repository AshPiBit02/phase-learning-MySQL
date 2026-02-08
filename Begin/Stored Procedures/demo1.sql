USE CampusStoreDB;
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
DELIMITER $$
CREATE PROCEDURE order_by_place(IN input_place varchar(50))
BEGIN
SELECT * FROM orders WHERE city IN ('Pokhara');
END $$
DELIMITER ;
CALL order_by_place('Pokhara');
-- 4. Show all orders placed in September 2023.
DELIMITER $$
CREATE PROCEDURE order_by_date(IN input_date DATE)
BEGIN
SELECT * FROM orders WHERE order_date=input_date;
END $$
DELIMITER ;
CALL order_by_date('2023-09-03');

-- 5. Find the highest priced product ordered.
DELIMITER $$
CREATE PROCEDURE highest_product()
BEGIN
SELECT * FROM orders WHERE price=(SELECT MAX(price) FROM orders);
END $$
DELIMITER ;
CALL highest_product();
-- 6. List customers who bought Rice.
DELIMITER $$
CREATE PROCEDURE customer_by_product(IN prod_name VARCHAR(20) )
BEGIN 
SELECT * FROM orders WHERE product_name=prod_name;
END $$
DELIMITER ;
CALL customer_by_product('Rice');

-- 7. Calculate the total sales amount.
DELIMITER $$
CREATE PROCEDURE total_sale()
BEGIN
SELECT SUM(quantity*price) AS total_trade FROM orders;
END $$
DELIMITER;
CALL total_sale();

-- 8. Find the average price of products ordered.
DELIMITER $$
CREATE PROCEDURE avg_price_of_prod()
BEGIN
SELECT AVG(price) AS avg_price_of_product FROM orders;
END $$
DELIMITER ;
CALL avg_price_of_prod();
-- 9. Show orderes placed by customers from ordered.
DELIMITER $$
CREATE PROCEDURE 
BEGIN
SELECT
END $$
DELIMITER ;
CALL

-- 10. Get all orderes where price < 500.
DELIMITER $$
CREATE PROCEDURE orders_according_to_price(IN input_price INT)
BEGIN
SELECT * FROM orders WHERE price<input_price;
END $$
DELIMITER ;
CALL orders_according_to_price(500);
-- 11. Find the top 5 most expensive orders.
DELIMITER $$
CREATE PROCEDURE top_n_expensive_orders(IN input_n INT)
BEGIN
SELECT * FROM orders ORDER BY price DESC LIMIT input_n;
END $$
DELIMITER ;
CALL top_n_expensive_orders(5);

-- 12. Show customers who were placed in 2023.
DELIMITER $$
CREATE PROCEDURE cust_placed_according_to_year(IN input_year INT)
BEGIN
    SELECT customer_name 
    FROM orders 
    WHERE YEAR(order_date) = input_year;
END $$
DELIMITER ;
CALL cust_placed_according_to_year(2023);

-- 13. Count how many orders were place in 2023.
DROP PROCEDURE count_order_by_year;
DELIMITER $$
CREATE PROCEDURE count_order_by_year(IN input_year INT)
BEGIN
SELECT COUNT(order_date) AS count_order FROM orders where YEAR(order_date)=input_year GROUP BY YEAR(order_date);
END $$
DELIMITER ;
CALL count_order_by_year(2023);

-- 14. Find the earliest order date.
DELIMITER $$
CREATE PROCEDURE earliest_order_date()
BEGIN
SELECT order_date FROM orders WHERE order_date=(SELECT MIN(order_date) FROM orders);
END $$
DELIMITER ;
CALL earliest_order_date();

-- 15. Show all orders of Coffee.

-- 16. Get the total quantity of Milk sold.
DROP PROCEDURE total_quantity_by_product;
DELIMITER $$
CREATE PROCEDURE total_quantity_by_product(IN input_prod VARCHAR(50))
BEGIN
SELECT SUM(quantity) AS count_quantity FROM orders WHERE product_name=input_prod;
END $$
DELIMITER ;
CALL total_quantity_by_product('Milk');

-- 17. Find customers who ordered products in Octorber 2023.


-- 18. Show orders wher city= Chitwan and product_name=Juice.
DELIMITER $$
CREATE PROCEDURE order_by_city_product(IN input_city VARCHAR(50),IN input_product VARCHAR(50))
BEGIN
SELECT * FROM orders WHERE city=input_city AND product_name=input_product;
END $$
DELIMITER ;
CALL order_by_city_product('Chitwan','Juice');

-- 19. Find the maximum quantity ordered in a single order.
DELIMITER $$
CREATE PROCEDURE max_quantity()
BEGIN
SELECT * FROM orders WHERE quantity=(SELECT MAX(quantity) FROM orders);
END $$
DELIMITER ;
CALL max_quantity();

-- 20. Show all orders sorted by order_date DESC.
DELIMITER $$
CREATE PROCEDURE sort_in_DESC_by_date()
BEGIN
SELECT * FROM orders ORDER BY order_date DESC;
END $$
DELIMITER ;
CALL sort_in_DESC_by_date();

-- 21. Get the sum of sales for each city.
DELIMITER $$
CREATE PROCEDURE sales_according_to_city()
BEGIN
SELECT city,SUM(quantity*price) AS total_sale FROM orders GROUP BY city;
END $$
DELIMITER ;
CALL sales_according_to_city();

-- 22. Find customers who ordered Butter or Cheese.
DELIMITER $$
CREATE PROCEDURE order_by_products(IN input_product1 VARCHAR(50),IN input_product2 VARCHAR(50))
BEGIN
SELECT * FROM orders WHERE product_name IN (input_product1,input_product2);
END $$
DELIMITER ;
CALL order_by_products('Butter','Cheese');

-- 23. Show orders where price BETWEEN 200 and 1000.
DELIMITER $$
CREATE PROCEDURE order_by_price_range(IN input_start DECIMAL ,input_end DECIMAL)
BEGIN
SELECT * FROM orders WHERE price>input_start AND price<input_end;
END $$
DELIMITER ;
CALL order_by_price_range(200,1000); 

-- 24. List distinct product names ordered.
DROP PROCEDURE distinct_product;
DELIMITER $$
CREATE PROCEDURE distinct_product()
BEGIN
    SELECT DISTINCT product_name
    FROM orders;
END $$
DELIMITER ;

-- Call the procedure
CALL distinct_product();

-- 25. Find customers who ordered on 2023-12-15.
DELIMITER $$
CREATE PROCEDURE order_by_date(IN input_date DATE)
BEGIN
SELECT * FROM orders WHERE order_date=input_date;
END $$
DELIMITER ;
CALL order_by_date('2023-12-15');




