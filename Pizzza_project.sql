       --PIZZA SALES SQL QUERIES
SELECT * FROM  pizza_sales;



-- Total Revenue

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Average Order Value

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AVG_Order_Value FROM pizza_sales;

-- Total Pizza Sold

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales;

-- Avg Pizza Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2))AS DECIMAL(10,2))AS Avg_Pizza_per_order
FROM pizza_sales;


--Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) AS order_day , COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);


-- Monthly Trend for Orders
SELECT DATENAME(MONTH,order_date) AS Month_name , COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_orders DESC;


-- % of Sales by Pizza Category
SELECT pizza_category, SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS PTC
FROM  pizza_sales 
GROUP BY pizza_category;


--% of Sales by Pizza Size
SELECT pizza_size, CAST(SUM (total_price) AS DECIMAL(10,2))AS total_sales,
CAST(SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PTC
FROM  pizza_sales 
GROUP BY Pizza_size
ORDER BY PTC DESC;


-- Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;


-- Bottom 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC;




--Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC;


-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC;


--Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC;


-- Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC;
