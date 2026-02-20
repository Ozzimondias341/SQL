--SQLQueryHW.sql
USE PV_521_Import;

--SELECT
--		[Преподаватель]  =	FORMATMESSAGE(N'%s %s %s', Teachers.last_name, Teachers.first_name, Teachers.middle_name)
--		,(
--		SELECT COUNT( discipline)
--		FROM TeachersDisciplinesRelation
--		WHERE teacher_id = teacher
--		)	AS N'Количество дисциплин'	
--FROM Teachers
--;

--SELECT 
--		discipline_name		AS N'Название дисциплины'
--		,(SELECT	COUNT(teacher)
--		FROM TeachersDisciplinesRelation
--		WHERE	discipline_id = discipline
--		)	AS N'Количество преподавателей'
--FROM Disciplines
--;

