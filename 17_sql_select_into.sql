-- The following SQL statement creates a backup copy of Customers:

SELECT *
INTO CustomersBackup2025
FROM Customers;


SELECT CompanyName, ContactName
INTO CustomersBackup2025_2
FROM Customers;

SELECT *
INTO CustomersBackup2025_3
FROM Customers
WHERE Country = 'Germany';

SELECT Customers.CompanyName, Orders.OrderID
INTO CustomersOrderBackup2025
FROM Customers
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


-- SQL INSERT INTO SELECT Statement

INSERT INTO Customers
    (CompanyName, City, Country)
SELECT CompanyName, City, Country
FROM Suppliers;

INSERT INTO Customers
    (CompanyName, ContactName, Address, City, PostalCode, Country)
SELECT CompanyName, ContactName, Address, City, PostalCode, Country
FROM Suppliers;

INSERT INTO Customers
    (CompanyName, City, Country)
SELECT CompanyName, City, Country
FROM Suppliers
WHERE Country='Germany';