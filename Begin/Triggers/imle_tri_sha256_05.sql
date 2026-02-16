-- table to store data data(userid,user_name,user_password)
CREATE TABLE user_data(user_id INT PRIMARY KEY AUTO_INCREMENT,
                         user_name VARCHAR(20),user_password VARCHAR(256))AUTO_INCREMENT=100;

-- table for log_interface(user_name,user_password)
CREATE TABLE log_interface(user_name VARCHAR(20) NOT NULL,
                                 user_password VARCHAR(20) NOT NULL);

-- table for signin_interface(new_user_name,ser_user_password)

CREATE TABLE signin_interface(new_user_name VARCHAR(20)  NOT NULL
                                 ,set_user_password VARCHAR(20) NOT NULL);

-- table for activity_log(user_name,user_type,activity,timestamp)
CREATE TABLE activity_log(user_name VARCHAR(50) NOT NULL,
                            user_type VARCHAR(20) CHECK (user_type IN ('Verified','Unknown','Known','New')),
                            activity VARCHAR(30) CHECK(activity IN ('LogIn','SignIn','Leave','Password Update')),
                            activity_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            ac_description VARCHAR(100) DEFAULT NULL);

-- table for delete_interface
 CREATE TABLE delete_interface(
    user_name VARCHAR(20),
    user_password VARCHAR(20)
);

-- table for user_password change
CREATE TABLE user_password_update(user_name VARCHAR(50) NOT NULL,
                                    user_password VARCHAR(20) NOT NULL,
                                    new_user_password VARCHAR(20)  NOT NULL);


-- TRIGGERS

-- signin_trigger


CREATE TRIGGER sigin_trigger
BEFORE INSERT ON signin_interface
FOR EACH ROW 
BEGIN

    IF EXISTS(SELECT 1 FROM user_data WHERE user_name = NEW.new_user_name) THEN
        INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES( NEW.new_user_name,'Unknown','SignIn',CONCAT('User ', NEW.new_user_name, ' already exists'));

    ELSE
        INSERT INTO user_data(user_name,user_password)
        VALUES(NEW.new_user_name,SHA2(NEW.set_user_password,256));
        INSERT INTO activity_log(user_name,user_type,activity)
        VALUES(
            NEW.new_user_name,'New','SignIn');
    END IF;

END;


-- login trigger
CREATE TRIGGER login_trigger
BEFORE INSERT ON log_interface
FOR EACH ROW
 BEGIN 
  IF EXISTS(SELECT 1 FROM user_data WHERE user_name=NEW.user_name
                         AND user_password=SHA2(NEW.user_password,256)) THEN
       INSERT INTO activity_log(user_name,user_type,activity)
        VALUES(NEW.user_name,'Verified','LogIn');
  ELSE
       INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Unknown','LogIn',CONCAT('Unknown ',NEW.user_name,"! Denied"));
    END IF;
 END;

 -- account delete trigger

 CREATE TRIGGER delete_account
BEFORE INSERT ON delete_interface
FOR EACH ROW
BEGIN

    IF EXISTS (SELECT 1 FROM user_data WHERE user_name = NEW.user_name AND user_password = SHA2(NEW.user_password,256)) THEN

        DELETE FROM user_data WHERE user_name = NEW.user_name;

        INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Verified','Leave',CONCAT('User ', NEW.user_name, ' deleted successfully'));
    ELSEIF EXISTS(SELECT 1 FROM user_data WHERE user_name=NEW.user_name AND user_password<>SHA2(NEW.user_password,256)) THEN
              INSERT INTO activity_log(user_name,user_type,activity,ac_description)
              VALUES(NEW.user_name,'Known','Leave','Incorrect password try again');
    ELSE
        INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Unknown','Leave','Deletion denied');
    END IF;
END;

-- Try to sign up a new user 'Ram'
INSERT INTO signin_interface(new_user_name, set_user_password)
VALUES('Ram','1234');
-- Try to sign up the same user 'Ram' again
INSERT INTO signin_interface(new_user_name, set_user_password)
VALUES('Ram','5678');
INSERT INTO signin_interface(new_user_name, set_user_password) VALUES('Ram','1234');
INSERT INTO signin_interface(new_user_name, set_user_password) VALUES('Hari','abcd');
INSERT INTO signin_interface(new_user_name, set_user_password) VALUES('Sita','pass1');
INSERT INTO signin_interface(new_user_name, set_user_password) VALUES('Ram','5678');
INSERT INTO signin_interface(new_user_name, set_user_password) VALUES('Sita','newpass');
INSERT INTO log_interface(user_name,user_password) VALUES('Ram','1234');
INSERT INTO log_interface(user_name,user_password) VALUES('Hari','abcd');
INSERT INTO log_interface(user_name,user_password) VALUES('Ram','0000');
INSERT INTO log_interface(user_name,user_password) VALUES('Sita','wrongpass');
INSERT INTO log_interface(user_name,user_password) VALUES('UnknownUser','1234');
INSERT INTO delete_interface(user_name,user_password) VALUES('Hari','abcd');
INSERT INTO delete_interface(user_name,user_password) VALUES('UnknownUser','123');
INSERT INTO delete_interface(user_name,user_password) VALUES('Sita','wrongpass');
SELECT * FROM user_data;
SELECT * FROM activity_log;


DELIMITER $$
CREATE TRIGGER update_password_trig
AFTER INSERT ON user_password_update
FOR EACH ROW
BEGIN
    -- Check if user exists
    IF EXISTS(SELECT 1 FROM user_data WHERE user_name = NEW.user_name) THEN 
        -- Verify old password
        IF EXISTS(SELECT 1 FROM user_data WHERE user_name = NEW.user_name AND user_password = SHA2(NEW.user_password,256)) THEN
            -- Update password in user_data
            UPDATE user_data SET user_password = SHA2(NEW.new_user_password,256) WHERE user_name = NEW.user_name;
            -- Log successful update
            INSERT INTO activity_log(user_name,user_type,activity,ac_description)
            VALUES(NEW.user_name,'Verified','Password Update','Password updated successfully');
        ELSE
            -- Old password incorrect
            INSERT INTO activity_log(user_name,user_type,activity,ac_description)
            VALUES(NEW.user_name,'Known','Password Update','Incorrect Password try again');
        END IF;
    ELSE
        -- Unknown user
        INSERT INTO activity_log(user_name,user_type,activity,ac_description)
        VALUES(NEW.user_name,'Unknown','Password Update',CONCAT('Unknown user ',NEW.user_name,' tried to change password'));
    END IF;
END$$
DELIMITER ;

INSERT INTO user_password_update VALUES('Ra','1234','2356');
INSERT INTO user_password_update VALUES('laoa','124','2356');
SELECT * FROM user_password_update;
SELECT * FROM user_data;
SELECT * FROM activity_log;
-- DROP TRIGGER update_password_trig;
-- DROP Table user_data;
-- DROP Table log_interface;
-- DROP TABLE user_password_update;
-- DROP Table signin_interface;
-- DROP Table activity_log;
-- DROP Table delete_interface;
-- DROP TRIGGER delete_account;
-- DROP TRIGGER login_trigger;
-- DROP TRIGGER sigin_trigger;
