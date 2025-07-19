-- Top 5 customers by total spending

SELECT customers.CustomerID,
	   customers.CompanyName,
	   SUM(UnitPrice * Quantity * (1 - Discount)) AS revenue
FROM 'Order details' AS details
JOIN Orders AS orders
	ON orders.OrderId = details.OrderID
JOIN Customers AS customers
	ON customers.CustomerID = orders.CustomerID
GROUP BY customers.CustomerID, customers.CompanyName
ORDER BY revenue DESC
LIMIT 5

-- Number of customers by country

SELECT Country,
	   COUNT(DISTINCT CustomerID) AS 'Number of Customers'
	FROM Customers
WHERE Country IS NOT NULL	
GROUP BY Country
ORDER BY "Number of Customers" DESC

--Average order count per customer

SELECT ROUND(AVG(order_count), 2) AS "Average Orders Per Customer"
	FROM(
SELECT CustomerID,
	   COUNT(DISTINCT OrderID) AS order_count
	FROM Orders
GROUP BY CustomerID)

-- Percentage of customers placed more than 1 order

SELECT 
	100.0 * COUNT(CASE WHEN order_count > 1 THEN 1 END) / COUNT(*)
	AS "Percentage of Customers with >1 Order"
FROM
(
SELECT customers.CustomerID,
	   COUNT(DISTINCT orders.OrderID) AS order_count
	FROM Customers customers
	LEFT JOIN Orders orders
	ON orders.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID
ORDER BY order_count DESC
) AS customer_orders


-- Top 3 cities by total sales value

SELECT 	customers.City,
		ROUND(SUM(UnitPrice * Quantity * (1- Discount)),2) AS revenue
	FROM "Order Details" order_details
	JOIN Orders orders
	ON order_details.OrderID = orders.OrderID
	JOIN Customers AS customers
	ON customers.CustomerID = orders.CustomerID
GROUP BY customers.City
ORDER BY revenue DESC
LIMIT 3