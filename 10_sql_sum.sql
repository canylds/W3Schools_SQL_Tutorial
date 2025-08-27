SELECT SUM(Quantity)
FROM [Order Details];

SELECT SUM(Quantity)
FROM [Order Details]
WHERE ProductID = 11;

SELECT SUM(Quantity) AS total
FROM [Order Details];

SELECT OrderID, SUM(Quantity) AS [Total Quantity]
FROM [Order Details]
GROUP BY OrderID;

SELECT SUM(Quantity * 10)
FROM [Order Details];

SELECT SUM(Quantity * UnitPrice)
FROM [Order Details];

SELECT AVG(UnitPrice)
FROM Products;

SELECT AVG(UnitPrice)
FROM Products
WHERE CategoryID = 1;

SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice)
FROM Products);

SELECT AVG(UnitPrice) AS AveragePrice, CategoryID
FROM Products
GROUP BY CategoryID;