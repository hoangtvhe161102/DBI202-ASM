CREATE TABLE Student (
	[sid] INT NOT NULL IDENTITY(1,1),
	[name] NVARCHAR(150) NOT NULL ,
	[dob] DATE NOT NULL,
	[gender] BIT NOT NULL DEFAULT 1,
	[Address] VARCHAR(150) NOT NULL , 
	CONSTRAINT pk_student PRIMARY KEY([sid]),											-- Rang buoc khoa chinh cho sid
	CONSTRAINT check_name_6_to_32_character CHECK(LEN([name]) >= 6 AND LEN([name])<=32) --Rang buoc do dai cua ten hoc sinh
);

Create table Lecture(
	[Lid] int not null Identity (1,1),
	[name] nvarchar(150) not null,
	[Email] nvarchar(150) not null,
	Constraint pk_Lecture primary key([Lid]),											--Dat Lid la khoa chinh
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
	CONSTRAINT fk_Student FOREIGN KEY (Suid) REFERENCES Student([sid]),
);
drop table Assessment