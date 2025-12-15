USE pizzeria;

-- ===================================================================================================
# 12 - Determine the top 3 highest selling pizzas.
SELECT
	pt.name,
    pt.category,
	ROUND(SUM((od.quantity * p.price)), 2) as p_revenue
FROM pizza_types pt
	JOIN pizzas p
		ON pt.pizza_type_id = p.pizza_type_id
	JOIN order_details od
		ON p.pizza_id = od.pizza_id
GROUP BY pt.name, pt.category
ORDER BY p_revenue DESC
LIMIT 3;


-- ===================================================================================================
# 13 - Calculate the percentage contribution of each pizza type to total revenue.
SELECT
	pt.category,
	ROUND(
		(SUM(od.quantity * p.price)) * 100 / 
        (SELECT 
			SUM(od.quantity * p.price) AS total_sales
		FROM order_details od
        JOIN pizzas p ON od.pizza_id = p.pizza_id), 2) AS revenue_percent
FROM pizza_types pt
	JOIN pizzas p
		ON pt.pizza_type_id = p.pizza_type_id
	JOIN order_details od
		ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY revenue_percent DESC;


-- ===================================================================================================
# 14 - Analyze the monthly cumulative revenue generated.

-- monthly revenue
SELECT 
	MONTHNAME(o.order_date) AS month,
    ROUND(SUM(od.quantity * p.price), 2) as revenue
FROM order_details od
	JOIN pizzas p
		ON od.pizza_id = p.pizza_id
	JOIN orders o
		ON od.order_id = o.order_id
GROUP BY month;


-- cumulative revenue
SELECT
	month,
    monthly_revenue,
    ROUND(SUM(monthly_revenue) OVER(ORDER BY month_num), 2) as cumulative_sales
FROM (
	SELECT 
		MONTH(o.order_date) AS month_num,
        MONTHNAME(o.order_date) AS month,
		ROUND(SUM(od.quantity * p.price), 2) as monthly_revenue
	FROM order_details od
		JOIN pizzas p
			ON od.pizza_id = p.pizza_id
		JOIN orders o
			ON od.order_id = o.order_id
	GROUP BY month_num, month
) AS monthly_revenue_table;


-- ===================================================================================================
# 15 - Determine the top 3 most ordered pizzas from each category based on revenue for each pizza category.
SELECT
	name, category, revenue
FROM(
	SELECT
		*, RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS category_rank
	FROM (
		SELECT
			pt.category,
			pt.name,
			ROUND(SUM(od.quantity * p.price), 2) AS revenue
		FROM pizza_types pt
			JOIN pizzas p
				ON pt.pizza_type_id = p.pizza_type_id
			JOIN order_details od
				ON p.pizza_id = od.pizza_id
		GROUP BY pt.category, pt.name       -- revenue of each pizza variety
	) AS ranked_table                       -- ranks assigned to pizza in each category
) AS final_result
WHERE category_rank <= 3;                   -- picked top 3 from each category