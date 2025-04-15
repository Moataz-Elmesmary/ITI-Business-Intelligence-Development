use ITI

declare @x int=(select avg(st_age) from Student)
set @x=100
select @x=9
select @x

declare @y int
	select @y=st_age from Student
	where st_id=1
select @y

declare @y int=1000
	select @y=st_age from Student
	where st_id=-1
select @y

declare @y int
	select @y=st_age from Student
	where St_Address='cairo'
select @y

--Array  --table variable
declare @t table(col1 int) ---> 1D array of integers
	insert into @t
	values(5),(9),(10)
select * from @t

declare @t table(col1 int) ---> 1D array of integers
	insert into @t
	select st_age from student where St_Address='cairo'
select * from @t
select count(*) from @t

declare @t table(col1 int,col2 varchar(10)) ---> 2D array
	insert into @t
	select st_age,st_fname from student where St_Address='cairo'
select * from @t
select count(*) from @t

declare @x int,@name varchar(30)
	select @x=st_age ,@name=st_fname from student
	where st_id=4
select @x,@name

declare @sal int
	update Instructor
		set ins_name='ahmed' , @sal=salary
	where ins_id=4
select @sal

---> dynamic queries

declare @par int=4

select * from Student
where st_id=@par

declare @par int=1

select top(@par)*
from student

--dynamic query    metadata
declare @col varchar(20)='*',@t varchar(20)='student'
select @col from @t

declare @col varchar(20)='*',@t varchar(20)='instructor'
execute('select '+@col+' from '+@t) 

declare @col varchar(20)='ins_name',@t varchar(20)='instructor',@cond varchar(20)='salary>8000'
execute('select '+@col+' from '+@t+' where '+@cond)

select 'select * from student'
execute('select * from student')

--Global var
select @@SERVERNAME
select @@VERSION

update Instructor set Salary+=100
select @@ROWCOUNT

select st_age from Student where st_age>26
select @@ROWCOUNT

select @@ROWCOUNT

select * from Student where st_age>26
go
if @@ERROR=156
	select 'invalid data'

insert into test values('khalid')
select @@IDENTITY


begin try
	delete from topic where top_id=1
end try
begin catch
	select 'table has relation'
end catch

------------------------------------------
--control of flow statments
--if
declare @x int
	update Instructor set Salary+=100
select @x=@@ROWCOUNT
if @x>0
	begin
		select 'multi rows affected'
		select 'welcome to ITI'
	end
else 
	begin
		select 'zero rows affected'
	end

--begin end
--if exists

if exists(select name from sys.tables where name='myexam')
	select 'table is existed'
else
	create table myexam
	(
	id int,
	name varchar(10)
	)

if not exists(select top_id from course where top_id=10)
	delete from topic where top_id=10
else
	select 'invalid query'

--while
--continue break
declare @x int=10    --memory=10
	while @x<20
		begin
			set @x+=1    --memory=16
			if @x=14
				continue   --->while
			if @x=16
				break  --exit
			select @x    ---display 11 ,12 , 13 ,15
		end
--case iif
select ins_name , salary,
                 case
					when salary>=5000 then 'high salary'
					when salary<5000 then 'low'
					else 'no data'
				 end  as Newcol
from Instructor

select ins_name , iif(salary>=5000,'high','low')
from Instructor

update Instructor
	set salary=Salary*1.20

update Instructor
	set salary=
	           case
			     when salary>=5000 then Salary*1.20
				 else Salary*1.10
			   end

--waitfor
--choose
---------------------------
--user defined functions
---->scalar
--function      fun_name   Parameters   return  body
create function getsname(@sid int)
returns varchar(30)
	begin
		declare @name varchar(30)
			select @name=st_fname from Student
			where st_id=@sid
		return @name
	end
--calling
select dbo.getsname(10)
alter schema hr transfer getsname
select hr.getsname(4)
alter schema dbo transfer hr.getsname
drop function getsname

declare @x varchar(10)
	set @x='fdsfsdfsdfsdfdfsdf'   --no error   --truncate string

column varchar(10) fdsfsdfsdfsdfdfsdf   error

---->Inline
create function getinst(@did int)
returns table
as
	return
		(
		 select ins_name,salary*12 as annualsal
		 from Instructor
		 where Dept_Id=@did
		)
--calling
select * from getinst(10)
select ins_name from getinst(10)
select sum(annualsal) from getinst(20)

---->multi
create function getstuds(@format varchar(100))
returns @t table
            (
			 id int,
			 sname varchar(20)
			)
as
	begin
		if @format='firstname'
			insert into @t
			select st_id,st_fname from Student
		else if @format='lastname'
			insert into @t
			select st_id,st_lname from Student
		else if @format='fullname'
			insert into @t
			select st_id,concat(st_fname,' ',st_lname) from Student
		return 
	end
--calling
select * from getstuds('fullname')
select id,sname as fullname from getstuds('fullname')

----------------------------------------------------
--string functions
select concat('ahmed',234,'1/1/2000',NULL,543.44)
select concat_ws(' & ', 'ahmed',234,'1/1/2000',NULL,543.44)

select trim('   st_fname   ')
select Ltrim('   st_fname   ')
select Rtrim('   st_fname   ')

select REVERSE('ahmed')

select REPLICATE('ahmed',3)

select REPLICATE(st_fname,3)
from Student

select CHARINDEX('a','mohamed')
select CHARINDEX('z','mohamed')

select CHARINDEX('a',st_fname) ,st_fname
from Student

select REPLACE('ahmed$gmail.com','$','@')

select stuff('ahmedomarkhalid',6,4,'ali')

select st_fname+space(6)+st_lname
from Student

select len(st_fname)
from Student

select substring(st_fname,1,3)
from Student

select *
from Student
where len(st_fname)>4

select OBJECT_ID('student')

select OBJECT_ID('students')

select isdate('1/1')
select isdate('1/1/2000')

select ISNUMERIC('323d')
select ISNUMERIC('323')

--math
sin cos tan log power sqrt

































