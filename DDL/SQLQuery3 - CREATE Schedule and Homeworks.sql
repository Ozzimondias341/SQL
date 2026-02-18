USE PV_521_DDL;

--CREATE TABLE Schedule
--(
--	lesson_id		INT				PRIMARY KEY,
--	lesson_topic	NVARCHAR(MAX)	NULL,
--	lesson_number	TINYINT			NOT NULL,
--	lesson_date		DATE			NOT NULL,
--	[status]		BIT				NOT NULL,
--	is_exam			BIT				NOT NULL,
--	[group]			INT				NOT NULL
--	CONSTRAINT FK_Schedule_Group	FOREIGN KEY REFERENCES Groups(group_id),
--	discipline		SMALLINT		NOT NULL
--	CONSTRAINT FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
--	teacher			INT				NOT NULL
--	CONSTRAINT FK_Schedule_Teacher	FOREIGN KEY REFERENCES Teachers(teacher_id)
--);

--CREATE TABLE Grades
--(
--	student			INT			NOT NULL,
--	lesson			INT			NOT NULL,
--	grade_1			TINYINT		NULL,
--	grade_2			TINYINT		NULL,
--	PRIMARY KEY(student, lesson),
--	CONSTRAINT FK_Grades_Student	FOREIGN KEY (student)	REFERENCES Students(student_id),
--	CONSTRAINT FK_Grades_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id)
--);

--CREATE TABLE HomeWorks
--(
--	[group]			INT				NOT NULL,
--	lesson			INT				NOT NULL,
--	task			BINARY(1000)	NOT NULL,
--	deadline		DATE			NOT NULL,
--	PRIMARY KEY([group]	, lesson),
--	CONSTRAINT FK_HomeWorks_Group	FOREIGN KEY ([group])	REFERENCES Groups(group_id),
--	CONSTRAINT FK_HomeWorks_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id)
--);


