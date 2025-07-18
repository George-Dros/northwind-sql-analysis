-- Top 10 Products.

SELECT  order_details.ProductId,
		products.ProductName,
		SUM(order_details.UnitPrice * order_details.Quantity * (1 - order_details.Discount)) AS revenue
	FROM "Order Details" order_details
	JOIN Products products
	ON order_details.ProductID = products.ProductID
GROUP BY products.ProductName
Order BY revenue DESC
LIMIT 10

-- Top 3 categories by revenue.

SELECT categories.CategoryName,
		ROUND(SUM(order_details.UnitPrice  * order_details.Quantity * (1 - order_details.Discount)), 2) AS revenue
	FROM Products products
	JOIN "Order Details" order_details
	ON products.ProductID = order_details.ProductID
	JOIN Categories categories
	ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryName
ORDER BY revenue DESC
LIMIT 3

-- Average unit price per category.

SELECT categories.CategoryName,
	   ROUND(AVG(UnitPrice), 2) AS avg_unit_price 
	FROM Products products
	JOIN Categories categories
	ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryName

-- Products that sold the highest total quantity.

SELECT  products.ProductName,
		SUM(order_details.Quantity) AS Total_Quantity_Sold
	FROM "Order Details" order_details
	JOIN Products products
	ON order_details.ProductID = products.ProductID
GROUP BY products.ProductName 
ORDER BY Total_Quantity_Sold DESC

-- Products that sold less than 5 units in total

SELECT  products.ProductName,
		SUM(order_details.Quantity) AS Total_Quantity_Sold
	FROM "Order Details" order_details
	JOIN Products products
	ON order_details.ProductID = products.ProductID
GROUP BY products.ProductName 
HAVING SUM(order_details.Quantity) < 5
ORDER BY Total_Quantity_Sold DESC
