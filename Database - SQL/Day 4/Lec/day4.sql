use ITI

select salary
from Instructor

select Sum(salary) as Total
from Instructor

select count(ins_id) as Cnt
from Instructor

select min(salary),max(salary)
from Instructor

select count(*),count(st_id),count(st_fname),count(st_age)
from Student

select avg(st_age)
from Student

select avg(isnull(st_age,0))
from Student

select sum(st_age)/count(*)
from Student

select sum(salary),dept_id
from Instructor
group by Dept_Id

select sum(salary),d.dept_id,dept_name
from Instructor i inner join Department d
	on d.Dept_Id = i.Dept_Id
group by d.dept_id,dept_name

select count(st_id),dept_id
from Student
group by Dept_Id

select count(st_id),st_address
from Student
group by St_Address

select count(st_id),dept_id,St_Address
from Student
group by Dept_Id,St_Address

select sum(salary),dept_id
from Instructor
group by Dept_Id

select sum(salary),dept_id
from Instructor
where Salary>1000
group by Dept_Id

select count(salary),dept_id
from Instructor
group by Dept_Id

select count(salary),dept_id
from Instructor
where Salary>1000
group by Dept_Id


select sum(salary),dept_id
from Instructor
group by Dept_Id

select sum(salary),dept_id
from Instructor
group by Dept_Id
having sum(salary)>30000

select sum(salary),dept_id
from Instructor
group by Dept_Id
having count(ins_id)>6


select sum(salary)
from Instructor
having count(ins_id)>100

-->execution order
----from
----join
----on
----where
----group by
----having
----select
----order by
----top
----into
----------------------------------------------------
--subqueries
select *
from Student
where st_age<(select avg(st_age) from Student)

select *,(select count(st_id) from Student)
from Student

select dept_name
from Department
where Dept_Id in ( select distinct dept_id
                   from Student
				   where Dept_Id is not null)

select distinct dept_name
from Student s inner join Department d
	on s.Dept_Id=d.Dept_Id

--subquery + DML
--delete + subquery
delete from Stud_Course
where st_id=1

delete from Stud_Course
where crs_name in('html','oop')

delete from Stud_Course
where crs_id in(select crs_id from Course where crs_name in('html','oop'))

--set operators
union all   union   intersect   except

select st_fname
from Student
union all
select ins_name
from Instructor

select st_fname,st_id
from Student
union all
select ins_name ,ins_id
from Instructor

select convert(varchar(20),st_id)
from Student
union all
select ins_name
from Instructor


select st_fname as [ITInames]
from Student
union all
select ins_name
from Instructor

select st_fname
from Student
union --distinct    order + unique
select ins_name
from Instructor

select st_fname
from Student
intersect
select ins_name
from Instructor

select st_fname
from Student
except
select ins_name
from Instructor

--grouping 
--subqueries
--set operators
-----------------------------------------
select st_fname , dept_id , st_age
from Student
where St_Address='alex'

select st_fname , dept_id , st_age
from Student
order by st_address

select st_fname , dept_id , st_age
from Student
order by 1

select st_fname , dept_id , st_age
from Student
order by dept_id desc,st_age asc

select st_fname+' '+st_lname as fullname
from Student
order by fullname 

select st_fname+' '+st_lname as fullname
from Student
where fullname ='ahmed hassan'

select st_fname+' '+st_lname as fullname
from Student
where st_fname+' '+st_lname ='ahmed hassan'

select *
from (select st_fname+' '+st_lname as fullname 
      from Student) as newtable
where fullname ='ahmed hassan'

create table test
(
 id int primary key identity, --autoincreament
 ename varchar(20)
)

insert into test values('khalid')

select * from test

delete from test

truncate table test

dbcc check_ident('test',reseed,0)

create table test2
(
 id int identity, --autoincreament
 ssn int primary key,
 ename varchar(20)
)

insert into test2 values(555,'ahmed'),(6666,'ali'),(9999,'eman')

select * from test2


drop table test


drop table student   --DDL    data & metadata

delete from student  --DML  data  where slower  log  rollback 
                     --child   parent

truncate table student --data faster --sometime log   --can't rollback
                       --reset identity  --child   --ddl 







