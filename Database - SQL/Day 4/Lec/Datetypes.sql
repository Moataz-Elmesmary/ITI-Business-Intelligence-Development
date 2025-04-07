
CREATE TABLE  dbo . Datatypes (
	 dt_bit   bit,
	 dt_tinyint   tinyint,
	 dt_smallint   smallint,
	 dt_int   int,
	 dt_bigint   bigint,

	 dt_money   money,
	 dt_smallmoney   smallmoney,
	 dt_real   real,
	 dt_float   float,
	 dt_decimal   decimal(7, 4),
	 
	 dt_date date,
	 dt_time Time,
	 dt_time_7 Time(7),
	 dt_datetime   datetime,
	 dt_smalldatetime   smalldatetime,
	 dt_datetime2   datetime2,
	 dt_datetime2_7   datetime2(7),
	 dt_datetimeoffset   datetimeoffset,
	 dt_timestamp timestamp,

	 dt_char   char (10),
	 dt_varchar   varchar (50),
	 dt_nvarchar   nvarchar (50),
	 dt_varcharmax   varchar (max),
	 dt_text   text,

	 dt_sqlvariant   sql_variant,
	 dt_uniqueidentifier uniqueidentifier default newid(),
	 dt_spatial_geo geography --geography::STGeomFromText('POLYGON((-122.358 47.653 , -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))')

)

select convert(varchar(100),dt_timestamp) from datatypes
