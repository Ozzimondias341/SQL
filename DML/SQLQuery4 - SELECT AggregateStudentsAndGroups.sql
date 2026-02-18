--SQLQuery4 - SELECT AggregateStudentsAndGroups
USE PV_521_Import;

SELECT
		direction_name		AS N'Направление обучения'
		,(
		SELECT COUNT( DISTINCT group_id) 
		FROM Groups, Directions 
		WHERE direction = direction_id 
		) AS N'Количество групп'
		,(
		SELECT COUNT (DISTINCT stud_id) 
		FROM Students, Groups 
		WHERE [group] = group_id AND direction = direction_id  
		) AS N'Количество студентов'

FROM Directions
;

--SELECT

--	direction_name		AS N'Направление обучения'
--	,COUNT(stud_id)		AS N'Количество студентов'
--	,COUNT(DISTINCT group_id)	AS N'Количество групп'

--FROM Students, Groups, Directions
--WHERE	[group]			=		group_id
--AND		direction		=		direction_id
--GROUP BY direction_name
--;
