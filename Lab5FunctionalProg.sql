
use AdventureWorks2019


--1
--Employee Count function
create function getCount()
returns int
as
begin
declare @EmpCount int
select @EmpCount =
COUNT(E.BusinessEntityID)
from HumanResources.Employee E
return @EmpCount
end

--Calling the function
select dbo.getCount()
--Verifying the count
select COUNT(*) from Sales.Customer

drop function getCount

--Customer Count function
create function getCustCount()
returns int
as
begin
declare @CustCount int
select @CustCount =
COUNT(C.CustomerID)
from Sales.Customer C
return @CustCount
end

select dbo.getCustCount()

select COUNT(*) from Sales.Customer

--creating Vendor count function
create function getVendorCount()
returns int
as
begin
declare @VendorCount int
select @VendorCount =
COUNT(*)
from Purchasing.Vendor V
return @VendorCount
end

select dbo.getVendorCount()

select COUNT(*) from Purchasing.Vendor

drop function getVendorCount
drop function getCustCount




--2

create function getCustCountbyCity(@city nvarchar(60))
returns int
as
begin
declare @CustCount int
select @CustCount =
COUNT(C.CustomerID)
from Sales.Customer C,Person.Address PA,Person.BusinessEntityAddress BEA
where BEA.AddressID=PA.AddressID and BEA.BusinessEntityID=C.CustomerID and PA.City=@city
return @CustCount
end

select dbo.getCustCountbyCity('Seattle')

drop function getCustCountbyCity

declare @cit nvarchar
set @cit='Seattle'
select COUNT(C.customerID) from Sales.Customer C,Person.Address PA,Person.BusinessEntityAddress BEA
where BEA.AddressID=PA.AddressID and BEA.BusinessEntityID=C.CustomerID and PA.City=@cit


--3

create function OrdersbyDate(@sdate datetime,@edate datetime)
returns int
as
begin
declare @OrderCount int
select @OrderCount =
COUNT(*)
from Sales.SalesOrderHeader O
where O.OrderDate Between @sdate and @edate
return @orderCount
end



select dbo.OrdersbyDate('01-03-2013','01-03-2014')

--Verification
select COUNT(*) from  Sales.SalesOrderHeader O
where O.OrderDate Between '01-03-2013' and '01-03-2014'


drop function OrdersbyDate

--4
create function getProductTable()
returns table
as
return 
select P.ProductID,P.Name,P.ProductSubcategoryID,P.StandardCost,P.Color from Production.Product P
where P.ProductSubcategoryID=3

drop function getProductTable

select * from getProductTable()


--5


use Demo

	print 'Welcome to ATM'
	print 'Choose your option'
	print'1. Balance 2. Withdraw 3. Deposit 4. Exit'

create function InsufficientBal()
returns nvarchar (20)
as
begin
	declare @printText nvarchar(20)
	set @printText= 'Insufficient balance'
	return @printText
end

create function Balance()
returns nvarchar (20)
as
begin
	declare @printText nvarchar(20)
	set @printText= 'Insufficient balance'
	return @printText
end



create function Withdraw(@bal int)
returns int
as
begin
if @bal>=100
	begin
		set @bal=@bal-100

	end
else
	 print dbo.InsufficientBal()
	
return @bal
end

create function Atm(@choice int,@balance int)
returns int
as
begin
	if @choice=1
		set @balance=@balance

	if @choice=2 
	begin
		if @balance>=100
			set @balance=@balance-100
			--print 'RS 100 is debited,Your current balance is '+@balance
			--print 'Insufficient balance'
	end


	if @choice = 3 
		set @balance=@balance+100
		--print 'RS 100 is credited,Your current balance is '+@balance
return @balance
end

drop function Atm


declare @bala int=1000
select dbo.Atm(2,@bala)
select dbo.Atm(1,1000)
select dbo.Atm(3,800)
select dbo.Atm(2,1000)

select dbo.Atm(2,@balance)
select @balance

declare @a int =10
set @a=10

declare @b int
set @b=10

drop function ATm