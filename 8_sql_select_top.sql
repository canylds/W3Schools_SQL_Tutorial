SELECT TOP 3
    *
FROM Customers;

SELECT COUNT(*)
FROM Customers;

SELECT TOP 50 PERCENT
    *
FROM Customers;

SELECT TOP 3
    *
FROM Customers
WHERE Country = 'UK'
ORDER BY CompanyName DESC;