-- session - 6
-- Task-1.
USE amazon;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT
);

INSERT INTO products VALUES
(1, 'Samsung Galaxy S24', 'Mobile', 74999),
(2, 'HP Pavilion Laptop', 'Laptop', 62999),
(3, 'Boat Rockerz 550', 'Headphones', 1999),
(4, 'Apple iPhone 15', 'Mobile', 79999),
(5, 'Sony Smart TV', 'Electronics', 54999);

SELECT * FROM Products
ORDER BY price ;

--  Task-2.
SELECT * FROM Products
ORDER BY price DESC
LIMIT 5;

-- Task-3.
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    rating DECIMAL(2,1)
);

INSERT INTO movies VALUES
(1, 'Jawan', 2023, 7.2),
(2, 'RRR', 2022, 8.0),
(3, '3 Idiots', 2009, 8.4),
(4, 'Pushpa', 2021, 7.6),
(5, 'Animal', 2023, 6.8);

SELECT title,release_year,rating FROM movies
ORDER BY release_year DESC ,rating DESC;

-- Task-4.
USE foodie_app;

SELECT * FROM restaurants
ORDER BY name 
LIMIT 10;

-- Task-5.
USE music_streaming_app;

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(100),
    artist VARCHAR(100),
    play_count INT,
    added_date DATE
);

INSERT INTO songs VALUES
(1, 'Brown Munde', 'AP Dhillon', 9500, '2024-01-10'),
(2, 'Kesariya', 'Arijit Singh', 12000, '2024-02-15'),
(3, 'Believer', 'Imagine Dragons', 12000, '2024-03-20'),
(4, 'Perfect', 'Ed Sheeran', 8700, '2023-12-01'),
(5, 'Excuses', 'AP Dhillon', 9500, '2024-04-05');

SELECT * FROM songs
ORDER BY play_count DESC ,added_date DESC
LIMIT 3;


-- session-7
-- Task-1.
USE QTY;
CREATE TABLE orders(
order_id INT PRIMARY KEY,
user_name VARCHAR(20),
total_amount INT,
order_date DATE
);

INSERT INTO orders VALUES
(1,"Amit",1250,"2026-07-01"),
(2,"Priya",850,"2026-07-02"),
(3,"Amit",NULL,"2026-07-03"),
(4,"Rahul",2300,"2026-07-04"),
(5,"Priya",1500,"2026-07-05");


-- Task-2.
SELECT user_name,count(*) AS order_count FROM orders
GROUP BY user_name;


-- Task-3. 
SELECT AVG(total_amount) AS avg_total FROM orders;


-- Task-4. 
SELECT MAX(total_amount) AS highest_amount , MIN(total_amount) AS lowest_amount FROM orders;


-- Task-5. 
SELECT SUM(total_amount) AS total_sales FROM orders
WHERE total_amount IS NOT NULL ;


-- session-8
-- Task-1. 
CREATE TABLE order2(
order_id INT PRIMARY KEY,
user_id INT,
payment_method VARCHAR(20),
amount INT 
);

INSERT INTO order2 VALUES
(1,101,"UPI",250),
(2,102,"Card",500),
(3,101,"Wallet",350),
(4,103,"COD",200),
(5,104,"UPI",400),
(6,102,"Card",700),
(7,103,"Wallet",150),
(8,105,"UPI",600);


-- Task-2.
 SELECT payment_method,count(*) AS order_count FROM order2
 GROUP BY payment_method;
 
 
 -- Task-3. 
 SELECT user_id,SUM(amount) AS total_spend FROM order2
 GROUP BY user_id;
 
 
 -- Task-4. 
 SELECT payment_method, AVG(amount) AS avg_amount FROM order2
 GROUP BY payment_method
 HAVING AVG(amount) > 300;


-- Task-5. 
-- WHERE - Filters individual rows before grouping and cannot use aggregate functions directly.
-- EXAMPLE
SELECT * FROM order2
WHERE amount > 300;

-- HAVING - Filters grouped results after group by and used with aggregate functions.
-- EXAMPLE
 SELECT user_id,SUM(amount) AS total_spend FROM order2
 GROUP BY user_id
 HAVING SUM(amount) > 500;


-- session-9
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


-- session-10
-- Task-1. 
USE music_streaming_app;
CREATE TABLE influencers(
id INT PRIMARY KEY,
name VARCHAR(20)
);

CREATE TABLE collaborations(
id INT PRIMARY KEY,
influencer1_id INT,
influencer2_id INT,
collab_date DATE,
FOREIGN KEY (influencer1_id) REFERENCES influencers(id),
FOREIGN KEY (influencer2_id) REFERENCES influencers(id)
);

INSERT INTO influencers VALUES
(1,"Aman Sharma"),
(2,"Priya Verma"),
(3,"Neha Soni"),
(4,"Karan Mehta"),
(5,"Ramesh Shah");

INSERT INTO collaborations VALUES
(1,1,2,'2025-01-15'),
(2,2,3,'2025-02-10'),
(3,1,4,'2025-05-13'),
(4,3,4,'2025-07-19'),
(5,2,4,'2025-10-05');

SELECT i1.name AS influencer_name, i2.name AS collaboration_partner, c.collab_date FROM influencers i1
LEFT JOIN collaborations c
ON i1.id = c.influencer1_id
LEFT JOIN influencers i2
ON c.influencer2_id = i2.id 
UNION
SELECT i2.name AS influencer_name, i1.name AS collaboration_partner, c.collab_date FROM influencers i2
LEFT JOIN collaborations c
ON i2.id = c.influencer2_id
LEFT JOIN influencers i1
ON c.influencer1_id = i1.id ;


-- Task-2. 
CREATE TABLE Playlists2(
id INT PRIMARY KEY,
user_id INT,
playlist_name VARCHAR(100),
parent_playlist_id INT,
FOREIGN KEY (parent_playlist_id) REFERENCES Playlists2(id)
);

INSERT INTO Playlists2 VALUES
(1, 101, 'Music', NULL),
(2, 101, 'Pop Songs', 1),
(3, 101, 'Rock Hits', 1),
(4, 102, 'Workout', NULL),
(5, 102, 'Gym Mix', 4);

SELECT p1.playlist_name AS playlist, p2.playlist_name AS parent_playlist
FROM Playlists2 p1
LEFT JOIN Playlists2 p2
ON p1.parent_playlist_id = p2.id;

-- Task-3. 
USE foodie_app;
CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

INSERT INTO Users VALUES
(1, 'Amit'),
(2, 'Sneha'),
(3, 'Rahul'),
(4, 'Priya'),
(5, 'Karan');

INSERT INTO Orders VALUES
(101, 1, '2026-01-10'),
(102, 2, '2026-01-15'),
(103, 3, '2026-02-01'),
(104, 1, '2026-02-10');

INSERT INTO Payments VALUES
(1, 101, 1200),
(2, 102, 850),
(3, 103, 500),
(4, 104, 1500);

SELECT u.username,o.order_date,p.amount FROM Users u
LEFT JOIN Orders o
ON u.id = o.user_id
LEFT JOIN Payments p
ON o.id = p.order_id;

-- Task-4. 
CREATE TABLE Restaurants4 (
    id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    review_text VARCHAR(255),
    rating INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants4(id)
);

INSERT INTO Restaurants4 VALUES
(1, 'Spice Hub', 'Ahmedabad'),
(2, 'Pizza World', 'Surat'),
(3, 'Food Palace', 'Vadodara');

INSERT INTO Reviews VALUES
(1, 1, 'Excellent food', 5),
(2, 1, 'Nice ambience', 4),
(3, 2, 'Good pizza', 5),
(4, 2, 'Average service', 3),
(5, 3, 'Loved the desserts', 5);

SELECT DISTINCT r.restaurant_name,rv.review_text,rv.rating FROM Restaurants4 r
JOIN Reviews rv
ON r.id = rv.restaurant_id;

-- Explanation:
-- Duplicates occurred because one restaurant can have multiple reviews , causing repeated restaurant records after the JOIN.

-- Task-5. 

CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products VALUES
(101, 'Laptop', 1, 55000),
(102, 'Smartphone', 1, 25000),
(103, 'T-Shirt', 2, 799),
(104, 'Jeans', 2, 1499),
(105, 'SQL Basics Book', 3, 599);

SELECT p.product_name,c.category_name FROM Products p
INNER JOIN Categories c
ON p.category_id = c.id;

SELECT product_name,category_name FROM Products
INNER JOIN Categories
USING (category_id);

-- Efficiency:
-- JOIN ... ON is generally more flexible and commonly used because it supports different column names and complex join conditions.
-- JOIN ... USING is shorter and easier to read but only works when both tables have the same column name.