use Sonysql2


--3
select * from Employee where EmpAddress='Bangalore'
select * from Employee where EmpAge>60

begin try
begin tran
use Sonysql
update Employee
SET EmpAddress='Mumbai'
where EmpAddress='Bangalore'
end try
begin catch
print error_number()
print('Sorry this update operation failed')
end catch

select * from Employee where EmpAddress='Mumbai'
select * from Employee where EmpAddress='Bangalore'

--4
rollback

select * from Employee where EmpAddress='Mumbai'
select * from Employee where EmpAddress='Bangalore'

--5
commit tran




select * from Employee
select * from Employee where EmpAge>60

begin try
begin tran
use Sonysql
delete from Employee
where EmpAge>60
end try
begin catch
print error_number()
print('Sorry this update operation was not successful')
end catch


select * from Employee
select * from Employee where EmpAge>60

rollback

select * from Employee
select * from Employee where EmpAge>60

commit tran

select * from Employee
select * from Employee where EmpAge>60

--6
begin tran
use Sonysql
delete from Employee
where EmpAge>60
save tran tr1
update Employee
SET EmpAddress='Delhi'
where EmpAddress='Udupi'
save tran tr2


rollback tran tr1

select * from Employee where EmpAddress='Udupi'
select * from Employee where EmpAddress='Delhi'

--1


create trigger trig_emp_ins
on Department
after delete
as
begin
insert into NewDepartment
select * from deleted d   
end

insert into Department (DeptName)
Values ('Learning and development')

