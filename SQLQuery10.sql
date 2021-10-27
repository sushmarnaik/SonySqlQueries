use master

create database Sonysql


use Sonysql

create table Employee
(
Empno int identity(1,1),
FName nchar(20),
LName nchar(20),
FullName as TRIM(FName)+' '+TRIM(LName),
EmpAge int,
EmpAddress nchar(30),
ManagerId int ,
Salary int,
DeptNo int ,
EmpPhone int,
constraint  pk_EmpNo PRIMARY KEY(EmpNo),
constraint checkAge check(EmpAge>18)
)


insert into Employee(FName,LName,EmpAge,EmpAddress,Salary)
Values ('Sushma','Naik',21,'Udupi',50000), 
('Rama','N',22,'Mangalore',60000),
('Ziya','H',21,'Bangalore',40000),
('Stephen','Johnson',60,'Mysore',200000),
('Ashley','Anderson',27,'Shimoga',90000),
('Barak','Obama',59,'Chikmagalur',130000)

insert into Employee(FName,LName,EmpAge,EmpAddress,Salary)
Values
('Barak','Obama',13,'Chikmagalur',130000)


create table Manager
(
ManagerId int identity(991,1) ,
EmpNo int,
ManagerName nchar(20) ,
constraint pk_ManagerId PRIMARY KEY (ManagerId),
constraint fk_EmpNo FOREIGN KEY (EmpNo) References Employee(EmpNo)
)

insert into Manager(EmpNo)
Values (5),
(2),
(3),
(1),
(6)

--insert into Manager(ManagerName)
--select FName from Employee,Manager where Manager.EmpNo=Employee.Empno

Update Manager
SET ManagerName=Employee.FName
from Employee
where Employee.Empno=Manager.EmpNo 

--constraint fk_DeptNo FOREIGN KEY (DeptNo) References Department(DeptNo),

create table Department
(
DeptNo int identity(100,1),
DeptName nchar(20),
EmpCount int,
ManagerName nchar(20),
ManagerId int,
constraint pk_DeptNo PRIMARY KEY (DeptNo),
constraint fk_ManagerId FOREIGN KEY (ManagerId) References Manager(ManagerId),
constraint uniqueMgrId unique (ManagerId)
)


insert into Department (DeptName,EmpCount,ManagerId)
Values ('Software',1000,992),
('IT',200,993),
('HR',150,995),
('Security',150,991),
('Admin',100,994)

update Department 
SET ManagerName=Manager.ManagerName
from Manager where Manager.ManagerId=Department.ManagerId

alter table Employee
add constraint fk_DeptNo FOREIGN KEY (DeptNo) References Department(DeptNo),
constraint fk_ManagerId2 FOREIGN KEY (ManagerId) References Manager(ManagerId)

update Employee
SET ManagerId=Manager.ManagerId
from Manager where Manager.EmpNo=Employee.Empno

update Employee
SET DeptNo=Department.DeptNo
from Department where Department.ManagerId=Employee.ManagerId

update Employee
SET DeptNo=101 where EmpNo=4

select * from Employee 
select * from Manager
select * from Department
select * from Employee where DeptNo=101

Drop table Employee
Drop table Manager
Drop table Department

Select FullName, EmpAddress  INTO TempEmp from Employee
Select * from TempEmp

drop table TempEmp

select * from Employee
where FName = 'Ziya'