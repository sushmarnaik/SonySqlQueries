use AdventureWorks2019

--21
select distinct top 25 Name from  Production.Product
select distinct top 25 P.Name from  Production.Product P,Sales.SalesOrderDetail S where S.ProductID=P.ProductID

--20
select top 10 SalesOrderID from Sales.SalesOrderHeader
select SOH.SubTotal/SOD.OrderQty as UNIT_PRICE from Sales.SalesOrderDetail SOD,Sales.SalesOrderHeader SOH where SOD.SalesOrderID= 43702 and SOH.SalesOrderID= 43702

--22
select  COUNT( CustomerID) from Sales.SalesOrderHeader
select  COUNT(distinct CustomerID) from Sales.SalesOrderHeader
select  COUNT( SalesPersonID) from Sales.SalesOrderHeader
select  COUNT(distinct SalesPersonID) from Sales.SalesOrderHeader

--23
select P.FirstName+' '+P.MiddleName+' '+P.LastName from Sales.Customer C,Person.Person P where C.CustomerID=P.BusinessEntityID and P.FirstName IS NOT NULL and P.MiddleName IS NOT NULL and P.LastName IS NOT NULL order by P.FirstName desc
select P.FirstName,P.MiddleName,P.LastName from Sales.Customer C,Person.Person P where C.CustomerID=P.BusinessEntityID and P.FirstName IS NOT NULL order by P.FirstName desc

--26
select distinct YEAR(OrderDate) from Sales.SalesOrderHeader
select * from Sales.SalesOrderHeader where   (DAY(OrderDate)=30 and (MONTH(OrderDate)=04 or MONTH(OrderDate)=06 or MONTH(OrderDate)=09 or MONTH(OrderDate)=11))
or  (DAY(OrderDate)=31 and (MONTH(OrderDate)=01 or MONTH(OrderDate)=03 or MONTH(OrderDate)=05 or MONTH(OrderDate)=07 or MONTH(OrderDate)=08  or MONTH(OrderDate)=10 or MONTH(OrderDate)=12 ))
or (DAY(OrderDate)=29 and MONTH(OrderDate)=02)
or (DAY(OrderDate)=28 and MONTH(OrderDate)=02 and YEAR(OrderDate)=2012)

--27
select distinct P.LastName from Sales.Customer C,Person.Person P where C.CustomerID=P.BusinessEntityID and P.LastName like '%a%a%'

select  * from Sales.SalesOrderHeader where TotalDue IN
(select MAX(TotalDue) from Sales.SalesOrderHeader)

--28
select top 3 (S.TotalDue) from Sales.SalesOrderHeader S where YEAR(OrderDate)=2013
order by S.TotalDue desc

--31
select SalesOrderID,TotalDue,OrderDate from Sales.SalesOrderHeader where YEAR(OrderDate)=2013 and MONTH(OrderDate)=01

--29
select top 1000 S.OrderQty,P.StandardCost, S.OrderQty*P.StandardCost as TOTAL_COST from Sales.SalesOrderDetail S, Production.Product P where P.ProductID=S.ProductID  order by S.OrderQty*P.StandardCost desc
select top 1000 S.OrderQty,S.UnitPrice, S.OrderQty*S.UnitPrice as TOTAL_COST from Sales.SalesOrderDetail S where S.OrderQty*S.UnitPrice>10000 order by S.OrderQty*S.UnitPrice desc


--15
select top 5 OrderQty from Sales.SalesOrderDetail
update Sales.SalesOrderDetail
SET OrderQty=OrderQty*2 where SalesOrderDetailID between 1 and 5
select top 5 OrderQty from Sales.SalesOrderDetail

update Sales.SalesOrderDetail
SET OrderQty=OrderQty/2 where SalesOrderDetailID between 1 and 5

--30
select SubTotal,TotalDue from Sales.SalesOrderHeader group by SubTotal,TotalDue order by SubTotal,TotalDue

select  SubTotal,TotalDue from Sales.SalesOrderHeader group by  rollup (SubTotal,TotalDue) order by TotalDue 

--25
select HireDate from HumanResources.Employee where DATEDIFF(year,hiredate,'20211025')>4
select HireDate from HumanResources.Employee where DATEDIFF(year,hiredate,'20121025')>4

select E.HireDate,P.FirstName from HumanResources.Employee E,Person.Person P where DATEDIFF(year,E.HireDate,'20211025')>4 and P.BusinessEntityID=E.BusinessEntityID
select E.HireDate,P.FirstName from HumanResources.Employee E,Person.Person P where DATEDIFF(year,E.HireDate,'20121025')>4 and P.BusinessEntityID=E.BusinessEntityID


select HireDate from HumanResources.Employee where YEAR(GetDate())-YEAR(HireDate)>4
select HireDate from HumanResources.Employee where 2011-YEAR(HireDate)>4
select COUNT(HireDate) from HumanResources.Employee

--24
select SickLeaveHours+VacationHours from HumanResources.Employee where SickLeaveHours+VacationHours>80
select E.SickLeaveHours+E.VacationHours,P.FirstName from HumanResources.Employee E,Person.Person P where E.SickLeaveHours+E.VacationHours>80 and P.BusinessEntityID=E.BusinessEntityID order by E.SickLeaveHours+E.VacationHours desc