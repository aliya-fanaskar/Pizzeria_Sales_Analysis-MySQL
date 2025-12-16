# Pizzeria Sales Analysis (SQL Project)

## Overview

This project presents an SQL-based exploratory analysis of a fictional pizzeria’s sales data. The analysis focuses on understanding sales performance, customer ordering patterns and category-level trends using **MySQL**.

The project reflects my learning journey and hands-on practice while building SQL fundamentals. The goal is to analyze the dataset and derive insights using structured queries ranging from simple aggregations to advanced analytical techniques.

---

## Dataset & Schema 
The database consists of the following tables:
* `orders` – order date and time details
* `order_details` – pizza-level order quantities
* `pizzas` – pizza size and price information
* `pizza_types` – pizza names and categories

All tables are joined using appropriate keys to enable end-to-end sales analysis - [database_setup.sql](https://github.com/aliya-fanaskar/Pizzeria_Sales_Analysis-MySQL/blob/main/SQL_files/1-database_setup.sql)


---

## Data Analysis

Following metrics were extracted to carry out the analysis

#### Simple Analysis - [(simple.sql)](https://github.com/aliya-fanaskar/Pizzeria_Sales_Analysis-MySQL/blob/main/SQL_files/2-simple.sql)
* Total number of orders
* Highest-priced pizza
* No. of uniqur pizza varieties
* Categorical distribution of pizza varieties
* Highest-priced pizza

#### Intermediate Analysis - [(intermediate.sql)](https://github.com/aliya-fanaskar/Pizzeria_Sales_Analysis-MySQL/blob/main/SQL_files/3-intermediate.sql)
* Average pizzas ordered per day
* Most to least common pizza size ordered
* Top ordered pizzas by quantity
* Category-wise pizza order quantity
* Order distribution by hour of the day
* Monthly orders and sales revenue

#### Advanced Analysis - [(advanced.sql)](https://github.com/aliya-fanaskar/Pizzeria_Sales_Analysis-MySQL/blob/main/SQL_files/4-advanced.sql)
* Top 3 highest selling pizzas
* Percentage contribution to total revenue
* Monthly cumulative revenue over time
* Top-performing pizzas within each category using window functions


---

## Key Insights

* The pizzeria recorded 21,350 orders during the year, contributing to total revenue of $817,860.
* The pizzeria features 32 different pizzas across 4 categories, and the XXL Classic Greek Pizza is the costliest item on the menu.
* On average, the pizzeria receives around 138 orders per day
* Ordering patterns show a strong preference for Large pizzas, moderate demand for Medium and Small, and negligible demand for XL and XXL sizes.
* Similarly, Classic pizzas are the most popular category by order volume, with Supreme, Veggie, and Chicken following closely behind.
* Orders peak during specific hours of the day, indicating clear demand patterns
* Monthly orders and revenue remain fairly consistent throughout the year, with noticeable peaks during mid-year months such as May to July, and a slight dip towards September and October.

---

## Business Recommendations

* Prioritize high-revenue pizza types in marketing campaigns
* Align staffing levels with peak ordering hours
* Promote top-performing categories while experimenting with low-performing ones
* Use revenue trends to plan seasonal or time-based offers

---

## Assumptions & Limitations

* Dataset represents a static snapshot of sales data
* Analysis is limited to sales and revenue metrics only
* No customer-level available for Customer segmentation
* No location-level data available to conduct profitability analysis by incorporating cost data

---

## SQL Concepts Used

* INNER JOINs across multiple tables
* Aggregations (`SUM`, `COUNT`, `AVG`)
* GROUP BY and HAVING clauses
* Subqueries
* Window functions (`RANK`, `OVER`)
* Date and time functions

---

## Sources

This project was created as part of my learning journey from a [Youtube Tutorial by WsCube Tech](https://www.youtube.com/watch?v=zZpMvAedh_E) guided by [Ayushi Jain](https://github.com/Ayushi0214). While the dataset and problem statement were provided during the tutorial, I did some more modifications in the database setup and made my own additions and variations to the analysis queries, including deeper aggregations, window functions, and insight-focused questions to enhance my learning.

Beyond the tutorial, I explored additional SQL concepts by referring to blogs, documentation, and practice sites. Some of these are as follows:
- [SQL for Data Analysis cheatsheet - blog from learnsql.com](https://learnsql.com/blog/sql-for-data-analysis-cheat-sheet/)
- [Setting up Foreign Key constraints to imported dataset in SQL - Youtube Tutorial](https://www.youtube.com/watch?v=q5wFWfsS-4I)
- [`SUM`() with `OVER`(PARTITION BY) - blog from learnsql.com](https://learnsql.com/blog/sum-over-partition-by/)
- [MySQL `OVER` clause - datacamp.com](https://www.datacamp.com/doc/mysql/mysql-over)
- [A comprehensive guide on SQL Joins - Medium Article](https://medium.com/@johnnyJK/understanding-sql-joins-a-comprehensive-guide-88bab3457270)

---

**Aliya Fanaskar**\
[**www.linkedin.com/in/aliya-fanaskar**](https://www.linkedin.com/in/aliya-fanaskar)
