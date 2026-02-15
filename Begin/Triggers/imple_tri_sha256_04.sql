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
