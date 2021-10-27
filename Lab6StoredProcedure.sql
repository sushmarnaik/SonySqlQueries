use AdventureWorks2019


--9
create proc usp_displayCust
@sdate datetime,
@edate datetime
as
begin
select P.FirstName,C.CustomerID,COUNT(O.SalesOrderID) as 'No of Orders',MIN(O.OrderDate) as 'first order date',MAX(O.OrderDate) as 'last order date' 
from Sales.Customer C,Sales.SalesOrderHeader O,Person.Person P 
where C.CustomerID=O.CustomerID and O.OrderDate between @sdate and @edate and P.BusinessEntityID=C.CustomerID
group by C.CustomerID,P.FirstName
end

exec dbo.usp_displayCust '01-02-2013', '01-02-2014'


drop proc usp_displayCust

select P.FirstName,C.CustomerID,COUNT(O.SalesOrderID),MIN(O.OrderDate),MAX(O.OrderDate) as 'No of Orders' from Sales.Customer C,Sales.SalesOrderHeader O,Person.Person P 
where C.CustomerID=O.CustomerID and O.OrderDate between '01-02-2013' and '01-12-2013' and P.BusinessEntityID=C.CustomerID
group by C.CustomerID,P.FirstName

--10

create table WeekdayTable
(
	Wid int identity(1,1),
	WeekDayName nvarchar(10)
)

insert into WeekdayTable(WeekDayName)
VALUES ('Monday'),('Tuesday'),('Wednesday'),('Thursday'),('Friday'),('Saturday'),('Sunday')

create proc usp_getWeekday
@choice int
as
begin
select WeekdayName from  WeekdayTable where Wid=@choice
end

exec dbo.usp_getWeekday 3


create proc usp_getWeekday2
@choice int
as
begin
set @choice=@choice+1
declare @text nvarchar(10)
set @text=@choice+'-10-2021'
declare @fulldate date
set @fulldate=@text
select DATENAME(DW,@fulldate)
end

exec dbo.usp_getWeekday2 3

drop proc usp_getWeekday2


--13
create proc usp_Largest
@n1 int,
@n2 int,
@n3 int,
@disp int out
as
begin
print 'Greatest number is '
if @n1>@n2 and @n1>@n3
set @disp= @n1

if @n2>@n1 and @n2>@n3
set @disp= @n2

if @n3>@n1 and @n3>@n2
set @disp= @n3
end

declare @res int
exec dbo.usp_Largest 1,5,3, @res out
print @res

drop proc usp_Largest

