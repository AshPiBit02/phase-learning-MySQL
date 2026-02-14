CREATE TABLE secure_transactions (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    username VARCHAR(50),
    role VARCHAR(20),          -- e.g., 'USER', 'ADMIN'
    auth_status VARCHAR(20),   -- e.g., 'VERIFIED', 'PENDING'
    transfer_amount DECIMAL(12,2),
    balance DECIMAL(12,2),
    txn_type VARCHAR(20),      -- e.g., 'DEPOSIT', 'WITHDRAWAL', 'TRANSFER'
    txn_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE secure_trans_log(
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    user_name VARCHAR(50),
    amount DECIMAL(12,2),
    txn_type VARCHAR(20),
    txn_date TIMESTAMP
)

CREATE TRIGGER txn_ins 
BEFORE INSERT ON secure_transactions
FOR EACH ROW   
BEGIN
 IF NEW.transfer_amount<0 THEN
 SET NEW.transfer_amount=0;
 END IF;
 IF NEW.auth_status='VERIFIED' THEN -- unverified user's transaction won't be stored
 INSERT INTO secure_trans_log(txn_id,user_id,user_name,amount,txn_type,txn_date)
        VALUES(NEW.txn_id,NEW.user_id,NEW.username,NEW.transfer_amount,NEW.txn_type,NEW.txn_date);
    END IF;
END;

INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(227412,'aashish125','ADMIN','VERIFIED',10000,1200000,'TRANSFER');

SELECT * FROM secure_trans_log;

INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(227252,'biknus','USER','VERIFIED',-10550,1200000,'TRANSFER');
INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(222542,'nusbik','USER','VERIFIED',12000,15000,'WITHDRAWAL');
INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(222253,'najtik','USER','PENDING',1230,12000,'DEPOSITE');
SELECT * FROM secure_transactions;






