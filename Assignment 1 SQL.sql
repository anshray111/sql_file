select ProductID, Name, Color, ListPrice from Production.Product

select ProductID, Name, Color, ListPrice from Production.Product where ListPrice <> 0;

select ProductID, Name, Color, ListPrice from Production.Product where Color is null;

select ProductID, Name, Color, ListPrice from Production.Product where Color is not null;

select ProductID, Name, Color, ListPrice from Production.Product where Color is not null and ListPrice > 0;

select Name + ' ' + Color as ConcatenatedCol from Production.Product where Color is not null;

SELECT 'NAME: ' + Name + '  --  COLOR: ' + Color AS Result from Production.Product 
WHERE (Name IN ('LL Crankarm', 'ML Crankarm', 'HL Crankarm', 'Chainring Bolts', 'Chainring Nut', 'Chainring'))
AND (Color IN ('Black', 'Silver'));


select ProductID, Name from Production.Product where ProductID Between 400 and 500;

select ProductID, Name, Color from Production.Product where Color in ('Black', 'Blue');

select * from Production.Product where Name like 'S%';

select Name, ListPrice from Production.Product where Name like 'S%' order by Name;

select Name, ListPrice from Production.Product where Name like 'S%' or Name like 'A%' order by Name;

select * from Production.Product where Name like 'SPO[^K]%' order by Name;

select Distinct Color from Production.Product order by Color Desc;