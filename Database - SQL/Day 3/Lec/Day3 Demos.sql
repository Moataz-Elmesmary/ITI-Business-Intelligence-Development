Select st_fname,dept_name
from student , Department

Select st_fname,dept_name
from student cross join Department

Select st_fname,dept_name
from student , Department
where Department.Dept_Id=Student.Dept_Id

Select st_fname,dept_name
from student S , Department D
where D.Dept_Id=S.Dept_Id

Select st_fname,D.*
from student S , Department D
where D.Dept_Id=S.Dept_Id

Select st_fname,dept_name,D.dept_id
from student S , Department D
where D.Dept_Id=S.Dept_Id and st_address='alex'
order by Dept_Name


Select st_fname,dept_name
from student S inner join Department D
on D.Dept_Id=S.Dept_Id

Select st_fname,dept_name
from student S inner join Department D
on D.Dept_Id=S.Dept_Id and st_address='alex'


Select st_fname,dept_name
from student S left outer join Department D
on D.Dept_Id=S.Dept_Id

Select st_fname,dept_name
from student S right outer join Department D
on D.Dept_Id=S.Dept_Id


Select st_fname,dept_name
from student S full outer join Department D
on D.Dept_Id=S.Dept_Id

--join + Multi
Select st_fname,crs_name,grade
from Student S, Stud_Course SC, Course C
where S.St_Id=SC.St_Id   and C.Crs_Id=SC.Crs_Id

Select st_fname,crs_name,grade
from Student S inner join Stud_Course SC
	on S.St_Id=SC.St_Id   
	inner join
	Course C
	on C.Crs_Id=SC.Crs_Id

Select st_fname,crs_name,grade,dept_name
from Student S inner join Stud_Course SC
	on S.St_Id=SC.St_Id   
	inner join
	Course C
	on C.Crs_Id=SC.Crs_Id
	inner join
	Department d
	on d.Dept_Id=s.Dept_Id

--join + DML
update Stud_Course
	set grade+=10
from Student S , Stud_Course SC
where s.St_Id=sc.St_Id and st_address='alex'

update SC
	set grade+=10
from Student S , Stud_Course SC
where s.St_Id=sc.St_Id and st_address='alex'

--Self join
select X.St_fname as StudName,Y.St_fname as Supername
from Student X, Student Y
where Y.St_Id=X.St_super

select X.St_fname as StudName,Y.*
from Student X, Student Y
where Y.St_Id=X.St_super

select X.St_fname as StudName,Y.*
from Student X inner join Student Y
on Y.St_Id=X.St_super
------------------------------------------
---------------------------------

delete from Department where dept_id=100

update Department set dept_id=4 where dept_id=100

update student set dept_id=20
where dept_id=100

Select st_fname
from Student
where st_fname is not null

Select isnull(st_fname,'')
from Student

Select isnull(st_fname,'stud has no name')
from Student

Select isnull(st_fname,st_lname)
from Student

Select Coalesce(st_fname,st_lname,st_address,'No data')
from Student

select st_fname,st_age
from Student

select st_fname+' '+st_age
from Student

select st_fname+' '+Convert(varchar(20),st_age)
from Student

select isnull(st_fname,'')+' '+Convert(varchar(20),isnull(st_age,0))
from Student

select concat(st_fname,' ',st_age)
from Student
----------------------------------
create table dept
(
 did int primary key,
 dname varchar(20) 
)

create table emp
(
 eid int,
 ename varchar(20),
 eadd varchar(20) default 'cairo',
 hiredate date default getdate(),
 BD date,
 age as(year(getdate())-year(BD)),
 sal int,
 overtime int,
 netsal as(isnull(sal,0)+isnull(overtime,0)) persisted,
 gender varchar(1),
 hour_rate int not null,
 Dnum int,
 constraint c1 primary key(eid,ename),
 constraint c2 unique(sal),
 constraint c3 unique(overtime),
 constraint c4 check(sal>1000),
 constraint c5 check(eadd in('alex','mansoura','cairo')),
 constraint c6 check(overtime between 100 and 500),
 constraint c7 check(gender='M' or gender='F'),
 constraint c8 foreign key(Dnum) references Dept(did)
			on delete set null on update cascade
)

alter table emp drop constraint c7

alter table emp add constraint c10 check(hour_rate>1000)

---Constraint      New data   XXXXXXXXXXX
---Constraint      shared    XXXXXXXXXXX
---Constraint      Datatype  XXXXXXXXXXX
--Rules

alter table instructor add constraint c100 check(salary>1000)


create rule r1 as @x>1000

sp_bindrule r1,'instructor.salary'

sp_bindrule r1,'emp.overtime'

sp_unbindrule 'instructor.salary'

sp_unbindrule 'emp.overtime'

drop rule r1


create rule r1 as @x>1000
sp_bindrule r1,'instructor.salary'
sp_unbindrule 'instructor.salary'
drop rule r1

create default def1 as 5000
sp_bindefault def1,'instructor.salary'
sp_unbindefault 'instructor.salary'
drop default def1

--New data type       (int    default(5000)    condition>1000)

create rule r1 as @x>1000
create default def1 as 5000

sp_addtype NewDT,'int'

sp_bindrule r1,NewDt
sp_bindefault def1,NewDT

create table mytest
(
 eid int ,
 ename varchar(20),
 esal NewDT
)
-------------------------------------------
--------------------------------------------
select *
from student
where st_fname='ahmed'

select *
from student
where st_fname like 'ahmed'

_ one char
% zero or more char

select *
from student
where st_fname like '_a%'

'a%h'
'%a_'
'ahm%'
'[ahm]%'
'[^ahm]%'
'[a-h]%'
'[^a-h]%'
'[562]%'
'%[%]'      ddddddd%
'%[_]%'     xxxxx_gggg
'[_]%[_]'     _ahmed_

--Joins
--DB Integrity   constraints   Rules   Default   DT
--like
--getdate()   isnull   coalesce  year   concat  Convert

create table emps
(
eid int primary key identity(1,1),  --Auto Increament
ename varchar(20)
)

insert into emps
values('omar')


select * from emps


select netsal  from emp

=============================
--built in
getdate()
isnull
coalesce
year month day
--Concat


Select getdate()
Select year(getdate())
Select month(getdate())
Select day(getdate())

Select day('4/6/2000')

select dept_name,Manager_hiredate
from Department


select dept_name,year(Manager_hiredate)
from Department

select dept_name,year(getdate())-year(Manager_hiredate)
from Department

--Concat

Select st_fname+' '+st_age
from Student

Select isnull(st_fname,'')+' '+convert(varchar(20),isnull(st_age,0))
from Student

Select concat(st_fname,' ',st_age)
from Student


Select concat('stud name=',st_fname,'   &  age=',st_age)
from Student











