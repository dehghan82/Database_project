use project_manager;
--update Employee set firstname='jack' where Personal_ID=100;
--update project set title='Computer Architecture' where ID=600;

--delete from Employee where Personal_ID=120;
--delete from project where ID=900;
--go
--create function overtime_salary_func
--( @hour int)
--returns int

--begin
--	declare @result int
--	set @result=@hour * 100000
--	return @result
--end;
--go
--print dbo.overtime_salary_func(5);
--go
--create function total_salary
--(@fixed int,
--@added int)
--returns int
--begin
--	declare @result int
--	set @result=@fixed+@added
--	return @result
--end;
--go
--print dbo.total_salary(5,10);