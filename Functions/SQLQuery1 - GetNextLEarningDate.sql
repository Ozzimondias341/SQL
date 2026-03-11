--SQLQuery1 - GetNextLearningDate.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION GetNextLearningDate (@group_name AS NCHAR(10), @date AS DATE = N'1900-01-01') RETURNS DATE
AS
BEGIN

	DECLARE @group_id						AS		INT				= (SELECT group_id FROM Groups WHERE group_name = @group_name)
	
	--DECLARE @date							AS		DATE			= (SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id)
	IF @date = CAST(N'1900-01-01' AS DATE)
	SET @date = (SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id)
	
	DECLARE @day							AS		SMALLINT			= DATEPART(WEEKDAY,@date)
	DECLARE @next_day						AS		SMALLINT			= dbo.GetNextLearningDay(@group_name, @date)
	DECLARE @interval						AS		SMALLINT			= @next_day - @day

	IF @interval < 0 SET @interval = 7 + @interval;
	IF @interval = 0 SET @interval = 7;

	DECLARE @next_date AS DATE		=  DATEADD(DAY, @interval, @date);
	
	RETURN IIF(NOT EXISTS (SELECT holiday FROM DaysOFF WHERE [date] = @next_date), @next_date, dbo.GetNextLearningDate(@group_name, @next_date))
	
	--IF EXISTS (SELECT holiday FROM DaysOFF WHERE [date] = @next_date) dbo.GetNextLearningDate(@group_name, @next_date); 
	--RETURN @next_date;

	 



	--DECLARE @group_id						AS		INT				= (SELECT group_id FROM Groups WHERE group_name = @group_name)
	--DECLARE @date_to_check					AS		DATE			= DATEADD(DAY, 1,	(SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id))
	--DECLARE @what_weekday_is_needed			AS		TINYINT			= dbo.GetNextLearningDay(@group_name, @date_to_check)
	--DECLARE @counter						AS		TINYINT			= 0

	--WHILE @counter < 30
	--BEGIN

	--	IF DATEPART(WEEKDAY, @date_to_check) = @what_weekday_is_needed RETURN @date_to_check

	--	SET @date_to_check = DATEADD(DAY ,1, @date_to_check)
	--	SET @counter = @counter + 1

	--END

	--RETURN (SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id)

END