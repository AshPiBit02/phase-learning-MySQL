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
