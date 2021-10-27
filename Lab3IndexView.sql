
--view

create view EmpDeptView
as Select E.BusinessEntityID,P.FirstName,D.DepartmentID,D.Name,D.GroupName 
from HumanResources.Employee E,HumanResources.Department D,Person.Person P,HumanResources.EmployeeDepartmentHistory EH
where E.BusinessEntityID=P.BusinessEntityID and E.BusinessEntityID=EH.BusinessEntityID and EH.DepartmentID=D.DepartmentID
--order by E.BusinessEntityID 

drop view EmpDeptView

select * from EmpDeptView
select * from HumanResources.Employee

alter view EmpDeptView
as select HireDate from HumanResources.Employee


drop view EmpDeptView

create view EmpDeptView
with encryption 
as select HireDate from HumanResources.Employee

sp_helptext EmpDeptView 
use Sonysql

select * from NewDepartment 
--index



create clustered index nameIndex
on NewDepartment(DeptName)
with pad_index,fillfactor=55

create nonclustered index nameIndex2
on NewDepartment(DeptName)
with pad_index,fillfactor=50

create nonclustered index EmpCountIndex
on NewDepartment(EmpCount)
with pad_index,fillfactor=30


sp_helpindex NewDepartment 