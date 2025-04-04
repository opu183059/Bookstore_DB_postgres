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
