
/*
Database Setup
(Turned into comments because tables already exist)
*/

/*
-- Created a Database
CREATE DATABASE ai_ml_workflow;

-- Created Table1
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    country VARCHAR(50)
);

-- Created Table2
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE
);

-- Created Table3
CREATE TABLE logins (
    login_id INT PRIMARY KEY,
    customer_id INT,
    login_date DATE
);

-- Inserted Values into Table1
INSERT INTO customers VALUES
(1, 'Alex', 18, 'Nigeria'),
(2, 'John', 25, 'Ghana'),
(3, 'Sarah', 30, 'Kenya'),
(4, 'Mike', 22, 'Nigeria'),
(5, 'David', 28, 'South Africa');

-- Inserted Values into Table2
INSERT INTO orders VALUES
(101, 1, 15000, '2025-01-10'),
(102, 1, 22000, '2025-02-15'),
(103, 2, 5000, '2025-03-01'),
(104, 3, 40000, '2025-01-25'),
(105, 4, 12000, '2025-02-05'),
(106, 5, 30000, '2025-03-10');

-- Inserted Values into Tables3
INSERT INTO logins VALUES
(1, 1, '2025-03-01'),
(2, 1, '2025-03-02'),
(3, 2, '2025-03-01'),
(4, 3, '2025-03-03'),
(5, 4, '2025-03-05'),
(6, 5, '2025-03-06');
*/

-- =====================================
-- VIEW TABLES
-- =====================================
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM logins;

-- =====================================
-- QUESTION 1
-- View all customer records
-- SQL Concept: SELECT
-- =====================================
SELECT * FROM customers;

-- =====================================
-- QUESTION 2
-- Show customers from Nigeria
-- SQL Concept: WHERE
-- =====================================
SELECT * 
FROM customers
WHERE country = 'Nigeria';

-- =====================================
-- QUESTION 3
-- Display customers ordered by age from youngest to oldest
-- SQL Concept: ORDER BY
-- =====================================
SELECT * 
FROM customers
ORDER BY age ASC;

-- =====================================
-- QUESTION 4
-- Show customers whose age is between 20 and 30
-- SQL Concept: BETWEEN
-- =====================================
SELECT * 
FROM customers
WHERE age BETWEEN 20 AND 30;

-- =====================================
-- QUESTION 5
-- Count the number of customers in each country
-- SQL Concept: GROUP BY
-- =====================================
SELECT country,
	COUNT(*) AS Total_Customers	
FROM customers
GROUP BY country;

-- =====================================
-- QUESTION 6
-- Show countries that have more than one customer
-- SQL Concept: HAVING
-- =====================================
SELECT country,
	COUNT(*) AS Total_Customers
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;

-- =====================================
-- QUESTION 7
-- Display customer names alongside their order amounts
-- SQL Concept: INNER JOIN
-- =====================================
SELECT c.customer_name,
	o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

-- =====================================
-- QUESTION 8
-- Show all customers and any orders they have placed
-- SQL Concept: LEFT JOIN
-- =====================================
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- =====================================
-- QUESTION 9
-- Classify customers as Adult or Young based on age
-- SQL Concept: CASE WHEN
-- =====================================
SELECT *,
	CASE
		WHEN age >= 25 THEN 'Adult'
		ELSE 'Young'
	END AS customer_age_grade
FROM customers;
