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