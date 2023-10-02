use project_manager;

select employee.Personal_ID,ssn,firstname,lastname
from dbo.Employee,dbo.project_agreement_employee
where project_agreement_employee.Project_ID=300 and project_agreement_employee.Personal_ID=Employee.Personal_ID;

select sum(Agreement_Contractual.Salary+Agreement_Contractual.Overtime*100000),count(project_agreement_employee.Personal_ID)
from dbo.project_agreement_employee,Agreement_Contractual
where project_agreement_employee.Project_ID=300 and Agreement_Contractual.ID=project_agreement_employee.Agreement_ID and project_agreement_employee.Agreement_ID in (select Agreement_Contractual.ID
																								from Agreement_Contractual);

select sum(Agreement_Hourly.Salary_per_hour*Agreement_Hourly.Hour_per_day),count(project_agreement_employee.Personal_ID)
from dbo.project_agreement_employee,Agreement_Hourly
where project_agreement_employee.Project_ID=600 and Agreement_Hourly.ID=project_agreement_employee.Agreement_ID and project_agreement_employee.Agreement_ID in (select Agreement_Hourly.ID
																								from Agreement_Hourly)
select *
from task
where task.Project_id='300';

select *
from SubTask
where Task_ID in (select task.ID
						  from task
                          where task.Project_id='300');

select top 10 *
from task
where task.Project_id='300'
order by spent_expense desc;

select  *
from SubTask
where Task_ID in (select task.ID
						  from task
                          where task.Project_id='300')
order by condition_sub_task desc;

select *
from task
where task.Project_id='300'
order by task.progress desc;

select *
from task
where task.Project_id='300'
order by start_task_time;

select *
from task
where task.Project_id='300'
order by task.priority desc;

select *
from [Log]
where [Log].date_time<'2023-06-02' and [Log].date_time>'2023-06-01' and [Log].Task_ID in (select task.ID
																						 from task
																						 where task.Project_id='300');

select *
from [Log]
where [Log].Team_ID='103';

select *
from (select count(ID)as count_log,Task_ID as task_id
      from [log]
	  group by (Task_ID))as temp
where Task_Id in (select task.ID
			     from task
                 where task.Project_id='300')
order by count_log desc;

select *
from project 
order by project.progress;

select *
from (select count(project_agreement_employee.Personal_ID)as count_Contractual ,Project_ID
			 from dbo.project_agreement_employee
			 where project_agreement_employee.Agreement_ID in (select Agreement_Contractual.ID
																from Agreement_Contractual)
			 group by project_agreement_employee.Project_ID)as temp
order by Count_Contractual desc;

select *
from(select count(project.id)as count_manager,manager_ID
	from project
	group by manager_ID)as temp
where count_manager>1;

select sum(Agreement_Contractual.Salary+Agreement_Contractual.Overtime*100000) as sum_salary, Personal_ID
from Agreement_Contractual,project_agreement_employee
where Agreement_Contractual.ID=project_agreement_employee.Agreement_ID and Personal_ID in(select manager_ID
																						  from project)
group by Personal_ID
order by sum_salary;

select sum(Agreement_Contractual.Salary)as salary_personal,Personal_ID
from Agreement_Contractual,project_agreement_employee,project
where Agreement_Contractual.ID=project_agreement_employee.Agreement_ID and project_agreement_employee.Project_ID='300' and project.ID='300' and (Personal_ID=project.manager_ID or
																			    Personal_ID=project.financial_manager_ID or
																				Personal_ID=project.operational_manager_ID or
																				Personal_ID=project.research_manager_ID)
group by Personal_ID
order by salary_personal;
