--SQLQuery1 - GetNextLearningDay.sql

USE PV_521_Import
SET DATEFIRST 1;

GO

CREATE OR ALTER FUNCTION GetNextLearningDay (@group_name AS NCHAR(10)) RETURNS TINYINT
AS
BEGIN

	DECLARE @group_id	AS		INT			=	 (SELECT group_id FROM Groups WHERE group_name = @group_name);
	DECLARE @weekdays	AS		TINYINT		=	 (SELECT weekdays FROM Groups WHERE group_name = @group_name);
	DECLARE @last_date	AS		DATE		=	 (SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id);
	DECLARE @last_day	AS		TINYINT		=	 DATEPART(WEEKDAY,@last_date);
	DECLARE @day		AS		TINYINT		=	 @last_day + 1;

	WHILE @day <= 14
	BEGIN
		IF (@weekdays & POWER(2,@day%7-1)) != 0 RETURN @day%7;
		SET @day = @day + 1;
	END

	RETURN 0;



	-- Моя попытка ниже 

	--DECLARE @counter AS TINYINT = CASE DATEPART(WEEKDAY, GETDATE())
	--	WHEN N'Monday' THEN 2
	--	WHEN N'Tuesday' THEN 3
	--	WHEN N'Wednesday' THEN 4
	--	WHEN N'Thursday ' THEN 5
	--	WHEN N'Friday' THEN 6
	--	WHEN N'Saturday' THEN 7
	--	WHEN N'Sunday' THEN 1
	--	ELSE 1
	--END;
	
	--DECLARE @weekdayToCheck AS TINYINT = 0;

	--WHILE 1 = 1
	--BEGIN

	--SET @weekdayToCheck =
	--CASE @counter
	--WHEN 1 THEN 1
	--WHEN 2 THEN 2
	--WHEN 3 THEN 4 
	--WHEN 4 THEN 8
	--WHEN 5 THEN 16
	--WHEN 6 THEN 32
	--WHEN 7 THEN 64
	--ELSE 0
	--END;

	----mask & (1 << i)

	--IIF((((SELECT weekdays FROM Groups WHERE @group = group_id) & @weekdayToCheck) <> 0), RETURN )
	
	--IIF((@counter >= 7), SET @counter = 1, SET @counter = @counter + 1);  

	--END
END