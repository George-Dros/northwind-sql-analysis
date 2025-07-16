-- Total Sales Per month

SELECT
	strftime('%m', orders.OrderDate) AS month,
	SUM(UnitPrice * Quantity * (1 - Discount)) AS revenue
	FROM "Order Details" order_details
	JOIN Orders orders
	ON order_details.OrderID = orders.OrderID
GROUP BY month
ORDER BY revenue DESC

-- Average order value per month

SELECT month,
	   ROUND(AVG(revenue), 2) AS avg_order_value
FROM
(
SELECT orders.OrderID,
	strftime('%m', orders.OrderDate) AS month,
	SUM(UnitPrice * Quantity * (1 - Discount)) AS revenue
	FROM "Order Details" order_details
	JOIN Orders orders
	ON order_details.OrderID = orders.OrderID
GROUP BY orders.OrderID
)
GROUP BY month

-- Month with the highest number of orders

SELECT
  strftime('%m', OrderDate) AS month,
  COUNT(OrderID) AS orders_number
FROM Orders
GROUP BY month
ORDER BY orders_number DESC
LIMIT 1;


-- Total revenue per year

SELECT
  strftime('%Y', OrderDate) AS year,
  ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 2) AS revenue
	FROM "Order Details" order_details
	JOIN Orders orders
	ON order_details.OrderID = orders.OrderID
GROUP BY year
ORDER BY revenue DESC


-- Average order value across all orders

SELECT ROUND(AVG(order_value), 2) AS avg_value_of_all_orders
FROM
(
SELECT orders.OrderID,
  ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 2) AS order_value
	FROM "Order Details" order_details
	JOIN Orders orders
	ON order_details.OrderID = orders.OrderID
GROUP BY orders.OrderID
)
