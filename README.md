🍕 Pizza Sales Analysis (SQL Project)

This project uses **MySQL** to analyze pizza sales data and uncover insights such as top-selling pizzas, revenue trends, and category-based performance.

---

📁 Dataset Overview

The dataset consists of the following 4 CSV files:

| File Name           | Description                              |
|---------------------|------------------------------------------|
| `orders.csv`        | Order timestamps and order IDs           |
| `order_details.csv` | Items (pizzas) in each order             |
| `pizzas.csv`        | Pizza IDs, sizes, and prices             |
| `pizza_types.csv`   | Pizza names, categories, and ingredients |

---

🧠 Objectives

- Analyze overall order and sales performance
- Identify top-selling pizzas by quantity and revenue
- Track orders and sales by time and date
- Measure revenue contribution by pizza type and category

---

🛠️ Tools Used

- **MySQL Workbench**
- SQL
- CSV files

---

📊 Analysis Breakdown

✅ Basic Queries
- Total number of orders
- Total revenue generated
- Most expensive pizza
- Most common pizza size
- Top 5 most ordered pizza types

🔁 Intermediate Queries
- Total quantity by pizza category
- Orders by hour of day
- Category-wise pizza distribution
- Average number of pizzas per day
- Top 3 pizza types by revenue

🔬 Advanced Queries
- % revenue contribution of each pizza type
- Cumulative revenue over time
- Top 3 revenue-generating pizzas per category

---

📂 Project Structure

pizza-sales-analysis/
├── data/
│ ├── orders.csv
│ ├── order_details.csv
│ ├── pizzas.csv
│ └── pizza_types.csv
├── queries/
│ ├── basic_queries.sql
│ ├── intermediate_queries.sql
│ └── advanced_queries.sql
└── README.md


---

📌 How to Use

1. Import the CSVs into MySQL Workbench.
2. Modify the `orders` table:
   ```sql
   ALTER TABLE orders
   MODIFY COLUMN date DATE,
   MODIFY COLUMN time TIME;


📬 Contact
Created by KAVITHA SAHUKARI
📂 GitHub: https://github.com/kavithasahukari
💼 LinkedIn: www.linkedin.com/in/kavitha-sahukari
