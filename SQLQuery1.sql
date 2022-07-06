CREATE TABLE Students(
	[sid] INT NOT NULL IDENTITY(1,1),
	[name] NVARCHAR(150) NOT NULL ,
	[dob] DATE NOT NULL,
	[gender] BIT NOT NULL DEFAULT 1,
	[Address] VARCHAR(150) NOT NULL , 
	CONSTRAINT pk_student PRIMARY KEY([sid]),											
	CONSTRAINT check_name_6_to_32_character CHECK(LEN([name]) >= 6 AND LEN([name])<=32) 
);




Create table Lecture(
	[Lid] int not null Identity (1,1),
	[name] nvarchar(150) not null,
	[Email] nvarchar(150) not null,
	Constraint pk_Lecture primary key([Lid]),										
);



Create table Subject (
	[Suid] int not null identity (1,1),
	[name] nvarchar(150) not null,
	Constraint pk_Subject primary key([Suid]),
);


create table Assessment (
	[Aid] int not null identity (1,1),
	[name] nvarchar(150) not null,
	[Weight] decimal(4,2) not null,
	[Suid] int not null,																
	Constraint pk_Assessment primary key([Aid]),					
);

drop table Assessment_Students
create table Assessment_Students(
	[Aid] int not null,
	[sid] int not null,
	[Date] date not null,
	[Score]	int not null,
	[RetakeScore] int not null,
	[DateRetake] date not null,
	Constraint pk_Assessment_Student primary key(sid, Aid, [Date]),
	CONSTRAINT pk_Students FOREIGN KEY (sid) REFERENCES Students([sid]),
	CONSTRAINT pk_Assessment FOREIGN KEY (Aid) REFERENCES Assessment([Aid])	
);
 