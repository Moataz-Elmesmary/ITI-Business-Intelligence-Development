create clustered index i2
on student(St_fname)

create nonclustered index i2
on student(St_fname)

create nonclustered index i3
on student(St_address)

select * from student
where st_id=1

select * from grades
where sid=1

--> Primary key constraint ---> clustered index
--> unique constraint -------->nonclustered index

create table test3
(
 id int identity,
 ssn int primary key,
 ename varchar(20),
 salary int unique,
 overtime int unique,
 constraint c100 check(salary>1000)
)

create unique index i5 ----> unique constraint + nonclustered index
on student(st_age)

create index i5 ----> nonclustered index  --default 
on student(st_age)

select * from Student where st_lname='mohamed'
select * from Instructor where Salary=8000
-------------------------------------------------->
--batch  script  transaction
----------------------------

--batch
--set of independent queries
insert 
update 
delete

--ddl
--script
--separated by go
create table
go
drop table
go
create funtion
go
sp_bindrule

--transaction
--set of dependent queries
--run as single unit of work

create table Parent (Pid int primary key)

create table child (cid int foreign key references parent(pid))

insert into Parent values(1)
insert into Parent values(2)
insert into Parent values(3)
insert into Parent values(4)

insert into child values(1)
insert into child values(22)
insert into child values(3)

begin transaction
	insert into child values(1)
	insert into child values(2)
	insert into child values(3)
rollback

begin try
	begin transaction
		insert into child values(1)
		insert into child values(2)
		insert into child values(3)
	commit
end try
begin catch
	rollback
	select ERROR_LINE(),ERROR_MESSAGE(),ERROR_NUMBER()
end catch


select * from child
truncate table child

--->transaction Properties  [ACID]

begin transaction
	insert
	truncate  --log file    explicit transaction
	update
	delete ---->error delete  rollback
-------------------------------------------------------

select convert(varchar(100),getdate())
select cast(getdate() as varchar(100))

select convert(varchar(100),getdate(),101)
select convert(varchar(100),getdate(),102)
select convert(varchar(100),getdate(),103)
select convert(varchar(100),getdate(),104)
select convert(varchar(100),getdate(),105)

select format(getdate(),'dd-MM-yyyy')
select format(getdate(),'dddd MMMM yyyy')
select format(getdate(),'ddd MMM yy')
select format(getdate(),'dddd')
select format(getdate(),'MMMM')
select format(getdate(),'hh:mm:ss')
select format(getdate(),'hh')
select format(getdate(),'hh tt')
select format(getdate(),'dd-MM-yyyy hh:mm:ss tt')

select format(getdate(),'dd')   --return string
select day(getdate()) --return int

select eomonth(getdate())
select format(eomonth(getdate()),'dd')
select format(eomonth(getdate()),'dddd')

select eomonth(getdate(),+2)
select eomonth(getdate(),-1)

-->Index
-->transaction
-->view
-->merge
-->curosr
-->Pivoting

--view
create view vstuds
as
	select * from student

select * from vstuds

create view vcairo(sid,sname,sadd)
as
	select st_id,st_fname,st_address
	from Student
	where St_Address='cairo'

select * from vcairo
select sname from vcairo

alter schema hr transfer vcairo
select * from hr.vcairo
alter schema dbo transfer hr.vcairo

drop table vcairo   XXXX
drop view vcairo

create view valex(sid,sname,sadd)
as
	select st_id,st_fname,st_address
	from Student
	where St_Address='alex'

select * from valex

create view vcairo_Alex
as
	select * from valex
	union all
	select * from vcairo

select * from vcairo_Alex
alter schema hr transfer vcairo_alex

--complex queries

alter view vjoin(sid,sname,did,dname)
with encryption
as
	select st_id,st_fname,d.dept_id,dept_name
	from student s inner join department d
	on d.dept_id=s.dept_id

sp_helptext 'vjoin'

select * from vjoin
select sname , dname from vjoin

create view vgrades
as
	select sname , dname , grade 
	from vjoin v inner join Stud_Course sc
	on v.sid =sc.St_Id

select * from vgrades

--DML + view
---view    one table
alter view vcairo(sid,sname,sadd)
as
	select st_id,st_fname,st_address
	from Student
	where St_Address='cairo'
with check option

insert into vcairo 
values(97,'ahmed','cairo')

insert into vcairo 
values(98,'ahmed','alex')

select * from vcairo

---view   multi tables
create view vjoin(sid,sname,did,dname)
as
	select st_id,st_fname,d.dept_id,dept_name
	from student s inner join department d
	on d.dept_id=s.dept_id

--delete XXXXXX
--insert , update
insert into vjoin(sid,sname)
values(93,'ali')

insert into vjoin(did,dname)
values(120,'hr')

update vjoin
	set sname='eman'
where sid=1


insert into vjoin
values(93,'ali',120,'hr')

update vjoin
	set sname='eman',dname='cloud'
where sid=1
----------------------------------------------
declare c1 cursor
for select st_id,st_fname from Student where St_Address='cairo'
for read only     
declare @id int,@name varchar(20)
open c1
fetch c1 into @id,@name
while @@FETCH_STATUS=0
	begin
		select @id,@name
        fetch c1 into @id,@name  ----counter++
	end
close c1
deallocate c1

--Array    string   --one cell    [ahmed,ali,amr........]
declare c1 cursor
for select distinct st_fname from Student where st_fname is not null
for read only
declare @name varchar(20),@all_names varchar(300)=''
open c1
fetch c1 into @name  
while @@FETCH_STATUS=0
	begin
		set @all_names=CONCAT(@all_names,',',@name)
		fetch c1 into @name 
	end
select @all_names
close c1
deallocate c1
-------------------------------------------------------
declare c1 cursor
for select salary from Instructor
for update
declare @sal int
open c1
fetch c1 into @sal
while @@FETCH_STATUS=0
	begin
		if @sal>=3000
			update Instructor
				set Salary=@sal*1.20
			where current of c1
		else if @sal<3000
			update Instructor
				set Salary=@sal*1.10
			where current of c1
		else
			delete from Instructor
			where current of c1
		fetch c1 into @sal
	end
close c1
deallocate c1
---------------------------------------
declare c1 cursor
for select ins_name from Instructor
for read only
declare @name1 varchar(20),@name2 varchar(20),@counter int=0
open c1
fetch c1 into @name1
while @@FETCH_STATUS=0
	begin
		if @name1='ahmed' and @name2='hany'
			set @counter+=1
		set @name2=@name1
		fetch c1 into @name1
	end
select @counter
close c1
deallocate c1
---------------------------------------------------
-->index
-->batch & transaction
-->view
-->pivoting
-->cursor
-->merge
create table lastt(Xid int,Xname varchar(20),Xval int) 

create table Dailyt(Yid int,Yname varchar(20),Yval int) 

Merge into Lastt as T
using  dailyt    as S
on T.Xid = S.Yid
when Matched then
	update
		set T.Xval = S.Yval
when not matched then
    insert
    values(s.yid ,s.yname ,s.yval)   
	
output $action;





























