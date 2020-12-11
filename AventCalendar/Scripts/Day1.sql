--Day1
DROP TABLE IF EXISTS #Day1

CREATE TABLE #Day1 (Day1 INT)

BULK INSERT #Day1 FROM 'C:\Temp\AventCalendar\Inputs\Day1.txt'

SELECT DISTINCT(a.Day1 * b.Day1) as 'ANSWER 1A'
FROM #Day1 a
JOIN #Day1 b on 1=1 
WHERE a.Day1 + b.Day1 = 2020

--Day1B
SELECT DISTINCT(a.Day1 * b.Day1 * c.Day1) as 'ANSWER 1B'
FROM #Day1 a
JOIN #Day1 b on 1=1
JOIN #Day1 c on 1=1
WHERE a.Day1 + B.Day1 + c.Day1 = 2020