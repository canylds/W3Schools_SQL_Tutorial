SELECT *
FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT *
FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT *
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
FROM Orders);

SELECT *
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID
FROM Orders);

SELECT *
FROM Customers;

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20 AND CategoryID IN (1, 2, 3);

-- The following SQL statement selects all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni:
SELECT *
FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT *
FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT CustomerID AS ID
FROM Customers;

SELECT CustomerID ID
FROM Customers;

SELECT ProductName AS [My Great Products]
FROM Products;

SELECT ProductName AS "My Great Products"
FROM Products;

SELECT CompanyName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

SELECT *
FROM Customers AS Persons;

SELECT o.OrderID, o.OrderDate, c.CompanyName
FROM Customers AS c, Orders AS o
WHERE c.CompanyName = 'Around the Horn' AND c.CustomerID = o.CustomerID;

SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName
FROM Customers, Orders
WHERE Customers.CompanyName = 'Around the Horn' AND Customers.CustomerID = Orders.CustomerID;
