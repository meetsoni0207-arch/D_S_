-- Session-9
-- Task-1. 
USE foodie_app;
CREATE TABLE restaurant3(
id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(100)
);

CREATE TABLE dishes(
id INT PRIMARY KEY,
restaurant_id INT,
dish_name VARCHAR(100),
price INT,
FOREIGN KEY (restaurant_id) REFERENCES restaurant3(id)
);

INSERT INTO restaurant3 VALUES
(1, 'Swagat', 'Ahmedabad'),
(2, 'Pizza Hut', 'Surat'),
(3, 'Barbeque Nation', 'Vadodara'),
(4, 'Food Corner', 'Rajkot');  


INSERT INTO dishes VALUES
(1, 1, 'Paneer Butter Masala', 280),
(2, 1, 'Butter Naan', 40),
(3, 2, 'Margherita Pizza', 299),
(4, 2, 'Garlic Bread', 149),
(5, 3, 'BBQ Platter', 599),
(6, 3, 'Chicken Tikka', 349);


-- Task-2. 
SELECT d.dish_name,d.price ,r.name,r.city FROM dishes AS d
INNER JOIN restaurant3 AS r
ON d.restaurant_id = r.id;

-- Task-3. 
SELECT r.name,r.city,d.dish_name,d.price
FROM restaurant3 AS r
LEFT JOIN dishes AS d
ON r.id = d.restaurant_id;

-- Task-4. 
SELECT d.dish_name,d.price,r.name , r.city 
FROM restaurant3 AS r
RIGHT JOIN dishes AS d
ON r.id = d.restaurant_id;

-- Task-5. 
/*
Which JOIN should be used?
Answer: Use a LEFT JOIN.
Reason:
A LEFT JOIN returns all playlists, even if some playlists have no songs.
Empty playlists will still appear with NULL values for the song columns.
*/
USE music_streaming_app;
CREATE TABLE playlists1 (
    playlist_id INT PRIMARY KEY,
    playlist_name VARCHAR(100)
);

CREATE TABLE songs1 (
    song_id INT PRIMARY KEY,
    playlist_id INT,
    song_name VARCHAR(100)
);

INSERT INTO playlists1 VALUES
(1, 'Workout Mix'),
(2, 'Chill Vibes'),
(3, 'Road Trip'),
(4, 'Party Hits'),
(5, 'Study Playlist');

INSERT INTO songs1 VALUES
(1, 1, 'Believer'),
(2, 1, 'Hall of Fame'),
(3, 2, 'Perfect'),
(4, 3, 'Brown Munde'),
(5, 4, 'Kesariya');

SELECT p.playlist_name,s.song_name FROM playlists1 AS p
LEFT JOIN songs1 AS s
ON p.playlist_id = s.playlist_id;

