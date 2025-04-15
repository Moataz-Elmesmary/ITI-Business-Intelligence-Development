--------------------------------------------------------------------
--Variables
--Local and Global variables:
--What is variable?
--Why?
----To facilitate repeated use of constant values
----To return custom messages to the client that contain variable information
----To pass information to and from a stored procedure
----To avoid using a subquery.

--Local variables:
----What is the meaning of local?
----Variables are local to the batch, stored procedure, or trigger in which they are declared
		--local variable must begin with @.
		--must has data type
		--intial value = NULL

--Declare variable:
	Declare @x int

--Assign value		4ways
	Set @x=10
	Select @x=20
	Select @x=id from employee where ……
	Update employee set name='ahmed' , @x=id where salary=1000

--Using variable
	Select * from employee where id=@x
	
	
--View variable value
	Select @x

--Notes:
--	1-Missing declaration.
--	2-Mismatch date types.
--	3-if select has no result -------------- @x remains unchanged.
--	4-if select has multiple rows -------- @x retains the last value.
--	5- Variables can be used only in place of constants.

--What is new in variables
--declare variable default argument
 DECLARE @MyName varchar(20)=’Michael’
 -- Declare variable and initialize using query
DECLARE @max_pay_rate DECIMAL(15, 2) = (SELECT MAX(pay_rate)
                                        FROM PayRates);

--compound assignment "short hand operators"
DECLARE @MyNumber int = 2
SET @MyNumber += @myNumber

--top with variables
declare @top int
set @top=2
select Top(@top)* from Student

--Global variables:
--	defined by server.
--	begin with @@.
--	cann't be created by user
--	cann't assigned a value by user
--	local to server or connection

--Common global variables:
select	@@rowcount  ---number of rows affected.
select	@@error  --------0 or num of error message.
--Note: 
Select @@error must be executed in a single batch.

select	@@identity -----NULL or Returns the value last inserted IDENTITY column
select	@@version  ----- version of the DBMS.
select @@servername

--Examples:
--	Note: DB has no table called stud
	
Select * from stud
	Select @@error       --returns error message number

	Select * from student where 1=2
	Select @@error       --returns 0

--Dynamic SQL:
	
Declare @col_list nvarchar(100)='*',@table_name nvarchar(100)='student'
	exec('select ' + @col_list + ' from ' + @table_name)
	
--Note:
--Variables used in the execute statement must be char or nvarchar.
		--Variables can be used only in place of constants.
			Select * from @table_name  ----- generate errors.
		
--Control-of-Flow Statement:
--if...else
--begin...end
--if exists
--("statment must has no errors" and then check if executed or not)
--while
--break         exit while
--continue    go to while
--return	exit the batch or stored procedure
--case

--Operators:
--                      < , > , <= , >= , = , <> , and , or

--Examples:
--      1)IF
declare @num_rows  int
	delete from student where st_id=190
	select @num_rows = @@rowcount
	if @num_rows = 0
			select  'No rows were deleted.'
	Else if @num_rows = 1
			select  'One row was deleted.'
	Else
			select ' Multiple rows were deleted.'

 --    2)While
	-- While the average price is greater than
	-- $20, this loop cuts all prices in half.
	-- However, if the maximum price falls below
	-- $40, the loop is immediately terminated.

while (select avg(price) from titles) > $20
		begin
		   update titles
			set price = price / 2
		   if (select max(price) from titles) < $40
			break
		end
--3) If exists
if exists(select 1 from sys.tables where name='studen')
select * from studen
--Message statements:
--	Select
--	Print
--	Raiserror           assignments

--select
--	Returns result set:
		Select col_list 			table date
		Select @x			variable of any type
	 	Select 'any string'		text
--print
	Returns debugging message
		Print 'string'		text
		Print  @x 	          variable only char or can be converted to char 
	
sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'<<%7.3s>>';
GO
RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           N'abcde'); -- First argument supplies the string.
-- The message text returned is: <<    abc>>.
GO
sp_dropmessage @msgnum = 50005;

--types of function--
------------------------

--1)isnull function

select upper(st_fname) from student
select lower(st_lname) from student

--2)convet function
select st_id from student 
where st_fname='ahmed' --Ahmed

select 	st_id from student where st_age like 20

select 	st_id from student where st_age like 2%

select 	st_id from student where convert(nvarchar(10),st_age) like '2%'

select convert(nvarchar(20),hiredate,3)
from instructor --1:5

select t_id from instructor 
where convert(nvarchar(50),hiredate,3) like '01%'

select * from Department 
where cast([Manager_hiredate] as varchar(40)) like '%1'
--3)system function
select db_name()

--4)aggregate function

--5)date
select getdate()

select datename(dd,hiredate) from Department

select datename(mm,hiredate) from Department

select datename(yy,hiredate) from Department

select datename(mm,getdate())

--6)string

select lower(st_fname) from student
select lower(st_lname) from student
select substring(st_fname,1,5) from student  --start--length 

--7)math
select sin(100)
select power(100,2)

--types of built in functions

--scalar funcion
--return oe vales
--all perviouse functions are scalar function

alter function getname(@sid int)
returns nvarchar(20)
begin
declare @name nvarchar(20)
	if @sid > 0
		select @name=st_fname from student 
		where st_id=@sid
	else
		set @name='sid must be positive'
return @name 	
end 


select dbo.getname(-1) as "name"
 
print dbo.getname(-1)

--table_valued function
--return table as a result of select statment

create function highage()
returns table
as 
return
(
select st_fname,st_age from student where st_age>=20 
)

select * from dbo.highage()

--multi_statment table-valued function
--return a new table as a result of insert statment 

create function student_names(@format nvarchar(50)) 
returns @t table
		(
		 student_id int primary key,
		 student_name nvarchar(50)
		)
as
begin
	if @format='fullname'
		insert @t
		select st_id,st_fname+' '+st_lname 
		from student
	else
	if @format='firstname'
		insert  into @t
		select st_id,st_fname
		from student
return
end

select * from student_names('fullname')

select * from student_names('firstname')


create function myday(@x datetime)
returns nvarchar(20)
as
begin
declare @d nvarchar(20)
select @d=datename(mm,@x)
return @d
end

select dbo.myday(02/02/2000)


--------------------------------------------------------------------
--Batch, transaction and script
--Batch
--a series of one or more statements submitted and executed at the same time and don't depend on each others.

update student set sname='ahmed' where sid=5    
insert into student values(66,'toto')		

--script set of patches separated with go statment
--for displine

select * from Student where St_Id=66
--Transaction
--a series of one or more data statements that executed as a unit or are aborted as a unit
--A transaction is a logical unit of work
--	Defined from business rules
--	Typically includes at least one data modification
--	Maintains DB consistency.
--What is:
--	Commit
--	Rolled back
--	Save point	savepoint allows for partial rollbacks


--Examples

--commit and rollback example	

use ITI	
		            	--determine which db to use
begin tran t1
declare @r int
update student set St_Fname='ahmed' where St_Id=5    --there is no errors
insert into student(St_Id,St_Fname) values(66,'toto')		--error so rollback
set @r=@@error   --look to the last statment only
if @r = 0
	begin
	commit tran
    select 'true'
	end
else
	begin
	rollback tran
	select 'false'
	end
------------------------------------------------------------------

--try and catch

create table parent
(
pid int primary key not null
)

create table child
(
cid int references parent(pid)
)

insert into parent values(1)
insert into parent values(2)
insert into parent values(3)
insert into parent values(4)

begin tran
insert into child values(1)
insert into child values(5)
insert into child values(2)
commit tran --commit the correct statment only

begin tran
insert into child values(1)
insert into child values(5)
insert into child values(2)
rollback tran --rollback all statments if there is error


begin tran
insert into child values(1)
insert into child values(2)
insert into child values(5)
if @@error!=0
	rollback tran
else 
	commit

select * from parent
select * from child

delete from child


begin try
	begin tran
		insert into child values(1)
		insert into child values(5)
		insert into child values(2)
	commit tran
	print 'transaction commited'
end try
begin catch
	rollback
	print 'transation rolled back'
	select error_number() as "number",
	error_message() as "message",
	error_line() as "line"
end catch

--save point

delete from child

declare @test int
begin try
	begin tran mytran
		insert into child values(1)
		insert into child values(2)
		insert into child values(3)
		set @test=1
	save tran save1	
		insert into child values(2)
		insert into child values(3)
		insert into child values(4)
		set @test=2
	save tran save2
		insert into child values(3)
		insert into child values(4)
		insert into child values(5)
		
	commit tran
	print 'transaction commited'
end try
begin catch
	if @test is null 
		rollback tran mytran
	else 
	if @test =1
		rollback tran save1
	else 
	if @test =2
	rollback tran save2
end catch

select * from child
delete from child

--nested transaction
--Using try/catch
begin try
	select 1/0
end try
begin catch
	print 'Error'
	select ERROR_MESSAGE() 'Error Message'
	,ERROR_NUMBER() 'Error Number'
	,ERROR_LINE () 'Error Line Number'
	,ERROR_SEVERITY () 'Error Severity Level'
	,ERROR_PROCEDURE() 'Error Procedure'
	,ERROR_STATE () 'Error State'
end catch
--------------------------------------------------------------------
use ITI
begin try
	insert into Student(st_id) values(100) 
end try
begin catch
	--select 'error student id already exist'
	RAISERROR (N'This is message %s %d.', -- Message text.
           10, -- SeverityLevel,
           1, -- State,
           N'number', -- First argument.
           1)-- Second argument.
           with log--in case of fatal error to log the event; 

end catch					
--------------------------------------------------------------------
declare @msgnum int,
@severity int
,@msgtext nvarchar(30)
go
sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'<<%7.3s>>';--7char displayed,take 1st 3char from msg
GO
RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           N'abcde'); -- First argument supplies the string.
-- The message text returned is: <<    abc>>.
GO
sp_dropmessage @msgnum = 50005;
GO

select * from sys.messages
where message_id=50005
 