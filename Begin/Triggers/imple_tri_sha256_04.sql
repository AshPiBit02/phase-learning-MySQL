# SECURE HAS Alogorithm
--  Synax: SHA2(str,n); WHERE n=224,256,384,512
CREATE TABLE data_db(
    user_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_name VARCHAR(30) UNIQUE NOT NULL,
    user_password VARCHAR(256)
)

INSERT INTO data_db(user_name,user_password)
VALUES ('alice', SHA2('AlicePass123', 256)),
 ('bob', SHA2('BobSecure!456', 256)),
 ('charlie', SHA2('Charlie789$', 256)),
 ('diana', SHA2('Diana@2026', 256)),
 ('eve', SHA2('EveStrong#321', 256));

CREATE Table login_log(
    user_name VARCHAR(30),
    Activity VARCHAR(50),
    user_type VARCHAR(15),
    activity_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE logIn_interface(
    user_name VARCHAR(30),
    user_password VARCHAR(20)
);

DROP table login_log;

CREATE TRIGGER before_loging
BEFORE INSERT ON logIn_interface
FOR EACH ROW
 BEGIN
       IF EXISTS(SELECT 1 FROM data_db WHERE user_name=NEW.user_name AND
               user_password=SHA2(NEW.user_password,256)) THEN
            INSERT INTO login_log(user_name,Activity,user_type)
                     VALUES(NEW.user_name,'Logged','VERIFIED');
        ELSE
            INSERT INTO login_log(user_name,Activity,user_type)
                     VALUES(NEW.user_name,'Not Logged','Unknown');
        END IF;
  END;
INSERT INTO login_interface VALUES('aahsi','ash1234');

INSERT INTO login_interface VALUES('bob','BobSecure!456');
SELECT * FROM login_log;

DROP TRIGGEr before_loging;
DROP TRIGGEr signIn;

CREATE TRIGGER signIN
BEFORE INSERT ON data_db
 FOR EACH ROW 
  BEGIN
    IF NOT EXISTS(SELECT 1 FROM data_db WHERE user_name<>OLD.user_name) THEN
         INSERT INTO login_log(user_name,Activity,user_type)
            VALUES(NEW.user_name,'Signed In','New');
         INSERT INTO data_db(user_name,user_password)
            VALUES(NEW.user_name,SHA2(NEW.user_password,256));
    ELSE
         INSERT INTO login_log(user_name,Activity,user_type)
            VALUES(NEW.user_name,'Not Signed In(user already exists)','Unknown');
    END IF;
  END;

INSERT INTO data_db(user_name,user_password) VALUES('max','maxine23');
INSERT INTO data_db(user_name,user_password) VALUES('max1','maxine23');
DELETE FROM data_db WHERE user_id IN (10,11);

SELECT * FROM data_db;

SELECT * FROM login_log;

DELETE FROM login_log WHERE user_name IN ('max','max1');







             

      

