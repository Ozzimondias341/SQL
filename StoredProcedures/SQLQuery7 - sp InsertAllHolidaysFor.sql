--SQLQuery7 - sp InsertAllHolidaysFor.sql

USE PV_521_Import;
GO

CREATE OR ALTER PROCEDURE sp_InsertAllHolidaysFor @year	AS	SMALLINT
AS
BEGIN

	EXEC sp_InsertHolidaysFor @year, N'Нов%';
	EXEC sp_InsertHolidaysFor @year, N'23%';
	EXEC sp_InsertHolidaysFor @year, N'8%';
	EXEC sp_InsertHolidaysFor @year, N'Пасха';
	EXEC sp_InsertHolidaysFor @year, N'Май%';
	EXEC sp_InsertHolidaysFor @year, N'Лет%';
	EXEC sp_InsertHolidaysFor @year, N'День%';

END