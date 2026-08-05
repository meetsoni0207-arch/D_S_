-- Session 4.
-- Task 1.

USE music_streaming_app;
CREATE TABLE MusicPlaylist1  (
    id INT PRIMARY KEY,
	Song_name VARCHAR(30),
    Artist VARCHAR(20),
    Genre VARCHAR(20),
    Duration FLOAT
);

INSERT INTO MusicPlaylist1 VALUES
(1,"Song A","Badshah","Romantic",1.56),
(2,"Song B","Diljit","Action",2.30),
(3,"Song C","Aditya","Horror", 1.00),
(4,"Song D","Diljit", "Comedy", 2.30),
(5, "Song E","Aditya","Horror", 1.00);

SELECT * FROM MusicPlaylist1;

-- Task 2.

SELECT Song_name , Artist FROM MusicPlaylist1 LIMIT 3;

-- Task 3.
USE foodie_app;
CREATE TABLE FoodOrders (
id INT PRIMARY KEY,
restaurant VARCHAR(40),
food_item VARCHAR(40),
order_date DATE
);

INSERT INTO FoodOrders VALUES
(1, "McDonald's", "Burger", "2026-07-01"),
(2, "Domino's", "Pizza", "2026-07-02"),
(3, "McDonald's", "Fries", "2026-07-03"),
(4, "KFC", "Chiken", "2026-07-04"),
(5, "Domino's", "Garlic Bread", "2026-07-05");

SELECT DISTINCT restaurant FROM FoodOrders;

-- Task 4.

SELECT food_item AS 'Dish', order_date AS 'Date Ordered' 
FROM FoodOrders;

-- Task 5.

SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;
