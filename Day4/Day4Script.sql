--Day4

DROP TABLE IF EXISTS #Day4
DROP TABLE IF EXISTS #Passports
DROP TABLE IF EXISTS #RAWPassport

CREATE TABLE #Day4 (Day4 NVARCHAR(MAX))

BULK INSERT #Day4 FROM 'C:\Temp\AventCalendar\Day4\Day4Data.txt'

Select
	Row_Number() OVER(Order By (Select NULL)) as 'Row#'
	, Day4 as 'RAWPassport'
INTO #RAWPassport
From #Day4


--FIELDS
--		byr --(Birth Year)
--		iyr --(Issue Year)
--		eyr --(Expiration Year)
--		hgt --(Height)
--		hcl --(Hair Color)
--		ecl --(Eye Color)
--		pid --(Passport ID)
--		cid (Country ID)		--NOT REQUIRED

--Create a inital record
--IF space is encountered, create a new record
--Evaluate non-space lines, add values found to current records
--cursor onward!

CREATE TABLE #Passports (Row# INT
,byr NVARCHAR(50)
,iyr NVARCHAR(50)
,eyr NVARCHAR(50)
,hgt NVARCHAR(50)
,hcl NVARCHAR(50)
,ecl NVARCHAR(50)
,pid NVARCHAR(50))


DECLARE @RAWPASSPORTROW# INT = 1
DECLARE @CURRENTPASSPORT INT = 1
INSERT INTO #Passports VALUES (@CURRENTPASSPORT,NULL,NULL,NULL,NULL,NULL,NULL,NULL)

--Select * from #RAWPassport

WHILE @RAWPASSPORTROW# <= (Select Count(Row#) From #RAWPassport)
BEGIN
	IF (SELECT RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#) IS NULL
		BEGIN
			SET @CURRENTPASSPORT = @CURRENTPASSPORT + 1
			INSERT INTO #Passports VALUES (@CURRENTPASSPORT,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
			SET @RAWPASSPORTROW# = @RAWPASSPORTROW# + 1
		END
	ELSE

		BEGIN
			IF (Select CHARINDEX( 'byr:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET byr = (				
				SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('byr:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('byr:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('byr:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('byr:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'iyr:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET iyr = (				
				SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('iyr:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('iyr:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('iyr:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('iyr:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'eyr:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET eyr = (				
				SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('eyr:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('eyr:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('eyr:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('eyr:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'hgt:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET hgt = (				
				SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hgt:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hgt:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hgt:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hgt:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'hcl:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET hcl = (				
				SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hcl:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hcl:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hcl:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('hcl:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'ecl:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET ecl = (				
					SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('ecl:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('ecl:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('ecl:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('ecl:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			IF (Select CHARINDEX( 'pid:',RAWPassport) from #RAWPassport where Row# = @RAWPASSPORTROW#) > 0
			BEGIN
				Update #Passports SET pid = (				
					SELECT 
					CASE 
						WHEN CHARINDEX(' ',(Select RAWPassport From #RAWPassport where Row# = @RAWPASSPORTROW#)) = 0 
						THEN RIGHT(RawPassport, LEN(RawPassport) - CHARINDEX(':',RAWPassport))
						ELSE 
							CASE
								WHEN CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('pid:',RawPassport)-1)) = 0 
								THEN RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('pid:',RawPassport))
								ELSE LEFT(RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('pid:',RawPassport))
								, CHARINDEX(' ', RIGHT(RawPassport, LEN(RawPassport) - 3 - CHARINDEX('pid:',RawPassport)))-1)
							END
						END	
				FROM #RAWPassport where Row# = @RAWPASSPORTROW#)
				WHERE Row# = @CURRENTPASSPORT
			END
			set @RAWPASSPORTROW# = @RAWPASSPORTROW# + 1
		END
END



Select COUNT(*) AS 'Answer 4A' 
from #Passports 
where
	byr is not null AND
	iyr is not null AND
	eyr is not null AND
	hgt is not null AND
	hcl is not null AND
	ecl is not null AND
	pid is not null

--DAY4B

Select COUNT(*) AS 'ANSWER 4B'
From #Passports
WHERE
LEN(byr) = 4 AND
byr BETWEEN '1920' AND '2002' AND
LEN(iyr) = 4 AND
iyr BETWEEN '2010' AND '2020' AND
LEN(eyr) = 4 AND
eyr BETWEEN '2020' AND '2030' AND
((hgt like '%cm' AND left(hgt,len(hgt)-2) BETWEEN '150' AND '193') 
	OR (hgt like '%in' AND left(hgt,len(hgt)-2) BETWEEN '59' AND '76')) AND
LEFT(hcl,1) = '#' AND
len(hcl) = 7 AND 
RIGHT(hcl,6) NOT LIKE '%[g-z]%' AND
ecl in (
	'amb',
	'blu',
	'brn',
	'gry',
	'grn',
	'hzl',
	'oth') AND
LEN(pid) = 9

