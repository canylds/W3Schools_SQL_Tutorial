SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%';

SELECT *
FROM Customers
WHERE CompanyName LIKE 'b_n_ap__';

SELECT CompanyName
FROM Customers;

SELECT *
FROM Customers
WHERE City LIKE '%l%';

SELECT *
FROM Customers
WHERE CompanyName LIKE 'la%';

SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%' OR CompanyName LIKE 'b%';

SELECT *
FROM Customers
WHERE CompanyName LIKE '%a';

SELECT *
FROM Customers
WHERE CompanyName LIKE 'b%s';

SELECT *
FROM Customers
WHERE CompanyName LIKE '%or%';

-- Return all customers that starts with "a" and are at least 3 characters in length:
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a__%';

-- Return all customers that have "r" in the second position:
SELECT *
FROM Customers
WHERE CompanyName LIKE '_r%';

-- Return all customers starting with either "b", "s", or "p":
SELECT *
FROM Customers
WHERE CompanyName LIKE '[bsp]%';

-- Return all customers starting with "a", "b", "c", "d", "e" or "f":
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-f]%';