-- Session 2.
-- Task 1. - Done in class.

-- Task 2.

CREATE DATABASE foodie_app;
USE foodie_app;

-- Task 3.

CREATE TABLE restaurants (
id INT PRIMARY KEY,
name VARCHAR(40),
cuisine VARCHAR(40),
rating FLOAT,
location VARCHAR(100)
);

-- Task 4.

CREATE TABLE user (
User_Id INT PRIMARY KEY,
Username VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Phone_Number VARCHAR(15) UNIQUE,
Created_at DATETIME DEFAULT current_timestamp
);

-- Task 5.

USE TOPS;

-- INCORRECT
/*	CREATE TABLE Stud (
     student_id INT
     student_name VARCHAR(50)
     age INT
 )	Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student_name VARCHAR(50)
     age INT
 )' at line 3	
 */
CREATE TABLE Stud (
    student_id INT
    student_name VARCHAR(50)
    age INT
);

-- CORRECT
CREATE TABLE Stud (
    student_id INT,
    student_name VARCHAR(50),
    age INT
);

