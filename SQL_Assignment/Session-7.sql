-- Session-7
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

