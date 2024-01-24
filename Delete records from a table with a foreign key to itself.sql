--
create table tbl1(
id int primary key,
parent_id int,
foreign key (parent_id) references tbl1(id)
                  )
  
--
insert into tbl1
values( 1 , null),
      (2 , 1),
      (3 , 2),
      (4 , null),
      (5 , 4)
--
/* If we use this code, the foreign key will be violated
delete from tbl1
where id = 1
*/
--
-- solution:
with tbl_cte as (
  select id from tbl1
  where parent_id is null and id = 1
   union all
  select a.id
  from tbl1 a 
  join tbl_cte b 
  on a.parent_id = b.id
                  )

delete from tbl1
where id in ( select id from tbl_cte) 

