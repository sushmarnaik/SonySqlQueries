--2
select substring('The Lazy Duck',10,13)
select TRIM('    The lazy duck    ')
select reverse('Lazy')
select upper('lazy')
select datalength('The lazy Duck')
select right('the Active duck',15)

--3
use AdventureWorks2019

select AVG(StandardCost),ProductSubcategoryID from Production.Product
group by ProductSubcategoryID

--4 
Select V.CreditRating, P.FirstName+'-High',P.BusinessEntityID,V.Name from Purchasing.Vendor V,Person.Person P where V.CreditRating>1 and P.BusinessEntityID=V.BusinessEntityID

Select V.CreditRating from Purchasing.Vendor V,Person.Person P where V.CreditRating>3 order by CreditRating desc

select V.CreditRating, P.FirstName+'-High',P.BusinessEntityID as Person_BID,V.BusinessEntityID as Vendor_BID,V.Name from Purchasing.Vendor V,Person.BusinessEntity BE,Person.BusinessEntityContact BEC,Person.Person P 
where BE.BusinessEntityID=V.BusinessEntityID and BE.BusinessEntityID=BEC.BusinessEntityID and BEC.PersonID=P.BusinessEntityID and V.CreditRating>1 

--5
use Sonysql

select * from Employee

Alter table Employee
add ManagerId int

update Employee
SET ManagerId=
Department.ManagerId from Department,Employee where Employee.DeptNo=Department.DeptNo

select E.FullName as Employee_Name,E2.ManagerId from Employee E JOIN Employee E2 ON E.EmpNo=E2.EmpNo