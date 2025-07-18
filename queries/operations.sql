-- Employee processed the most orders.

SELECT 
  employees.EmployeeID,
  employees.LastName,
  employees.FirstName,
  COUNT(DISTINCT orders.OrderID) AS orders_processed
FROM Orders orders
JOIN Employees employees
  ON orders.EmployeeID = employees.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY orders_processed DESC;

-- Average number of days between order and shipment.

SELECT
		ROUND(AVG(julianday(ShippedDate) - julianday(OrderDate)), 2) AS avg_shipping_days
		FROM Orders
WHERE ShippedDate IS NOT NULL

-- Shipper that delivered the most orders.

SELECT 
		shippers.CompanyName,
		COUNT(DISTINCT orders.OrderID) number_of_orders
		FROM Orders orders
		JOIN Shippers shippers
		ON orders.ShipVia = shippers.ShipperID
GROUP BY shippers.CompanyName
ORDER BY number_of_orders DESC 		
LIMIT 1

-- Average shipping delay per shipper

SELECT 	shippers.CompanyName,
		ROUND(AVG(julianday(orders.ShippedDate) - julianday(orders.OrderDate)), 2) AS avg_shipping_delay
		FROM Orders orders
		JOIN Shippers shippers
		ON orders.ShipVia = shippers.ShipperID
WHERE orders.ShippedDate IS NOT NULL		
GROUP BY shippers.CompanyName
ORDER BY avg_shipping_delay DESC	

-- Employee that generated the most revenue

SELECT employees.FirstName,
	   employees.LastName,
		ROUND(SUM(order_details.UnitPrice * order_details.Quantity * (1 - order_details.Discount)), 2) AS revenue
		FROM "Order details" order_details
		JOIN Orders orders
		ON order_details.OrderID = orders.OrderID
		JOIN Employees employees
		ON orders.EmployeeID = employees.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY revenue DESC
LIMIT 1