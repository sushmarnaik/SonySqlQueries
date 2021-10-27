create database Sonysql2


use Sonysql2

create table Employee
(
EmpNo int identity(1,1),
FName nchar(20),
LName nchar(20),
FullName as TRIM(FName)+' '+TRIM(LName),
EmpAge int,
EmpAddress nchar(30),
Salary int,
DeptNo int ,
EmpPhone int,
constraint  pk_EmpNo PRIMARY KEY(EmpNo),
constraint checkAge check(EmpAge>18)
)


insert into Employee(FName,LName,EmpAge,EmpAddress,Salary,EmpPhone)
Values ('Sushma','Naik',21,'Udupi',50000,987654321), 
('Rama','N',22,'Mangalore',60000,987654322),
('Ziya','H',21,'Bangalore',40000,987654323),
('Stephen','Johnson',60,'Mysore',200000,987654324),
('Ashley','Anderson',27,'Shimoga',90000,987654325),
('Barak','Obama',59,'Chikmagalur',130000,987654326)

insert into Employee(FName,LName,EmpAge,EmpAddress,Salary)
Values
('Barak','Obama',13,'Chikmagalur',130000)


--constraint fk_DeptNo FOREIGN KEY (DeptNo) References Department(DeptNo),

create table Department
(
DeptNo int identity(100,1),
DeptName nchar(20),
EmpCount int,
ManagerName nchar(20),
ManagerId int,
constraint pk_DeptNo PRIMARY KEY (DeptNo),
constraint fk_ManagerId FOREIGN KEY (ManagerId) References Employee(EmpNo),
constraint uniqueMgrId unique (ManagerId)
)


insert into Department (DeptName,EmpCount,ManagerId)
Values ('Software',1000,2),
('IT',200,3),
('HR',150,5),
('Security',150,1),
('Admin',100,6)

update Department 
SET ManagerName=Employee.FName
from Employee where Employee.Empno=Department.ManagerId

alter table Employee
add constraint fk_DeptNo FOREIGN KEY (DeptNo) References Department(DeptNo)

update Employee
SET DeptNo=Department.DeptNo
from Department where Department.ManagerId=Employee.EmpNo

update Employee
SET DeptNo=101 where EmpNo=4

select * from Employee 
select * from Department
select * from Employee where DeptNo=101

alter table Employee
drop constraint fk_DeptNo

alter table Department
drop constraint fk_ManagerId

Drop table Employee
Drop table Department


Select FullName, EmpAddress  INTO #TempEmp from Employee
Select * from #TempEmp

drop table TempEmp

--Select DeptNo, DeptName, ManagerName  INTO NewDepartment from Department
--Select * from NewDepartment

--drop table NewDepartment

select * from Employee
where FName = 'Ziya'

alter table Employee
add constraint def_Address
default 'Bangalore' for EmpAddress

alter table Employee
drop constraint def_Address

alter table Employee
add constraint def_Phone
default 91000 for EmpPhone

alter table Employee
drop constraint def_Phone

insert into Employee(FName,LName,EmpAge,Salary)
Values ('Sushma','Naik',21,50000)

select * from Employee

create default defPhone2 as 9100

exec sp_bindefault defPhone2 , 'Employee.EmpPhone'
exec sp_unbindefault defPhone2 , 'Employee.EmpPhone'

create default def_Address2 as 'Bangalore'

exec sp_bindefault def_Address2 , 'Employee.EmpAddress'
exec sp_unbindefault def_Address2 , 'Employee.EmpAddress'

update Employee
SET Fname='Suma' where EmpNo=1
select * from Employee

update Department 
SET EmpCount=160 where DeptNo=104
select * from Department


create table NewDepartment
(
DeptNo int  ,
DeptName nchar(20),
EmpCount int,
ManagerName nchar(20),
ManagerId int,
)


Insert INTO NewDepartment(DeptNo,DeptName,EmpCount,ManagerName,ManagerId)
Select DeptNo,DeptName,EmpCount,ManagerName,ManagerId from Department
select * from NewDepartment
--Select DeptNo,DeptName,EmpCount,ManagerName,ManagerId from Department


delete Employee where EmpAge>59
select * from Employee

Alter table Employee
Add EmpGender nchar(1)

create rule gender_rule as @rulgender in ('F','M','O')

exec sp_bindrule gender_rule , 'Employee.EmpGender'

insert into Employee(EmpGender)
Values ('Z')

insert into Employee(FName,LName,EmpAge,Salary,DeptNo)
Values ('Sujay','R',61,90000,103)

insert into Employee(FName,LName,EmpAge,Salary,DeptNo)
Values ('Suraj','H',63,90000,104)

select * from Employee