#ALL Operator(allows comparison with all the values in the subquery)
-- Syntax: SELECT column1,column2,... FROM table_name WHERE column_name operator ALL (subquery)
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_year INT
);
INSERT INTO Products VALUES
(201, 'Laptop', 'Electronics', 80000),
(202, 'Smartphone', 'Electronics', 60000),
(203, 'Chair', 'Furniture', 7000),
(204, 'Table', 'Furniture', 12000),
(205, 'Headphones', 'Electronics', 5000);
INSERT INTO Orders VALUES
(1, 201, 2, 2025),
(2, 202, 1, 2024),
(3, 203, 5, 2025),
(4, 204, 3, 2025),
(5, 205, 10, 2024);
--find products whose price is greater than ALL prices in the furniture category
SELECT product_id,product_name,price FROM products WHERE price > ALL
 (SELECT price FROM products WHERE category='Furniture');
 -- List products whose price is less than ALL prices in the Electronics category
 SELECT product_id,product_name,price FROM products WHERE price < ALL
  (SELECT price FROM products WHERE category='Electronics');
  -- Show products ordered in 2025 whose price is greater than ALL prices of products ordered in 2024
  SELECT p.product_id,p.product_name,p.price FROM products p WHERE p.product_id IN 
  (SELECT product_id FROM orders WHERE order_year=2025)
  AND p.price > ALL (SELECT price FROM products WHERE product_id IN 
  (SELECT product_id from orders WHERE order_year =2024));
--   Find products whose price is equal to ALL prices of products in the Furniture category
SELECT product_id,product_name,category,price FROM products WHERE price = ALL
 (SELECT price FROM products WHERE category='Furniture');
 -- List products whose price is not equal to ALL prices in the electronics category
 SELECT product_id,product_name,price,category FROM products WHERE price <> ALL
  (SELECT price FROM products WHERE category='Electronics');
  --Show products whose product_id matches ALL product_id values ordered in 2025
  SELECT product_id,product_name,category FROM products WHERE product_id = ALL
   (SELECT product_id FROM orders WHERE order_year=2025);
   -- Find products whose price is greater than ALL prices of products with quntity > 3;
   SELECT product_id,product_name,price FROM products WHERE price > ALL
    (SELECT price FROM products WHERE product_id IN (SELECT product_id FROM orders WHERE quantity>3));
    -- Display products whose category matches ALL categories of products ordered in 2025
    SELECT product_id,product_name,category FROM products WHERE category = ALL
     (SELECT category FROM products WHERE product_id IN (SELECT product_id FROM orders WHERE order_year=2025));
     -- Find products whose price is less than ALL prices of products ordered in both 2024 and 2025
     SELECT product_id,product_name,price FROM products WHERE price < ALL
      (SELECT price FROM products WHERE product_id IN (SELECT product_id FROM orders WHERE order_year IN (2025,2024)));
      -- Show products whose product_id is equal to ALL product_id values of order with quantity =1
      SELECT product_id,product_name FROM products WHERE product_id = ALL (SELECT product_id FROM orders WHERE quantity = 1);
      -- List products whose price is greater than ALL prices of products not in Electronics category
      SELECT product_id,product_name,price FROM products WHERE price > 
      ALL (SELECT price FROM products WHERE category NOT IN ('Electronics'));
      -- Find products whose price is less than ALL prices of products ordered in 2025 with quantity >=3
      SELECT product_id,product_name,price FROM products WHERE price < ALL 
      (SELECT price FROM products WHERE product_id IN (SELECT product_id FROM orders
       WHERE order_year=2025 AND quantity>=3) );

