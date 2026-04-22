# Restaurant Orders — SQL Analysis

## Project Overview
An exploratory data analysis of a restaurant's menu and order data using SQL.
The goal was to understand menu composition, customer ordering behaviour, and what drives high-value orders.

Dataset source: Maven Analytics (via YouTube)

---

## Dataset
| Table | Rows | Description |
|---|---|---|
| menu_items | 32 | Item name, category, and price |
| order_details | 12,234 | Individual items ordered, linked to order ID |

- *Date range:* January 1, 2023 → March 9, 2023
- *Total unique orders:* 5,370
- *Menu categories:* American, Asian, Mexican, Italian

---

## Business Questions Explored

### Part 1 — Menu Analysis
- How many items are on the menu?
- What are the least and most expensive items?
- How many dishes exist per category, and what is the average price per category?

### Part 2 — Order Analysis
- What is the date range of the data?
- How many orders and items were placed in this period?
- Which orders had the most items?

### Part 3 — Customer Behaviour
- What are the most and least ordered items, and which categories do they belong to?
- Which orders spent the most money?
- What can we learn from the highest-spending orders?

---

## Key Findings
- *Italian and Asian* dishes are the most expensive categories on average
- The *least ordered item* was Chicken Tacos (Mexican)
- The *most ordered item* was Hamburger (American)
- The *top 5 highest-spending orders* all heavily favoured *Italian dishes*
- This suggests Italian items, despite being pricier, are popular among the restaurant's highest-value customers — a strong case for keeping them on the menu

---

## SQL Concepts Used
- SELECT, WHERE, ORDER BY, LIMIT
- Aggregate functions: COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING
- LEFT JOIN across two tables
- Subqueries and CTEs (WITH)
- DISTINCT for deduplication

---

## Files
| File | Description |
|---|---|
| menu_items.csv | Menu data |
| order_details.csv | Order transaction data |
| create_restaurant_db.sql | Script to create and populate the database |
| Restaurant_data_analysis.sql | All analysis queries with comments |
