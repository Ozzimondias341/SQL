USE PV_521_DDL;

--CREATE TABLE Teachers
--(
--	teacher_id			INT				PRIMARY KEY,
--	last_name			NVARCHAR(50)	NOT NULL,
--	first_name			NVARCHAR(50)	NOT NULL,
--	middle_name			NVARCHAR(50)		NULL,
--	birth_date			DATE			NOT NULL
--);

--CREATE TABLE Disciplines
--(
--	discipline_id		SMALLINT		PRIMARY KEY,
--	discipline_name		NVARCHAR(50)	NOT NULL,
--	number_of_lessons	TINYINT			NOT NULL
--);

--CREATE TABLE DisciplinesDirectionsRelation
--(
--	discipline			SMALLINT,
--	direction			TINYINT,
--	PRIMARY KEY(discipline, direction),
--	CONSTRAINT FK_DDR_Discipline	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id),
--	CONSTRAINT FK_DDR_Direction		FOREIGN KEY (direction)	REFERENCES Directions(direction_id)
--);

--CREATE TABLE TeachersDisciplinesRelation
--(
--	teacher		INT,
--	discipline	SMALLINT,
--	PRIMARY KEY(teacher,discipline),
--	CONSTRAINT FK_TDR_Teacher		FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
--	CONSTRAINT FK_TDR_Discipline	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
--);

--CREATE TABLE RequiredDisciplines
--(
--	required_discipline		SMALLINT,
--	discipline				SMALLINT,
--	PRIMARY KEY(required_discipline, discipline),
--	CONSTRAINT FK_RD_Discipline		FOREIGN KEY (discipline)						REFERENCES Disciplines(discipline_id),
--	CONSTRAINT FK_RD_Required		FOREIGN KEY (required_discipline)				REFERENCES Disciplines(discipline_id)
--);

--CREATE TABLE DependentDisciplines
--(
--	dependent_discipline	SMALLINT,
--	discipline				SMALLINT,
--	PRIMARY KEY(dependent_discipline, discipline),
--	CONSTRAINT FK_DD_Discipline		FOREIGN KEY (discipline)						REFERENCES Disciplines(discipline_id),
--	CONSTRAINT FK_DD_Dependent		FOREIGN KEY (dependent_discipline)			REFERENCES Disciplines(discipline_id)
--);

--CREATE TABLE Exams
--(
--	student			INT,
--	discipline		SMALLINT,
--	grade			TINYINT		NOT NULL,
--	PRIMARY KEY(student, discipline),
--	CONSTRAINT FK_Exams_Discipline	FOREIGN KEY (discipline)		REFERENCES Disciplines(discipline_id),
--	CONSTRAINT FK_Exams_Student		FOREIGN KEY (student)			REFERENCES Students(student_id)
--);



--DROP TABLE Teachers, DisciplinesDirectionsRelation, Disciplines;