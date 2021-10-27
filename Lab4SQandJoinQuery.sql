use AdventureWorks2019
select * from Sales.SalesOrderHeader O where 

--1
select P.BusinessEntityID,P.FirstName,O1.OrderDate from Person.Person P,Sales.SalesOrderHeader O1
where O1.CustomerID=P.BusinessEntityID and P.BusinessEntityID NOT IN
(
select O.CustomerID from Sales.SalesOrderHeader O where OrderDate<CONVERT(date,'01-05-2013')
)

select O1.CustomerID from Sales.SalesOrderHeader O1 where not OrderDate>CONVERT(date,'01-05-2013') order by O1.CustomerID desc
select O1.CustomerID from Sales.SalesOrderHeader O1,Person.Person P where  OrderDate<CONVERT(date,'01-05-2013') and P.BusinessEntityID=O1.CustomerID order by O1.CustomerID desc

--2
select distinct PA.StateProvinceID,C.CustomerID,P.FirstName from Sales.Customer C, Person.Address PA,Person.Person P,Person.BusinessEntityAddress BEA
where C.CustomerID=BEA.BusinessEntityID and PA.AddressID=BEA.AddressID and C.CustomerID=P.BusinessEntityID 
and PA.StateProvinceID NOT IN
(
select  PA2.StateProvinceID from HumanResources.Employee E,Person.Address PA2,Person.Person P2,Person.BusinessEntityAddress BEA2 
where E.BusinessEntityID=BEA2.BusinessEntityID and PA2.AddressID=BEA2.AddressID
)
order by PA.StateProvinceID

--query for displaying states of employees
select distinct PA.StateProvinceID from HumanResources.Employee E,Person.Address PA,Person.BusinessEntityAddress BEA
where E.BusinessEntityID=BEA.BusinessEntityID and BEA.AddressID=PA.AddressID order by PA.StateProvinceID


select distinct PA.StateProvinceID from HumanResources.Employee E, Person.Address PA,Person.Person P,Person.BusinessEntityAddress BEA
where E.BusinessEntityID=BEA.BusinessEntityID and PA.AddressID=BEA.AddressID 

select StateProvinceID from Person.StateProvince order by StateProvinceID desc

--4
select * from HumanResources.Shift where StartTime='23:00:00'

select P.FirstName,E.BusinessEntityID,E.MaritalStatus,EH1.ShiftID,S.Name ,E.Gender
from HumanResources.Employee E,Person.Person P,HumanResources.EmployeeDepartmentHistory EH1,HumanResources.Shift S 
where E.MaritalStatus='M' and P.BusinessEntityID=E.BusinessEntityID and EH1.BusinessEntityID=E.BusinessEntityID and E.Gender='F' and S.ShiftID=EH1.ShiftID and
E.BusinessEntityID IN
(
select E2.BusinessEntityID from HumanResources.Employee E2,HumanResources.EmployeeDepartmentHistory EH 
where EH.BusinessEntityID=E2.BusinessEntityID and EH.ShiftID=3
)


--5
select Customer.TerritoryID from Sales.Customer
select Name from Person.StateProvince where StateProvinceID=9 

select distinct C.CustomerID,COUNT(C.CustomerID) as NO_OF_ORDERS,PA.StateProvinceID ,St.Name
from  Person.Address PA, Person.BusinessEntityAddress BEA,Sales.SalesOrderDetail OD,Person.StateProvince St, Sales.Customer C JOIN Sales.SalesOrderHeader O 
ON C.CustomerID=O.CustomerID
where PA.StateProvinceID=9 and BEA.BusinessEntityID=C.CustomerID and BEA.AddressID=PA.AddressID and OD.SalesOrderID=O.SalesOrderID and St.StateProvinceID=PA.StateProvinceID 
group by C.CustomerID,PA.StateProvinceID,St.Name
--,SUM(OD.OrderQty) as ORDER_QUANTITY 

select * from Sales.SalesOrderDetail,Sales.SalesOrderHeader where OrderQty>1 and CustomerID=12332

--7
select * from Person.Person P,Purchasing.Vendor V where P.BusinessEntityID=V.BusinessEntityID

select * from Person.PersonPhone P,Purchasing.Vendor V where P.BusinessEntityID=V.BusinessEntityID

Select P.FirstName, Ph.PhoneNumber,V.Name as 'Vendor Business Name' from Person.PersonPhone Ph,Person.BusinessEntityContact BEC,Person.Person P,Person.BusinessEntity BE INNER JOIN Purchasing.Vendor V 
ON V.BusinessEntityID=BE.BusinessEntityID
where BE.BusinessEntityID=BEC.BusinessEntityID and BEC.PersonID=Ph.BusinessEntityID and P.BusinessEntityID=Ph.BusinessEntityID


--8

Select P.ProductID,P.Name,MIN(S.UnitPrice) as 'Minimum unit price' from Production.Product as P JOIN Sales.SalesOrderDetail S 
ON P.ProductID=S.ProductID
group by P.ProductID,P.Name