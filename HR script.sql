USE [master]
GO

CREATE DATABASE "HR"
GO

USE [HR]
GO
CREATE TYPE [dbo].[Candidate_Type] AS TABLE(
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [char](1) NULL,
	[Age] [int] NULL,
	[Email] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[CV] [varbinary](max) NULL,
	[Referral] [int] NULL,
	[Status] [char](1) NULL,
	[AppliedPosition] [varchar](100) NULL,
	[CallerId] [int] NULL
)
GO
CREATE TYPE [dbo].[EvaluationForm_Type] AS TABLE(
	[Schedule_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Notes] [varchar](300) NULL,
	[JSONData] [nvarchar](max) NULL,
	[RecommendPositionID] [int] NULL,
	[CreatedBy] [int] NULL
)
GO
CREATE TYPE [dbo].[GetAllIntervieweeByPeriodOfTime_Type] AS TABLE(
	[StartDate] [date] NULL,
	[EndDate] [date] NULL
)
GO
CREATE TYPE [dbo].[Interviewer_Type] AS TABLE(
	[Username] [varchar](100) NULL,
	[Password] [varchar](200) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Role] [char](1) NULL,
	[Position] [varchar](100) NULL,
	[CallerId] [int] NULL
)
GO
CREATE TYPE [dbo].[Schedule_Type] AS TABLE(
	[MeetingDate] [datetime] NOT NULL,
	[Type] [char](1) NOT NULL,
	[IsCancelled] [char](1) NOT NULL,
	[Notes] [varchar](300) NULL,
	[Candidate_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[Position_ID] [int] NOT NULL
)
GO
CREATE TYPE [dbo].[TestGrade_Type] AS TABLE(
	[Score] [int] NOT NULL,
	[Schedule_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [char](1) NULL,
	[Age] [int] NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [varchar](100) NULL,
	[PhoneNumber] [char](50) NOT NULL,
	[CV] [varbinary](max) NULL,
	[Referral] [int] NULL,
	[Status] [char](1) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifedDate] [datetime] NOT NULL,
	[ModifedBy] [int] NULL,
	[AppliedPosition] [varchar](100) NOT NULL,
 CONSTRAINT [Candidate_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Role] [char](1) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Prodecure] [varchar](200) NULL,
	[Message] [varchar](8000) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationForm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [varchar](300) NULL,
	[RecommendPositionID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[JSONData] [nvarchar](max) NULL,
	[ScheduleInterviewer_ID] [int] NOT NULL,
 CONSTRAINT [EvaluationForm_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [Position_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MeetingDate] [datetime] NOT NULL,
	[Type] [char](1) NOT NULL,
	[IsCancelled] [char](1) NOT NULL,
	[Notes] [varchar](300) NULL,
	[Candidate_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Position_ID] [int] NOT NULL,
 CONSTRAINT [Schedule_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleInterviewer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Schedule_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [ScheduleInterviewer_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestGrade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NULL,
	[Schedule_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [TestGrade_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidate] ON 

INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (19, N'Anna', N'Karapetyan', N'F', 19, N'anna@gmail.com', N'Yerevan', N'03251478                                          ', NULL, 1, N'A', CAST(N'2017-07-16T20:21:10.860' AS DateTime), 3, CAST(N'2017-07-16T20:21:10.860' AS DateTime), 3, N'Database Engineer')
INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (20, N'Narek', N'Hayrapetyan', N'M', 24, N'narek@gmail.com', N'Yerevan', N'12154512                                          ', NULL, 1, N'A', CAST(N'2017-07-16T20:21:10.870' AS DateTime), 3, CAST(N'2017-07-16T20:21:10.870' AS DateTime), 3, N'Database Engineer')
INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (21, N'Anahit', N'Karapetyan', NULL, NULL, N'anahit@gmail.com', NULL, N'03251478                                          ', NULL, NULL, NULL, CAST(N'2017-07-20T22:53:04.780' AS DateTime), NULL, CAST(N'2017-07-20T22:53:04.780' AS DateTime), NULL, N'Database Engineer')
INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (25, N'Vram', N'Karapetyan', NULL, NULL, N'Vram@gmail.com', NULL, N'02155487242                                       ', NULL, NULL, NULL, CAST(N'2017-07-27T19:24:07.217' AS DateTime), NULL, CAST(N'2017-07-27T19:24:07.217' AS DateTime), NULL, N'Principal Software Developer')
INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (26, N'Marine', N'Hakobyan', NULL, NULL, N'marine@gmail.com', NULL, N'022124545636                                      ', NULL, NULL, NULL, CAST(N'2017-07-27T19:26:34.113' AS DateTime), NULL, CAST(N'2017-07-27T19:26:34.113' AS DateTime), NULL, N'Principal Software Developer')
INSERT [dbo].[Candidate] ([ID], [FirstName], [LastName], [Gender], [Age], [Email], [Address], [PhoneNumber], [CV], [Referral], [Status], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [AppliedPosition]) VALUES (27, N'Milna', N'Taranyan', NULL, NULL, N'milena@gmail.com', NULL, N'021548963232                                      ', NULL, NULL, NULL, CAST(N'2017-07-27T19:26:34.113' AS DateTime), NULL, CAST(N'2017-07-27T19:26:34.113' AS DateTime), NULL, N'Principal Software Developer')
SET IDENTITY_INSERT [dbo].[Candidate] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (37, N'karen', N'ndjbs5452sds', N'Karen', N'Gabrielyan', N'I', CAST(N'2017-07-16T20:11:46.003' AS DateTime), 3)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (38, N'david', N'sdbsdnbhj15452', N'David', N'Martirosyan', N'I', CAST(N'2017-07-16T20:12:00.330' AS DateTime), 3)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (43, NULL, NULL, N'Michel', N'Gabrielyan', N'I', CAST(N'2017-07-18T17:38:09.660' AS DateTime), NULL)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (54, NULL, NULL, N'Nairi', N'Bavikyan', N'I', CAST(N'2017-07-27T20:06:24.720' AS DateTime), NULL)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (55, NULL, NULL, N'Ani', N'Babayan', N'I', CAST(N'2017-07-27T20:06:24.720' AS DateTime), NULL)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (62, NULL, NULL, N'Hovhannes', N'Mkrtchyan', N'I', CAST(N'2017-07-27T22:18:43.317' AS DateTime), NULL)
INSERT [dbo].[Employee] ([ID], [Username], [PasswordHash], [FirstName], [LastName], [Role], [CreatedDate], [CreatedBy]) VALUES (63, NULL, NULL, N'Andranik', N'Babayan', N'I', CAST(N'2017-07-27T22:18:43.317' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (1, 515, N'uspInsertInterviewee', N'Cannot insert the value NULL into column ''Name'', table ''HR.dbo.Position''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-16T19:12:26.357' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (2, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (David).', CAST(N'2017-07-16T20:02:46.913' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (3, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (David).', CAST(N'2017-07-16T20:02:46.923' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (4, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:03:20.020' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (5, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:03:20.020' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (6, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:04:09.810' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (7, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:04:09.810' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (8, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:05:08.213' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (9, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:08:09.190' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (10, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (hayk).', CAST(N'2017-07-16T20:08:44.380' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (11, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (hayk).', CAST(N'2017-07-16T20:09:26.270' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (12, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (hayk).', CAST(N'2017-07-16T20:10:42.773' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (13, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (hayk).', CAST(N'2017-07-16T20:11:46.003' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (14, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (karen).', CAST(N'2017-07-16T20:20:06.867' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (15, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:20:06.870' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (16, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (karen).', CAST(N'2017-07-16T20:21:10.880' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (17, 2627, N'uspInsertInterviewer', N'Violation of UNIQUE KEY constraint ''UQ_Employee_Username''. Cannot insert duplicate key in object ''dbo.Employee''. The duplicate key value is (david).', CAST(N'2017-07-16T20:21:10.883' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (18, 515, N'uspInsertInterviewer', N'Cannot insert the value NULL into column ''CreatedBy'', table ''HR.dbo.Position''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-18T17:23:15.267' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (19, 515, N'uspInsertInterviewer', N'Cannot insert the value NULL into column ''CreatedBy'', table ''HR.dbo.Position''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-18T17:26:15.630' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (20, 515, N'uspInsertInterviewer', N'Cannot insert the value NULL into column ''CreatedBy'', table ''HR.dbo.Position''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-18T17:31:50.623' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (21, 515, N'uspInsertInterviewer', N'Cannot insert the value NULL into column ''CreatedBy'', table ''HR.dbo.Position''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-18T17:33:02.513' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (22, 515, N'uspInsertSchedule', N'Cannot insert the value NULL into column ''RecommendPositionID'', table ''HR.dbo.EvaluationForm''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-22T00:26:46.147' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (23, 515, N'uspInsertSchedule', N'Cannot insert the value NULL into column ''RecommendPositionID'', table ''HR.dbo.EvaluationForm''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-22T00:27:28.773' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (24, 515, N'uspInsertSchedule', N'Cannot insert the value NULL into column ''RecommendPositionID'', table ''HR.dbo.EvaluationForm''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-22T00:31:56.093' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (25, 515, N'uspInsertSchedule', N'Cannot insert the value NULL into column ''RecommendPositionID'', table ''HR.dbo.EvaluationForm''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-22T00:32:24.397' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (26, 515, N'uspInsertSchedule', N'Cannot insert the value NULL into column ''Score'', table ''HR.dbo.TestGrade''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-22T00:39:12.153' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (27, 515, N'uspInsertInterviewee', N'Cannot insert the value NULL into column ''Email'', table ''HR.dbo.Candidate''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-27T19:15:40.943' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (28, 515, N'uspInsertInterviewee', N'Cannot insert the value NULL into column ''Email'', table ''HR.dbo.Candidate''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-27T19:16:57.557' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (29, 515, N'uspInsertInterviewee', N'Cannot insert the value NULL into column ''Email'', table ''HR.dbo.Candidate''; column does not allow nulls. INSERT fails.', CAST(N'2017-07-27T19:19:21.183' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (30, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:40:58.347' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (31, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:47:54.420' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (32, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:49:20.950' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (33, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:49:44.840' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (34, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:52:02.183' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (35, 16924, N'uspInsertInterviewer', N'Cursorfetch: The number of variables declared in the INTO list must match that of selected columns.', CAST(N'2017-07-27T19:52:52.010' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (36, 245, N'uspInsertInterviewer', N'Conversion failed when converting the varchar value ''Principal Software Developer'' to data type int.', CAST(N'2017-07-27T19:57:27.063' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (37, 245, N'uspInsertInterviewer', N'Conversion failed when converting the varchar value ''Principal Software Developer'' to data type int.', CAST(N'2017-07-27T19:58:09.400' AS DateTime))
INSERT [dbo].[ErrorLog] ([Id], [Number], [Prodecure], [Message], [CreatedDate]) VALUES (38, 245, N'uspInsertInterviewer', N'Conversion failed when converting the varchar value ''Principal Software Developer'' to data type int.', CAST(N'2017-07-27T20:04:11.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
SET IDENTITY_INSERT [dbo].[EvaluationForm] ON 

INSERT [dbo].[EvaluationForm] ([ID], [Notes], [RecommendPositionID], [CreatedDate], [CreatedBy], [JSONData], [ScheduleInterviewer_ID]) VALUES (7, N'XELOQ CHI PAHE', 4, CAST(N'2017-07-22T14:18:01.333' AS DateTime), 7, NULL, 10)
INSERT [dbo].[EvaluationForm] ([ID], [Notes], [RecommendPositionID], [CreatedDate], [CreatedBy], [JSONData], [ScheduleInterviewer_ID]) VALUES (8, NULL, NULL, CAST(N'2017-07-22T00:44:06.043' AS DateTime), 4, NULL, 11)
INSERT [dbo].[EvaluationForm] ([ID], [Notes], [RecommendPositionID], [CreatedDate], [CreatedBy], [JSONData], [ScheduleInterviewer_ID]) VALUES (9, NULL, NULL, CAST(N'2017-07-27T21:16:14.297' AS DateTime), 5, NULL, 12)
INSERT [dbo].[EvaluationForm] ([ID], [Notes], [RecommendPositionID], [CreatedDate], [CreatedBy], [JSONData], [ScheduleInterviewer_ID]) VALUES (10, NULL, NULL, CAST(N'2017-07-27T21:16:14.310' AS DateTime), 7, NULL, 13)
SET IDENTITY_INSERT [dbo].[EvaluationForm] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (1, N'Auditor', CAST(N'2017-07-03T23:16:01.497' AS DateTime), 1)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (2, N'Dentist', CAST(N'2017-07-03T23:24:12.887' AS DateTime), 122)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (3, N'Manager', CAST(N'2017-07-05T00:48:48.003' AS DateTime), 2)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (4, N'Database engineer', CAST(N'2017-07-05T00:53:34.070' AS DateTime), 3)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (5, N'HR manager', CAST(N'2017-07-11T11:32:09.870' AS DateTime), 11)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (6, N'Assistant', CAST(N'2017-07-11T11:41:28.143' AS DateTime), 3)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (10, N'Principal Software Developer', CAST(N'2017-07-27T19:24:07.217' AS DateTime), NULL)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (11, N'Engineer', CAST(N'2017-07-27T22:05:47.250' AS DateTime), NULL)
INSERT [dbo].[Position] ([ID], [Name], [CreatedDate], [CreatedBy]) VALUES (12, N'Doctor', CAST(N'2017-07-27T22:05:47.287' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ID], [MeetingDate], [Type], [IsCancelled], [Notes], [Candidate_ID], [Employee_ID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Position_ID]) VALUES (11, CAST(N'2017-07-22T00:41:34.360' AS DateTime), N'I', N'0', NULL, 19, 38, CAST(N'2017-07-22T00:41:34.393' AS DateTime), 3, CAST(N'2017-07-22T00:41:34.393' AS DateTime), 3, 4)
INSERT [dbo].[Schedule] ([ID], [MeetingDate], [Type], [IsCancelled], [Notes], [Candidate_ID], [Employee_ID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Position_ID]) VALUES (12, CAST(N'2017-07-22T00:44:05.927' AS DateTime), N'T', N'0', NULL, 20, 37, CAST(N'2017-07-22T00:44:05.960' AS DateTime), 4, CAST(N'2017-07-22T00:44:05.960' AS DateTime), 4, 5)
INSERT [dbo].[Schedule] ([ID], [MeetingDate], [Type], [IsCancelled], [Notes], [Candidate_ID], [Employee_ID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Position_ID]) VALUES (13, CAST(N'2017-07-27T21:16:14.193' AS DateTime), N'I', N'0', NULL, 26, 54, CAST(N'2017-07-27T21:16:14.293' AS DateTime), 5, CAST(N'2017-07-27T21:16:14.293' AS DateTime), 5, 10)
INSERT [dbo].[Schedule] ([ID], [MeetingDate], [Type], [IsCancelled], [Notes], [Candidate_ID], [Employee_ID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Position_ID]) VALUES (14, CAST(N'2017-07-27T21:16:14.193' AS DateTime), N'I', N'0', NULL, 19, 55, CAST(N'2017-07-27T21:16:14.310' AS DateTime), 7, CAST(N'2017-07-27T21:16:14.310' AS DateTime), 7, 10)
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[ScheduleInterviewer] ON 

INSERT [dbo].[ScheduleInterviewer] ([ID], [Schedule_ID], [Employee_ID], [Status], [CreatedDate], [CreatedBy]) VALUES (10, 11, 38, N'C', CAST(N'2017-07-22T00:41:34.397' AS DateTime), 3)
INSERT [dbo].[ScheduleInterviewer] ([ID], [Schedule_ID], [Employee_ID], [Status], [CreatedDate], [CreatedBy]) VALUES (11, 12, 37, N'C', CAST(N'2017-07-22T00:44:06.043' AS DateTime), 4)
INSERT [dbo].[ScheduleInterviewer] ([ID], [Schedule_ID], [Employee_ID], [Status], [CreatedDate], [CreatedBy]) VALUES (12, 13, 54, N'C', CAST(N'2017-07-27T21:16:14.297' AS DateTime), 5)
INSERT [dbo].[ScheduleInterviewer] ([ID], [Schedule_ID], [Employee_ID], [Status], [CreatedDate], [CreatedBy]) VALUES (13, 14, 55, N'C', CAST(N'2017-07-27T21:16:14.310' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[ScheduleInterviewer] OFF
SET IDENTITY_INSERT [dbo].[TestGrade] ON 

INSERT [dbo].[TestGrade] ([ID], [Score], [Schedule_ID], [Employee_ID]) VALUES (2, 100, 11, 38)
INSERT [dbo].[TestGrade] ([ID], [Score], [Schedule_ID], [Employee_ID]) VALUES (3, NULL, 12, 37)
INSERT [dbo].[TestGrade] ([ID], [Score], [Schedule_ID], [Employee_ID]) VALUES (4, NULL, 13, 54)
INSERT [dbo].[TestGrade] ([ID], [Score], [Schedule_ID], [Employee_ID]) VALUES (5, NULL, 14, 55)
SET IDENTITY_INSERT [dbo].[TestGrade] OFF
ALTER TABLE [dbo].[EvaluationForm]  WITH CHECK ADD  CONSTRAINT [EvaluationForm_ScheduleInterviewer_FK] FOREIGN KEY([ScheduleInterviewer_ID])
REFERENCES [dbo].[ScheduleInterviewer] ([ID])
GO
ALTER TABLE [dbo].[EvaluationForm] CHECK CONSTRAINT [EvaluationForm_ScheduleInterviewer_FK]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Schedule_Candidate_FK] FOREIGN KEY([Candidate_ID])
REFERENCES [dbo].[Candidate] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Schedule_Candidate_FK]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Schedule_Employee_FK] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Schedule_Employee_FK]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Schedule_Position_FK] FOREIGN KEY([Position_ID])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Schedule_Position_FK]
GO
ALTER TABLE [dbo].[ScheduleInterviewer]  WITH CHECK ADD  CONSTRAINT [ScheduleInterviewer_Employee_FK] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[ScheduleInterviewer] CHECK CONSTRAINT [ScheduleInterviewer_Employee_FK]
GO
ALTER TABLE [dbo].[ScheduleInterviewer]  WITH CHECK ADD  CONSTRAINT [ScheduleInterviewer_Schedule_FK] FOREIGN KEY([Schedule_ID])
REFERENCES [dbo].[Schedule] ([ID])
GO
ALTER TABLE [dbo].[ScheduleInterviewer] CHECK CONSTRAINT [ScheduleInterviewer_Schedule_FK]
GO
ALTER TABLE [dbo].[TestGrade]  WITH CHECK ADD  CONSTRAINT [TestGrade_Employee_FK] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[TestGrade] CHECK CONSTRAINT [TestGrade_Employee_FK]
GO
ALTER TABLE [dbo].[TestGrade]  WITH CHECK ADD  CONSTRAINT [TestGrade_Schedule_FK] FOREIGN KEY([Schedule_ID])
REFERENCES [dbo].[Schedule] ([ID])
GO
ALTER TABLE [dbo].[TestGrade] CHECK CONSTRAINT [TestGrade_Schedule_FK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspGetAllIntervieweeByPeriodOfTime]
		@Period GetAllIntervieweeByPeriodOfTime_Type READONLY
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
		DECLARE @StartDate DATE
		DECLARE @EndDate DATE

		SElect top(1)  
		@StartDate=StartDate,
		@EndDate=EndDate
		from @Period

			SELECT  [Candidate].ID,[FirstName],[LastName],[AppliedPosition],[Email],[Address],[Gender],[Age],[PhoneNumber],[CV],[Referral],Candidate.[Status],Candidate.[CreatedDate],Candidate.[CreatedBy],[ModifedDate],[ModifedBy],
					Schedule.[Type],ScheduleInterviewer.[Status],EvaluationForm.RecommendPositionID,EvaluationForm.Notes,TestGrade.Score
			FROM dbo.Candidate
			join Schedule on Candidate.ID=Schedule.Candidate_ID
			join ScheduleInterviewer on Schedule.ID=ScheduleInterviewer.Schedule_ID
			join EvaluationForm on ScheduleInterviewer.ID=EvaluationForm.ScheduleInterviewer_ID
			join TestGrade on TestGrade.Schedule_ID=Schedule.ID
			where Candidate.CreatedDate>=@StartDate and Candidate.CreatedDate<=@EndDate

	END TRY
	BEGIN CATCH
		
		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;
		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;
		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		/*-1 return means Error Occured*/
		RETURN -1
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetInterviewee]
	
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT  [ID],[FirstName],[LastName],[AppliedPosition],[Email],[Address],[Gender],[Age],[PhoneNumber],[CV],[Referral],[Status],[CreatedDate],[CreatedBy],[ModifedDate],[ModifedBy]
			FROM dbo.Candidate

	END TRY
	BEGIN CATCH
		
		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;
		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;
		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		/*-1 return means Error Occured*/
		RETURN -1
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspGetInterviewer]
AS
BEGIN
	SET NOCOUNT ON;

		BEGIN TRY
			SELECT  [ID],[Username],[PasswordHash],[FirstName],[LastName],[Role],[CreatedDate],[CreatedBy]
			FROM dbo.Employee
			WHERE Role='I'

	END TRY
	BEGIN CATCH
		
		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;
		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;
		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		/*-1 return means Error Occured*/
		RETURN -1
	END CATCH

    
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspInsertInterviewee]
	@Interviewee	Candidate_Type READONLY
	
as
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
		
		BEGIN TRAN

		------------ BUSINESS LOGIC STARTS HERE -----------
		DECLARE @PositionId INT
		DECLARE @CandidateId INT
		DECLARE @FirstName varchar(100)
		DECLARE @LastName varchar(100)
		DECLARE @Gender char(1)
		DECLARE @Age int
		DECLARE @Email varchar(100)
		DECLARE @Address varchar(100)
		DECLARE @PhoneNumber char(50)
		DECLARE @CV varbinary(max)
		DECLARE @Referral int
		DECLARE @Status char(1)
		DECLARE @CallerId int
		DECLARE @AppliedPosition varchar(100)

        DECLARE curInsertInterviewee CURSOR FOR SELECT 
										FirstName,
										LastName,
										Gender,
										Age,
										Email,
										[Address],
										PhoneNumber,
										CV,
										Referral,
										[Status],
										CallerId,
										AppliedPosition
						   from @Interviewee

Open curInsertInterviewee

FETCH NEXT FROM curInsertInterviewee INTO  @FirstName 
										  ,@LastName 
										  ,@Gender 
										  ,@Age 
										  ,@Email
										  ,@Address 
										  ,@PhoneNumber 
										  ,@CV
										  ,@Referral
										  ,@Status 
										  ,@CallerId 
										  ,@AppliedPosition

WHILE (@@FETCH_STATUS=0)
BEGIN
		SELECT top 1 @PositionId = ID
		FROM dbo.Position
		WHERE Name =@AppliedPosition
	
		-- checking if position does not exists we insert new row

		IF @PositionId is null
			INSERT INTO dbo.Position VALUES (@AppliedPosition, getdate(), @CallerId)

		INSERT INTO dbo.Candidate VALUES (@FirstName,
										  @LastName,
										  @Gender,
										  @Age,
										  @Email,
										  @Address,
										  @PhoneNumber,
										  @CV,
										  @Referral,
										  @Status,
										  getDate(),
										  @CallerId,
										  getDate(),
										  @CallerId,
										  @AppliedPosition )

		
SET @CandidateID = SCOPE_IDENTITY()

	
FETCH NEXT FROM curInsertInterviewee INTO  @FirstName 
										  ,@LastName 
										  ,@Gender 
										  ,@Age 
										  ,@Email
										  ,@Address 
										  ,@PhoneNumber 
										  ,@CV
										  ,@Referral
										  ,@Status 
										  ,@CallerId 
										  ,@AppliedPosition
END
CLOSE curInsertInterviewee 
DEALLOCATE curInsertInterviewee
		------------ BUSINESS LOGIC ENDS HERE -----------
		COMMIT TRAN
    RETURN @CandidateId 

	END	 TRY
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;

		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;

		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;

		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		

		 /*-1 return means Error Occured*/
		 RETURN -1
		
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspInsertInterviewer]
	@Interviewer Interviewer_Type READONLY
as
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
		
		BEGIN TRAN

		------------ BUSINESS LOGIC STARTS HERE -----------
		DECLARE @PositionId INT
		DECLARE @EmployeeId INT

		DECLARE @Username varchar(100)
		DECLARE @Password varchar(200)
		DECLARE @FirstName varchar(100)
		DECLARE @LastName varchar(100)
		DECLARE @Role char(1)
		DECLARE @CallerId  int
		DECLARE @Position varchar(100)
		Declare @RoleDefaultValue char(1)

		DECLARE curInsertInterviewer CURSOR FOR SELECT
												 Username
												,[Password]
												,FirstName
												,LastName
												,[Role]
												,Position
												,CallerId
											from @Interviewer 
OPEN curInsertInterviewer

FETCH NEXT FROM curInsertInterviewer INTO @Username 
										 ,@Password 
										 ,@FirstName 
										 ,@LastName 
										 ,@Role 
										 ,@Position 
										 ,@CallerId  					  

WHILE(@@FETCH_STATUS=0)
 BEGIN
        SELECT top 1 @PositionId = Position.ID
		FROM dbo.Position
		WHERE Position.[Name] = @Position
		-- checking if position does not exists we insert new row

		IF @PositionId is null
			INSERT INTO dbo.Position VALUES (@Position, getdate(), @CallerId)

		SET @RoleDefaultValue='I'
		INSERT INTO dbo.Employee VALUES (@Username, @Password, @FirstName, @LastName, isnull(@Role,@RoleDefaultValue), getdate(), @CallerId )

		SET @EmployeeId = SCOPE_IDENTITY()

		FETCH NEXT FROM curInsertInterviewer INTO @Username 
												 ,@Password 
												 ,@FirstName 
												 ,@LastName 
												 ,@Role 
												 ,@Position 
												 ,@CallerId  	

 END
 CLOSE curInsertInterviewer
 DEALLOCATE curInsertInterviewer
		------------ BUSINESS LOGIC ENDS HERE -----------
		COMMIT TRAN
    RETURN @EmployeeId 

	END	 TRY
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;

		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;

		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;

		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate() )
		
		 /*-1 return means Error Occured*/

		RETURN -1
		
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspInsertSchedule]
	@Schedule Schedule_Type READONLY
	
as
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
		
		BEGIN TRAN

		------------ BUSINESS LOGIC STARTS HERE -----------
		DECLARE @ScheduleID int  
		DECLARE @MeetingDate [datetime]
		DECLARE	@Type [char](1) 
		DECLARE	@IsCancelled [char](1) 
		DECLARE	@Notes [varchar](300) 
		DECLARE	@Candidate_ID [int] 
		DECLARE	@Employee_ID [int] 
		DECLARE	@CreatedBy [int] 
		DECLARE	@ModifiedBy [int] 
		DECLARE	@Position_ID [int]

		DECLARE curInsertSchedule CURSOR FOR SELECT
											 [MeetingDate],
											 [Type],
											 IsCancelled,
											 Notes,
											 Candidate_ID,
											 Employee_ID,
											 CreatedBy,
											 ModifiedBy,
											 Position_ID
										from @Schedule
	
OPEN curInsertSchedule

FETCH NEXT FROM curInsertSchedule INTO @MeetingDate,
									   @Type,
									   @IsCancelled,
									   @Notes,
									   @Candidate_ID,
									   @Employee_ID,
									   @CreatedBy,
									   @ModifiedBy,
									   @Position_ID

WHILE(@@FETCH_STATUS=0)
 BEGIN
	INSERT INTO dbo.Schedule VALUES (@MeetingDate,
									 @Type,
									 @IsCancelled,
									 @Notes,
									 @Candidate_ID,
									 @Employee_ID,
									 GETDATE(),
									 @CreatedBy,
									 GETDATE(),
									 @ModifiedBy,
									 @Position_ID)


		
		SET @ScheduleID = SCOPE_IDENTITY()

		DECLARE @StatusCreated char(1)=N'C'
		DECLARE @ScheduleInterviewer int

		Insert into ScheduleInterviewer
		values(@ScheduleID,
				@Employee_ID,
				@StatusCreated,
				GETDATE(),
				@CreatedBy)

		set @ScheduleInterviewer=SCOPE_IDENTITY()

	   DECLARE @date datetime=GETDATE()
		Insert into EvaluationForm
             values(NULL,
					NULL,
					@date,
					@CreatedBy,
					NULL,
					@ScheduleInterviewer)



	   Insert into TestGrade
	   values (NULL,
			   @ScheduleID,
			   @Employee_ID
			   )
FETCH NEXT FROM curInsertSchedule INTO @MeetingDate,
									   @Type,
									   @IsCancelled,
									   @Notes,
									   @Candidate_ID,
									   @Employee_ID,
									   @CreatedBy,
									   @ModifiedBy,
									   @Position_ID

 END
  CLOSE curInsertSchedule
  DEALLOCATE curInsertSchedule
		------------ BUSINESS LOGIC ENDS HERE -----------

		COMMIT TRAN
    RETURN @ScheduleID

	END	 TRY
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;

		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;

		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;

		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		

		 /*-1 return means Error Occured*/
		 RETURN -1
		
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[uspUpdateEvaluationForm]
	@EvaluationForm EvaluationForm_Type READONLY
as
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY		
		BEGIN TRAN

		DECLARE @Notes varchar(300)
		DECLARE @JSONData nvarchar(max)
		DECLARE @RecommendPositionID int
		DECLARE @CreatedBy int
		DECLARE @Schedule_ID int
		DECLARE @Employee_ID int
		
		SELECT TOP (1) @Schedule_ID = Schedule_ID,
			   @Employee_ID = Employee_ID,
			   @CreatedBy = CreatedBy,
			   @RecommendPositionID = RecommendPositionID,
			   @JSONData = JSONData,
			   @Notes = Notes
		FROM @EvaluationForm

		DECLARE @ScheduleInterviewer_ID int
		
		SELECT @ScheduleInterviewer_ID = ID
		FROM ScheduleInterviewer
		WHERE @Schedule_ID = Schedule_ID and @Employee_ID = Employee_ID
		
		UPDATE EvaluationForm
		SET Notes = @Notes ,
		    RecommendPositionID = @RecommendPositionID ,
			CreatedDate = GETDATE(),
			CreatedBy = @CreatedBy,
			JSONData = @JSONData
		 WHERE ScheduleInterviewer_ID = @ScheduleInterviewer_ID

		COMMIT TRAN
    RETURN 

	END	 TRY
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;

		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;

		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;

		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		

		 /*-1 return means Error Occured*/
		 RETURN -1
		
	END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[uspUpdateTestGrade]
	@Grade TestGrade_type READONLY
as
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY		
		BEGIN TRAN
		DECLARE @Score int
		DECLARE @Schedule_ID int
		DECLARE @Employee_ID int

		SELECT TOP (1) @Score = Score,
				@Schedule_ID = [Schedule_ID],
				@Employee_ID = [Employee_ID]
		FROM @Grade 		

		UPDATE TestGrade
		SET Score = @Score
		WHERE Schedule_ID = @Schedule_ID and Employee_ID = @Employee_ID

		COMMIT TRAN
    RETURN 

	END	 TRY
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;

		DECLARE @Number int ;
		DECLARE @Procedure varchar(200) ;
		DECLARE @Message varchar(8000) ;

		SELECT @Number = ERROR_NUMBER(), @Procedure = ERROR_PROCEDURE(), @Message = ERROR_MESSAGE() ;

		INSERT INTO dbo.ErrorLog VALUES ( @Number, @Procedure, @Message, getdate())
		

		 /*-1 return means Error Occured*/
		 RETURN -1
		
	END CATCH
END
GO
