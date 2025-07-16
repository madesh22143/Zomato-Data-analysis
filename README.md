# Zomato-Data-analysis
Zomato Sales Analysis Using SQL

This is a fictional project that mimics the Zomato food delivery platform. It performs SQL-based analysis on sales, customer behavior, restaurant performance, and delivery metrics.

## 📌 Project Overview

Analyze a food delivery service’s operations and trends using SQL on a relational database.

### 🎯 Objectives:
- Analyze monthly sales trends
- Identify top-performing restaurants
- Explore delivery performance
- Understand customer behavior and preferences

---

## 🧱 Database Schema

### 1. `customers`
| Column        | Type         |
|---------------|--------------|
| customer_id   | INT (PK)     |
| name          | VARCHAR      |
| city          | VARCHAR      |
| signup_date   | DATE         |

### 2. `restaurants`
| Column        | Type         |
|---------------|--------------|
| restaurant_id | INT (PK)     |
| name          | VARCHAR      |
| cuisine       | VARCHAR      |
| city          | VARCHAR      |
| rating        | DECIMAL      |

### 3. `orders`
| Column        | Type         |
|---------------|--------------|
| order_id      | INT (PK)     |
| customer_id   | INT (FK)     |
| restaurant_id | INT (FK)     |
| order_date    | DATE         |
| delivery_time | INT (minutes)|
| total_amount  | DECIMAL      |
| payment_method| VARCHAR      |

### 4. `order_items`
| Column        | Type         |
|---------------|--------------|
| order_item_id | INT (PK)     |
| order_id      | INT (FK)     |
| item_name     | VARCHAR      |
| quantity      | INT          |
| price         | DECIMAL      |

---

## 📊 Sample SQL Queries

```sql
-- Monthly Revenue
SELECT DATE_TRUNC('month', order_date) AS month, SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Top 5 Restaurants
SELECT r.name, SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name
ORDER BY total_revenue DESC
LIMIT 5;

-- Average Delivery Time by Cuisine
SELECT r.cuisine, AVG(o.delivery_time) AS avg_delivery_time
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.cuisine;
```

---

## 💡 Tools Used

- SQL (PostgreSQL/MySQL)
- Excel or Tableau (optional for visualization)

