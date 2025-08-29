-- The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:

SELECT CompanyName
FROM Suppliers
WHERE EXISTS (SELECT ProductName
FROM Products
WHERE Products.SupplierID = Suppliers.SupplierID AND UnitPrice < 20);


-- SQL ANY and ALL Operators

/*
The following SQL statement lists the ProductName 
if it finds ANY records in the OrderDetails table has Quantity equal to 10 
(this will return TRUE because the Quantity column has some values of 10):
*/

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID
FROM [Order Details]
WHERE Quantity = 10);


SELECT DISTINCT p.ProductName
FROM Products p
    JOIN [Order Details] od
    ON p.ProductID = od.ProductID
WHERE od.Quantity = 10;


/*
The following SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. 
This will of course return FALSE because the Quantity column has many different values (not only the value of 10):
*/

SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID
FROM [Order Details]
WHERE Quantity = 10);