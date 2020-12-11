--Day2A
DROP TABLE IF EXISTS #Day2

CREATE TABLE #Day2 (Day2 NVARCHAR(MAX))

BULK INSERT #Day2 FROM 'C:\Temp\AventCalendar\Day2\Day2Data.txt'


--HELPFUL STUFF 
--	SELECT RIGHT(LEFT(Day2, CHARINDEX(':', Day2)-1), 1) as 'Letter Being Evaluated', 
--	LEFT(Day2,CHARINDEX('-', Day2)-1) as 'MIN', 
--	RIGHT(LEFT(Day2, CHARINDEX(':', Day2) -3), CHARINDEX(':', Day2) -3 - CHARINDEX('-', Day2)) as 'MAX',
--	RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1) as 'Password',
--	LEN(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1)) - LEN(REPLACE(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1),RIGHT(LEFT(Day2, CHARINDEX(':', Day2)-1), 1),'')) as 'Letter in Password',
--	*
--	FROM #Day2

	SELECT Count(*) as 'ANSWER 2A'
	FROM #Day2
	WHERE 
	LEN(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1)) - LEN(REPLACE(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1),RIGHT(LEFT(Day2, CHARINDEX(':', Day2)-1), 1),''))
		BETWEEN
			LEFT(Day2,CHARINDEX('-', Day2)-1)
			AND 
			RIGHT(LEFT(Day2, CHARINDEX(':', Day2) -3), CHARINDEX(':', Day2) -3 - CHARINDEX('-', Day2))

--DAY2B
	SELECT COUNT(*) as 'ANSWER 2B'
	From #Day2
	WHERE 
	( 
		RIGHT(LEFT(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1),LEFT(Day2,CHARINDEX('-', Day2)-1)),1) = RIGHT(LEFT(Day2, CHARINDEX(':', Day2)-1), 1)
		OR
		RIGHT(LEFT(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1), RIGHT(LEFT(Day2, CHARINDEX(':', Day2) -3), CHARINDEX(':', Day2) -3 - CHARINDEX('-', Day2))),1) = RIGHT(LEFT(Day2, CHARINDEX(':', Day2)-1), 1)
	)
	AND
	(
		RIGHT(LEFT(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1),LEFT(Day2,CHARINDEX('-', Day2)-1)),1) <> RIGHT(LEFT(RIGHT(Day2, LEN(Day2)-CHARINDEX(':', Day2)-1), RIGHT(LEFT(Day2, CHARINDEX(':', Day2) -3), CHARINDEX(':', Day2) -3 - CHARINDEX('-', Day2))),1)
	)


