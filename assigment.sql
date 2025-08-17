--Basic SQL Queries

select * from employees

select emp_id, emp_name , dept_id
from employees
where location='Cairo' ;

--DISTINCT Keyword

select DISTINCT dept_id
from employees ;

---Data Definition Language (DDL):

create table students(
    id int primary key auto_increment,
    First_Name varchar(50) not null,
    Last_Name varchar(50) default 'Unknown',
    Address VARCHAR(100) DEFAULT 'N/A',
    City VARCHAR(50) DEFAULT 'N/A',
    Birth_Date Date 
);

drop table students ;

--Data Manipulation Language (DML):

insert into students(id,First_Name,Last_Name,Address,City,Birth_Date)
values(1,'Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01');

update students
set City='Garden City'
where First_Name='Ahmed';

--Transaction Control

begin;

delete from students
where City='cairo';

rollback;