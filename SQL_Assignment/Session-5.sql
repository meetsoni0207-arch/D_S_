-- Session-5
-- Task-1

USE foodie_app;

CREATE TABLE restaurant2(
id INT PRIMARY KEY,
name VARCHAR(20),
cuisine VARCHAR(20),
rating FLOAT,
city VARCHAR(20)
);

INSERT INTO restaurant2 VALUES
(1, 'Swagat', 'North Indian', 4.5, 'Ahmedabad'),
(2, 'Swadisht', 'South Indian', 4.2, 'Surat'),
(3, 'Pizza Palace', 'Italian', 3.8, 'Vadodara'),
(4, 'Dragon Wok', 'Chinese', 4.7, 'Ahmedabad'),
(5, 'Tandoori Treat', 'Mughlai', 3.6, 'Surat');

-- Task-2

SELECT * FROM restaurant2
WHERE rating>4.0 AND city IN("Ahmedabad","Surat");

-- Task-3

SELECT * FROM restaurant2
WHERE name LIKE "swa%";

-- Task-4

SELECT * FROM restaurant2
WHERE rating BETWEEN 3.5 AND 4.5;

-- Task-5

SELECT * FROM restaurant2
WHERE cuisine IN ("Chinese","Italian","South Indian");

