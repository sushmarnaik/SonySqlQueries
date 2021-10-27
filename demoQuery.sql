use Demo

create rule rul_gender as @rulgender in ('M','F','O')
exec sp_bindrule rul_gender,'Table_1.gender'