use project_manager;
--create table Employee(
--Personal_ID int not null,
--ssn char(10) not null,
--firstname nvarchar(50) not null,
--lastname nvarchar(50) not null,
--workarea nvarchar(100) not null,
--gender bit not null,--0 female,1 male,
--experience int not null default 0,--year of work
--birth_date date not null check (birth_date<getdate() and birth_date>getdate()-(365*100)),primary key(Personal_ID),
--unique(ssn)
--);

--create table project(
--ID int not null primary key,
--title nvarchar(50) not null,
--budget float not null default 0,
--client nvarchar(50) not null,
--expense float not null default 0,
--progress float not null default 0,
--manager_ID int not null,
--financial_manager_ID int,
--research_manager_ID int ,
--operational_manager_ID int,
--constraint managerfk
--foreign key (manager_ID) references Employee(personal_ID)
--on delete cascade on update cascade,
--foreign key (financial_manager_ID) references Employee(personal_ID)
--on delete no action on update no action,
--foreign key (research_manager_ID) references Employee(personal_ID)
--on delete no action on update no action,
--foreign key (operational_manager_ID) references Employee(personal_ID)
--on delete no action on update no action,
--check(budget>=0),check(expense>=0),check(progress>=0 and progress<=100));

--create table Team
--(
--ID int not null,
--workarea nvarchar(100) not  null,
--LEADER_ID int not null,
--constraint TEAM_Lead
--foreign key(LEAder_ID)references Employee(Personal_ID)
--on delete cascade on update cascade,
--primary key (ID)
--);

--create table task(
--ID int not null,
--Title nvarchar(50) not null,
--spent_expense float not null default 0,
--hours_of_work int not null default 0,
--task_condition int not null default 0 check(task_condition>=0 and task_condition<=2),
--start_task_time datetime,
--end_task_time datetime,
--[priority] int not null check ([priority]>0 and [priority]<100),
--workarea nvarchar(100) not null,
--progress float not null default 0 check(progress>=0 and progress<=100),
--expected_spense float not null default 0,
--Project_id int not null,
--Team_id int not null,
--primary key(ID),
--foreign key(Project_id)references project(ID)
--on delete no action on update no action,
--foreign key(Team_id)references Team(ID)
--on delete cascade on update cascade,
--check(start_task_time<end_task_time)
--);

--create table SubTask(
--Sub_Task_ID int not null primary key,
--title nvarchar(50) not null,
--spent_expense float not null default 0,
--hours_of_work int not null default 0,
--condition_sub_task int not null default 0 check(condition_sub_task>=0 and condition_sub_task<=1),
--Priority_sub_task int not null  default 1 check(Priority_sub_task>=1 and Priority_sub_task<=10),
--Task_ID int not null,
--foreign key (Task_ID) references task(ID)
--on delete cascade on update cascade);

--create table Agreement(
--ID int not null primary key,
--Date_of_start_work  date not null,
--check(Date_of_start_work<getdate()));

--create table Agreement_Contractual(
--ID int not null primary key,
--Date_of_start_work  date not null,
--Overtime int not null default 0 check(Overtime>=0),
--vacations_per_year int not null default 0 check(vacations_per_year>=0),
--Insurance nvarchar(20),
--Salary float not null default 0 check(Salary>=0),
--Hour_per_day int not null default 0 check(Hour_per_day>=0),
--check(Date_of_start_work<getdate()),
--foreign key (ID) references Agreement(ID)
--on delete cascade on update cascade);



--create table [Log](
--ID int not null primary key,
--area_of_work nvarchar(50) not null,
--title nvarchar(50) not null,
--date_time datetime not null check(date_time<getdate()),
--Task_ID int not null,
--Team_ID int not null,
--foreign key (Task_ID) references Task(ID)
--on delete no action on update no action,
--foreign key (Team_ID) references Team(ID)
--on delete cascade on update cascade);

--create table Agreement_Hourly(
--ID int not null primary key,
--Date_of_start_work  date not null,
--Salary_per_hour float not null default 0 check(Salary_per_hour>=0),
--Hour_per_day int not null default 0,
--check(Date_of_start_work<getdate()),
--foreign key (ID) references Agreement(ID)
--on delete cascade on update cascade);



--create table project_agreement_employee(
--Project_ID int not null,
--Agreement_ID int not null,
--Personal_ID int not null,
--primary key(Project_ID,Agreement_ID,Personal_ID),
--foreign key (Project_ID) references project(ID)
--on delete no action on update no action,
--foreign key (Agreement_ID) references Agreement(ID)
--on delete cascade on update cascade,
--foreign key (Personal_ID) references Employee(personal_ID)
--on delete cascade on update cascade);

--create table Education(
--Personal_ID int not null,
--degree nvarchar(50) not null,
--primary key(Personal_ID,degree),
--foreign key (Personal_ID) references Employee(Personal_ID)
--on delete cascade on update cascade,
--);

--create Table member_of_team
--(
--Team_ID int not null,
--Personal_ID int not null,
--foreign key(Team_ID)references Team(ID)
--on delete no action on  update no action,
--foreign key(Personal_ID)references Employee(Personal_ID)
--on delete cascade on update cascade,
--primary key(TEAM_ID,personal_ID)
--);

