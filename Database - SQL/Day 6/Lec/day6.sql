delete from dept where did =10

update dept
	set did=100
where did=20

--SchemaName.Objectname
--default schema dbo
--sqlserver schema
--logical group of object
create schema HR

create schema sales

alter schema hr transfer student

alter schema hr transfer instructor

alter schema sales transfer department

select * from hr.student

create table student
(
esid int,
ename varchar(10)
)

select * from student

create table sales.student
(
esid int,
ename varchar(10)
)

select * from sales.student


select * from student
select * from dbo.student

----------------------------
--Server
---DB
--schema
--objects [tables-functions -views]
-------------------------------

alter schema dbo transfer hr.instructor

alter schema dbo transfer sales.department



use AdventureWorks2012

select * from HumanResources.employeeDepartmenthistory


use ITI

select * from AdventureWorks2012.HumanResources.employeeDepartmenthistory

alter synonym EH
for AdventureWorks2012.HumanResources.employeeDepartmenthistory

select *
from EH

---------------------------------------------
select * into hr.course
from course

alter schema hr transfer course

-----------------------------------
--create DB
--Properties DB table column relationship
--schema    sysnonym
-----------------------------------
--builtin functions
select upper(st_fname),lower(st_lname) 
from student

select len(st_fname),st_fname
from Student

select substring(st_fname,1,3)
from Student

select substring(st_fname,3,3)
from Student

select substring(st_fname,1,len(St_fname)-1)
from Student

select *
from Student
where len(St_fname)>4

select top(1) st_fname
from student
order by len(st_fname) desc

select trim('     ahmed  ')
select ltrim('     ahmed  ')
select Rtrim('     ahmed  ')

select REPLICATE(st_fname,3)
from Student

select REVERSE(st_fname)
from Student

select CHARINDEX('m','ahmedhassan')

select patiNDEX('%[d]h%','ahmedhassan')




--math
sin cos tan log power

select power(salary,2)
from Instructor

select abs(-5)

select pi()

select SQRT(25)

select isdate('1sdfsd')

select ISNUMERIC('hdhsd')

--Aggregate function
count Max Min avg
------------------------------
create table depts
(
 did int Primary key,
 dname varchar(20)
)

create table emps
(
 eid int identity(1,1),
 ename varchar(20),
 eadd varchar(20) default 'cairo',
 hiredate date default getdate(),
 bd date,
 age as year(getdate())-year(bd),
 salary int ,
 overtime int,
 netsal as (isnull(salary,0)+isnull(overtime,0)) persisted,
 gender varchar(1),
 hour_rate int not null,
 dnum int,
 constraint c1 primary key(eid,ename),
 constraint c2 unique(salary),
 constraint c3 unique(overtime),
 constraint c4 check(salary>1000),
 constraint c5 check(overtime between 100 and 500),
 constraint c6 check(gender='f' or gender='m'),
 constraint c7 check(eadd in('alex','mansoura','cairo')),
 constraint c8 foreign key(dnum) references depts(did)
     on delete set null on update cascade
)

alter table emps drop constraint c3

alter table emps add constraint c9 check(hour_rate>1000)

--->constraint ---->new data  XXXXXXX
--->constraint ---->shared between table  XXXXX
--->constraint ---> new data type XXXXX

alter table instructor add constraint c10 check(salary>1000)

---> Rule  --->Global check constraint
------>condition (shared) (newdata)
create rule r1 as @x>1000

sp_bindrule r1,'instructor.salary'
sp_bindrule r1,'emps.overtime'

sp_unbindrule 'instructor.salary'
sp_unbindrule 'emps.overtime'

drop rule r1

----------------------------------------------------
create default def1 as 5000

sp_bindefault def1,'instructor.salary'

sp_unbindefault 'instructor.salary'

drop default def1
-------------------------------------------
--create new data type    int     value>1000   default 5000
sp_addtype complexdt ,'int'

create rule r1 as @x>1000

create default def1 as 5000

sp_bindrule r1,complexdt

sp_bindefault def1,complexdt   

create table mystaff
(
 id int,
 name varchar(10),
 salary complexdt
)

/*
alter table mystaff alter column salary bigint
alter table mystaff alter column salary complexdt
*/
---------------------------------------
-------------------------------------------------------------------------------------------------------
------------------------------------Advanced Queries--------------------------------------------------
--identity column with insert	
--only one identity column in the table not allowed for mutiple identities
CREATE TABLE dbo.T1 ( column_1 int, column_2 VARCHAR(30),
					column_3 int IDENTITY primary key);
GO

SELECT * FROM T1

delete from t1 where column_3 between 2 and 19

INSERT T1 VALUES (100,'omar')


INSERT T1 (column_2) VALUES ('Row #2');
GO
SET IDENTITY_INSERT T1 ON;
SET IDENTITY_Insert T1 off;
GO
INSERT INTO T1 (column_3,column_1,column_2)  VALUES 
(600,1, 'Explicit identity value');
GO

select @@IDENTITY

select SCOPE_IDENTITY()

select IDENT_CURRENT(t1)


dbcc checkident(t1,RESEED,1)

dbcc checkident(t1,RESEED,15)

dbcc checkident(t1,RESEED,102)

truncate table t1

--Identity limitations
----The IDENTITY column of a table contains a unique, system-generated ID number for each row in the table
----Adaptive Server stores in memory blocks of potential ID numbers for each table
----It stores the last-used value and the block’s maximum value
--Tables with infrequent inserts may show large (numeric) gaps in the IDENTITY column
----If a table insert fails, the assigned ID value is lost
----If the server shuts down abnormally, the as-yet-unused values of the current block are lost
--You can set block size for a given table at table creation time using with identity_gap.  
--For a table that will have relatively few inserts, set a low block size to limit 
--potential gaps in the IDENTITY column 

--SHOW IDENTITY COLUMN    
select AddressID from Person.Address
select Address.$IDENTITY from person.Address


--@@identity 
----returns the last identity value produced by the current 
----connection regardless of the insert was explicitly or implicitly

--Scope_identity()
----returns the last identity value that u explicitly created
----by the current connection

--IDENT_Current('table_Name') 
----returns the last actual identityvalue in table,regardless
---- of the connection 


USE tempdb
go

CREATE TABLE MyCurrent
(id INT IDENTITY(1,1) PRIMARY KEY ,NAME VARCHAR(50))


CREATE TABLE MyTrigger
(id INT IDENTITY(100,5) PRIMARY KEY ,NAME VARCHAR(50))

CREATE TRIGGER t1
ON myCurrent
AFTER INSERT
as

INSERT INTO mytrigger VALUES('omar')



INSERT INTO mycurrent VALUES('ahmed')



SELECT @@IDENTITY

SELECT SCOPE_IDENTITY()

SELECT IDENT_CURRENT('MyCurrent')


CREATE UNIQUE INDEX i1 ON mycurrent(name)

INSERT INTO mycurrent VALUES('ahmed') --fail

SELECT @@IDENTITY

SELECT SCOPE_IDENTITY()

SELECT IDENT_CURRENT('MyCurrent')


INSERT INTO mycurrent VALUES('ahmed1')

SELECT @@IDENTITY

SELECT SCOPE_IDENTITY()

SELECT IDENT_CURRENT('MyCurrent')

--note use the same 4 statments in new connection and see what is the results

--how to reset identity
--1)using truncate statment
--2)use insert_identity on then off
--3)use dbcc checkident

dbcc checkident(tableNAME,RESEED,1)

DELETE FROM mycurrent

INSERT INTO mycurrent VALUES('ahmed22')

SELECT SCOPE_IDENTITY()


truncate table mycurrent

INSERT INTO mycurrent VALUES('ahmed24')

SELECT SCOPE_IDENTITY()










