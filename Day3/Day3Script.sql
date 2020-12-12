--Day3A
DROP TABLE IF EXISTS #Day3
DROP TABLE IF EXISTS #MAP

CREATE TABLE #Day3 (Day3 NVARCHAR(31))

BULK INSERT #Day3 FROM 'C:\Temp\AventCalendar\Day3\Day3Data.txt'

DECLARE @HD DEC(2,1)

Select
	Row_Number() OVER(Order By (Select NULL)) as 'Row#'
	, Day3 as 'Map'
INTO #MAP
From #Day3

--HELPFUL STUFF
--Select @HD=3
--	Select
--	((Row#-1)*@HD)+1 as 'HorizontalDistnace'
--	, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END AS 'Position'
--	,  RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) As 'Symbol'
--	, CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END AS '#=1'
--	,*
--	From #MAP
--	) as X

Select @HD=3

Select SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END ) as 'Answer 2A'
From #MAP

--Day3B

Declare @A1 INT
Declare @A2 INT
Declare @A3 INT
Declare @A4 INT
Declare @A5 INT

--1/1
Select @HD = 1
Select @A1 = SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END )
From #MAP

--3/1
Select @HD = 3
Select @A2 =SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END )
From #MAP

--5/1
Select @HD = 5
Select @A3 = SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END )
From #MAP

--7/1
Select @HD = 7
Select @A4 = SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END )
From #MAP

--1/2
Select @HD = 0.5
Select @A5 = SUM(CASE WHEN RIGHT(LEFT(Map, CASE WHEN (((Row#-1)*@HD)+1) % 31 = 0 THEN 31 ELSE (((Row#-1)*@HD)+1) % 31 END),1) = '#' THEN 1 ELSE 0 END )
From #MAP
Where Row# % 2 = 1

--Select @A1, @A2, @A3, @A4, @A5
Select @A1 * @A2 * @A3 * @A4 * @A5 as 'ANSWER 3B'