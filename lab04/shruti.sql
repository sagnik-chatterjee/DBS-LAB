-- 1  
select count(id),course_id 
from takes 
group by course_id;

-- 2   
select dept_name 
from (	select count(id) as count_id,dept_name 
		from takes natural join course 
		group by dept_name) 
where count_id>10;

-- 3  
select count(course_id),dept_name 
from course 
group by dept_name;

-- 4
select dept_name,avg(salary) 
from instructor 
group by dept_name 
having avg(salary) > 42000;

-- 5  
select count(id),sec_id 
from takes 
where semester='Spring' and year=2009 
group by sec_id;

-- 6  
select course_id,prereq_id 
from prereq 
order by course_id;

-- 7  
select * 
from instructor 
order by salary desc;

-- 8   
select max(tot_salary) 
from (	select sum(salary) as tot_salary,dept_name 
		from instructor 
		group by dept_name);

-- 9   
select avg(salary) 
from instructor, (	select dept_name as d_name 
					from instructor 
					group by dept_name 
					having avg(salary) > 42000) 
where dept_name=d_name;

-- 10  
with 
sec_tot(tot, secid) as (	select count(id),sec_id 
						from takes 
						where semester='Spring' and year=2010 
						group by sec_id),

max_sec(value) as	(	select max(tot) 
						from sec_tot)
	
select secid 
from sec_tot,max_sec 
where value=tot;

-- 11
with 
id_cse (cid) as (	select course_id 
					from student natural join takes 
					where dept_name='Comp. Sci.'),

teaches_name(name,courseid) as	(	select name,course_id 
									from instructor natural join teaches)

select distinct name 
from id_cse,teaches_name 
where cid=courseid;

-- 12   
select avg(salary) 
from instructor, (	select dept_name as d_name 
					from instructor 
					group by dept_name 
					having avg(salary) > 50000),
				
				 (	select dept_name as d 
					from instructor 
					group by dept_name 
					having count(id)>5) 

where dept_name=d_name and dept_name=d;

-- 13  
with 
max_budget (value) as	(	select max (budget) 
							from department)

select budget,dept_name 
from department, max_budget
where department.budget=max_budget.value;

-- 14  
with 
dept_total (dept_name,value) as (	select dept_name,sum(salary) 
									from instructor
									group by dept_name),

dept_total_avg (value) as (	select avg(value) 
							from dept_total)

select dept_name 
from dept_total,dept_total_avg
where dept_total.value >= dept_total_avg.value;

-- 15   
with 
sec_tot(tot,secid) as (	select count(id),sec_id 
						from takes 
						where semester='Fall' and year=2009 
						group by sec_id),

max_sec(value) as (	select max(tot) 
					from sec_tot)

select secid 
from sec_tot,max_sec 
where value=tot;

-- 16 
with 
tot_cred_finance(tot) as (	select sum(tot_cred) 
							from student 
							where dept_name='finance'),

tot_all(name,cred) as (	select dept_name,sum(tot_cred) 
						from student 
						group by dept_name)

select name from tot_cred_finance,tot_all where cred>tot;

-- 17  
delete 
from instructor 
where dept_name = 'Finance';

-- 18  
delete 
from course 
where dept_name ='Comp. Sci.';

-- 19   
update student 
set dept_name='IT' 
where dept_name='Comp. Sci.';

-- 20   
update instructor 
set salary = salary*1.03 
where salary > 100000;

update instructor 
set salary = salary*1.05 
where salary <= 100000;

-- 21   
insert into student
select id,name,dept_name,0
from instructor;

-- 22   
delete from instructor 
where salary < (	select avg(salary) 
					from instructor);