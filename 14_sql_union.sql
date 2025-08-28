-- UNION


    SELECT City
    FROM Customers
UNION
    SELECT City
    FROM Suppliers
ORDER BY City;


-- The following SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table:

    SELECT City, Country
    FROM Customers
    WHERE Country = 'Germany'
UNION
    SELECT City, Country
    FROM Suppliers
    WHERE Country = 'Germany'
ORDER BY City;


-- The following SQL statement lists all customers and suppliers:

    SELECT 'Customer' AS Type, ContactName, City, Country
    From Customers
UNION
    SELECT 'Supplier', ContactName, City, Country
    From Suppliers;


-- The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table:

    SELECT City
    FROM Customers
UNION ALL
    SELECT City
    FROM Suppliers
ORDER BY City;


-- The following SQL statement returns the German cities (duplicate values also) from both the "Customers" and the "Suppliers" table:

    SELECT City, Country
    FROM Customers
    WHERE Country='Germany'
UNION ALL
    SELECT City, Country
    FROM Suppliers
    WHERE Country='Germany'
ORDER BY City;