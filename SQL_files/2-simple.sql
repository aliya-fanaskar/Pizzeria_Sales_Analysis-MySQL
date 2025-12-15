USE pizzeria;

-- ===================================================================================================
# 1 - Retrieve the total number of orders placed.
SELECT COUNT(*) AS No_of_Orders FROM orders;


-- ===================================================================================================
# 2 - Calculate the total revenue generated from pizza sales.
SELECT 
	ROUND(SUM(od.quantity * p.price), 2) AS Total_Sales
FROM order_details od JOIN pizzas p
	ON od.pizza_id = p.pizza_id;


-- ===================================================================================================
# 3 - Total variety of pizzas. 
SELECT COUNT(DISTINCT name) AS unique_pizzas FROM pizza_types;


-- ===================================================================================================
# 4 - Categorical distribution of pizza varieties. 
SELECT 
	category, COUNT(name) as nos
FROM pizza_types
GROUP BY category;


-- ===================================================================================================
# 5 - Identify the highest-priced pizza.
SELECT 
	pt.name,
    pt.category,
    p.size,
    p.price
FROM pizzas p JOIN pizza_types pt
	ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC LIMIT 1;

-- in case, there are ties
SELECT 
	pt.name,
    pt.category,
    p.size,
    p.price
FROM pizzas p JOIN pizza_types pt
	ON p.pizza_type_id = pt.pizza_type_id
WHERE price = (
	SELECT MAX(price) FROM pizzas
);