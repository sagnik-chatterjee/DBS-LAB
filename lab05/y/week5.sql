create table department(
dept_no number(5,0),
dept_name varchar2(20) not null unique,
mngr_ssn number(5, 0),
mngr_st_date date,
num_emp number(5,0),
constraint pk_dept primary key(dept_no)
);


create table employee(
emp_ssn number(5,0),
bdate date, 
fname varchar2(20),
minit varchar2(5),
lname varchar2(20),
address varchar2(40),
salary number(7, 1),
sex char(1),
emp_dept number(5, 0),
super_ssn number(5, 0),
constraint fk_empself foreign key(super_ssn) references employee(emp_ssn),
constraint pk_emp primary key(emp_ssn),
constraint fk_empdept foreign key(emp_dept) references department(dept_no),
constraint sex_check check (sex in ('M', 'F', 'O'))
);

create table project(
proj_no number(5, 0),
proj_name varchar2(20) not null unique,
proj_loc varchar2(30),
proj_dept number(5,0),
constraint pk_proj primary key(proj_no),
constraint fk_projdept foreign key(proj_dept) references department(dept_no)
);

create table works_on(
emp_ssn number(5,0),
proj_no number(5,0),
hours number(3, 0),
constraint fk_worksonemp foreign key(emp_ssn) references employee(emp_ssn),
constraint fk_worksonproj foreign key(proj_no) references project(proj_no)
);

create table dept_location(
dept_no number(5,0),
loc_name varchar2(30),
constraint fk_deptloc foreign key(dept_no) references department(dept_no),
constraint pk_deptloc primary key(dept_no, loc_name)
);

create table dependent(
name varchar2(20), 
sex char(1), 
bdate date, 
rel varchar2(10),
dep_of number(5,0),
constraint fk_dependent foreign key(dep_of) references employee(emp_ssn),
constraint pk_dependent primary key(name, dep_of)
);

alter table department add constraint fk_deptemp foreign key(mngr_ssn) references employee(emp_ssn);
