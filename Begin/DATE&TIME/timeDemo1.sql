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