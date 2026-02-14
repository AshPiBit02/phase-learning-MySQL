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

DROP TRIGGER txn_ins;
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
VALUES(227412,'aashish125','ADMIN','VERIFIED',1000,12000,'TRANSFER');

SELECT * FROM secure_trans_log;
SELECT * FROM secure_transactions;
TRUNCATE TABLE secure_transactions;
TRUNCATE TABLE secure_trans_log;

INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(227252,'biknus','USER','VERIFIED',-10550,1200000,'TRANSFER');
INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(222542,'nusbik','USER','VERIFIED',12000,15000,'WITHDRAWAL');
INSERT INTO  secure_transactions(user_id,username,role,auth_status,transfer_amount,balance,txn_type)
VALUES(222253,'najtik','USER','PENDING',1230,12000,'DEPOSITE');
SELECT * FROM secure_transactions;

CREATE TRIGGER txn_upd
AFTER UPDATE ON secure_transactions
FOR EACH ROW
   BEGIN
         IF OLD.txn_type IN ('WITHDRAWAL','TRANFDER') THEN
             UPDATE secure_transactions SET NEW.balance=OLD.balance-NEW.transfer_amount;
             END IF;
             IF NEW.txn_type='DEPOSIT' THEN
             UPDATE secure_transactions SET NEW.balance=NEW.balance+NEW.transfer_amount;
             END IF;
        INSERT INTO secure_trans_log(txn_id,user_id,user_name,amount,txn_type,txn_date)
        VALUES(NEW.txn_id,NEW.user_id,NEW.username,NEW.transfer_amount,NEW.txn_type,NEW.txn_date);
   END ;



CREATE TABLE verfied_users(
    userId VARCHAR(30) PRIMARY KEY,
    user_name VARCHAR(15) UNIQUE NOT NULL,
    user_password VARCHAR(20) NOT NULL
);

INSERT INTO verfied_users (userId, user_name, user_password)
VALUES ('U1001', 'aashish_21', 'Nepal@123');

INSERT INTO verfied_users (userId, user_name, user_password)
VALUES ('ADM001', 'sysadmin', 'Root!Secure');

INSERT INTO verfied_users (userId, user_name, user_password)
VALUES ('U1002', 'gamerX', 'Play@2026');

INSERT INTO verfied_users (userId, user_name, user_password)
VALUES ('EMP045', 'sita.k', 'WorkLife#88');

INSERT INTO verfied_users (userId, user_name, user_password)
VALUES ('TEST01', 'qa_test', 'Check123!');
SELECT * FROM verfied_users;

CREATE Table  LogIn_system(
    user_name VARCHAR(15) NOT NULL,
    user_password VARCHAR(20) NOT NULL
);

DROP TABLE signin_log;

TRUNCATE TABLE signin_log;
CREATE TABLE SignIn_log(
    user_name VARCHAR(15) NOT NULL,
    password VARCHAR(20) NOT NULL,
    login_status VARCHAR(15) CHECK(login_status IN ('Logged_In','Not_Logged_In')),
    user VARCHAR(15) CHECK(user IN ('Authentic','Unknown')),
    login_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

 DROP trigger sign_in_trigger;
CREATE TRIGGER sign_in_trigger
AFTER INSERT ON LogIn_system
FOR EACH ROW   
 BEGIN
    IF EXISTS( SELECT 1 FROM verfied_users WHERE user_name=NEW.user_name AND user_password=NEW.user_password) THEN
    INSERT INTO signIn_log(user_name,password,login_status,user)
                   VALUES(NEW.user_name,NEW.user_password,'Logged_In','Authentic');
       ELSE
         INSERT INTO signIn_log(user_name,password,login_status,user) 
                  VALUES(NEW.user_name,NEW.user_password,'Not_Logged_In','Unknown');
      END IF;
 END;

INSERT INTO login_system VALUES('sita.k','WorkLife#88');
INSERT INTO login_system VALUES('sita.','WorkLife#88');
INSERT INTO login_system VALUES('aashish_21','Nepal@123');
INSERT INTO login_system VALUES('sysadmin','root!secur');

SELECT * FROM signin_log;







