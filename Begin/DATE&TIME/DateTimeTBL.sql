CREATE TABLE EventLog (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    created_at DATETIME,
    updated_at TIMESTAMP,
    city VARCHAR(50)
);
INSERT INTO EventLog (event_name, event_date, created_at, updated_at, city) VALUES
('Tech Conference', '2023-01-15', '2023-01-10 09:30:00', CURRENT_TIMESTAMP, 'Kathmandu'),
('Music Festival', '2023-02-20', '2023-02-01 14:00:00', CURRENT_TIMESTAMP, 'Pokhara'),
('Hackathon', '2023-03-05', '2023-02-25 08:45:00', CURRENT_TIMESTAMP, 'Butwal'),
('Job Fair', '2023-04-12', '2023-04-01 10:15:00', CURRENT_TIMESTAMP, 'Chitwan'),
('Sports Meet', '2023-05-20', '2023-05-10 16:00:00', CURRENT_TIMESTAMP, 'Kathmandu'),
('Art Exhibition', '2023-06-25', '2023-06-15 11:30:00', CURRENT_TIMESTAMP, 'Pokhara'),
('Food Carnival', '2023-07-02', '2023-06-28 13:20:00', CURRENT_TIMESTAMP, 'Butwal'),
('Book Fair', '2023-07-15', '2023-07-01 09:00:00', CURRENT_TIMESTAMP, 'Chitwan'),
('Science Expo', '2023-08-01', '2023-07-25 15:45:00', CURRENT_TIMESTAMP, 'Kathmandu'),
('Film Festival', '2023-08-20', '2023-08-05 18:00:00', CURRENT_TIMESTAMP, 'Pokhara'),
('Startup Pitch', '2023-09-05', '2023-08-30 12:00:00', CURRENT_TIMESTAMP, 'Butwal'),
('Gaming Tournament', '2023-09-10', '2023-09-01 20:00:00', CURRENT_TIMESTAMP, 'Chitwan'),
('Cultural Fest', '2023-09-15', '2023-09-05 08:00:00', CURRENT_TIMESTAMP, 'Kathmandu'),
('Career Workshop', '2023-09-25', '2023-09-15 09:45:00', CURRENT_TIMESTAMP, 'Pokhara'),
('Leadership Summit', '2023-10-01', '2023-09-20 07:30:00', CURRENT_TIMESTAMP, 'Butwal'),
('Coding Bootcamp', '2023-10-05', '2023-09-25 10:00:00', CURRENT_TIMESTAMP, 'Chitwan'),
('Dance Show', '2023-10-10', '2023-10-01 19:00:00', CURRENT_TIMESTAMP, 'Kathmandu'),
('Startup Meetup', '2023-10-15', '2023-10-05 17:00:00', CURRENT_TIMESTAMP, 'Pokhara'),
('Photography Contest', '2023-10-20', '2023-10-10 11:00:00', CURRENT_TIMESTAMP, 'Butwal'),
('Debate Competition', '2023-10-25', '2023-10-15 13:00:00', CURRENT_TIMESTAMP, 'Chitwan');


CREATE TABLE DailyRoutine (
    routine_id INT AUTO_INCREMENT PRIMARY KEY,
    activity VARCHAR(100),
    start_time TIME,
    end_time TIME,
    city VARCHAR(50)
);
INSERT INTO DailyRoutine (activity, start_time, end_time, city) VALUES
('Morning Exercise', '05:30:00', '06:30:00', 'Kathmandu'),
('Breakfast', '07:00:00', '07:30:00', 'Pokhara'),
('Office Work', '09:00:00', '17:00:00', 'Butwal'),
('Lunch Break', '12:30:00', '13:15:00', 'Chitwan'),
('Team Meeting', '10:00:00', '11:00:00', 'Kathmandu'),
('Coding Session', '14:00:00', '16:00:00', 'Pokhara'),
('Evening Walk', '18:00:00', '18:45:00', 'Butwal'),
('Dinner', '20:00:00', '20:45:00', 'Chitwan'),
('Late Night Study', '22:00:00', '23:30:00', 'Kathmandu'),
('Meditation', '06:00:00', '06:20:00', 'Pokhara'),
('Shopping', '17:30:00', '18:30:00', 'Butwal'),
('Movie Time', '21:00:00', '23:00:00', 'Chitwan'),
('Breakfast', '08:00:00', '08:30:00', 'Kathmandu'),
('Workshop', '11:00:00', '13:00:00', 'Pokhara'),
('Gaming', '19:00:00', '21:00:00', 'Butwal'),
('Reading', '20:30:00', '22:00:00', 'Chitwan'),
('Yoga', '05:00:00', '05:45:00', 'Kathmandu'),
('Coffee Break', '15:30:00', '15:45:00', 'Pokhara'),
('Presentation', '09:30:00', '10:30:00', 'Butwal'),
('Networking Event', '18:30:00', '20:00:00', 'Chitwan');

CREATE TABLE EventSchedule (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    start_time TIME,
    end_time TIME,
    created_at DATETIME,
    city VARCHAR(50)
);
INSERT INTO EventSchedule (event_name, event_date, start_time, end_time, created_at, city) VALUES
('Historic Summit', '1989-11-09', '09:00:00', '17:00:00', '1989-10-20 10:30:00', 'Berlin'),
('Cultural Fair', '1992-05-12', '10:00:00', '15:00:00', '1992-04-01 09:00:00', 'Kathmandu'),
('Tech Expo', '1995-07-20', '09:00:00', '18:00:00', '1995-06-15 11:00:00', 'Tokyo'),
('Music Festival', '1999-08-15', '18:00:00', '23:00:00', '1999-07-10 14:45:00', 'Pokhara'),
('Workshop', '2001-03-10', '11:00:00', '13:00:00', '2001-02-25 09:15:00', 'Butwal'),
('Hackathon', '2005-11-15', '08:00:00', '20:00:00', '2005-10-28 16:00:00', 'Chitwan'),
('Seminar', '2008-02-20', '10:00:00', '12:00:00', '2008-01-30 08:30:00', 'Kathmandu'),
('Team Meeting', '2010-04-21', '09:30:00', '10:30:00', '2010-04-01 09:00:00', 'Pokhara'),
('Coding Session', '2012-06-22', '14:00:00', '16:00:00', '2012-06-03 15:00:00', 'Butwal'),
('Evening Walk', '2014-08-23', '18:00:00', '18:45:00', '2014-08-04 18:10:00', 'Chitwan'),
('Dinner Party', '2016-10-24', '20:00:00', '22:00:00', '2016-09-05 19:00:00', 'Kathmandu'),
('Late Night Study', '2018-12-25', '22:00:00', '23:30:00', '2018-12-06 22:05:00', 'Pokhara'),
('Meditation', '2019-02-26', '06:00:00', '06:20:00', '2019-02-07 06:05:00', 'Butwal'),
('Shopping', '2020-04-27', '17:30:00', '18:30:00', '2020-04-08 17:40:00', 'Chitwan'),
('Movie Night', '2021-06-28', '21:00:00', '23:00:00', '2021-06-09 20:55:00', 'Kathmandu'),
('Breakfast Meetup', '2022-08-01', '07:30:00', '08:30:00', '2022-07-10 07:40:00', 'Pokhara'),
('Workshop', '2023-09-02', '11:00:00', '13:00:00', '2023-08-11 11:05:00', 'Butwal'),
('Gaming Session', '2024-10-03', '19:00:00', '21:00:00', '2024-09-12 19:10:00', 'Chitwan'),
('Reading Hour', '2025-11-04', '20:30:00', '22:00:00', '2025-10-13 20:35:00', 'Kathmandu'),
('Yoga Class', '2026-01-05', '05:00:00', '05:45:00', '2025-12-14 05:05:00', 'Pokhara');