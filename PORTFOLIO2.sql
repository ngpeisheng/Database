-- Create a new database called 'Sociol'
-- Connect to the 'master' database to run
USE master
GO

-- check whether if database exist
IF NOT EXISTS(
	SELECT [name]	
		FROM sys.databases
		WHERE [name] = N'Sociol'
)

-- create database
CREATE DATABASE Sociol
GO

use Sociol


/* Table: dbo.Member #1*/ 
if exists(select * from sysobjects
	where id = object_id('dbo.Member') and sysstat & 0xf = 3)
	drop table dbo.Member
GO

/* Table: dbo.Project */
if exists(select * from sysobjects
	where id = object_id('dbo.Project') and sysstat & 0xf = 3)
	drop table dbo.Project
GO

/* Table: dbo.Rewards */
if exists(select * from sysobjects
	where id = object_id('dbo.RewardsClaimed') and sysstat & 0xf = 3)
	drop table dbo.RewardsClaimed
GO

/* Table: dbo.Kudos */
if exists(se…
[9:48 AM, 2/4/2021] Peisheng: -- Create a new database called 'Sociol'
-- Connect to the 'master' database to run
USE master
GO

-- check whether if database exist
IF NOT EXISTS(
	SELECT [name]	
		FROM sys.databases
		WHERE [name] = N'Sociol'
)

-- create database
CREATE DATABASE Sociol
GO

use Sociol


/* Table: dbo.Member #1*/ 
if exists(select * from sysobjects
	where id = object_id('dbo.Member') and sysstat & 0xf = 3)
	drop table dbo.Member
GO

/* Table: dbo.Project */
if exists(select * from sysobjects
	where id = object_id('dbo.Project') and sysstat & 0xf = 3)
	drop table dbo.Project
GO

/* Table: dbo.Rewards */
if exists(select * from sysobjects
	where id = object_id('dbo.RewardsClaimed') and sysstat & 0xf = 3)
	drop table dbo.RewardsClaimed
GO

/* Table: dbo.Kudos */
if exists(select * from sysobjects
	where id = object_id('dbo.Kudos') and sysstat & 0xf = 3)
	drop table dbo.Kudos
GO

/* Table: dbo.Stickers */
if exists(select * from sysobjects
	where id = object_id('dbo.Stickers') and sysstat & 0xf = 3)
	drop table dbo.Stickers
GO
/* Table: dbo.Rewards */
if exists(select * from sysobjects
	where id = object_id('dbo.Awards') and sysstat & 0xf = 3)
	drop table dbo.Awards
GO


/* Table: dbo.Rewards */
if exists(select * from sysobjects
	where id = object_id('dbo.Rewards') and sysstat & 0xf = 3)
	drop table dbo.Rewards
GO

/* Table: dbo.employee */
if exists(select * from sysobjects
	where id = object_id('dbo.Employee') and sysstat & 0xf = 3)
	drop table dbo.Employee
GO

/* Table: dbo.Adminstrator */
if exists(select * from sysobjects
	where id = object_id('dbo.Administrator') and sysstat & 0xf = 3)
	drop table dbo.Administrator
GO

/* CREATING TABLES*/

/* Table: dbo.Employee */

CREATE TABLE dbo.Employee
(
  EmployeeID		int IDENTITY (1,1),
  EmployeeName		varchar(100)	NOT NULL,
  Gender			varchar(1)		NULL,
  Nationality		varchar(50)		NULL,
  DOB				date		NULL,
  PhoneNo			int				NOT NULL,
  Department		varchar(50)		NOT NULL,
  Position          varchar(50)     NULL,
  CompanyName		varchar(50)		NOT NULL,
  [Points]			int				NOT NULL,
  KudosReward		varchar(50)		NULL,
  PointsReward		int				NULL,
  EmailAddr			varchar(100)	NOT NULL,
  [Password]		varchar(255)	NOT NULL DEFAULT('emp')
  CONSTRAINT PK_Employee PRIMARY KEY NONCLUSTERED (EmployeeID)
)
GO

/* Table: dbo.Admin */
CREATE TABLE dbo.Administrator
(
  AdminID		int IDENTITY (1,1),
  AdminName		varchar(100)	NOT NULL,
  Gender		varchar(1)		NULL,
  Nationality	varchar(50)		NULL,
  DOB			date		NULL,
  PhoneNo		int				NOT NULL,
  Department	varchar(50)		NOT NULL,
  Position		varchar(50)		NOT NULL,
  CompanyName	varchar(50)		NOT NULL,
  EmailAddr		varchar(100)		NOT NULL,
  [Password]	varchar(255)	NOT NULL DEFAULT('admin')
  CONSTRAINT PK_Administrator PRIMARY KEY NONCLUSTERED (AdminID)
)
GO

/* Table: dbo.Project */
CREATE TABLE dbo.Project
(
  ProjectID		int IDENTITY (1,1),
  AdminID		int				NOT NULL,
  ProjectName	varchar(150)	NOT NULL,
  ProjectStatus	varchar(20)		NOT NULL DEFAULT('In Progress'),
  Department	varchar(50)		NOT NULL,
  CompanyName	varchar(50)		NOT NULL,
  DueDate		DateTime		NOT NULL
  CONSTRAINT PK_Project PRIMARY KEY NONCLUSTERED (ProjectID)
  CONSTRAINT FK_Project_AdminID FOREIGN KEY (AdminID) 
  REFERENCES dbo.Administrator(AdminID),
)
GO

/* Table: dbo.Member */
CREATE TABLE dbo.Member
(
  MemberID		int IDENTITY (1,1),
  ProjectID		int				NOT NULL,
  EmployeeID	int				NOT NULL
  CONSTRAINT PK_Member PRIMARY KEY NONCLUSTERED (MemberID)
  CONSTRAINT FK_Member_EmployeeID FOREIGN KEY (EmployeeID)
  REFERENCES dbo.Employee(EmployeeID),
  CONSTRAINT FK_Member_ProjectID FOREIGN KEY (ProjectID)
  REFERENCES dbo.Project(ProjectID)
)
GO

/*Table: dbo.Kudos */
CREATE TABLE dbo.Kudos
(
  KudosID		int IDENTITY (1,1),
  EmployeeID	int				NULL,
  AdminID		int				NULL,
  KudosName		varchar(150)	NOT NULL,
  KudosPath     varchar(max)	NOT NULL,
  SenderName	varchar(30)		NOT NULL,
  DateSent		DateTime		NOT NULL
  CONSTRAINT PK_Kudos PRIMARY KEY NONCLUSTERED (KudosID)
  CONSTRAINT FK_Kudos_EmployeeID FOREIGN KEY (EmployeeID) 
  REFERENCES dbo.Employee(EmployeeID),
  CONSTRAINT FK_Kudos_AdminID FOREIGN KEY (AdminID) 
  REFERENCES dbo.Administrator(AdminID)

)

/*Table: dbo.Kudos */
CREATE TABLE dbo.Awards
(
  AwardsID		int IDENTITY (1,1),
  EmployeeID	int				NULL,
  AdminID		int				NULL,
  AwardsName	varchar(150)	NOT NULL,
  AwardsPath    varchar(max)	NOT NULL,
  SenderName	varchar(30)		NOT NULL,
  DateSent		DateTime		NOT NULL
  CONSTRAINT PK_Awards PRIMARY KEY NONCLUSTERED (AwardsID)
  CONSTRAINT FK_Awards_EmployeeID FOREIGN KEY (EmployeeID) 
  REFERENCES dbo.Employee(EmployeeID),
  CONSTRAINT FK_Awards_AdminID FOREIGN KEY (AdminID) 
  REFERENCES dbo.Administrator(AdminID)

)

GO

/*Table: dbo.Stickers */
CREATE TABLE dbo.Stickers
(
  StickerID		int IDENTITY (1,1),
  EmployeeID	int				NOT NULL,
  StickerName	nvarchar(150)	NOT NULL,
  StickerPath	nvarchar(max)	NOT NULL,
  SenderName	varchar(100)	NOT NULL,
  DateSent		DateTime		NOT NULL
  CONSTRAINT PK_Stickers PRIMARY KEY NONCLUSTERED (StickerID)
  CONSTRAINT FK_Stickers_EmployeeID FOREIGN KEY (EmployeeID) 
  REFERENCES dbo.Employee(EmployeeID)

)
GO


CREATE TABLE dbo.Rewards
(
  RewardsID int IDENTITY(1,1),
  RewardsName nvarchar(255) NOT NULL,
  RewardsPath nvarchar(max) NOT NULL,
  RewardsCat varchar(255) NOT NULL,
  RPoints int NOT NULL,
  RewardsDesc varchar(255) NULL
  CONSTRAINT PK_Rewards PRIMARY KEY NONCLUSTERED (RewardsID)
)
GO

CREATE TABLE dbo.RewardsClaimed
(	
  RCID int IDENTITY(1,1),
  EmployeeID int NOT NULL,
  RewardsID int NOT NULL,
  [DateClaim] date NOT NULL DEFAULT (getdate())
  CONSTRAINT PK_RewardsClaimed PRIMARY KEY NONCLUSTERED(RCID)
  CONSTRAINT FK_RewardsClaimed_EmployeeID FOREIGN KEY (EmployeeID) 
  REFERENCES dbo.Employee(EmployeeID),
  CONSTRAINT FK_RewardsClaimed_RewardsID FOREIGN KEY (RewardsID) 
  REFERENCES dbo.Rewards(RewardsID)
)
GO

/* INPUT DATA */

/* Employee */
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (1, 'Jeremy', 'M','Singaporean','2000-03-21',91129009,'Human Resource', 'Hiring Assistant', 'STK Engineering', 1000, '','','jeremypf2@outlook.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (2, 'Jinn', 'M','Singaporean','1990-10-02',91137788,'Human Resource', 'HR Admin Associate', 'STK Engineering', 100, '','','jinnpf2@outlook.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (3, 'Yuri', 'F','Japanese','1990-04-22',93725173,'Human Resource', 'Hiring Assistant', 'STK Engineering', 100, '','','yuripf2@outlook.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (4, 'Derek', 'M','Malaysian','1967-11-15',84736284,'Human Resource', 'Team Leader', 'STK Engineering', 100, '','','derek@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (5, 'Kelvin', 'M','Singaporean','1973-08-10',94888822,'Finance', 'Accountant', 'STK Engineering', 100, '','','kelvin@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (6, 'Aisha', 'F','Indonesian','1983-05-03',83319900,'Finance', 'Finance Officer', 'STK Engineering', 100, '','','aisha@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (7, 'Mel', 'F','Indonesian','1983-01-07',91102222,'Human Resource', 'Campus Recruiter', 'STK Engineering', 100, '','','miraclemel31@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (8, 'Kim', 'M','South Korea','1983-02-06',92201111,'Finance', 'Finance Officer', 'STK Engineering', 100, '','','kim@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (9, 'Jess', 'F','American','1983-02-02',90311910, 'Human Resource', 'Team Leader', 'STK Engineering', 100,'','', 'jesslim2298@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (10, 'Kumar', 'M','India','1991-05-02',90201910, 'Finance', 'Front Desk Officer', 'STK Engineering', 100,'','', 'kumar@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (11, 'Max', 'M','Australian','1988-09-07',91102242,'Finance', 'Finance Officer', 'Maple Logistic', 100,'','', 'max@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (12, 'Annabelle', 'F','Singaporean','1989-01-06',98801111,'Finance', 'Finance Officer', 'Maple Logistic', 100,'','', 'annabelle@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (13, 'Kun', 'F','Thai','1983-02-02',99081910, 'Finance', 'Team Leader', 'Maple Logistic', 100, '','','kun@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (14, 'Kia', 'M','Japanese','1981-05-02',91311910, 'Finance', 'Finance Officer', 'Maple Logistic', 100, '','','kia@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (15, 'Farsina', 'M','Burmese','1981-05-02',91311910, 'Human Resource', 'Recruiter', 'STK Engineering', 170, '','','farsina@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (16, 'Penny', 'F','Singaporean','1984-05-19',847719473, 'Information Technology', 'Programmer', 'STK Engineering', 220, '','','pennytan@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (17, 'Katie', 'F','Chinese','1990-06-26',93740192, 'Information Technology', 'Software Developer', 'STK Engineering', 250, '','','katiecheng@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (18, 'Howie', 'M','Malysian','1968-11-29',85739279, 'Information Technology', 'Software Developer', 'STK Engineering', 190, '','','howie@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (19, 'Muthu', 'M','India','1981-05-02',86937264, 'Information Technology', 'Web Developer', 'STK Engineering', 384, '','','muthu@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (20, 'Joline', 'F','Indonesian','1982-12-14',98472849, 'Information Technology', 'Web Developer', 'STK Engineering', 194, '','','jolineng@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (21, 'Tiana Carson', 'F','American','1989-07-23',85739275, 'Information Technology', 'Software Developer', 'STK Engineering', 190, '','','tiannacarson@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (22, 'Donovan', 'M','Singaporean','1972-08-23',93816482, 'Information Technology', 'Programmer', 'STK Engineering', 190, '','','donovanl@pager.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (23, 'Arnold', 'M','Mexican','1988-04-09',94028461,'Finance', 'Accountant', 'Maple Logistic', 130,'','', 'arnoldrami@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (24, 'Timothy', 'M','Singaporean','1984-02-06',93745180,'Finance', 'Accountant', 'Maple Logistic', 283,'','', 'timonthysoon@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (25, 'Darryl', 'M','Singaporean','1967-07-16',92221424,'Finance', 'Business Administration', 'Maple Logistic', 195,'','', 'darryltay@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (26, 'Ian', 'M','Singaporean','1965-08-14',90042144,'Finance', 'Finance Officer', 'Maple Logistic', 109,'','', 'ianchan@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (27, 'Dione', 'F','Singaporean','1988-01-12',95550593,'Marketing', 'Marketing Assistant', 'Maple Logistic', 200,'','', 'annabelle@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (28, 'Ferlyn', 'F','Singaporean','1989-06-29',95833311,'Marketing', 'Social Media Marketer', 'Maple Logistic', 230,'','', 'ferlynsng@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (29, 'Chaw', 'F','Singaporean','1991-03-28',85955520,'Marketing', 'Creative Designer', 'Maple Logistic', 90,'','', 'chawthazin@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (30, 'Fei Hong', 'F','Chinese','1992-12-10',80089588,'Sales', 'Sales Coordinator', 'Maple Logistic', 50,'','', 'lingfeihong@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (31, 'Daniel', 'M','British','2000-08-20',90098999,'Sales', 'Customer Service Officer', 'Maple Logistic', 155,'','', 'danielcasey@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (32, 'Anna', 'F','Malaysian','1986-04-18',85441222,'Sales', 'Customer Service Officer', 'Maple Logistic', 104,'','', 'annaong@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (33, 'Terence', 'M','Malaysian','1988-05-23',87779374,'Human Resource', 'Recruiter', 'Maple Logistic', 180,'','', 'terenceliew@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (34, 'Reuben', 'M','Singaporean','1978-02-20',87849284,'Human Resource', 'HR Admin Associate', 'Maple Logistic', 98,'','', 'reubenwong@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (35, 'Wendy', 'F','Indonesian','1976-09-19',95888099,'Human Resource', 'Hiring Assistant', 'Maple Logistic', 160,'','', 'wendytsl@gmail.com', 'emp')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Gender], [Nationality], [DOB], [PhoneNo], [Department], [Position], [CompanyName], [Points], [KudosReward], [PointsReward], [EmailAddr], [Password])
VALUES (36, 'Qawiem', 'M','Malaysian','1989-11-16',98840099,'Human Resource', 'Hiring Assistant', 'Maple Logistic', 179,'','', 'qawiemqq@gmail.com', 'emp')

SET IDENTITY_INSERT [dbo].[Employee] OFF

/* Admin */
SET IDENTITY_INSERT [dbo].[Administrator] ON /* kudos and company */
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (1, 'Jay', 'M','Singaporean','1967-01-01', 99211893, 'Human Resource', 'Manager', 'STK Engineering', 'adminj@g.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (2, 'Charlyn', 'F','Malaysian','1974-05-06', 91113000, 'Human Resource', 'Manager', 'Maple Logistic', 'adminc@g.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (3, 'Ali', 'M','Singaporean','1950-10-18', 92210099, 'Finance', 'Supervisor', 'STK Engineering', 'socioliseverything@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (4, 'Gemma', 'F','American','1968-01-30', 94274836, 'Finance', 'Manager', 'Maple Logistic Engineering', 'gemmasmith@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (5, 'Olivier', 'M','French','1979-08-16', 84279471, 'Information Technology', 'IT Manager', 'STK Engineering', 'olivierabreo@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (6, 'Punjab', 'M','Indian','1963-11-23', 85739275, 'Information Technology', 'Supervisor', 'STK Engineering', 'punjab_agarwal@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (7, 'Maria', 'F','American','1976-12-01', 90049284, 'Sales', 'Sales Executive', 'Maple Logistic', 'mariajohnson@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (8, 'Erik', 'M','Mexican','1986-02-19', 85937755, 'Marketing', 'Marketing Executive', 'Maple Logistic', 'erikbolivia@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (9, 'Pauline', 'F','Chinese','1984-03-23', 94405902, 'Marketing', 'Business and Strategy Program Manager', 'Maple Logistic', 'paulineliu@gmail.com', 'admin')
INSERT [dbo].[Administrator] ([AdminID], [AdminName],[Gender],[Nationality],[DOB], [PhoneNo], [Department], [Position], [CompanyName], [EmailAddr], [Password])
VALUES (10, 'Melody', 'F','Singaporean','1978-04-15', 92221343, 'Human Resource', 'Manager', 'STK Engineering', 'melodycham@gmail.com', 'admin')
SET IDENTITY_INSERT [dbo].[Administrator] OFF

/* Kudos */
SET IDENTITY_INSERT [dbo].[Kudos] ON
INSERT [dbo].[Kudos] ([KudosID],[EmployeeID],[KudosName],[KudosPath],[SenderName],[DateSent])
VALUES(1,1,'MostHelpful','/images/MostHelpful.png','Aisha','2020-11-15')
INSERT [dbo].[Kudos] ([KudosID],[EmployeeID],[KudosName],[KudosPath],[SenderName],[DateSent])
VALUES(2,1,'TeamPlayer','/images/TeamPlayer.png','Aisha','2020-11-01')
INSERT [dbo].[Kudos] ([KudosID],[EmployeeID],[KudosName],[KudosPath],[SenderName],[DateSent])
VALUES(3,1,'CleanCoder','/images/CleanCoder.png','Jinn','2020-11-03')
INSERT [dbo].[Kudos] ([KudosID],[EmployeeID],[KudosName],[KudosPath],[SenderName],[DateSent])
VALUES(4,3,'CleanArchitect','/images/CleanArchitect.png','Jinn','2020-11-04')
INSERT [dbo].[Kudos] ([KudosID],[EmployeeID],[KudosName],[KudosPath],[SenderName],[DateSent])
VALUES(5,4,'CleanCoder','/images/CleanCoder.png','Kelvin','2020-11-12')
SET IDENTITY_INSERT[dbo].[Kudos] OFF


/* Kudos */
SET IDENTITY_INSERT [dbo].[Awards] ON
INSERT [dbo].[Awards] ([AwardsID],[EmployeeID],[AdminID],[AwardsName],[AwardsPath],[SenderName],[DateSent])
VALUES(1,1,1,'Excellence','/images/Excellence.png','Jay','2020-12-11')
INSERT [dbo].[Awards] ([AwardsID],[EmployeeID],[AdminID],[AwardsName],[AwardsPath],[SenderName],[DateSent])
VALUES(2,2,3,'EmployeeOfTheMonth','/images/EmployeeOfTheMonth.png','Ali','2020-12-11')
INSERT [dbo].[Awards] ([AwardsID],[EmployeeID],[AdminID],[AwardsName],[AwardsPath],[SenderName],[DateSent])
VALUES(3,5,3,'EmployeeOfTheMonth','/images/EmployeeOfTheMonth.png','Ali','2020-9-15')
INSERT [dbo].[Awards] ([AwardsID],[EmployeeID],[AdminID],[AwardsName],[AwardsPath],[SenderName],[DateSent])
VALUES(4,9,10,'EmployeeOfTheMonth','/images/EmployeeOfTheMonth.png','Melody','2020-10-12')
SET IDENTITY_INSERT [dbo].[Awards] OFF

/* Stickers */
SET IDENTITY_INSERT [dbo].[Stickers] ON
INSERT [dbo].[Stickers] ([StickerID],[EmployeeID],[StickerName],[StickerPath],[SenderName],[DateSent])
VALUES(1,1,'happybirthday','/images/happybirthday.png','Aisha','2020-11-11')
INSERT [dbo].[Stickers] ([StickerID],[EmployeeID],[StickerName],[StickerPath],[SenderName],[DateSent])
VALUES(2,1,'nice','/images/nice.png','Aisha','2020-11-07')
INSERT [dbo].[Stickers] ([StickerID],[EmployeeID],[StickerName],[StickerPath],[SenderName],[DateSent])
VALUES(3,2,'thankyou', '/images/thankyou.png','Kelvin','2020-11-02')
INSERT [dbo].[Stickers] ([StickerID],[EmployeeID],[StickerName],[StickerPath],[SenderName],[DateSent])
VALUES(4,3,'foryou', '/images/foryou.png', 'Kelvin','2020-11-15')
INSERT [dbo].[Stickers] ([StickerID],[EmployeeID],[StickerName],[StickerPath],[SenderName],[DateSent])
VALUES(5,4,'thankyou','/images/thankyou.png','Jinn','2020-11-15')
SET IDENTITY_INSERT[dbo].[Stickers] OFF

/* Project */
SET IDENTITY_INSERT [dbo].[Project] ON
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (1, 1,'STK Recruitment Drive 2020','In Progress','Human Resource','STK Engineering','2021-05-09')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (2, 10,'HR Compliance Review Project','Delayed','Human Resource','STK Engineering','2021-04-19')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (3, 4,'2020 Financial Statement','Completed','Finance','Maple Logistic','2021-02-27')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (4, 10,'Recruitment Process Revamp','Completed','Human Resource','STK Engineering','2021-05-04')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (5, 1,'Team Building Project','In Progress','Human Resource','STK Engineering','2021-08-24')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (6, 5,'STK Mobile App','Delayed','Information Technology','STK Engineering','2021-06-23')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (7, 2,'Recruitment Fair 2021','In Progress','Human Resource','Maple Logistic','2021-08-27')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName], [DueDate])
VALUES (8, 2,'Performance Management','In Progress','Human Resource','Maple Logistic','2021-07-18')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (9, 8,'Project UNION 2021','In Progress','Marketing','Maple Logistic','2021-03-22')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (10, 9,'Website Revamp','In Progress','Marketing','Maple Logistic','2021-07-01')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (11, 9,'Social Media Project','Completed','Marketing','Maple Logistic','2021-01-06')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (12, 7,'Sales Report','Delayed','Sales','Maple Logistic','2021-10-11')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (13, 7,'Market Intelligence Project','Completed','Sales','Maple Logistic','2021-05-03')
INSERT [dbo].[Project] ([ProjectID], [AdminID],[ProjectName], [ProjectStatus], [Department], [CompanyName],[DueDate])
VALUES (14, 3,'Internal Audit','In Progress','Sales','Maple Logistic','2021-11-10')
SET IDENTITY_INSERT[dbo].[Project] OFF

/* Member */
SET IDENTITY_INSERT [dbo].[Member] ON
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (1, 1, 2)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (2, 1, 1)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (3, 1, 3)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (4, 1, 9)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (5, 1, 7)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (6, 14, 5)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (7, 14, 6)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (8, 14, 10)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (9, 14, 8)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (10, 2, 1)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (11, 2, 2)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (12, 2, 3)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (13, 2, 7)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (14, 3, 23)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (15, 3, 24)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (16, 3, 25)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (17, 3, 26)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (18, 4, 3)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (19, 4, 9)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (20, 5, 1)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (21, 5, 2)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (22, 6, 16)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (23, 6, 17)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (24, 6, 18)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (25, 6, 21)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (26, 6, 22)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (27, 7, 33)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (28, 7, 34)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (29, 8, 35)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (30, 8, 36)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (31, 9, 27)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (32, 9, 28)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (33, 9, 29)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (34, 10, 27)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (35, 10, 28)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (36, 11, 29)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (37, 12, 30)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (38, 13, 31)
INSERT [dbo].[Member] ([MemberID],[ProjectID],[EmployeeID])
VALUES (39, 13, 32)
SET IDENTITY_INSERT[dbo].[Member] OFF

/* Rewards */
SET IDENTITY_INSERT [dbo].[Rewards] ON

/* Beverage */
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (1,'Starbucks Coffee', '/images/StarbucksCoffee.jpg', 'Beverage', 100, 'Starbucks (Coffee)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (2,'Coffee Bean and Tea Leaf Coffee', '/images/CoffeeBeanCoffee.jpg', 'Beverage', 100, 'Coffee Bean and Tea Leaf (Coffee)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (3,'Coffee Bean and Tea Leaf Tea', '/images/Tea.jpeg', 'Beverage', 100, 'Coffee Bean and Tea Leaf (Tea)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (4,'Koi Bubble Tea', '/images/KoiBubbleTea.jpg', 'Beverage', 150, 'Koi (Bubble Tea)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (5,'Hey Tea', '/images/heytea.jfif', 'Beverage', 150, 'Hey Tea (Bubble Tea)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (6,'Boost', '/images/BoostJuice.png', 'Beverage', 200, 'Boost (Fruit Juice)')

/* Voucher */
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (7,'Golden Village F&B Voucher','/images/GVFnBvoucher.webp', 'Voucher', 4000, 'Golden Village Voucher (F&B)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (8,'Golden Village $10 Voucher','/images/GV10voucher.webp', 'Voucher', 4000, 'Golden Village Voucher ($10)')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (9,'NTUC Voucher','/images/NTUCVoucher10.jpg', 'Voucher', 5000, '$10 NTUC Voucher')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (10,'Ion Orchard Voucher','/images/IonOrchardVoucher.jpg', 'Voucher', 5000, 'Ion Orchard Voucher')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (11,'Choice Voucher','/images/choicevoucher.jpg', 'Voucher', 5000, 'Choice Voucher ($10)')

/* Staycation */
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (12,'Grand Hyatt Hotel Staycation','/images/GHStay.jpeg', 'Staycation', 10000, '2D1N Staycation at Grand Hyatt Hotel')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (13,'The Warehouse Hotel Staycation','/images/thewarehousehotel.jpg', 'Staycation', 10000, '2D1N Staycation at The Warehouse Hotel')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (14,'Hilton Singapore Hotel Staycation','/images/HiltonSingapore.jpg', 'Staycation', 10000, '2D1N Staycation at Hilton Singapore Hotel')
INSERT [dbo].[Rewards] ([RewardsID], [RewardsName], [RewardsPath], [RewardsCat], [RPoints], [RewardsDesc])
VALUES (15,'The Ritz-Carlton Millenia Hotel Staycation','/images/theritzcarltonmillenia.jfif', 'Staycation', 11000, '2D1N Staycation at The Ritz-Carlton Millenia Hotel')

SET IDENTITY_INSERT[dbo].[Rewards] OFF

SET IDENTITY_INSERT [dbo].[RewardsClaimed] ON
INSERT [dbo].[RewardsClaimed] ([RCID], [EmployeeID], [RewardsID], [DateClaim])
VALUES (1,1,1,'2020-12-09')
INSERT [dbo].[RewardsClaimed] ([RCID], [EmployeeID], [RewardsID], [DateClaim])
VALUES (2,2,3,'2020-11-19')
INSERT [dbo].[RewardsClaimed] ([RCID], [EmployeeID], [RewardsID], [DateClaim])
VALUES (3,5,2,'2020-11-21')
INSERT [dbo].[RewardsClaimed] ([RCID], [EmployeeID], [RewardsID], [DateClaim])
VALUES (4,7,4,'2020-12-13')
SET IDENTITY_INSERT [dbo].[RewardsClaimed] OFF

SELECT * FROM Employee
SELECT * FROM Administrator
SELECT * FROM Kudos
SELECT * FROM Stickers
SELECT * FROM Project
SELECT * FROM Member
SELECT * FROM Rewards
SELECT * FROM RewardsClaimed
SELECT * FROM Awards
SELECT * FROM Member