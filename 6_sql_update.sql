UPDATE Customers
SET ContactName = 'John Doe', City = 'Manchester'
WHERE CustomerID = 'ISLAT';

SELECT *
FROM Customers
WHERE Country = 'UK';

UPDATE Customers
SET City = 'London'
WHERE Country = 'UK';