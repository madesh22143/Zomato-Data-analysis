
-- Zomato Sales Analysis: SQL Dataset (Fictional)

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Anita Sharma', 'Mumbai', '2022-01-15'),
(2, 'Ravi Kumar', 'Delhi', '2022-03-22'),
(3, 'Priya Mehta', 'Bangalore', '2022-06-05');

-- 2. Restaurants Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO restaurants VALUES
(1, 'Spice Villa', 'Indian', 'Mumbai', 4.6),
(2, 'Pasta Street', 'Italian', 'Delhi', 4.2),
(3, 'Sushi House', 'Japanese', 'Bangalore', 4.8);

-- 3. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    delivery_time INT,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO orders VALUES
(101, 1, 1, '2023-01-10', 35, 500.00, 'Card'),
(102, 2, 2, '2023-02-18', 45, 800.00, 'UPI'),
(103, 3, 3, '2023-03-22', 25, 1200.00, 'Cash');

-- 4. Order_Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_name VARCHAR(100),
    quantity INT,
    price DECIMAL(7,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items VALUES
(1, 101, 'Paneer Butter Masala', 1, 250.00),
(2, 101, 'Naan', 2, 125.00),
(3, 102, 'Pasta Alfredo', 1, 400.00),
(4, 102, 'Garlic Bread', 1, 150.00),
(5, 103, 'Sushi Combo', 1, 1200.00);
