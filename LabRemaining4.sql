use AdventureWorks2019

select O1.SalesOrderID,P.FirstName,O1.OrderDate from Sales.SalesOrderHeader O1 INNER JOIN Sales.SalesOrderHeader O2 ON O1.SalesOrderID=O2.SalesOrderID
INNER JOIN Person.Person P ON O2.CustomerID=P.BusinessEntityID
where YEAR(O1.OrderDate)=2013 and not YEAR(O2.OrderDate)=2014

select * from Sales.SalesOrderHeader

