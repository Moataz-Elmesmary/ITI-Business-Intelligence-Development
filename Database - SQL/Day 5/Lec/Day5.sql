--transact-SQL
--top
select * from student

select * from student
where St_Address='cairo'

select top(2)*
from student

select top(1)*
from student

select top(1)*
from student
where St_Address='alex'


select top(5) st_fname
from student
where St_Address='alex'

select max(salary)
from Instructor

--from   select  order   top
select top(2) salary
from Instructor
order by Salary desc


--Newid  --GUID
select newid()

select * , newid() as Xid
from Student
order by Xid

select top(1)*
from Student
order by newid()

--fullpath object
--Servername.DBNae.SchemaName.ObjectName

select *
from Student

select *
from  [Rami].ITI.dbo.student


select * 
from Company_SD.dbo.Project

select dept_name from Department
union all
select dname from Company_SD.dbo.Departments


select *
from (select * , Row_number() over(order by st_age desc) as RN
      from student) as X
where RN=1


select *
from (select * , Dense_rank() over(order by st_age desc) as DR
from student) as X
where DR=1

select *
from (select * , Ntile(3) over(order by st_age desc) as G
       from student) as X
where G=1


select *
from (select * , Row_number() over(Partition by dept_id order by st_age desc) as RN
      from student) as X
where RN=1


select *
from (select * , Dense_rank() over(Partition by dept_id order by st_age desc) as DR
from student) as X
where DR=1


-------------------------
select *
from (select * , Ntile(2) over(Partition by dept_id order by st_id desc) as G
       from student) as X
where G=1 


-------------------------
select *
from (select * , Ntile(2) over(Partition by dept_id order by st_id desc) as G
       from student) as X
where G=2

-----------------------
--Configuration
--Instance
--types of instances
--types of authentication
--Transact-SQL
Top   newid  Ranking    fullpath  selectinto   insertbasedonselect

--ddl
--create table from existing one
select * into tab2
from  student

select * into tab3
from  student

select * into company_sd.dbo.student
from  student

select st_id,st_fname into tab5
from Student
where st_age>25

select * into tab7
from student
where 1=2   --false condition   st_age<0

--insert based on select
--insert   DML
insert into tab5
values(1,'ahmed')

insert into tab5
values(5,'ahmed'),(8,'eman'),(9,'ali')

insert into tab5
select st_id,st_fname from Student where St_Address='alex'

--bulk insert
--insert data from file
bulk insert tab5
from 'f:\ITIstuds.txt'
with(fieldterminator=',')



