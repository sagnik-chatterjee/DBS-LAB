-- 1:
create table employees 
	(
		emp_no int, 
		emp_name varchar(20) not null, 
		gender char(1) not null, 
		salary int, 
		address varchar(20) not null, 
		d_no int, 
		check (gender in ('M','F'))
	);




-- 2:
create table departments 
	(
		dept_no int primary key, 
		dept_name varchar(20) unique not null, 
		location varchar(20)
	);




-- 3:
alter table employees
add constraint fk_dept
foreign key (d_no) references departments(dept_no);



-- 4:
insert into departments 
	values ('1', 'CSE', 'AB5');

insert into departments 
values ('2', 'CCE', 'AB5');

insert into departments 
	values ('3', 'IT', 'AB5');

insert into departments 
	values ('4', 'EEE', 'AB4');

insert into departments 
	values ('5', 'AERO', 'AB3');





-- 5:
insert into employees 
	values ('4','Arun', 'O', 40, 'Udupi', 2);

insert into employees 
	values ('4','Arun', 'M', 40, 'Udupi', 7);

insert into departments 
	values ('6', 'XYZ', 'AB3');




-- 6:
delete 
	from departments 
	where dept_name='XYZ';





-- 7:
alter table employees
	drop constraint fk_dept;

alter table employees
add constraint fk_dept
foreign key (d_no) references departments(dept_no) on delete cascade;



-- 8:
alter table employees 
	modify(salary numeric not null);

alter table employees 
	modify(salary numeric default 10000);

insert into employees 
	values('4','Paawan', 'M', default, 'Udupi', 2);


-- ::::::::::::::::::DUMP VALUES:::::::::::::::::::::::::::


-- 9
select id, dept_name 
from student;



-- 10
select name 
from instructor 
where dept_name='Comp. Sci.';



-- 11
select title 
from course 
where dept_name='Comp. Sci.' and credits=4;




-- 12
select c.course_id, c.title 
from takes t, course c 
where t.id=12345 and t.course_id=c.course_id;




-- 13
select name 
from instructor
where salary between 40000 and 90000;




-- 14
select instructor.id 
from instructor 
where not exists(select teaches.id from teaches where teaches.id=instructor.id);




-- 15
select name, title, year 
from (takes natural join section) join course using (course_id) join student using (id) 
where room_number=3128;




-- 16
select name, course_id, title as c_name, year 
from takes join student using (id) join course using (course_id) 
where year=&year;




-- 17 (2 ways)
select distinct(IA.name), IA.salary 
from instructor IA cross join instructor IC 
where IA.salary > IC.salary and IC.dept_name='Comp. Sci.';
-- else
select distinct(IA.name), IA.salary 
from instructor IA, instructor IC 
where IA.salary > IC.salary and IC.dept_name='Comp. Sci.';




-- 18
select name, dept_name 
from instructor 
where dept_name like '%ic%';



-- 19
select name, length(name) 
from student;




-- 20
select dept_name, substr(dept_name, 3, 3) 
from department;




-- 21
select upper(name) 
from instructor;




-- 22
select NVL(tot_cred, 0) 
from student;





-- 23
select salary, ROUND(salary/3, -2) 
from instructor;






-- 24
alter table employees 
add DOB date;

select sysdate 
from dual; --to know the date format 

update employees 
	set DOB='01-JAN-00' 
	where emp_no=1;

update employees 
	set DOB='01-FEB-70' 
	where emp_no=2;

update employees 
	set DOB='05-AUG-80' 
	where emp_no=3;

update employees 
	set DOB='05-FEB-95' 
	where emp_no=4;

select emp_no, emp_name, TO_CHAR (DOB, 'DD-Mon-YYYY') 
from employees;

select emp_no, emp_name, TO_CHAR (DOB, 'DD-Mon-YY') 
from employees;

select emp_no, emp_name, TO_CHAR (DOB, 'DD-MM-YY') 
from employees;




-- 25
select emp_name, TO_CHAR (DOB, 'YEAR') 
from employees;

select emp_name, TO_CHAR (DOB, 'Year') 
from employees;

select emp_name, TO_CHAR (DOB, 'year') 
from employees;




-- 26
select emp_name, TO_CHAR (DOB, 'DAY') 
from employees;

select emp_name, TO_CHAR (DOB, 'Day') 
from employees;




-- 27
select emp_name, TO_CHAR (DOB, 'MONTH') 
from employees;

select emp_name, TO_CHAR (DOB, 'Month') 
from employees;




-- 28
select emp_name, LAST_DAY(DOB), TO_CHAR (LAST_DAY(DOB), 'Day') 
from employees;

select emp_name, LAST_DAY(DOB), TO_CHAR (LAST_DAY(DOB), 'Day') 
from employees
where emp_name='Paawan';





-- 29
select emp_name, ROUND(MONTHS_BETWEEN(SYSDATE, DOB)/12) 
from employees;




-- 30
select emp_name, NEXT_DAY(ADD_MONTHS(DOB, 12*60), 'Saturday') 
from employees;




-- 31
select emp_name 
from employees 
where TO_CHAR(DOB, 'YYYY')=&x;
-- Enter value for x: 2000




-- 32
select emp_name 
from employees 
where TO_CHAR(DOB, 'YYYY') between &x and &y;
-- Enter value for x: 1975
-- Enter value for y: 1995



-- 33
select emp_name 
from employees 
where TO_CHAR(ADD_MONTHS(DOB, 12*60), 'YYYY')=&x;