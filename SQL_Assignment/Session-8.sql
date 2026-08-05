-- Session-8
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

