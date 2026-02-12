-- 1. Insert a new deposite for account ACC1006 with amount 30000.00 and then COMMIT it.
BEGIN;
INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('ACC1006','DEPOSIT',3000.00,NOW());
 COMMIT;
 SELECT * FROM banktransactions;
 -- 2. Insert a new withdrawal fro account ACC1007 with amount 1200.00 but then ROLLBACK - confirm it disappers.
 BEGIN;
 INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('AC1007','WITHDRAWAL',1200.00,NOW());
 SELECT * FROM banktransactions;
 ROLLBACK;
 SELECT * FROM banktransactions;
 -- 3. Update the amount of tnx_id=2 to 2500.00, then ROLLBACK to undo the change.
 BEGIN;
 UPDATE banktransactions  SET amount=2500.00 WHERE txn_id=2;
 SELECT * FROM banktransactions;
 ROLLBACK;
 SELECT * FROM banktransactions;
 -- 4. Delete the transaction with txn_id=3, then ROLLBACK to restore it.
 START TRANSACTION;
 DELETE FROM banktransactions WHERE txn_id=3;
 SELECT * from banktransactions;
 ROLLBACK;
 SELECT * from banktransactions;
 -- 5. Insert two deposite (ACC1008=4000.00,ACC1009=600.00), then ROLLBACK before commtting;
 START TRANSACTION;
 INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('ACC1008','DEPOSITE',4000.00,NOW()),('ACC1009','DESPOSITE',600.00,NOW());
 SELECT * FROM banktransactions;
 ROLLBACK;
 SELECT * FROM banktransactions;
 -- 6. Insert two withdrawals(ACC1010=800.00, ACC1011=600.00), then COMMIT only after verfying both are added.
 START TRANSACTION;
 INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('ACC1010','WITHDRAWAL',800.00,NOW()),('ACC1011','DESPOSITE',600.00,NOW());
 SELECT * FROM banktransactions;
 COMMIT;
 SELECT * FROM banktransactions;
-- 7. Insert a deposite for ACC1012 =5000.00, set SAVEPOINT sq1, then insert 
-- another deposite for ACC1013=4500.00, and ROLLBACK to sp1
START TRANSACTION;
 INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('ACC1010','WITHDRAWAL',5000.00,NOW());
 SELECT * FROM banktransactions;
 ROLLBACK;
 SAVEPOINT sp1;
 INSERT INTO banktransactions(account_no,txn_type,amount, txn_date)
 VALUES('ACC1010','WITHDRAWAL',800.00,NOW()),('ACC1011','DESPOSITE',600.00,NOW());
 SELECT * FROM banktransactions;
 ROLLBACK TO sp1;
 SELECT * FROM banktransactions;
--  8. Update txn_id =4 to amount 2000.00, set SAVEPOINT sp2, then rollback to sp2
BEGIN;
SAVEPOINT sp2;
UPDATE banktransactions SET amount=2000.00 WHERE txn_id=4;
SELECT * FROM banktransactions;
ROLLBACK TO sp2;
SELECT * FROM banktransactions;

-- 9. Use SET TRANSACTION ISOLATION LEVEL SERIALIZABLE and insert a withdrawal for ACC1010=500.00 observe stricter isolation
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- ensures that within this transaction,user can only read rows that have already committed by  other transactions.
BEGIN;
INSERT INTO banktransactions(account_no,txn_type,amount,txn_date)
 VALUES('ACC1010','DEPOSITE',500.00,NOW());

 SELECT * FROM banktransactions;
 COMMIT;



