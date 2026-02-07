-- Write a stored procedure to fetch all orders.
DELIMITER $$ 
CREATE PROCEDURE get_all_orders()
BEGIN
SELECT * FROM orders ;
END $$ 
DELIMITER ;
CALL get_all_orders();
-- Write a stored procedure to fetch orders by customer name.
DELIMITER $$
CREATE PROCEDURE Get_Order_By_Customer_Name(IN cust_name VARCHAR(50))
BEGIN
SELECT * FROM orders WHERE customer_name=cust_name;
END $$
DELIMITER ;
CALL Get_Order_By_Customer_Name('Sita');
USE view;


-- Write a stored procedure to fetch orders by product name
DELIMITER $$
CREATE PROCEDURE getOrderByProductname(prod VARCHAR(50))
BEGIN
SELECT * FROM orders WHERE product=prod;
END $$
DELIMITER ;
CALL getOrderByProductname('Phone');
USE view;

-- WASP to fetch orders placed after a given date.
DELIMITER $$
CREATE PROCEDURE getOrderByDate(IN input_date DATE)
BEGIN
SELECT * FROM orders WHERE order_date>input_date;
END $$ 
DELIMITER ;
CALL getOrderByDate('2023-09-01');
SHOW PROCEDURE STATUS WHERE Db='view';

USE view;

DELIMITER $$

CREATE PROCEDURE getOrderByDate(IN input_date DATE)
BEGIN
    SELECT * 
    FROM Orders 
    WHERE order_date > input_date;
END $$

DELIMITER ;

CALL getOrderByDate('2023-09-01');
SHOW PROCEDURE STATUS WHERE Db='view';
CALL view.getOrderByDate('2023-09-01');