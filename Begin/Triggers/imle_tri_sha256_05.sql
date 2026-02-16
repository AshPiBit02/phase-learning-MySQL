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
                            user_type VARCHAR(20) CHECK (user_type IN ('Verified','Unknown','New')),
                            activity VARCHAR(30) CHECK(activity IN ('LogIn','SignIn','Leave')),
                            activity_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- TRIGGERS

-- signin_trigger
CREATE TRIGGER sigin_trigger
BEFORE INSERT ON user_data
FOR EACH R
