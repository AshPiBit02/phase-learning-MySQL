CREATE TABLE BankTransactions (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    account_no VARCHAR(20),
    txn_type VARCHAR(10),   -- 'DEPOSIT' or 'WITHDRAW'
    amount DECIMAL(10,2),
    txn_date DATETIME
);
INSERT INTO BankTransactions (account_no, txn_type, amount, txn_date) VALUES
('ACC1001', 'DEPOSIT', 5000.00, '2026-02-01 10:00:00'),
('ACC1002', 'WITHDRAW', 2000.00, '2026-02-02 11:30:00'),
('ACC1003', 'DEPOSIT', 1500.00, '2026-02-03 09:15:00'),
('ACC1004', 'WITHDRAW', 1000.00, '2026-02-04 14:45:00'),
('ACC1005', 'DEPOSIT', 2500.00, '2026-02-05 16:20:00');