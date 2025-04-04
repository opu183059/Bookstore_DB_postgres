-- Active: 1743780779693@@127.0.0.1@5432@bookstore_db

-- Create books table 
CREATE TABLE books (
    id SERIAL PRIMARY KEY,  
    title VARCHAR(255) NOT NULL, 
    author VARCHAR(255) NOT NULL,  
    price DECIMAL(10,2) CHECK (price >= 0),  -- Price is non-negative
    stock INT CHECK (stock >= 0),  -- Stock is non-negative
    published_year INT 
);

-- Create customer table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,  
    email VARCHAR(255) UNIQUE NOT NULL,  
    joined_date DATE DEFAULT CURRENT_DATE  
);

-- Create order table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,  
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,  
    book_id INT REFERENCES books(id) ON DELETE CASCADE,  
    quantity INT CHECK (quantity > 0),  -- quantity greater than 0
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

--view all table
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'; 

-- inserting books data
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don’t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

SELECT * FROM books;
 
 -- insert customer data
 INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');

SELECT * FROM customers;

INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');

SELECT * FROM orders;

-- problem 1: Find books that are out of stock
SELECT title FROM books WHERE stock = 0;

-- problem 2: Retrieve the most expensive book in the store
SELECT * FROM books ORDER BY price DESC LIMIT 1;

--problem 3:  Find the total number of orders placed by each customer
SELECT name, (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.id) AS total_orders FROM customers;

-- problem 4: Calculate the total revenue generated from book sales
SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;

-- problem 5: List all customers who have placed more than one order
SELECT customers.name, COUNT(orders.id) AS orders_count
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.id) > 1;

-- problem 6: Find the average price of books in the store
SELECT ROUND(AVG(price), 2) AS avg_book_price FROM books;

-- problem 7: Increase the price of all books published before 2000 by 10%
UPDATE books SET price = price * 1.10 WHERE published_year < 2000;

SELECT * FROM books

-- problem 8: Delete customers who haven't placed any orders

-- SELECT DISTINCT customer_id FROM orders;
DELETE FROM customers WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT * FROM customers;