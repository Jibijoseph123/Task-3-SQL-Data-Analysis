create database ecommerce;
use ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, '2024-01-10', 500),
(102, 2, '2024-01-12', 300),
(103, 1, '2024-01-15', 200),
(104, 3, '2024-01-20', 700);

-- SELECT + ORDER BY
SELECT * FROM customers ORDER BY customer_name;

-- GROUP BY + SUM
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- WHERE vs HAVING
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 400;

-- JOIN (INNER JOIN)
SELECT c.customer_name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- SUBQUERY
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_amount > 300);

-- AVERAGE REVENUE PER USER 
SELECT AVG(total_amount) AS avg_revenue_per_user
FROM orders;

-- HANDLE NULL VALUES
SELECT IFNULL(total_amount, 0) AS total_amount
FROM orders;

-- CREATE VIEW
CREATE VIEW customer_revenue AS
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
SELECT * FROM customer_revenue;

-- OPTIMIZATION WITH INDEX
CREATE INDEX idx_customer_id ON orders(customer_id);
