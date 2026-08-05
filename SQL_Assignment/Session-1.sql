-- Session 1
-- Task 1. - Done in class

-- Task 2.
CREATE DATABASE music_streaming_app ;
USE music_streaming_app;
CREATE TABLE playlists (
playlists_id INT PRIMARY KEY,
name VARCHAR(20),
created_by VARCHAR(20)
);

-- Task 3.
INSERT INTO playlists VALUES
(101, "Song A", "Badshah"),
(102, "Song B", "Honey Singh"),
(103, "Song C", "Arjit Singh");

-- Task 4.

SELECT * FROM playlists;
SELECT *
FROM playlists
WHERE Created_by = "Badshah";

-- Task 5.

/*
### Difference Between Table, Row, and Column in SQL (Using Zomato Example)

In SQL, data is stored in **tables**. A table is like an Excel sheet that contains related information.

#### 1. Table

A **table** is a collection of data organized into rows and columns.

**Example:** A Zomato database may have a table called **Orders** that stores information about food orders.

| Order_ID | Customer_Name | Restaurant | Amount |
| -------- | ------------- | ---------- | ------ |
| 101      | Rahul         | Pizza Hut  | 450    |
| 102      | Priya         | McDonald's | 300    |
| 103      | Amit          | Domino's   | 550    |

Here, **Orders** is the table.

#### 2. Row

A **row** represents a single record in a table.

**Example:** The row

| 101 | Rahul | Pizza Hut | 450 |

contains all the information about one specific order placed by Rahul.

#### 3. Column

A **column** represents a particular type of information stored for every record.

In the Orders table:

* **Order_ID** is a column.
* **Customer_Name** is a column.
* **Restaurant** is a column.
* **Amount** is a column.

Each column stores one category of data for all orders.

### Summary

* **Table** = Complete collection of related data (e.g., Orders table).
* **Row** = One individual record (e.g., Rahul's order).
* **Column** = One specific field of information (e.g., Customer_Name or Amount).

Therefore, in a Zomato-like application, customer orders are stored in a table, each order is represented by a row, and details such as Order_ID, Customer_Name, Restaurant, and Amount are stored in columns.
*/
