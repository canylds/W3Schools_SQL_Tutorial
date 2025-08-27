/*
If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. 
However, make sure the order of the values is in the same order as the columns in the table. 
Here, the INSERT INTO syntax would be as follows:

INSERT INTO table_name
VALUES (value1, value2, value3, ...);
*/

INSERT INTO Products
    (ProductName, UnitPrice, UnitsInStock)
VALUES
    ('A Product', 10.50, 10)

SELECT ProductID, UnitPrice, UnitsInStock
FROM Products
WHERE ProductName = 'A Product';

-- DELETE From Products WHERE ProductID = 1079;

INSERT INTO Products
    (ProductName, UnitPrice, UnitsInStock)
VALUES
    ('Product 1', 50.50, 20),
    ('Product 2', 20.25, 40);

SELECT *
FROM Products;

SELECT *
FROM Customers
WHERE Region IS NOT NULL;