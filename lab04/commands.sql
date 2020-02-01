-- 1 
 select course_id, count(id) 
 from takes 
 group by course_id;

 -- 2
select dept_name 
from student 
group by dept_name 
having count(id) > 10;

-- 3
select dept_name, count(course_id) 
from course 
group by dept_name;

-- 4
select dept_name, avg(salary)
from instructor 
group by dept_name 
having avg(salary) > 42000;

-- 5
select course_id, sec_id, semester, count(id) enrollment 
from takes
where year=2009 and semester='Spring'
group by (course_id, sec_id, semester, year);

-- 6
select * 
from prereq 
order by course_id;

-- 7
select * 
from instructor 
order by salary desc;

-- 8
select dept_name 
from instructor 
group by dept_name 
having sum(salary) >= all (	select sum(salary) 
							from instructor 
							group by dept_name);  

-- 9
select dept_name, avg_sal
from (	select dept_name, avg(salary) avg_sal 
		from instructor 
		group by dept_name)
where avg_sal > 42000;

-- 10
select dept_name, enrollment, avgsal
from (	select dept_name, count(*) enrollment, avg(salary) avgsal 
		from instructor 
		group by dept_name)
where ct > 2 and avgsal > 40000;

-- 11
select name from instructor i where not exists
((select id from student where dept_name='Comp. Sci.') 
minus
(select j.id from takes j, teaches k where j.course_id = k.course_id and j.sec_id = k.sec_id
and j.semester =  k.semester and j.year = k.year and k.id = i.id));

-- 12
select dept_name, avg_sal
from (select dept_name, avg(salary) avg_sal, count(id) num_inst from instructor group by dept_name)
where avg_sal > 50000 and num_inst > 5;

-- 13
with max_budget(value) as 
(select max(budget) from department)
select budget from department, max_budget where
department.budget = value;



-- with 
-- sec_enrol(sec_id, semester, year, enrolment) 
-- as (select sec_id, semester, year, count(id) enrolment 
-- 	from takes 
-- 	group by (sec_id, semester, year)),
-- max_enrol(value) 
-- as (select max(enrolment) 
-- 	from sec_enrol 
-- 	where semester='Spring' and year=2010)
-- select sec_id, enrolment 
-- from sec_enrol, max_enrol 
-- where semester='Spring' 
-- and year = 2010 and enrolment = value;

-- with 
-- sec_enrol(sec_id, semester, year, enrolment) 
-- as (select sec_id, semester, year, count(id) enrolment 
-- 	from takes group by (sec_id, semester, year))
-- select sec_id, enrolment from sec_enrol where semester='Spring' and year = 2010 
-- and enrolment >= all (select enrolment from sec_enrol  where semester='Spring' and year = 2010 );

-- with sec_enrol(sec_id, semester, year, enrolment) 
-- as (select sec_id, semester, year, count(id) enrolment from takes where semester='Spring' and year=2010 group by (sec_id, semester, year))
-- select sec_id, enrolment from sec_enrol where enrolment = (select max(enrolment) from sec_enrol);


1>
 select course_id, count(id) from takes group by course_id;

-------------------------------------------------------------------------------------------------------------------------
2>
select dept_name from student group by dept_name having count(id) > 10;

-------------------------------------------------------------------------------------------------------------------------
3>
select dept_name, count(course_id) from course group by dept_name;

-------------------------------------------------------------------------------------------------------------------------
4>
select dept_name, avg(salary) from instructor group by dept_name having avg_salary > 42000;

-------------------------------------------------------------------------------------------------------------------------
5>
select course_id, sec_id, semester,count(id) enrollment from takes
where year=2009 and semester='Spring'
group by (course_id, sec_id, semester, year);

-------------------------------------------------------------------------------------------------------------------------
6>  
select * from prereq order by course_id;

-------------------------------------------------------------------------------------------------------------------------
7>

select * from instructor order by salary desc;

-------------------------------------------------------------------------------------------------------------------------
8>
select dept_name from instructor group by dept_name 
having sum(salary) >= all (select sum(salary) from instructor group by dept_name);  

-------------------------------------------------------------------------------------------------------------------------
9>
select dept_name, avg_sal
from (select dept_name, avg(salary) avg_sal from instructor group by dept_name)
where avg_sal > 42000;

-------------------------------------------------------------------------------------------------------------------------
10>

with sec_enrol(sec_id, semester, year, enrolment) 
as (select sec_id, semester, year, count(id) enrolment from takes group by (sec_id, semester, year)),
max_enrol(value) as (select max(enrolment) from sec_enrol where semester='Spring' and year=2010)
select sec_id, enrolment from sec_enrol, max_enrol where semester='Spring' and year = 2010 and enrolment = value;


with sec_enrol(sec_id, semester, year, enrolment) 
as (select sec_id, semester, year, count(id) enrolment from takes group by (sec_id, semester, year))
select sec_id, enrolment from sec_enrol where semester='Spring' and year = 2010 
and enrolment >= all (select enrolment from sec_enrol  where semester='Spring' and year = 2010 );

with sec_enrol(sec_id, semester, year, enrolment) 
as (select sec_id, semester, year, count(id) enrolment from takes where semester='Spring' and year=2010 group by (sec_id, semester, year))
select sec_id, enrolment from sec_enrol where enrolment = (select max(enrolment) from sec_enrol);
-------------------------------------------------------------------------------------------------------------------------
11>
select name from instructor i where not exists
((select id from student where dept_name='Comp. Sci.') 
minus
(select j.id from takes j, teaches k where j.course_id = k.course_id and j.sec_id = k.sec_id
and j.semester =  k.semester and j.year = k.year and k.id = i.id));
-------------------------------------------------------------------------------------------------------------------------
12>

select dept_name, avg_sal
from (select dept_name, avg(salary) avg_sal, count(id) num_inst from instructor group by dept_name)
where avg_sal > 50000 and num_inst > 5;
-------------------------------------------------------------------------------------------------------------------------
13>
with max_budget(value) as 
(select max(budget) from department)
select budget from department, max_budget where
department.budget = value;

-------------------------------------------------------------------------------------------------------------------------
14>
with dept_total(dept_name, value) as 
(select dept_name, sum(salary) from instructor group by dept_name),
dept_total_avg(value) as (select avg(value) from dept_total)
select dept_name from dept_total, dept_total_avg 
where dept_total.value>= dept_total_avg.value; 

-------------------------------------------------------------------------------------------------------------------------
15>

with sec_enrol(sec_id, semester, year, enrolment) 
as (select sec_id, semester, year, count(id) enrolment from takes where semester='Fall' and year=2009 group by (sec_id, semester, year))
select sec_id, enrolment from sec_enrol where enrolment = (select max(enrolment) from sec_enrol);

-------------------------------------------------------------------------------------------------------------------------
16>
with dept_tot_cred(dept_name, tot_cred) as
(select dept_name, sum(tot_cred) from student group by dept_name),
fin_tot_cred(value) as
(select tot_cred from dept_tot_cred where dept_name = 'Finance')
select dept_name from dept_tot_cred, fin_tot_cred where tot_cred > value;

-------------------------------------------------------------------------------------------------------------------------
17>
delete from instructor where dept_name='Finance';

-------------------------------------------------------------------------------------------------------------------------
18>
delete from course where dept_name='Comp. Sci.';

-------------------------------------------------------------------------------------------------------------------------
19>
update student set dept_name='IT' where dept_name='Comp. Sci.';

-------------------------------------------------------------------------------------------------------------------------
20>
update instructor set salary = case
when salary <= 100000 then salary * 1.05
else salary * 1.03
end;

-------------------------------------------------------------------------------------------------------------------------
21>
insert into student 
select id, name, dept_name, 0 from instructor;
-------------------------------------------------------------------------------------------------------------------------
22>
delete from instructor where salary < (select avg(salary) from instructor);
-------------------------------------------------------------------------------------------------------------------------