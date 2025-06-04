1. Total Quantity of Each Pizza Category Ordered

SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;


2. Distribution of Orders by Hour (using time only)

SELECT HOUR(time) AS order_hour, COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour;


3. Category-Wise Distribution of Pizzas

SELECT pt.category, COUNT(DISTINCT p.pizza_id) AS pizza_count
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;


4. Average Number of Pizzas Ordered Per Day

SELECT date, SUM(od.quantity) AS total_pizzas
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY o.date
ORDER BY o.date;

-- (To calculate the average separately:)
SELECT AVG(daily.total_pizzas) AS avg_pizzas_per_day
FROM (
    SELECT date, SUM(od.quantity) AS total_pizzas
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    GROUP BY o.date
) AS daily;


5. Top 3 Most Ordered Pizza Types by Revenue

SELECT pt.name, SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

