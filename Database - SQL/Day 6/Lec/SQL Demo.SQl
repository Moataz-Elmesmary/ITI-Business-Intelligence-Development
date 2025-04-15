--Sparse Columns
----Sparse columns are another addition to the SQL Server 2008 tool belt. They offer a good trade-off for many applications: taking no space if they are empty and more space if they have data. In other words they optimize storage for NULL values.
----Sparse columns are just like ordinary columns with a few limitations. They are defined with the SPARSE keyword and there is no difference on how they are used in data manipulation statements.

--Here are the details:

--Pros:
--• Storing NULL in a sparse column takes up no space at all
--• Up to 30,000 columns
--• To any external application the column will behave the same
--• Sparse columns fit well with filtered indexes to index on non-NULL values

--Cons:
--• If a sparse column has data it takes 4 more bytes than a normal column
--• Not all data types can be sparse: TEXT, NTEXT, IMAGE, TIMESTAMP, user-defined data types, GEOMETRY, GEOGRAPHY, and VARBINARY(MAX) with the FILESTREAM attribute
--• Computed columns cannot be sparse
--• Cannot have default values

CREATE TABLE Survey (
      survey_nbr INT NOT NULL PRIMARY KEY,
      survey_desc VARCHAR(30),
      survey_info1 VARCHAR(30) SPARSE NULL)
      
--Database creation
CREATE DATABASE sample;

--creates a database with explicit specifications for
--database and transaction log files.
--Because the PRIMARY option is omitted
--the first file is assumed as the primary file
--If the MAXSIZE option is not specified
--or is set to UNLIMITED, the file will grow until the disk is full
--if ON exists all files of db must be specified
CREATE DATABASE projects
ON (NAME=projects_dat,
FILENAME = 'd:\db\pro.mdf'
)

USE master;
CREATE DATABASE projects
ON (NAME=projects_dat,
FILENAME = 'd:\db\projects2.mdf',
SIZE = 10,
MAXSIZE = 100,
FILEGROWTH = 5)
LOG ON
(NAME=projects_log,
FILENAME = 'd:\db\projects2.ldf',
SIZE = 40,
MAXSIZE = 100,
FILEGROWTH = 10);

drop database projects

				/** MetaData Fn (scalar fn.) **/
select DB_ID()

SELECT DB_NAME() AS 'database'    
--select name of the current Database

exec sys.sp_databases

--retrieve info about DB
--Returns one row for each file of a database
--ay 7aga sys. 3bara 3an views
select * 
from sys.database_files
									------------------
use master
select * from sys.databases
									------------------
--Returns one row for each column of an object that contains columns
--(for example, a table or a view)a row of each column in that table
--columns of the same table will have the same obj_id
select * 
from sys.columns

select * 
from sys.tables

select * 
from sys.schemas
									------------------
--To check the value of a specific db property
SELECT DATABASEPROPERTY
('iti', 'IsAutoShrink');
									------------------	
--Retrieve Info about all objects
sp_help

--Retrieving Info about all dbs
sp_helpdb

--Retrieving Info about a specific db
sp_helpdb iti2

--To retrieve info. about a specific Table (schema,columns,keys,indexes)
sp_help student

--To retrieve info. about a specific DataType
sp_help nvarchar
/*Type_name:nvarchar		Storage_type:nvarchar
    Length: 8000					Prec :4000
    Scale:NULL					Nullable:  yes
    Default_name:none		Rule_name:  none
    Collation:SQL_Latin1_General_CP1_Cl_AS 
*/
								------------------
--Retrieving Info about the db size, unallocated space
--data size, index size, free "unused" space
sp_spaceused 
								------------------
									------------------------	
				

use test
create table dept
(
did int primary key,
name text
)

create table emp
(
eid int  not null,
ename nvarchar(50),
esal int,
constraint c1
check (esal>100)
,
eadd nvarchar(50) default 'cairo'
,
constraint c2
check (eadd in ('cairo','alex'))
,
overtime int,
constraint c4
check (overtime between 100 and 1000)
, constraint c3
primary key(eid)
,
did int,

constraint c5
foreign key(did)
references dept(did)
)

alter table emp
add constraint c55
unique (ename)

alter table emp
drop constraint c55

sp_helpconstraint emp

--snapshots
create database snap
on
(
name='iti',
filename='d:\db\2.ss'
)
as snapshot of iti 

use snap
select * from student

--schema creation
create schema Projects

alter schema Projects transfer dbo.t1

/*
SQL Server 2005 introduces the concept of a synonym: 
a single-part name that can replace a two-, three-, or 
four-part name in many SQL statements. Using synonyms 
lets you cut down on typing 
*/
create synonym mySyn 
for HumanResources.Employee
				-----------------------
select * from mySyn
				-----------------------
use AdventureWorks
--to create an alias for the table name
create synonym p
for Production.ProductListPriceHistory

--Create Default--
------------------------------
create default dcity as 'tanta'

sp_bindefault dcity,'student.st_address'

insert into student(id,sname) values(667,'khalid') --city will entered as defaut 'tanta'
--go to table to see reflection

drop default dcity  --cann't drop because it is bound to a column

sp_unbindefault 'student.st_address'
--then drop default
----------------------------------
--Create Rule--
--------------------------
--as check constraint

create rule rage as @age>10 --@salary is a variable refers to the bounded column

--rules override each others 
sp_bindrule rage,'student.st_age'
--only one rule per column

insert into student(id,salary) values(865,40)--salary<40 reflect with rule

drop rule rage  --cann't drop because it is bound to a column	

sp_unbindrule "student.st_age"
--then drop rule
---------------------------------------------------------------------------------------
--Craete Datatype-
--user defined datatypes

sp_addtype new_dtype,'nvarchar(50)','not null'
--change sname datatype to be
-- see table modification wizerd
alter table student
alter column st_fname new_dtype

sp_droptype new_dtype
------------------------------------------
Anther method

--creates an alias type based on the system-supplied varchar data type
CREATE TYPE SSN
FROM varchar(11) NOT NULL ;

CREATE TYPE ShortDescription
FROM nvarchar(10) NOT NULL ;

--binding rule+default+datatype--
------------------------------------------

sp_bindefault dcity,new_dtype

insert into student(id) values(44)

sp_bindrule rsalary,new_dtype

--if data type is bound on column before bound rule 
sp_bindrule rsalary,new_dtype ,'futureonly'

					-------------------------																
--You can query the sys.filegroups catalog view 
--to view the files in the newly created database:
USE MyNewDB
GO
SELECT fg.name as file_group,
df.name as file_logical_name,
df.physical_name as physical_file_name
FROM sys.filegroups fg
join sys.database_files df
on fg.data_space_id = df.data_space_id	
				------------------------------
--getting the schemas from specified db
SELECT name,
SCHEMA_NAME(schema_id) as schemaName,
USER_NAME(principal_id) as principal
FROM AdventureWorks.sys.schemas	
				--------------------------------
--To retrieve data about tables in a specific schema
SELECT TABLE_NAME
FROM AdventureWorks.INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Purchasing'
ORDER BY TABLE_NAME	
				-------------------------------
--Retrieving MetaDate about a DB file "data file"
select * from sys.database_files
where name='AdventureWorks_Data'				
													

select file_id( N'iti2')  --Returns the file ID for the given
							   --logical file name in the current database.

select FILE_NAME(1)			   --Returns the logical file name
							   --for the given file ID.

select FILEGROUP_ID('primary') --Returns the filegroup ID for
							   -- a specified filegroup name.

select FILEGROUP_NAME(1)	   --Returns the filegroup name
							   --for the specified filegroup ID.
									------------------------


