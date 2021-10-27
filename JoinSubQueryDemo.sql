use AdventureWorks2019

--sub queries

select * from Production.Product
select * from Production.ProductCategory
select * from Production.ProductSubcategory

select ProductCategoryID,Name
from Production.ProductCategory
where ProductCategoryID in
(select ProductCategoryID from Production.ProductCategory
where name='Bikes'
)

select name  from Production.ProductCategory
--corelated subqueries

--join

