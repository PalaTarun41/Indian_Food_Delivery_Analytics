CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    segment VARCHAR(20)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

CREATE TABLE delivery_partners (
    delivery_partner_id INT PRIMARY KEY,
    name VARCHAR(100),
    vehicle VARCHAR(20),
    rating DECIMAL(2,1)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    delivery_partner_id INT,
    order_datetime DATETIME,
    delivery_time_minutes INT,
    order_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (delivery_partner_id) REFERENCES delivery_partners(delivery_partner_id)
);
