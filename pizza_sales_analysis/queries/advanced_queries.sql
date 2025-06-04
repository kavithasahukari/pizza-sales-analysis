 1. Percentage Contribution of Each Pizza Type to Total Revenue

SELECT 
    pt.name AS pizza_type,
    ROUND(SUM(od.quantity * p.price) * 100 / 
          (SELECT SUM(od2.quantity * p2.price)
           FROM order_details od2
           JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id), 2) AS percentage_contribution
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY percentage_contribution DESC;


2. Cumulative Revenue Over Time

SELECT 
    o.date,
    ROUND(SUM(od.quantity * p.price), 2) AS daily_revenue,
    ROUND(SUM(SUM(od.quantity * p.price)) OVER (ORDER BY o.date), 2) AS cumulative_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.date
ORDER BY o.date;


3. Top 3 Most Ordered Pizza Types by Revenue per Category

SELECT
    category,
    name,
    revenue
FROM (
    SELECT 
        pt.category,
        pt.name,
        ROUND(SUM(od.quantity * p.price), 2) AS revenue,
        RANK() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS revenue_rank
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) ranked
WHERE revenue_rank <= 3
ORDER BY category, revenue DESC;