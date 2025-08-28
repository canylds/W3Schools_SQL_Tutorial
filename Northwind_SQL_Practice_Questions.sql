-- Northwind SQL Practice Questions


-- 1. Her müşterinin toplam sipariş sayısını bulun. Toplam sipariş sayısı 5’ten fazla olanları azalan sırada listeleyin.

SELECT c.CompanyName, COUNT(o.OrderID) AS TotalOrders
FROM Customers AS c
    JOIN Orders As o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING COUNT(o.OrderID) > 5
ORDER BY TotalOrders DESC;


-- 2. Her kategori için toplam stok miktarını ve ortalama fiyatı bulun. Ortalama fiyatı 20’den yüksek olan kategorileri azalan sırada gösterin.

SELECT c.CategoryName, COUNT(p.UnitsInStock) AS TotalStock, AVG(p.UnitPrice) AS AvgPrice
FROM Categories AS c
    JOIN Products As p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
HAVING AVG(p.UnitPrice) > 20
ORDER BY AvgPrice DESC;


/*
3. 1997 yılında sipariş verilen ürünlerin her biri için toplam sipariş miktarını ve toplam satış tutarını bulun; 
ürün fiyatı 20’den fazla olanları filtreleyin ve toplam satış tutarı 500’den fazla olanları azalan sırada listeleyin.
*/

SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Products AS p
    INNER JOIN [Order Details] as od ON p.ProductID = od.ProductID
    INNER JOIN Orders o ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997 AND p.UnitPrice > 20
GROUP BY p.ProductName
HAVING SUM(od.Quantity * od.UnitPrice) > 500
ORDER BY TotalSales DESC;


/*
4. Her tedarikçi için sağladığı ürünlerin ortalama fiyatını ve toplam stok miktarını bulun; 
sadece stok miktarı 50’den fazla olan ürünleri dahil edin ve ortalama fiyatı 15’den yüksek olan tedarikçileri azalan stok miktarına göre listeleyin.
*/

SELECT s.CompanyName, AVG(p.UnitPrice) AS AvgPrice, SUM(p.UnitsInStock) AS TotalStock
FROM Suppliers AS s
    JOIN Products AS p ON s.SupplierID = p.SupplierID
WHERE p.UnitsInStock > 50
GROUP BY s.CompanyName
HAVING AVG(p.UnitPrice) > 15
ORDER BY TotalStock DESC;


/*
Her kategori için 1997 yılında satılan toplam ürün adedini ve toplam satış tutarını bulun; 
sadece ürün fiyatı 10’dan büyük olanları hesaplayın ve toplam ürün adedi 100’den fazla olan kategorileri azalan sırada listeleyin.
*/

SELECT c.CategoryName, SUM(od.Quantity) AS TotalQuantity, SUM(od.Quantity * od.UnitPrice) TotalSales
FROM Categories AS c
    JOIN Products AS p ON c.CategoryID = p.CategoryID
    JOIN [Order Details] AS od ON p.ProductID = od.ProductID
    JOIN Orders AS o ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 1997 AND p.UnitPrice > 10
GROUP BY c.CategoryName
HAVING SUM(od.Quantity) > 100
ORDER By TotalQuantity DESC;