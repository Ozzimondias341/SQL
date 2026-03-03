--SQLQuery1 - GetNextLearningDate.sql

USE PV_521_Import;
GO

CREATE OR ALTER FUNCTION GetNextLearningDate (@group_name AS NCHAR(10)) RETURNS DATE
AS
BEGIN

	DECLARE @group_id						AS		INT				= (SELECT group_id FROM Groups WHERE group_name = @group_name)
	DECLARE @what_weekday_is_needed			AS		TINYINT			= dbo.GetNextLearningDay(@group_name)
	DECLARE @date_to_check					AS		DATE			= DATEADD(DAY, 1,	(SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id))
	DECLARE @counter						AS		TINYINT			= 0

	WHILE @counter < 30
	BEGIN

		IF DATEPART(WEEKDAY, @date_to_check) = @what_weekday_is_needed RETURN @date_to_check

		SET @date_to_check = DATEADD(DAY ,1, @date_to_check)
		SET @counter = @counter + 1

	END

	RETURN (SELECT MAX([date]) FROM Schedule WHERE [group] = @group_id)

END