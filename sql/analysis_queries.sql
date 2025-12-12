-- 1. Daily order count
SELECT DATE(order_datetime) AS order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_datetime);

-- 2. Average delivery time by city
SELECT c.city, AVG(o.delivery_time_minutes) AS avg_delivery_time
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city;

-- 3. Top cuisines
SELECT r.cuisine, COUNT(*) AS orders_count
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.cuisine
ORDER BY orders_count DESC;

-- 4. Peak ordering hours
SELECT HOUR(order_datetime) AS hour, COUNT(*) AS total_orders
FROM orders
GROUP BY HOUR(order_datetime)
ORDER BY total_orders DESC;

-- 5. Best delivery partners
SELECT dp.name, dp.vehicle, dp.rating, COUNT(*) AS deliveries
FROM orders o
JOIN delivery_partners dp ON o.delivery_partner_id = dp.delivery_partner_id
WHERE o.order_status = 'Delivered'
GROUP BY dp.name, dp.vehicle, dp.rating
ORDER BY deliveries DESC;
