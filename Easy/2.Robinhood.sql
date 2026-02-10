--Creating tables for the given problem

--Table 1 trades
CREATE TABLE trades (
    order_id INT,
    user_id INT,
    price FLOAT,
    quantity INT,
    trade_status TEXT,
    trade_time TIMESTAMP
);

--Table 2 users

CREATE TABLE users (
    user_id INT,
    city TEXT,
    email TEXT,
    signup_date TIMESTAMP
);

-- Inserting values into the tables
-- Table 2 users

INSERT INTO users (user_id, city, email, signup_date) VALUES
(1, 'Toronto', 'user1@gmail.com', '2023-01-10'),
(2, 'Toronto', 'user2@gmail.com', '2023-01-15'),
(3, 'Vancouver', 'user3@gmail.com', '2023-02-01'),
(4, 'Vancouver', 'user4@gmail.com', '2023-02-10'),
(5, 'New York', 'user5@gmail.com', '2023-02-20'),
(6, 'New York', 'user6@gmail.com', '2023-03-01'),
(7, 'Chicago', 'user7@gmail.com', '2023-03-05'),
(8, 'Chicago', 'user8@gmail.com', '2023-03-10'),
(9, 'San Francisco', 'user9@gmail.com', '2023-03-15');

-- Inserting values into the tables
-- Table 1 trades

INSERT INTO trades (order_id, user_id, price, quantity, trade_status, trade_time) VALUES
-- Toronto users
(101, 1, 100.5, 2, 'COMPLETED', '2023-03-20 10:15:00'),
(102, 1, 200.0, 1, 'COMPLETED', '2023-03-21 11:00:00'),
(103, 2, 150.0, 3, 'FAILED',   '2023-03-22 09:30:00'),
(104, 2, 120.0, 1, 'COMPLETED', '2023-03-23 14:45:00'),

-- Vancouver users
(105, 3, 300.0, 1, 'COMPLETED', '2023-03-20 12:00:00'),
(106, 3, 180.0, 2, 'COMPLETED', '2023-03-21 13:15:00'),
(107, 4, 220.0, 1, 'COMPLETED', '2023-03-22 16:00:00'),

-- New York users
(108, 5, 500.0, 1, 'COMPLETED', '2023-03-20 10:30:00'),
(109, 5, 450.0, 2, 'COMPLETED', '2023-03-21 11:45:00'),
(110, 6, 400.0, 1, 'COMPLETED', '2023-03-22 15:00:00'),
(111, 6, 350.0, 1, 'CANCELLED','2023-03-23 17:30:00'),

-- Chicago users
(112, 7, 250.0, 2, 'COMPLETED', '2023-03-21 09:00:00'),
(113, 8, 275.0, 1, 'FAILED',   '2023-03-22 10:00:00'),

-- San Francisco users
(114, 9, 600.0, 1, 'COMPLETED', '2023-03-23 18:00:00');

SELECT * FROM users;
SELECT * FROM trades;

--Question: Assume you are given the tables containing 
--information on trades and users. Write a query to list the  
--top three cities that had the most 
--number of completed orders

SELECT u.city,COUNT(t.order_id) AS completed_orders
    FROM users u
    INNER JOIN trades t ON u.user_id = t.user_id
    WHERE t.trade_status = 'COMPLETED'
    GROUP BY u.city
    ORDER BY completed_orders DESC
    LIMIT 3;