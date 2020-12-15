--Day6

DROP TABLE IF EXISTS #Day6
DROP TABLE IF EXISTS #Database
DROP TABLE IF EXISTS #DeclarationAnswers

CREATE TABLE #Day6 (Day6 NVARCHAR(MAX))

BULK INSERT #Day6 FROM 'C:\Temp\AventCalendar\Day6\Day6Data.txt'

Select
	Row_Number() OVER(Order By (Select NULL)) as 'Row#'
	, Day6 as 'DeclarationAnswers'
INTO #DeclarationAnswers
From #Day6

CREATE TABLE #Database ( Row# INT
, GroupID INT
, PassengerID INT
, a INT
, b INT
, c INT
, d INT
, e INT
, f INT
, g INT
, h INT
, i INT
, j INT
, k INT
, l INT
, m INT
, n INT
, o INT
, p INT
, q INT
, r INT
, s INT
, t INT
, u INT
, v INT
, w INT
, x INT
, y INT
, z INT
)

DECLARE @GroupID INT = 1
DECLARE @PassengerID INT = 1
DECLARE @CurrentRow# INT = 1

--WHILE NOT AT THE END OF THE FILE
--CREATE GROUPID 1 PASSENGER 1
--CHECK IF SPACE: GROUPID++
--UPDATE RECORD

WHILE @CurrentRow# <= (Select Count(Row#) From #DeclarationAnswers)
BEGIN
	IF(Select DeclarationAnswers From #DeclarationAnswers Where Row# = @CurrentRow#) IS NULL
		BEGIN
			SET @CurrentRow# = @CurrentRow# + 1
			SET @GroupID = @GroupID + 1
		END
	ELSE
		BEGIN
			INSERT INTO #Database VALUES (@CurrentRow#, @GroupID, @PassengerID, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
			IF(Select CHARINDEX('a', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET a = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('b', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET b = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('c', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET c = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('d', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET d = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('e', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET e = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('f', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET f = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('g', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET g = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('h', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET h = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('i', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET i = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('j', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET j = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('k', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET k = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('l', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET l = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('m', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET m = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('n', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET n = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('o', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET o = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('p', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET p = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('q', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET q = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('r', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET r = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('s', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET s = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('t', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET t = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('u', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET u = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('v', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET v = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('w', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET w = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('x', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET x = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('y', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET y = 1 Where Row# = @CurrentRow# END
			IF(Select CHARINDEX('z', DeclarationAnswers) From #DeclarationAnswers Where Row# = @CurrentRow#) > 0 BEGIN Update #Database SET z = 1 Where Row# = @CurrentRow# END
			SET @PassengerID = @PassengerID + 1
			SET @CurrentRow# = @CurrentRow# + 1
		END
END

Select * From #Database

Select SUM(Total) as 'Answer 6A'
FROM (
Select
MAX(a) +
MAX(b) +
MAX(c) +
MAX(d) +
MAX(e) +
MAX(f) +
MAX(g) +
MAX(h) +
MAX(i) +
MAX(j) +
MAX(k) +
MAX(l) +
MAX(m) +
MAX(n) +
MAX(o) +
MAX(p) +
MAX(q) +
MAX(r) +
MAX(s) +
MAX(t) +
MAX(u) +
MAX(v) +
MAX(w) +
MAX(x) +
MAX(y) +
MAX(z) as 'Total' 
From #Database Group by GroupID ) x

Select SUM(Total) as 'Answer 6B' FROM (
Select 
CASE WHEN Count(*) = Sum(a) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(b) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(c) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(d) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(e) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(f) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(g) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(h) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(i) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(j) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(k) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(l) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(m) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(n) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(o) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(p) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(q) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(r) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(s) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(t) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(u) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(v) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(w) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(x) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(y) THEN 1 ELSE 0 END +
CASE WHEN Count(*) = Sum(z) THEN 1 ELSE 0 END as 'TOTAL'
From #Database
Group By GroupID) x