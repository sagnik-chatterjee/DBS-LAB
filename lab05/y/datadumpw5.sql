insert into department values(10000, 'Research', NULL, NULL, 0);
insert into department values(10001, 'HR', NULL, NULL, 0);
insert into department values(10002, 'Software', NULL, NULL, 0);
insert into department values(10003, 'Marketing', NULL, NULL, 0);

insert into employee values(1, to_date('03/01/2000','DD/MM/YYYY'), 'John', 'B.', 'Smith', 'Boston, USA', 70000.0, 'M', 10000, NULL);
insert into employee values(2, to_date('05/05/1990','DD/MM/YYYY'), 'George', 'W.', 'Bush', 'Boston, USA', 50000.0, 'M', 10000, 1);
insert into employee values(3, to_date('05/02/1970','DD/MM/YYYY'), 'Hillary', 'M.', 'Clinton', 'Boston, USA', 60000.0, 'F', 10000, 1);
insert into employee values(4, to_date('09/12/1994','DD/MM/YYYY'), 'Michelle', 'A.', 'Obama', 'Houston, Texas', 40000.0, 'F', 10001, NULL);
insert into employee values(5, to_date('12/04/1999','DD/MM/YYYY'), 'Donald', 'J.', 'Trump', 'Houston, Texas', 44000.0, 'M', 10002, NULL);
insert into employee values(6, to_date('31/01/1999','DD/MM/YYYY'), 'Ronald', 'R.', 'Reagan', 'New York, USA', 50000.0, 'M', 10002, 5);
insert into employee values(7, to_date('22/07/1992','DD/MM/YYYY'), 'William', 'J.', 'Clinton', 'Washington, USA', 80000.0, 'M', 10003, NULL);

update department set mngr_ssn=1 where dept_no=10000;
update department set mngr_ssn=4 where dept_no=10001;
update department set mngr_ssn=6 where dept_no=10002;
update department set mngr_ssn=7 where dept_no=10003;

insert into project values(1, 'ProductX', 'Bellaire', 10000);
insert into project values(2, 'ProductY', 'Sugarland', 10000);
insert into project values(3, 'ProductZ', 'Houston', 10000);
insert into project values(10, 'Computerization', 'Stafford', 10001);
insert into project values(20, 'Reorganiztion', 'Houston', 10002);
insert into project values(30, 'Newbenefits', 'Stafford', 10003);

insert into works_on values(1, 1, 14);
insert into works_on values(1, 2, 11);
insert into works_on values(2, 3, 34);
insert into works_on values(7, 30, 22);
insert into works_on values(4, 10, 19);
insert into works_on values(5, 20, 51);
insert into works_on values(6, 20, 32);

