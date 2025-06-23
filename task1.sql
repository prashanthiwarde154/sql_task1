-- Creating a new database for my e-commerce system
CREATE DATABASE IF NOT EXISTS myshop;
USE myshop;

-- Creating customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(80),
    contact_email VARCHAR(100),
    mobile_no VARCHAR(20)
);

-- Making product categories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Products list with category link
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_title VARCHAR(100),
    price DECIMAL(8,2),
    in_stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Order details table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    date_ordered DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Products inside each order
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    qty INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Payment table for orders
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    total_paid DECIMAL(10,2),
    payment_mode VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
