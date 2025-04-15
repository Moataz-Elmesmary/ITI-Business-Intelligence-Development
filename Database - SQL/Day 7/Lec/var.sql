declare @x int=(select avg(st_age) from student)
set @x=100
select @x=8
select @x

declare @y int,@name varchar(20)
select @y=st_age,@name=st_fname from Student
where st_id=8
select @y,@name


declare @y int=100
select @y=st_age from Student
where st_address='alex'
select @y


declare @t table(x int,y varchar(20))
insert into @t
select st_age,st_fname from Student
where st_address='alex'
select * from @t

declare @y int=2
select top(@y)*
from student


declare @col varchar(20)='ins_name'
       ,@t varchar(30)='instructor'
execute('select '+@col+' from '+@t)


execute( 'select * from Student')

--Global
select @@SERVERNAME


update student
set st_age+=1
select @@rowcount

select * from topic
select @@ROWCOUNT
select @@ROWCOUNT

select * from topic
go
select @@error

create table test1
(
id int identity,
name varchar(20)
)

insert into test1 values('eman')
select * from test1

select @@identity

---Control of flow statments
--if
declare @x int=10
if @x>0
	begin 
	select 'x>0'
	end
else
	select 'x<0'

--if exists

if exists(select name from sys.tables where name='student')
	select * from student
else
	select 'invalid table'

if not exists(select dept_id from student where dept_id=100)
	if not exists(select dept_id from instructor where dept_id=100)
		delete from Department
		where dept_id=100

begin try
		delete from Department
		where dept_id=10
end try
begin catch
	select 'Dept has relationship'
	select ERROR_LINE(),ERROR_MESSAGE(),ERROR_NUMBER()
end catch


declare @x int=10
while @x<20
	begin
		select @x+=1
		if @x=14
			continue
		if @x=16
			break
			select @x
	end




--begin
--end
--while
--continue
--break
--case
select ins_name,
			case
			when salary>2000 then 'low sal'
			when salary<=2000 then 'high'
			when dept_id=10 then 'xxxxxxxxxx'
			else 'No Data'
			end
from instructor




select ins_name,
			case gender
				when 'm' then 'Male'
				when 'f' then 'female'
				
			end
from Instructor



update instruct




or
	set salary=
			case 
			when salary>=3000 then salary*1.30
			else salary*1.20
			end
where salary is not null

--iif
--choose
--waitfor

--Built in functions
select Coalesce(st_fname,st_lname,'Nodate')
from student

isnull
nullif----

select db_name()
select suser_name()


select st_fname+convert(varchar(20),st_age)
from student

select st_fname+cast(st_age as varchar(20))
from student

select convert(varchar(30),getdate(),101)
select convert(varchar(30),getdate(),102)
select convert(varchar(30),getdate(),104)

select dept_name,format(Manager_hiredate,'yyyy')
from Department

select format(getdate(),'MM')

select month(getdate())
 
 select concat(st_fname,' ',st_age,NULL)
 from Student

 select max(st_age)
 from Student

 select count(st_id),count(st_lname)
 from Student

 select power(salary,2)
 from Instructor

 select len(st_fname)
 from Student

 select substring(st_fname,1,3)
 from Student

 --scalar
 --string getsname(int id)
 alter function getsname(@id int)
 returns varchar(30)
 begin
	declare @name varchar(30)
	select @name=st_fname
	from Student
	where st_id=@id
	return @name
 end

 select dbo.getsname(1)

 alter schema hr transfer dbo.getsname

 select *
 from Instructor
 where ins_name=dbo.getsname(1)



 select *
 from company.dbo.project

 --inline
 create function getins(@did int)
 returns table
 as
 return
 (
  select ins_name,salary*12 as total
  from Instructor
  where dept_id=@did
 )

 select ins_name from getins(10)
where total>9000
 --multi
 create function getstuds(@format varchar(10))
 returns @t table
			(
			 id int,
			 name varchar(30)
			)
AS
BEGIN
	if @format='first'
		insert into @t
		select st_id,st_fname from Student
	else if @format='last'
		insert into @t
		select st_id,st_lname from Student
	else if @format='full'
		insert into @t
		select st_id,st_fname+' '+st_lname from Student
return 
END

select * from getstuds('FULL')

