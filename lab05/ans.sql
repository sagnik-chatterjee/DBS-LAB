-- 1
select bdate, address 
from employee 
where fname = 'John' and  minit = 'B' and lname = 'Smith';
	
select fname, minit, lname, address
from employee, department1
where employee.dno = department1.dnumber and dname = 'Research';



-- 2
select proj_no, proj_dept, lname, address, bdate 
from project, department, employee
where proj_loc = 'Stafford' and proj_dept = dept_no and mngr_ssn = emp_ssn;



-- 3
select distinct(salary) 
from employee;



-- 4
select (a.fname || ' ' || a.lname) emp_name, (b.fname || ' ' || b.lname) super_name
from employee a, employee b
where a.super_ssn = b.emp_ssn; 



-- 5
select w.proj_no
from works_on w, project p, employee e
where w.proj_no = p.proj_no and emp_dept = proj_dept and w.emp_ssn = e.emp_ssn and e.lname = 'Smith';



-- 6
 select * from employee where address like '%Houston, Texas%';



-- 7
select salary * 1.1 raised_sal from employee e, works_on w, project p
where w.emp_ssn = e.emp_ssn and w.proj_no = p.proj_no and p.proj_name = 'ProductX';



-- 8
select * from employee
where emp_dept = 10000 and salary between 40000 and 65000;


-- 9
select emp_ssn from worko


-- 10
select fname || ' ' || minit || ' ' || lname from employee where super_ssn is null;