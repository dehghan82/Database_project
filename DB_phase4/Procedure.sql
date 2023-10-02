

CREATE OR ALTER PROCEDURE Get_Task_ID_project @Project_ID int
AS
begin
select task.ID
from  project_manager.dbo.task
where task.Project_id=@Project_ID
end
GO
 

 CREATE OR ALTER PROCEDURE Get_SubTask_ID_project @Project_ID int
AS
begin
select *
from project_manager.dbo.SubTask
where Task_ID in (select task.ID
						  from project_manager.dbo.task
                          where task.Project_id=@Project_ID);
end
GO
