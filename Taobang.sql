--Tao bang
--1
Create table Students(
	StudentID int not  null primary key,
	[Name] varchar(150) not null,
	Gender varchar(150) not null,
	DOB date not null
);

--2
Create table Subject(
	SubjectID int not null primary key,
	[Name] varchar(150) not null,
);

--3
Create table Semester(
	SemesterID int not null primary key,
	[Name] varchar(150) not null
);

--4
Create table Semester_Subject(
	SemesterID int not null,
	SubjectID int not null,
	primary key (SemesterID,SubjectID),
	FOREIGN KEY (SemesterID) REFERENCES [Semester](SemesterID),
	FOREIGN KEY (SubjectID) REFERENCES [Subject] (SubjectID)
);

--5
Create table [Group](
	GroupID int not null primary key,
	[Name] varchar(150) not null,
	SubjectID INT FOREIGN KEY REFERENCES [Subject](SubjectID)
);

--6
Create table Students_Group(
	StudentID int not  null,
	GroupID int not null,
	primary key(StudentID, GroupID),
	FOREIGN KEY (StudentID) REFERENCES [Students](StudentID),
	FOREIGN KEY (GroupID) REFERENCES [Group] (GroupID)
);

--7
Create table Assessment(
	AssessmentID int not null primary key,
	[Name] varchar(150) not null,
	[Weight] int not null,
	SubjectID INT FOREIGN KEY REFERENCES [Subject](SubjectID)
);

--8
Create table Students_Assessment(
	AssessmentID INT FOREIGN KEY REFERENCES [Assessment](AssessmentID),
	StudentID int FOREIGN KEY REFERENCES Students(StudentID),
	[Date] date not null,
	Score int not null,
	primary key (AssessmentID,StudentID,[Date])
);


