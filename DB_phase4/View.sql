use project_manager
go
create view Log_day as
select *
from project_manager.dbo.[Log]
where [Log].date_time<getdate() and [Log].date_time>getdate()-1;
go

create view Task_doing as
select *
from project_manager.dbo.task
where task.start_task_time<GETDATE() and task_condition=1;