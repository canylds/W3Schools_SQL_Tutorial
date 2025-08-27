SELECT *
FROM Customers
WHERE Country = 'Mexico';

SELECT CompanyName, City
FROM Customers
WHERE Country = 'Mexico';

SELECT *
FROM Customers
WHERE CustomerID = 'ANTON';

SELECT *
FROM Products
WHERE UnitsInStock BETWEEN 10 AND 20;

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitsInStock <> 0;

SELECT *
FROM Customers
WHERE City LIKE 's%';

SELECT CompanyName, City, Country
FROM Customers
WHERE City IN ('Berlin', 'Madrid', 'London')
ORDER BY City;