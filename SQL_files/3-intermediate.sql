USE pizzeria;

-- ===================================================================================================
# 6 - Calculate the average number of pizzas ordered daily.
SELECT 
	ROUND(AVG(order_qty), 2) AS Avg_Orders
FROM(
	SELECT
		o.order_date,
		SUM(od.quantity) AS order_qty
	FROM orders o
		JOIN order_details od
			ON o.order_id = od.order_id
	GROUP BY o.order_date
) AS daily_orders;


-- ===================================================================================================
# 7 - Identify the most to least common pizza size ordered.
SELECT 
    p.size,
    COUNT(od.order_details_id) as Order_Qty
FROM pizzas p JOIN order_details od
	ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY Order_Qty DESC;


-- ===================================================================================================
# 8 - List the top 5 most ordered pizzas based on quantities ordered.
SELECT 
	pt.name,
    SUM(od.quantity) AS order_qty
FROM pizza_types pt
	JOIN pizzas p 
		ON pt.pizza_type_id = p.pizza_type_id
	JOIN order_details od
		ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY order_qty DESC
LIMIT 5;


-- ===================================================================================================
# 9 - Find the total quantity of each category of pizza ordered.
SELECT
	pt.category,
    SUM(od.quantity) AS total_qty
FROM pizza_types pt
	JOIN pizzas p
		ON pt.pizza_type_id = p.pizza_type_id
	JOIN order_details od
		ON p.pizza_id = od.pizza_id
GROUP BY category
ORDER BY total_qty DESC;


-- ===================================================================================================
# 10 - Determine the distribution of orders by hour of the day.
SELECT 
	HOUR(order_time) AS hour_of_day,
    COUNT(*) AS orders_qty
FROM orders
GROUP BY hour_of_day
ORDER BY hour_of_day;


-- ===================================================================================================
# 11 - Calculate monthly orders and sales revenue.
-- per day revenue
SELECT 
	MONTHNAME(o.order_date) AS month,
    SUM(od.quantity) AS orders,
    ROUND(SUM(od.quantity * p.price), 2) as revenue
FROM order_details od
	JOIN pizzas p
		ON od.pizza_id = p.pizza_id
	JOIN orders o
		ON od.order_id = o.order_id
GROUP BY month;