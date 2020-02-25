DECLARE
	message varchar2(20):='Hello,World!';

BEGIN
	dbms_output.put_line(message);
END;
/

-- if server output is disabled then: 
SET SERVEROUTPUT ON
/
--

SHOW ERROR --if pl sql isnt showing 

-- initialize
create table stud(
RollNo number(3),
GPA float
);

insert into stud values (1, 5.8);
insert into stud values (2, 6.5);
insert into stud values (3, 3.4);
insert into stud values (4, 7.8);
insert into stud values (5, 9.5);


-- 1
DECLARE
	ans float;
BEGIN

 	select GPA into ans from stud where RollNo=&r;
	dbms_output.put_line('GPA is ' || ans);

END;
/

-- 2
DECLARE
	ans float;
	grade varchar(2);

BEGIN
 	select GPA into ans from stud where RollNo=&r;

 	if (ans > 9) then grade:='A+';
 	elsif (ans > 8) then grade:='A';
 	elsif (ans > 7) then grade:='B';
 	elsif (ans > 6) then grade:='C';
 	elsif (ans > 5) then grade:='D';
 	elsif (ans > 4) then grade:='E';
 	else grade:='F';
 	end if;

	dbms_output.put_line('grade is ' || grade);
END; 
/

-- 3
DECLARE
	issue date;
	ret date;
	days integer;

BEGIN
 	issue := '&i';
 	ret := '&r';

 	-- select DATEDIFF(dd, issue, ret) into days;
 	days := ret-issue;

 	if (days < 7) then 
 		dbms_output.put_line('Fine is nil');
 	elsif (days < 15) then 
 		dbms_output.put_line('Fine is ' || days * 1);
 	elsif (days < 30) then 
 		dbms_output.put_line('Fine is ' || days * 2);
 	else 
 		dbms_output.put_line('Fine is ' || days * 5);
 	end if;
END; 
/

-- 4
DECLARE
	ans float;
	grade varchar(2);
	r number(1);

BEGIN

	FOR r in 1..5 LOOP

 		select GPA into ans from stud where RollNo=r;

	 	if (ans > 9) then grade:='A+';
	 	elsif (ans > 8) then grade:='A';
	 	elsif (ans > 7) then grade:='B';
	 	elsif (ans > 6) then grade:='C';
	 	elsif (ans > 5) then grade:='D';
	 	elsif (ans > 4) then grade:='E';
	 	else grade:='F';
	 	end if;

		dbms_output.put_line('grade is ' || grade);
 	
 	END LOOP;
	
END; 
/

-- 5
alter table stud
add LetterGrade varchar2(2);

DECLARE
	ans float;
	grade varchar(2);
	r number(1);

BEGIN

	FOR r in 1..5 LOOP

 		select GPA into ans from stud where RollNo=r;

	 	if (ans > 9) then grade:='A+';
	 	elsif (ans > 8) then grade:='A';
	 	elsif (ans > 7) then grade:='B';
	 	elsif (ans > 6) then grade:='C';
	 	elsif (ans > 5) then grade:='D';
	 	elsif (ans > 4) then grade:='E';
	 	else grade:='F';
	 	end if;

		update stud set LetterGrade=grade where RollNo=r;
 	
 	END LOOP;
	
END; 
/

-- 6
DECLARE
	temp float;
	maxx float;
	s number(1);
	r number(1);
BEGIN
 	select GPA into maxx from stud where RollNo=1;
 	s:=1;

	FOR r in 2..5 LOOP

 		select GPA into temp from stud where RollNo=r;
 	
 		if (temp > maxx) then s:=r;
 		end if;
 		if (temp > maxx) then maxx:=temp;
 		end if;
 	
 	END LOOP;
 	dbms_output.put_line('RollNo: ' || s || ' GPA: ' || maxx);
END; 
/

-- 7
DECLARE
	gp studenttable.gpa%TYPE;
	grade varchar(2);

BEGIN
	for i in 1..5 loop
		select gpa into gp from studenttable where rollno = i;

		if (gp>=9 and gp<=10) then goto ap;
		elsif (gp>=8 and gp<9) then	goto aa;
		elsif (gp>=7 and gp<8) then goto bb;
		elsif (gp>=6 and gp<7) then	goto cc;
		elsif (gp>=5 and gp<6) then	goto dd;
		elsif (gp>=4 and gp<5) then	goto ee;
		else goto ff;
		end if;

		<<ap>>
			grade:='A+';
			goto prnt;
		
		<<aa>>
			grade:='A';
			goto prnt;
		
		<<bb>>
			grade:='B';
			goto prnt;
		
		<<cc>>
			grade:='C';
			goto prnt;
		
		<<dd>>
			grade:='D';
			goto prnt;
		
		<<ee>>
			grade:='E';
			goto prnt;
		
		<<ff>>
			grade:='F';
		
		<<prnt>>
			dbms_output.put_line('Roll.no. ' || i || ' Grade ' || grade);

	end loop;

END;
/

-- 8
DECLARE
	nam instructor.name%TYPE;
	val instructor%ROWTYPE;

BEGIN
	nam := '&n';
	select * into val from instructor where name=nam;
	dbms_output.put_line(val);
END;
/

-- 9
DECLARE
	OutOfRangeExptn Exception;
	gp studenttable.gpa%TYPE;
	grade studenttable.lettergrade%TYPE;

BEGIN
	for i in 1..5 loop
		select gpa into gp from studenttable where rollno = i;
		
		if (gp>=9 and gp<=10) then grade:='A+';
		elsif (gp>=8 and gp<9) then grade:='A';
		elsif (gp>=7 and gp<8) then grade:='B';
		elsif (gp>=6 and gp<7) then grade:='C';
		elsif (gp>=5 and gp<6) then grade:='D';
		elsif (gp>=4 and gp<5) then grade:='E';
		elsif (gp>=0 and gp<4) then grade:='F';
		else RAISE OutOfRangeExcptn;
		end if;

		update studenttable set lettergrade=grade where rollno=i;
	end loop;

EXCEPTION
	when OutOfRangeExcptn then
		dbms_output.put_line('GPA out of range');
	when others then
		dbms_output.put_line('Error');
END;
/
