create table ID_numbers(
ID int)

declare @ID_counter int = 1
while @ID_counter <= 10
begin
	insert into ID_numbers
		values(@ID_counter)
	set @ID_counter = @ID_counter + 1
end

select A.ID as all_IDs , B.ID as Employee_IDs
from ID_numbers as A left join Employee as B
on A.ID = B.ID 

select A.ID as all_IDs , B.ID as Unused_IDs
from ID_numbers as A left join Employee as B
on A.ID = B.ID 
where B.ID is null
