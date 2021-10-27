create database newDb
use NewDb
use Sonysql
drop database newDb

declare @abcd as nvarchar(10)='hie'
set @abcd='hieee'
select @abcd

create table returnTable
(displaystring nvarchar(10))

create table returnTable2
(displaystring nvarchar(10))

insert into returnTable 
VALUES (@abcd)

drop table returnTable

create function Atm2(@choice int,@balance int)
returns table
as
	
	return 
	select * from returnTable

drop function Atm


select * from dbo.Atm(1,2)

insert into returnTable2
select * from dbo.Atm(1,2)

select * from returnTable2

create table ResultInfo
(
DisplayText nvarchar(30),
CurBalance int,
FinalBalance int,
DisplayBal nvarchar(30)
)

drop table ResultInfo

insert into ResultInfo (CurBalance)
VALUES (1000)

create function getBalance(@balance int)
returns nvarchar(30)
as
begin
return 'Balance is '+@balance
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
declare @dispbal nvarchar(30)
declare @disp nvarchar(30)
set @disp=''
 if @choice= 1  
 begin
 set @dispbal=dbo.getBalance(@balance)
 set @disp=dbo.getBalance(@balance)
 end

 if @choice=2
 begin
	 if @balance>=100
		begin
		set @balance=dbo.WithdrawFunc(@balance)
		set @disp='Amount has been withdrawn'
		end
	 else
		set @disp='Insufficient balance'
	 set @dispbal=dbo.getBalance(@balance)
 end

  if @choice= 3 
  begin
	 set @balance=dbo.DepositFunc(@balance)
	 set @disp='Amount has been deposited'
	 set @dispbal=dbo.getBalance(@balance)
	 end
 insert into ResultInfo (DisplayText,FinalBalance,DisplayBal)
 VALUES (@disp,@balance,@dispbal)
return @balance
end

drop function Atm

Select dbo.Atm(2,1000)

select * from ResultInfo

