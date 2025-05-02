--1)
select Distinct e.city from Employees e join Customers c on e.City = c.City

--2-a)
select city from Customers EXCEPT select city from Employees

--b) Sub Query
select Distinct city from Customers where city not in (select city from Employees)

--3)
select ProductName, sum(Quantity) as TotalQuantity from Products p join [Order Details] od on p.ProductID = od.ProductID group by ProductName

--4)
select c.city, sum(od.Quantity)as TotalProducts from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on c.CustomerID = o.CustomerID group by c.city


--5)
select * from (select city, count(CustomerID) as totalCount from Customers group by city) as sub where sub.totalCount > 2

--6)
select c.city, count(DISTINCT od.ProductID) as TotalProducts from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on c.CustomerID = o.CustomerID group by c.city having count(DISTINCT od.ProductID) >= 2

--7)
select Distinct c.CustomerID, c.ContactName from Customers c join Orders o on c.CustomerID = o.CustomerID where o.ShipCity != c.City

--8)
select TOP 5 p.ProductName, avg(od.UnitPrice) as UnitPrice, c.City from Products p join [Order Details] od on od.ProductID = p.ProductID join Orders o on od.OrderID = o.OrderID join Customers c on c.CustomerID = o.CustomerID group by p.ProductName, c.city order by count(p.ProductName) DESC

-- 9-a)
Select city from Employees
EXCEPT 
select e.City from Employees e join Orders o on e.EmployeeID = o.EmployeeID join [Order Details] od on od.OrderID = o.OrderID

-- 9-b)
Select Distinct e.City
FROM Employees e
left join Orders o ON e.EmployeeID = o.EmployeeID
left join [Order Details] od ON od.OrderID = o.OrderID
WHERE od.OrderID is null;

--10)



--11) We can use Distinct keyword for the same