1. Total Number of Orders

   SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;


2. Total Revenue from Pizza Sales

   SELECT SUM(od.quantity * p.price) AS total_revenue
   FROM order_details od
   JOIN pizzas p ON od.pizza_id = p.pizza_id;


3. Highest-Priced Pizza

   SELECT * FROM pizzas
   ORDER BY price DESC
   LIMIT 1;


4. Most Common Pizza Size Ordered

   SELECT p.size, SUM(od.quantity) AS total_ordered
   FROM order_details od
   JOIN pizzas p ON od.pizza_id = p.pizza_id
   GROUP BY p.size
   ORDER BY total_ordered DESC
   LIMIT 1;


5. Top 5 Most Ordered Pizza Types

   SELECT pt.name, SUM(od.quantity) AS total_quantity
   FROM order_details od
   JOIN pizzas p ON od.pizza_id = p.pizza_id
   JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
   GROUP BY pt.name
   ORDER BY total_quantity DESC
   LIMIT 5;