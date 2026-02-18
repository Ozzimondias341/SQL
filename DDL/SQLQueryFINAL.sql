CREATE DATABASE PV_521_DDL_ALL_IN_ONE
ON
(
	NAME		=	PV_521_DDL_ALL_IN_ONE,
	FILENAME	=	'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_DML_ALL_IN_ONE.mdf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH  =	8 MB
)
LOG ON
(
	NAME		=	PV_521_DDL_ALL_IN_ONE_log,
	FILENAME	=	'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_DML_ALL_IN_ONE.ldf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH  =	8 MB
);
GO
USE PV_521_DDL_ALL_IN_ONE;

CREATE TABLE DaysOfWeek
(
	day_id			TINYINT			PRIMARY KEY,
	day_name		CHAR(11)		NOT NULL
);

CREATE TABLE FormOfEducation
(
	form_id			TINYINT			PRIMARY KEY,
	form_name		CHAR(30)		NOT NULL
);


CREATE TABLE TypeOfSchedule
(
	[type_id]		TINYINT		PRIMARY KEY,
	[form]			TINYINT		NOT NULL
	CONSTRAINT FK_TOS_FOE		FOREIGN KEY		REFERENCES FormOfEducation(form_id),
	[day]			TINYINT		NOT NULL
	CONSTRAINT FK_TOS_DOW		FOREIGN KEY		REFERENCES DaysOfWeek(day_id),
	lessons_start	TIME		NOT NULL,	
);

CREATE TABLE Directions
(
	direction_id	TINYINT			PRIMARY KEY,
	direction_name	NVARCHAR(150)	NOT NULL
);

CREATE TABLE Groups
(
	group_id			INT				PRIMARY KEY,
	group_name			NVARCHAR(24)	NOT NULL,
	direction			TINYINT			NOT NULL
	CONSTRAINT FK_Groups_Direction	FOREIGN KEY REFERENCES Directions(direction_id),
	type_of_schedule	TINYINT			NOT NULL
	CONSTRAINT FK_Groups_TOE		FOREIGN KEY REFERENCES TypeOfSchedule([type_id]),
);

CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY IDENTITY(1,1), 
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)		NULL,
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT	FK_Students_Group	FOREIGN KEY REFERENCES Groups(group_id)
);

CREATE TABLE Teachers
(
	teacher_id			INT				PRIMARY KEY,
	last_name			NVARCHAR(50)	NOT NULL,
	first_name			NVARCHAR(50)	NOT NULL,
	middle_name			NVARCHAR(50)		NULL,
	birth_date			DATE			NOT NULL
);

CREATE TABLE Disciplines
(
	discipline_id		SMALLINT		PRIMARY KEY,
	discipline_name		NVARCHAR(50)	NOT NULL,
	number_of_lessons	TINYINT			NOT NULL
);

CREATE TABLE DisciplinesDirectionsRelation
(
	discipline			SMALLINT,
	direction			TINYINT,
	PRIMARY KEY(discipline, direction),
	CONSTRAINT FK_DDR_Discipline	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DDR_Direction		FOREIGN KEY (direction)	REFERENCES Directions(direction_id)
);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	SMALLINT,
	PRIMARY KEY(teacher,discipline),
	CONSTRAINT FK_TDR_Teacher		FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Discipline	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE RequiredDisciplines
(
	required_discipline		SMALLINT,
	discipline				SMALLINT,
	PRIMARY KEY(required_discipline, discipline),
	CONSTRAINT FK_RD_Discipline		FOREIGN KEY (discipline)						REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_RD_Required		FOREIGN KEY (required_discipline)				REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DependentDisciplines
(
	dependent_discipline	SMALLINT,
	discipline				SMALLINT,
	PRIMARY KEY(dependent_discipline, discipline),
	CONSTRAINT FK_DD_Discipline		FOREIGN KEY (discipline)						REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DD_Dependent		FOREIGN KEY (dependent_discipline)			REFERENCES Disciplines(discipline_id)
);

CREATE TABLE Exams
(
	student			INT,
	discipline		SMALLINT,
	grade			TINYINT		NOT NULL		CHECK( grade > 0 AND grade < 13),
	PRIMARY KEY(student, discipline),
	CONSTRAINT FK_Exams_Discipline	FOREIGN KEY (discipline)		REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_Exams_Student		FOREIGN KEY (student)			REFERENCES Students(student_id)
);

CREATE TABLE Schedule
(
	lesson_id		INT				PRIMARY KEY,
	lesson_topic	NVARCHAR(300)	NULL,
	lesson_number	TINYINT			NOT NULL,
	lesson_date		DATE			NOT NULL,
	[status]		BIT				NOT NULL,
	is_exam			BIT				NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT FK_Schedule_Group	FOREIGN KEY REFERENCES Groups(group_id),
	discipline		SMALLINT		NOT NULL
	CONSTRAINT FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher			INT				NOT NULL
	CONSTRAINT FK_Schedule_Teacher	FOREIGN KEY REFERENCES Teachers(teacher_id)
);

CREATE TABLE Grades
(
	student			INT			NOT NULL,
	lesson			INT			NOT NULL,
	grade_1			TINYINT		NULL		CHECK( grade_1 > 0 AND grade_1 < 13),
	grade_2			TINYINT		NULL		CHECK( grade_2 > 0 AND grade_2 < 13),
	PRIMARY KEY(student, lesson),
	CONSTRAINT FK_Grades_Student	FOREIGN KEY (student)	REFERENCES Students(student_id),
	CONSTRAINT FK_Grades_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id)
);

CREATE TABLE HomeWorks
(
	[group]			INT				NOT NULL,
	lesson			INT				NOT NULL,
	task			BINARY(1000)	NOT NULL,
	deadline		DATE			NOT NULL,
	PRIMARY KEY([group]	, lesson),
	CONSTRAINT FK_HomeWorks_Group	FOREIGN KEY ([group])	REFERENCES Groups(group_id),
	CONSTRAINT FK_HomeWorks_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id)
);

CREATE TABLE ResultsHW
(
	[group]			INT				NOT NULL,
	lesson			INT				NOT NULL,
	student			INT				NOT NULL,
	grade			TINYINT			NOT NULL	CHECK( grade > 0 AND grade < 13),
	result			BINARY(1000)	NOT NULL,
	work_done		DATE			NOT NULL,
	PRIMARY KEY([group], lesson, student),
	CONSTRAINT FK_RHW_HomeWors	FOREIGN KEY ([group], lesson)	REFERENCES HomeWorks([group], lesson),
	CONSTRAINT FK_RHW_Student	FOREIGN KEY (student)			REFERENCES Students(student_id)
);