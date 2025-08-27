/*
Here are the different types of the JOINs in SQL:

(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
*/

SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


-- INNER JOIN

SELECT ProductID, ProductName, CategoryName
FROM Products
    INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
    INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

/*
JOIN and INNER JOIN will return the same result.

INNER is the default join type for JOIN, so when you write JOIN the parser actually writes INNER JOIN.
*/

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
    JOIN Categories ON Products.CategoryID = Categories.CategoryID;

SELECT Orders.OrderID, Customers.CompanyName, Employees.LastName
FROM ((Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
    INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID);


-- LEFT JOIN

SELECT Customers.CompanyName, Orders.OrderID
FROM Customers
    LEFT JOIN Orders ON Customers.CustomerID = orders.CustomerID
ORDER BY Customers.CompanyName;


-- RIGHT JOIN

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
    RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER By Orders.OrderID;


-- FULL JOIN

SELECT Customers.CompanyName, Orders.OrderID
FROM Customers
    FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CompanyName;


-- SELF JOIN

-- A self join is a regular join, but the table is joined with itself.

SELECT A.CompanyName AS CompanyName1, B.CompanyName AS CompanyName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
    AND A.City = B.City
ORDER BY A.City;


-- JOIN EXAMPLES

-- INNER JOIN

-- Hangi personel hangi satışları yapmıştır?
SELECT *
FROM Employees INNER JOIN Orders ON Employees.EmployeeID = orders.EmployeeID;

-- Hangi ürün hangi kategoride?
SELECT *
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- Beverages kategorisindeki ürünler
SELECT *
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Beverages';

-- Beverages kategorisindeki ürünlerin sayısı kaçtır?
SELECT COUNT(p.ProductName)
FROM Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages';

-- Hangi satışı hangi çalışanım yapmış?
SELECT o.OrderID, e.FirstName + ' ' + e.LastName
FROM Orders AS o
    INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID;

-- Faks numarası null olmayan tedarikçilerden alınmış ürünleri getir
SELECT p.ProductName
FROM Products p
    INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.Fax IS NOT NULL;

SELECT p.ProductName
FROM Products p
    INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.Fax <> 'NULL';

-- 1997 yılından sonra Nancy'nin satış yaptığı firmaların isimleri (1977 dahil)
SELECT e.FirstName, c.CompanyName
FROM Customers AS c
    INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
    INNER JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
WHERE e.FirstName = 'Nancy' AND YEAR(o.OrderDate) >= 1997;

-- Limited olan tedarikçilerden alınmış, seafood kategorisindeki ürünlerin toplam satış tutarı
SELECT SUM(p.UnitPrice * p.UnitsInStock)
FROM Products AS p
    INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
WHERE s.CompanyName LIKE '%Ltd.%' AND c.CategoryName = 'Seafood';

-- Personellerin bağlı olarak çalıştığı kişileri listele
SELECT e1.EmployeeID AS EmployeeID, e1.FirstName AS "e1.FirstName", e2.EmployeeID AS ReportsTo, e2.FirstName AS "e2.FirstName"
FROM Employees AS e1 INNER JOIN Employees AS e2 ON e1.ReportsTo = e2.EmployeeID;

-- Hangi personel toplam kaç adet satış yapmış? Satış adedi 100'den fazla olanlar ve personelin adının baş harfi M olan kayıtlar gelsin.
SELECT e.FirstName + ' ' + e.LastName , COUNT(o.OrderID)
FROM Employees AS e INNER JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
WHERE e.FirstName LIKE 'M%'
GROUP BY e.FirstName + ' ' + e.LastName
HAVING COUNT(o.OrderID) > 100;

-- Seafood kategorisindeki ürünlerin sayısı
SELECT Categories.CategoryID, COUNT(*)
FROM Products INNER JOIN Categories ON products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Seafood'
GROUP BY Categories.CategoryID;

-- En çok satış yapan personelim?
SELECT TOP 1
    e.FirstName + ' ' + e.LastName, COUNT(o.OrderID)
FROM Employees AS e INNER JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName + ' ' + e.LastName
ORDER BY COUNT(o.OrderID) DESC

-- Adında a harfi olan personellerin satış id'si 10500'den büyük olan satışların toplam tutarını ve bu satışların hangi tarihte gerçekleştiğini listele.
SELECT o.OrderDate, SUM(od.UnitPrice * od.Quantity)
FROM Orders AS o
    INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
    INNER JOIN Employees As e ON o.EmployeeID = e.EmployeeID
WHERE e.FirstName LIKE '%a%' AND o.OrderID > 10500
GROUP BY o.OrderDate