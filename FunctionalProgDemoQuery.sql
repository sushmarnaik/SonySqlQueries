use Demo

declare @age int
set @age=10

use AdventureWorks2019
select emptype=
case 
when Rate>=35 then 'Senior Executive'
when Rate>=50 then 'Top Executive'
when Rate>=10 then 'Chief Executive'
else 'Trainee'
end
from HumanResources.EmployeePayHistory

create function fetcgemp(@id int)
returns datetime
as
begin
declare @latestdate datetime
select @latestdate=max(hiredate)
from HumanResources.Employee
where BusinessEntityID=@id
return @latestdate
end

select dbo.fetcgemp(1)

drop function fetcgemp

alter function fetcgemp()
returns int
as
begin
declare @bid int
select @bid=max(businessentityid)
from HumanResources.Employee
return @bid
end

select dbo.fetcgemp()

create function fetchemp(@id int)
returns datetime
as
begin
declare @latestdate datetime
select @latestdate=max(hiredate)
from HumanResources.Employee
where BusinessEntityID=@id
return @latestdate
end

select fetchemp(1)