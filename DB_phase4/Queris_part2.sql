use project_manager;
----first query
--select Employee.Personal_ID,Employee.ssn,Employee.firstname,Employee.lastname,Employee.gender,Employee.experience,Employee.workarea, COUNT(*) as [count]
--from ((Employee inner join  member_of_team on Employee.Personal_ID=member_of_team.Personal_ID)inner join Team on Team.ID=member_of_team.Team_ID)inner join task
--on (task.Team_id=Team.ID)
--group by Employee.Personal_ID,Employee.ssn,Employee.firstname,Employee.lastname,Employee.gender,Employee.experience,Employee.workarea
--having count(*)>1;

--second query

--select Team_ID from 
--(Employee inner join member_of_team on Employee.Personal_ID=member_of_team.Personal_ID)
--where Employee.Personal_ID=??????;

-- third query
--select Team.ID, COUNT(*) as [no.members]
--from (Team inner join member_of_team on Team.ID=member_of_team.Team_ID)
--group by Team.ID
--having COUNT(*)>=4;

--forth query

--select Employee.Personal_ID,sum(Agreement_Contractual.Overtime)as total_time from 
--((Employee inner join project_agreement_employee on Employee.Personal_ID=project_agreement_employee.Personal_ID)inner join project 
--on project_agreement_employee.Project_ID=project.ID)inner join Agreement_Contractual on Agreement_Contractual.ID=project_agreement_employee.Agreement_ID
--group by Employee.Personal_ID
--order by total_time desc;

--fifth query

--select Employee.Personal_ID,sum( Agreement_Contractual.Salary) as total_salary from 
--((Employee inner join project_agreement_employee on Employee.Personal_ID=project_agreement_employee.Personal_ID)inner join project 
--on project_agreement_employee.Project_ID=project.ID)inner join Agreement_Contractual on Agreement_Contractual.ID=project_agreement_employee.Agreement_ID
--group by Employee.Personal_ID
--order by total_salary desc;

--sixth query
--select * from task
--order by task.hours_of_work desc;

--seventh query
--select * from [Log]
--where [Log].date_time<?????? and [Log].date_time>??????;













