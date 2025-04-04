-- Active: 1743780779693@@127.0.0.1@5432@bookstore_db

-- creating books table 
CREATE TABLE books (
    id SERIAL PRIMARY KEY,  
    title VARCHAR(255) NOT NULL, 
    author VARCHAR(255) NOT NULL,  
    price DECIMAL(10,2) CHECK (price >= 0),  -- Price is non-negative
    stock INT CHECK (stock >= 0),  -- Stock is non-negative
    published_year INT 
);

--view all table
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'; 
