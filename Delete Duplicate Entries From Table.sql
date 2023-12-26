create table Employee
(ID int primary key identity(1,1),
client_id int ,
name varchar(100) ,
Join_Date datetime )

insert into Employee 
values
(101 , 'Farhad' , '20201211') ,
(202 , 'Reza' , '20210510' ), 
(303 , 'Zahra' , '20180706' ),
(101 , 'Ali' , '20230501' ),
(404 , 'Sara' , '20220314' ),
(404 , 'John' , '20140807' ),
(505 , 'Rafael' , '20230415' ),
(606 , 'Elijah' , '20190216' ) , 
(303 , 'Jacob' , '20201018' ),
(707 , 'Amir' , '20210609' ),
(202 , 'Peter' , '20230215' ),
(202 , 'Lara' , '20230810' )

select * from Employee

select client_id , count(*) from Employee
group by(client_id)

-- Delete duplicate entries from the table for employees who were hired later
with Employee_duplicate as (
select id , client_id , row_number() over( partition by client_id order by join_date) as order_number from Employee) 

delete from Employee
where id in ( select id from Employee_duplicate where order_number > 1) 

select * from Employee



