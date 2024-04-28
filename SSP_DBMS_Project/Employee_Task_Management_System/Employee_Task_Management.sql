create database employee_task_management;
use employee_task_management;

create table Employee (Emp_id int primary key, First_Name varchar(100) not null, Last_Name varchar(100) not null, 
Street varchar(100), City varchar(100), State varchar(100), Date_of_joining date, Phone_No double unique, 
Alternate_phone double unique, Email varchar(100) default 'not_known', Password varchar(20) not null, Role varchar(20) default 'Employee');

create table Tasks (Task_id int primary key, Assigned_To int, Title varchar(50), 
Description varchar(100), Due_Date date, Status varchar(25), foreign key (Assigned_To) references Employee(Emp_ID));
select * from Employee;
select * from Tasks;



