create table MyTable 
(EmployeeNumber int , 
EmployeeName nvarchar(100) , 
Manager int)

insert into MyTable (EmployeeNumber , EmployeeName , Manager) 
values(101 , 'A' , null) , 
(102 , 'B' , 101) ,
(103 , 'C' , 101) ,
(104 , 'D' , 103) ,
(105 , 'E' , 103) ,
(106 , 'F' , 104) ,
(107 , 'G' , 105) ,
(108 , 'H' , 105) ,
(109 , 'I' , 105) ,
(110 , 'J' , 109) ,
(111 , 'K' , 109) ,
(112 , 'L' , 101) ,
(113 , 'M' , 106) ,
(114 , 'N' , 111) ,
(115 , 'O' , 111) ,
(116 , 'P' , 105) ,
(117 , 'Q' , 110) ,
(118 , 'R' , 111) ,
(119 , 'S' , 101) 


with MyCTE as 
(select  EmployeeNumber , EmployeeName , Manager , 0 as OrgLevel from MyTable
where Manager is null
union all 
select MT.EmployeeNumber , MT.EmployeeName , MT.Manager , MC.OrgLevel + 1  from MyTable as MT
join MyCTE as MC
on MT.Manager = MC.EmployeeNumber)

select * from MyCTE