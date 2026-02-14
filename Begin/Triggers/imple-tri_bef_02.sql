CREATE TABLE quantum_learners (
    learner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

CREATE TRIGGER before_quantum_learners_insert
BEFORE INSERT ON quantum_learners
FOR EACH ROW
BEGIN
 IF NEW.age<0 THEN
 SET NEW.age=0;
 END IF;
 END;
INSERT INTO quantum_learners(name,age,course) VALUES('Rak','22','computer science');
INSERT INTO quantum_learners(name,age,course) VALUES('Wak','-5','software engineering');
INSERT INTO quantum_learners(name,age,course) VALUES('Sak','21','computer engineering'),
('Jak',-2,'architecture');
SELECT * FROM quantum_learners;

CREATE TABLE cosmic_employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

CREATE TRIGGER before_cosmic_employees_insert
BEFORE INSERT ON cosmic_employees 
FOR EACH ROW
BEGIN
 IF NEW.salary<1000 THEN
 SET NEW.salary=1000;
 END IF;
 END;
 INSERT INTO cosmic_employees(name,salary,department) VALUES('Aas',128000,'Development'),
 ('Pas',200,'Sales'),('Nas',1222,'Round'); -- 200 will become 1000 automatically

 SELECT * FROM cosmic_employees;


CREATE TABLE orbit_vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(50),
    model VARCHAR(50),
    year INT
);
CREATE TRIGGER before_orbit_vehicles_insert
BEFORE INSERT ON orbit_vehicles
FOR EACH ROW
BEGIN
IF NEW.year<2000 THEN
SET NEW.year=2000;
END IF;
END;
INSERT INTO orbit_vehicles(owner_name,model,year) VALUES('nas','CNF343O1',1988),
('jas','CNF328O2',2001);
SELECT * FROM orbit_vehicles;

CREATE TABLE astro_auth_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER before_astro_auth_users_insert
BEFORE INSERT ON astro_auth_users
FOR EACH ROW
BEGIN
 IF NEW.password='' THEN
  SET NEW.password='DEFAULT_PASS';
  END IF;
  IF NEW.username=LOWER(NEW.username) THEN
  SET NEW.username=UPPER(new.username);
  END IF;
  END;
  INSERT INTO astro_auth_users(username,password,email) VALUES('asi12','chds','aashihs@gmail.com'),
  ('glosb','','bhal@gmail.com');
  SELECT * FROM astro_auth_users;

  CREATE TABLE hyper_auth_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    is_verified BOOLEAN DEFAULT FALSE,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hyper_auth_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(20),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details VARCHAR(255)
);
CREATE TRIGGER before_hyper_auth_users_insert
BEFORE INSERT ON hyper_auth_users
FOR EACH ROW
BEGIN
 IF NEW.password='' THEN
 SET NEW.password='DEFAULT_PASS';
 END IF;
 IF NEW.username=LOWER(NEW.username) THEN
 SET NEW.username=UPPER(NEW.username);
 END IF;
 END;
 INSERT INTO hyper_auth_users (username, password, email)
VALUES ('Aashish', 'secure123', 'aashish@example.com');
SELECT * FROM hyper_auth_users;

CREATE TRIGGER after_hyper_auth_users_update
BEFORE UPDATE ON hyper_auth_users
FOR EACH ROW
BEGIN
 IF NEW.is_verified=TRUE THEN
 INSERT INTO hyper_auth_logs(user_id,action,details) VALUES(OLD.user_id,'UPDATE','Verified user');
 END IF;
 END;
 INSERT INTO hyper_auth_users (username, password, email)
VALUES ('TestUser', '', 'test@example.com');
SELECT * FROM hyper_auth_users;
UPDATE hyper_auth_users SET is_verified=TRUE WHERE user_id=1;
SELECT * FROM hyper_auth_logs;


CREATE TABLE interstellar_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE interstellar_orders_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    orderid INT,
    action VARCHAR(20),
    details VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER transaction_log_insert
BEFORE INSERT ON interstellar_orders
FOR EACH ROW 
BEGIN
 IF NEW.quantity<1 THEN
 SET NEW.quantity=1;
 END IF;
 SET NEW.total_amount=NEW.quantity*NEW.price;
 INSERT INTO interstellar_orders_log(orderid,action,details) 
 VALUES(1007,'INSERT',CONCAT('Order for ',NEW.product_name,' by ',NEW.customer_name));
 END;
INSERT INTO interstellar_orders (customer_name, product_name, quantity, price)
VALUES ('Aashish', 'Laptop', 2, 500.00);
SELECT * FROM interstellar_orders;
SELECT * FROM interstellar_orders_log;
INSERT INTO interstellar_orders (customer_name, product_name, quantity, price)
VALUES ('Ram', 'Smartphone', 0, 300.00);
SELECT * FROM interstellar_orders;
SELECT * FROM interstellar_orders_log;

 CREATE TRIGGER transaction_log_update
AFTER UPDATE ON interstellar_orders
FOR EACH ROW
BEGIN
    INSERT INTO interstellar_orders_log (orderid, action, details)
    VALUES (
        NEW.order_id,
        'UPDATE',
        CONCAT(
            'Updated order: ', NEW.product_name,
            ', new qty = ', NEW.quantity,
            ', new total = ', NEW.total_amount
        )
    );
END;

UPDATE interstellar_orders
SET quantity = 5
WHERE customer_name = 'Aashish';

SELECT * FROM interstellar_orders;
SELECT * FROM interstellar_orders_log;

CREATE TRIGGER transaction_log_delete
BEFORE DELETE ON interstellar_orders
FOR EACH ROW  
BEGIN
 INSERT INTO interstellar_orders_log(orderid,action,details)
  VALUES(OLD.order_id,'DELETE',CONCAT('Delected order: ',OLD.product_name,
                                      ' by ',OLD.customer_name));
END;

DELETE FROM interstellar_orders
WHERE customer_name = 'Ram';

SELECT * FROM interstellar_orders;
SELECT * FROM interstellar_orders_log;

