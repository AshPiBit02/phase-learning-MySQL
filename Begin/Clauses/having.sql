#HAVING clause(used to filter records that are grouped together by the GROUP BY  clause)
-- Syntax: SELECT cloumn1,column2, AGGREGATE_FUNCTION(column3) 
--         FROM table_name
--         GROUP BY column1,column2
--         HAVING aggregate_condition
CREATE TABLE HarvestLog (
    log_id INT PRIMARY KEY,
    farmer_name VARCHAR(50),
    crop_type VARCHAR(30),
    harvest_kg INT,
    region VARCHAR(40),
    harvest_date DATE
);
INSERT INTO HarvestLog 
(log_id, farmer_name, crop_type, harvest_kg, region, harvest_date) 
VALUES
(301, 'Ramesh Adhikari', 'Rice', 1200, 'Lamjung', '2025-11-10'),
(302, 'Sita Bhandari', 'Wheat', 800, 'Baglung', '2025-11-12'),
(303, 'Kiran Shrestha', 'Maize', 2000, 'Gorkha', '2025-11-08'),
(304, 'Maya Gurung', 'Rice', 1500, 'Parbat', '2025-11-15'),
(305, 'Dipesh KC', 'Wheat', 600, 'Tanahun', '2025-11-11'),
(306, 'Ramesh Adhikari', 'Maize', 1800, 'Lamjung', '2025-11-18'),
(307, 'Sita Bhandari', 'Rice', 900, 'Baglung', '2025-11-20');
-- Show total harvest per farmer_name, but only those who harvested more than 2000kg in total
SELECT farmer_name ,SUM(harvest_kg) AS total_harvest FROM harvestlog
GROUP BY farmer_name HAVING SUM(harvest_kg)>2000; 
-- List total harvest per crop_type, but only crops with average harvest above 1000kg
SELECT crop_type,SUM(harvest_kg) AS total_harvest_crop FROM harvestlog
GROUP BY crop_type HAVING AVG(harvest_kg)>1000;
-- Show total harvest per region, but only regions with at least 2 entries
SELECT region,COUNT(*) AS entry_count, SUM(harvest_kg) AS total_harvest FROM harvestlog
GROUP BY region HAVING COUNT(*)>1;
-- Display farmers who harvested Maize, grouped by name and only include thosee with total Maize harvest >1500 kg
SELECT farmer_name,SUM(harvest_kg) AS total_maize_harvested FROM harvestlog WHERE crop_type='Maize'
GROUP BY farmer_name HAVING SUM(harvest_kg)>1500;
-- Show farmers whose average harvest per entry is below 1000kg
SELECT farmer_name,AVG(harvest_kg) AS AVG_harvest FROM harvestlog
GROUP BY farmer_name HAVING AVG(harvest_kg)<1000;
--Show regions where total rice harvest exceeds 2000 kg
SELECT region,SUM(harvest_kg) AS total_rice_harvested FROM harvestlog WHERE crop_type='Rice'
GROUP BY region HAVING SUM(harvest_kg)>1000;

CREATE TABLE OrderLog (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(40),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    delivery_time TIME,
    created_at TIMESTAMP
);
INSERT INTO OrderLog 
(order_id, customer_name, product, quantity, price, order_date, delivery_time, created_at) 
VALUES
(401, 'Ramesh Adhikari', 'Laptop', 2, 75000.00, '2026-01-20', '10:30:00', '2026-01-20 10:30:00'),
(402, 'Sita Bhandari', 'Phone', 1, 45000.00, '2026-01-25', '14:15:00', '2026-01-25 14:15:00'),
(403, 'Kiran Shrestha', 'Tablet', 3, 30000.00, '2026-01-26', '09:00:00', '2026-01-26 09:00:00'),
(404, 'Maya Gurung', 'Headphones', 5, 5000.00, '2026-01-26', '11:45:00', '2026-01-26 11:45:00'),
(405, 'Dipesh KC', 'Monitor', 2, 20000.00, '2026-01-24', '16:00:00', '2026-01-24 16:00:00');
-- Show all orders placed today using WHERE order_date = CURRENT_DATE.
SELECT * FROM orderlog WHERE order_date='2026-01-26';
-- Show each customer's total spending(SUM(quantity*price)),but only include those who spent more than 50000
SELECT customer_name, SUM(quantity*price) AS total_spending 
FROM orderlog GROUP BY customer_name HAVING SUM(quantity*price)>50000;
-- List products with an average order quantity greater than 2
SELECT product,AVG(quantity) AS order_quantity FROM orderlog
GROUP BY product HAVING AVG(quantity)>2;
-- Display orders created in the last 24 hours WHERE created_at>=CURRENT_TIMESTAMP-INTERVAL 1 DAY;
SELECT * FROM orderlog WHERE created_at>=CURRENT_TIMESTAMP - INTERVAL 1 DAY;
-- Show customers who placed more than 1 order
SELECT customer_name FROM orderlog
GROUP BY customer_name HAVING COUNT(*)>1;
-- Display order_date grouped totals, but only dates where total revenue exceeds 100,000;
SELECT order_date,SUM(quantity*price) AS total_revenue FROM orderlog
GROUP BY order_date HAVING SUM(quantity*price)>100000;
-- show products with a total revenue less than 50,000
SELECT product,SUM(quantity*price) AS total_revenue FROM orderlog
GROUP BY product HAVING SUM(quantity*price)<50000;
-- find customers whose maximum single order value is above 40,000
SELECT customer_name,MAX(quantity*price) AS max_order_value
FROM orderlog GROUP BY customer_name HAVING MAX(quantity*price)>40000;
-- Show delivery_time slots grouped, but only those with at least 2 orders scheduled
SELECT delivery_time,COUNT(*) AS order_count FROM orderlog
GROUP BY delivery_time HAVING COUNT(*)>=2;
-- list customers whose average order value is below 20000
SELECT customer_name, AVG(price*quantity) AS order_value
FROM orderlog GROUP BY customer_name HAVING AVG(price*quantity)<20000;
-- Show products ordered by more than one distinct customer
SELECT product,COUNT(DISTINCT customer_name) AS customer_count
 FROM orderlog GROUP BY product HAVING COUNT(DISTINCT customer_name)>1;
 -- Display mothns(using MONTH(order_date)) where total order exceed 1
 SELECT MONTH(order_date) AS order_month,COUNT(*) AS total_orders FROM orderlog
 GROUP BY MONTH(order_date) HAVING COUNT(*)>=2;