select count(ProductID) from Production.Product;

select count(*) from Production.Product where ProductSubcategoryID IS NOT NULL;

select ProductSubcategoryID, count(*) as CountedProducts from Production.Product group by ProductSubcategoryID;

select ProductSubcategoryID, count(*) as CountedProducts from Production.Product where ProductSubcategoryID IS NULL group by ProductSubcategoryID;

select sum(Quantity) as TotalProductQuantity from Production.ProductInventory;

select * from (
select ProductID, sum(Quantity) as TotalSumOfProducts from Production.ProductInventory where LocationID = 40 group by ProductID)
innerTable where innerTable.TotalSumOfProducts < 100;

select avg(Quantity) as AverageQuantity from Production.ProductInventory where LocationID = 10;

select ProductID, Shelf, avg(Quantity) as TheAvg from Production.ProductInventory group by ProductID, Shelf;

select ProductID, Shelf, avg(Quantity) as TheAvg from Production.ProductInventory where Shelf != 'N/A' group by ProductID, Shelf;

select Color, Class, count(*) as TheCount, avg(ListPrice) as AvgPrice from Production.Product group by Color, Class;

select c.Name as Country, s.Name as Province from Person.CountryRegion c join Person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode;

select c.Name as Country, s.Name as Province from Person.CountryRegion c join Person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode where c.Name = 'Canada' or c.Name = 'Germany';

select distinct p.ProductName from NORTHWND.dbo.[Order Details] od join NORTHWND.dbo.Orders o on o.OrderID = od.OrderID join NORTHWND.dbo.Products p on p.ProductID = od.ProductID  where (year(o.OrderDate) + 27) >= Year(GETDATE());

select TOP 5 c.PostalCode from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID group by c.PostalCode order by count(c.PostalCode) DESC;

select TOP 5 c.PostalCode from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID where (year(o.OrderDate) + 27) >= Year(GETDATE()) group by c.PostalCode order by count(c.PostalCode) DESC;

select City, count(CustomerID) as NoOfCustomers from NORTHWND.dbo.Customers group by City;

select City, count(CustomerID) as NoOfCustomers from NORTHWND.dbo.Customers group by City having count(CustomerID) > 2;

select distinct c.ContactName from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID where o.OrderDate > CAST('1998-01-01' AS DATE)

select tempD.ContactName, max(tempD.OrderDate) as MostRecentOrderDates from (select c.ContactName, o.OrderDate from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID)
as tempD group by tempD.ContactName;

select c.ContactName, count(od.ProductID) as ProductCount from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID join NORTHWND.dbo.[Order Details] od on od.OrderID = o.OrderID group by c.ContactName;

select c.CustomerID, count(od.ProductID) as ProductCount from NORTHWND.dbo.Customers c join NORTHWND.dbo.Orders o on c.CustomerID = o.CustomerID join NORTHWND.dbo.[Order Details] od on od.OrderID = o.OrderID group by c.CustomerID having count(od.ProductID) > 100;

select s.CompanyName as [Supplier Company Name], sh.CompanyName AS [Shipping Company Name]
from NORTHWND.dbo.Suppliers s
join NORTHWND.dbo.Products p ON s.SupplierID = p.SupplierID
join NORTHWND.dbo.[Order Details] od ON p.ProductID = od.ProductID
join NORTHWND.dbo.Orders o ON od.OrderID = o.OrderID
join NORTHWND.dbo.Shippers sh ON o.ShipVia = sh.ShipperID
GROUP BY s.CompanyName, sh.CompanyName;

select o.OrderDate, p.ProductName from NORTHWND.dbo.Products p join NORTHWND.dbo.[Order Details] od on p.ProductID = od.ProductID join NORTHWND.dbo.Orders o on o.OrderID = od.OrderID group by o.OrderDate, p.ProductName;

select e1.FirstName as FirstNameFromPair, e2.FirstName as SecondNameFromPair from NORTHWND.dbo.Employees e1 join NORTHWND.dbo.Employees e2 on e1.Title = e2.Title and e1.EmployeeID != e2.EmployeeID;

select Distinct m.FirstName from NORTHWND.dbo.Employees e join NORTHWND.dbo.Employees m on m.EmployeeID = e.ReportsTo;

SELECT c.City, c.CompanyName AS Name, c.ContactName, 'Customer' AS Type FROM NORTHWND.dbo.Customers c

UNION ALL

SELECT s.City, s.CompanyName AS Name, s.ContactName, 'Supplier' AS Type FROM NORTHWND.dbo.Suppliers s ORDER BY City, Name;


