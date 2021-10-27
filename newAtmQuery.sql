use Sonysql

create function getBalance(@balance int)
returns nvarchar(30)
as
begin
return 'Your Balance is '+@balance
end

create function WithdrawFunc(@balance int)
returns int
as
begin
	set @balance=@balance-100
	return @balance
end

drop function WithdrawFunc

create function DepositFunc(@balance int)
returns int
as
begin
	set @balance=@balance+100
	return @balance
end

drop function DepositFunc

create function Atm(@choice int, @balance int)
returns int
as
begin
 if @choice=2
 begin
	 if @balance>=100
		begin
		set @balance=dbo.WithdrawFunc(@balance)
		end
 end

  if @choice= 3 
  begin
	 set @balance=dbo.DepositFunc(@balance)
	 end
return @balance
end

drop function Atm

Declare @resBal int
set @resBal=1000
declare @i int
select @i=COUNT(*) from InputValues 
declare @j int
set @j=1
declare @curChoice int

while @i>0
begin
select @curChoice= choice  from InputValues where Cid=@j

select @resBal=dbo.Atm(@curChoice,@resBal)
declare @resText nvarchar(30)
set @resText= 'Your current Balance is '
select @resText,@resBal
set @i=@i-1
set @j=@j+1
end



create table InputValues
(
Cid int identity(1,1),
choice int
)

insert into InputValues
VALUES (1),(2),(2),(2),(1),(3),(3)

drop table InputValues