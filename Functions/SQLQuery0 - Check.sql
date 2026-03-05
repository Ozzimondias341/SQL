--PRINT @@VERSION;
USE PV_521_Import;
SET DATEFIRST 1;

GO
EXEC sp_SelectScheduleFor N'PV_521';
--PRINT dbo.GetNextLearningDay(N'PV_521', N'2026-03-05');
--SELECT MAX([date]) FROM Schedule WHERE [group]=521
PRINT dbo.GetNextLearningDate(N'PV_521', N'2026-03-09');
