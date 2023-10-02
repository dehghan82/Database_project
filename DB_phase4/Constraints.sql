use project_manager;
alter table agremment_hourly add constraint [hour] check(hour_Per_day>=30);
alter table agremment_hourly add constraint [salary] check(salary_per_day<=50);
alter table agremment_contractual add constraint [vacation] check(vacations_per_year<=15);
alter table agremment_contractual add constraint [overtime] check(overtime<=30);
alter table agremment_contractual drop constraint [vacation];
alter table agremment_hourly drop constraint[salary];


