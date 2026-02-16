-- table to store data data(userid,user_name,user_password)
CREATE TABLE user_data(user_id INT PRIMARY KEY AUTO_INCREMENT,
                         user_name VARCHAR(20),user_password VARCHAR(256))AUTO_INCREMENT=100;

-- table for log_interface(user_name,user_password)
CREATE TABLE log_interface(user_name VARCHAR(20) NOT NULL,
                                 user_password VARCHAR(20) NOT NULL);

-- table for signin_interface(new_user_name,ser_user_password)
CREATE TABLE signin_interface(new_user_name VARCHAR(20) UNIQUE NOT NULL
                                 ,set_user_password VARCHAR(20) NOT NULL);

-- table for activity_log(user_name,user_type,activity,timestamp)
CREATE TABLE activity_log(user_name VARCHAR(50) NOT NULL,
                            user_type VARCHAR(20) CHECK (user_type IN ('Verified','Unknown','Known','New')),
                            activity VARCHAR(30) CHECK(activity IN ('LogIn','SignIn','Leave')),
                            activity_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            ac_description VARCHAR(100) DEFAULT NULL);

-- TRIGGERS
DROP Table activity_log;
DROP Trigger sigIn_trigger;

-- signin_trigger
CREATE TRIGGER sigin_trigger
BEFORE INSERT ON user_data
FOR EACH ROW 
 BEGIN
    IF EXISTS(SELECT 1 FROM user_data WHERE user_name<>NEW.user_name) THEN
        INSERT INTO signin_interface VALUES(NEW.user_name,NEW.user_password);
        INSERT INTO user_data(user_name,user_password) VALUES(NEW.user_name,SHA2(NEW.user_password,256));
        INSERT INTO activity_log(user_name,user_type,activity) VALUES(NEW.user_name,'New','SignIn');
    ELSE
       INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Unknown','SignIn',CONCAT('user with user name ',NEW.user_name," already exists"));
 END IF;
 END;

-- login trigger
CREATE TRIGGER login_trigger
BEFORE INSERT ON activity_log
FOR EACH ROW
 BEGIN 
  IF EXISTS(SELECT 1 FROM user_data WHERE user_name=NEW.user_name
                         AND user_password=SHA2(NEW.user_password,256)) THEN
       INSERT INTO activity_log(user_name,user_type,activity)
        VALUES(NEW.user_name,'Verifed','LogIn');
  ELSE
       INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Unknown','LogIn',CONCAT('Unknown ',NEW.user_name,"! Denied"));
    END IF;
 END;
        
        
