SELECT *
FROM Customers
ORDER BY CustomerID;

SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

SELECT *
FROM Products
ORDER BY ProductName DESC;

SELECT CompanyName, City
FROM Customers
ORDER BY City DESC, CompanyName;

SELECT *
FROM Customers
WHERE Country = 'Spain' AND CompanyName LIKE 'G%';

SELECT *
FROM Customers
WHERE Country = 'Spain' AND (CompanyName LIKE 'G%' OR CompanyName LIKE 'R%');

SELECT *
FROM Customers
WHERE Country = 'Spain' AND CompanyName LIKE 'G%' OR CompanyName LIKE 'R%';

SELECT *
FROM Customers
WHERE NOT Country = 'Spain';

SELECT *
FROM Customers
WHERE CompanyName NOT LIKE 'a%';

SELECT *
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 100;

SELECT *
FROM Customers
WHERE Country NOT IN ('Mexico', 'Spain', 'Brazil', 'UK');

SELECT *
FROM Products
WHERE NOT UnitPrice < 100;