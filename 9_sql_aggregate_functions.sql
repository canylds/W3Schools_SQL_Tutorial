SELECT MIN(UnitPrice)
FROM Products;

SELECT MAX(UnitPrice)
FROM Products;

SELECT MIN(UnitPrice) AS SmallestPrice
FROM Products;

SELECT MIN(UnitPrice) AS SmallestPrice, CategoryID
FROM Products
GROUP BY CategoryID;

SELECT COUNT(*)
FROM Products;

SELECT COUNT(ProductName)
FROM Products;

SELECT COUNT(QuantityPerUnit)
FROM Products;

SELECT COUNT(ProductID)
FROM Products
WHERE UnitPrice > 20;

SELECT COUNT(UnitPrice)
FROM Products;

SELECT COUNT(DISTINCT UnitPrice)
FROM Products;

SELECT COUNT(*) AS [Number of records]
FROM Products;

SELECT COUNT(*) AS [Number of records], CategoryID
FROM Products
GROUP BY CategoryID;