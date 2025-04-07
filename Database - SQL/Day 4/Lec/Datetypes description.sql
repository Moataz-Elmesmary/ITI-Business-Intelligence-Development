--Numeric DT
bit 0-1 
tinyint 1Byte 0-255
smallint 2Byte -32.767 to 32.768
int 4Byte 2Millare 
bigint 8Byte 9999999999

--Floating DT
money 8 byte 4digits only 0.0000
smallmoney 4byte 4digits only 0.0000
real 4byte 8digit only and round up 0.000000000
float 8byte up to 32 digit 0.00000000000000000000000000
decimal(7,4) 8byte
Numeric(7,4) Old

--Date DT
Date
Time
datetime 1753 to 9999 any decimal
smalldatetime 1990 to 2050 no seconds
datetime2 seconds up to 7 decimal
datetimeoffset +2,

--string DT
char(10) 8000 char,
varchar(50),
nvarchar(50),
varchar(max),
Text old

--binary
binary(100) 4 byte,
varbinary(500) 8 byte,
image

--Others
--XML
--sql_variant
