-- Session-11
-- Task-1
USE foodie_app;
CREATE TABLE Ratings (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant3(id)
);

INSERT INTO Ratings VALUES
(1, 1, 4.5),
(2, 1, 4.0),
(3, 2, 3.5),
(4, 2, 4.0),
(5, 3, 5.0),
(6, 3, 4.8),
(7, 4, 3.2),
(8, 4, 3.8);


SELECT r.id , r.name ,r.city FROM restaurant3 r
WHERE (
SELECT AVG(ra.rating) FROM ratings ra
WHERE ra.restaurant_id = r.id)
>
(SELECT AVG(rating) FROM ratings);

-- Task-2
SELECT u.username ,
(SELECT COUNT(*) FROM orders o
WHERE u.id = o.user_id) as total_orders
FROM users u;

-- Task-3
USE amazon;
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(2,1),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Reviews VALUES
(1, 1, 5.0),
(2, 1, 4.0),
(3, 2, 5.0),
(4, 3, 3.0),
(5, 4, 4.0),
(6, 4, 2.0);

SELECT title FROM movies
WHERE movie_id IN 
(SELECT movie_id FROM reviews
WHERE rating=5);

-- Task-4

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100)
);

INSERT INTO Sellers VALUES
(1, 'TechStore'),
(2, 'FashionHub'),
(3, 'MegaMart');

CREATE TABLE Categories2 (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO Categories2 VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

CREATE TABLE Products2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    seller_id INT,
    category_id INT,
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
    FOREIGN KEY (category_id) REFERENCES Categories2(category_id)
);

INSERT INTO Products2 VALUES
(101, 'Laptop', 1, 1),
(102, 'Shirt', 1, 2),
(103, 'Novel', 1, 3),
(104, 'T-Shirt', 2, 2),
(105, 'Jeans', 2, 2),
(106, 'Mobile', 3, 1),
(107, 'Book', 3, 3);

SELECT seller_name FROM sellers s
WHERE NOT EXISTS
(SELECT category_name  FROM categories2 c
WHERE NOT EXISTS
(SELECT * FROM products2 p
WHERE p.seller_id = s.seller_id AND 
p.category_id = c.category_id));