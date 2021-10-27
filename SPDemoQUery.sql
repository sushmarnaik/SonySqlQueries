use Demo

create proc usp_calculate
@n1 int,
@n2 int,
@result int out
as
--II Create logic
begin
set @result=@n1+@n2
end

--III Execute the SP
declare @res int
exec dbo.usp_calculate 100,300,@res out
select @res as 'Addition'

--ex.2 with tables

create proc 
select * from usp_updateName
@custid int,
@result nvarchar(50) out
as begin
update Cust_order
set CustomerName='newNameFromSP' where custsalesid=@custid
if @@ERROR=0
set @result='Yayyy success customer name updated'
else
set @result='Failed customer anme not updated'
end

--Exec sp
declare @status nvarchar(50)
exec usp_updname 2,@status out
select @status 'zfinal Status'

