USE [master]
GO
/****** Object:  Database [DemoMSU]    Script Date: 02-07-2021 11:18:48 ******/
CREATE DATABASE [DemoMSU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoMSU', FILENAME = N'D:\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoMSU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoMSU_log', FILENAME = N'D:\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoMSU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoMSU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoMSU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoMSU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoMSU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoMSU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoMSU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoMSU] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoMSU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoMSU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoMSU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoMSU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoMSU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoMSU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoMSU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoMSU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoMSU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoMSU] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoMSU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoMSU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoMSU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoMSU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoMSU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoMSU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoMSU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoMSU] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoMSU] SET  MULTI_USER 
GO
ALTER DATABASE [DemoMSU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoMSU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoMSU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoMSU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoMSU] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemoMSU', N'ON'
GO
ALTER DATABASE [DemoMSU] SET QUERY_STORE = OFF
GO
USE [DemoMSU]
GO
/****** Object:  UserDefinedTableType [dbo].[DemoFacutlyProgrameAdd]    Script Date: 02-07-2021 11:18:48 ******/
CREATE TYPE [dbo].[DemoFacutlyProgrameAdd] AS TABLE(
	[FacultyId] [int] NULL,
	[ProgrammeId] [int] NULL,
	[preferenceNo] [int] NULL,
	[IsActive] [bit] NULL,
	[UserId] [bigint] NULL,
	[UserTime] [datetime] NULL,
	[IsDeleted] [bit] NULL
)
GO
/****** Object:  Table [dbo].[DemoFacutlyPrograme]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DemoFacutlyPrograme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[ProgrammeId] [int] NOT NULL,
	[preferenceNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_DemoFacutlyPrograme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyProgrammeDemo]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyProgrammeDemo](
	[Id] [int] NOT NULL,
	[FacultyId] [int] NOT NULL,
	[ProgrammeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_FacultyProgrammeDemo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstFaculty]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstFaculty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](100) NOT NULL,
	[FacultyCode] [nvarchar](20) NOT NULL,
	[FacultyAddress] [nvarchar](max) NULL,
	[CityName] [nvarchar](50) NULL,
	[Pincode] [int] NULL,
	[FacultyContactNo] [nvarchar](15) NULL,
	[FacultyFaxNo] [nvarchar](20) NULL,
	[FacultyEmail] [nvarchar](150) NULL,
	[FacultyUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_InstituteMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstProgramme]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstProgramme](
	[Id] [int] NOT NULL,
	[ProgrammeName] [nvarchar](150) NOT NULL,
	[ProgrammeCode] [nvarchar](20) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[ProgrammeDescription] [nvarchar](max) NULL,
	[ProgrammeLevelId] [int] NOT NULL,
	[ProgrammeModeId] [int] NOT NULL,
	[ProgrammeTypeId] [int] NOT NULL,
	[InstructionMediumId] [int] NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[IsCBCS] [bit] NOT NULL,
	[IsSepartePassingHead] [bit] NULL,
	[MaxMarks] [int] NULL,
	[MinMarks] [int] NULL,
	[MaxCredits] [int] NULL,
	[MinCredits] [int] NULL,
	[ProgrammeDuration] [int] NOT NULL,
	[ProgrammeValidity] [int] NOT NULL,
	[TotalParts] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_MstProgramme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstFaculty] ON 

INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Faculty of Arts', N'FoA', NULL, NULL, NULL, NULL, NULL, N'dean-arts@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.063' AS DateTime), 1000000024, CAST(N'2021-05-17T11:21:12.420' AS DateTime))
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Faculty of Commerce', N'FoC', NULL, NULL, NULL, NULL, NULL, N'dean-comm@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.067' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Faculty of Education & Psychology', N'FoEdu&Psy', NULL, NULL, NULL, NULL, NULL, N'dean-edu@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.070' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Faculty of Family & Community Sciences', N'FoF&CS', NULL, NULL, NULL, NULL, NULL, N'dean-fcs@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.070' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Faculty of Fine Arts', N'FoFA', NULL, NULL, NULL, NULL, NULL, N'dean-farts@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.070' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Faculty of Journalism & Communication', N'FoJ&C', NULL, NULL, NULL, NULL, NULL, N'dean-jc@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.073' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Faculty of Law', N'FoL', NULL, NULL, NULL, NULL, NULL, N'dean-law@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.073' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Faculty of Management Studies', N'FoMS', NULL, NULL, NULL, NULL, NULL, N'dean-ms@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.077' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Faculty of Medicine', N'FoM', NULL, NULL, NULL, NULL, NULL, N'deanmcbrd@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.077' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Faculty of Performing Arts', N'FoPA', NULL, NULL, NULL, NULL, NULL, N'dean-perarts@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.077' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Faculty of Pharmacy', N'FoPH', NULL, NULL, NULL, NULL, NULL, N'dean-pharmacy@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.077' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Faculty of Science', N'FoS', NULL, NULL, NULL, NULL, NULL, N'dean-science@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.077' AS DateTime), NULL, NULL)
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'Faculty of Social Work', N'FoSW', N'', N'Vadodara', NULL, N'', N'', N'dean-sw@msubaroda.ac.in', N'https://www.msubaroda.ac.in/Academics/AboutFaculty/', 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.080' AS DateTime), 1000000024, CAST(N'2021-05-17T11:22:21.140' AS DateTime))
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'Faculty of Technology & Engineering', N'FoT&E', N'', N'', NULL, N'', N'', N'dean-techo@msubaroda.ac.in', N'https://www.msubaroda.ac.in/Academics/AboutFaculty/', 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.080' AS DateTime), 1000000024, CAST(N'2021-05-17T11:40:17.740' AS DateTime))
INSERT [dbo].[MstFaculty] ([Id], [FacultyName], [FacultyCode], [FacultyAddress], [CityName], [Pincode], [FacultyContactNo], [FacultyFaxNo], [FacultyEmail], [FacultyUrl], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'Test Faculty', N'TF', NULL, NULL, NULL, NULL, NULL, N'dean-TF@msubaroda.ac.in', NULL, 1, 0, 1202100007, CAST(N'2021-02-06T13:53:11.080' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstFaculty] OFF
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Bachelor of Arts (Hons.)', N'BA', 1, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.870' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Bachelor of Library and Information Science', N'BLIS', 1, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.870' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Beginners Certificate Course in French Language- Level-I', N'Certificate', 1, NULL, 1, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 5, 10, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.870' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Diploma in French', N'DIF', 1, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.870' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Diploma in German', N'DIG', 1, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.873' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Diploma in Persian', N'DIP', 1, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.873' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Diploma in Russian', N'DIR', 1, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.873' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Diploma in Political Leadership and Governance', N'DPLG', 1, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.873' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Master of Arts - Gujarati', N'MA', 1, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.873' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Master of Library and Information Science', N'MLIS', 1, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.877' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Post Diploma in French', N'PDIF', 1, NULL, 6, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.877' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Post Diploma in German', N'PDIG', 1, NULL, 6, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.877' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'Post Diploma in Russian', N'PDIR', 1, NULL, 6, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.877' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'ACHARYA', N'ACHARYA', 1, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.877' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'SHASTRI', N'SHASTRI', 1, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.880' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'VISHARAD', N'VISHARAD', 1, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.880' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'Bachelor of Business Administration', N'B.B.A.', 2, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.880' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'Bachelor of Commerce', N'B.Com.', 2, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.897' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N'Bachelor of Commerce (Honours)', N'B.Com.(Hon', 2, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.897' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N'Master of Commerce', N'M.Com.', 2, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.897' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N'Post Graduate Diploma', N'PG Diploma', 2, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.897' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N'Under Graduate Diploma in Cooperative Management', N'UGDCIM', 2, NULL, 4, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.897' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, N'Bachelor of Education', N'B.Ed', 3, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, N'Master in Education', N'M.Ed.', 3, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, N'Master of Management Studies (Education)', N'MMS (Educa', 3, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, N'Professional Diploma in Educational Managemnt', N'PDEM', 3, NULL, 5, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, N'Post-Graduate Diploma', N'PG Diploma', 3, NULL, 5, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, N'Bachelor of Science (Family and Community Sciences)', N'B.Sc. (F.C', 4, N'Bachelor of Science (Family and Community Sciences)', 2, 1, 4, 1, 2, 1, 0, 0, 0, 0, 0, 36, 72, 3, 1, 1, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), 1000000024, CAST(N'2021-05-17T13:03:09.103' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, N'Bachelor of Science (Fashion Technology)', N'B.Sc.(F.T.', 4, NULL, 2, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, N'Bachelor of Science (Honors)', N'B.Sc.(F.C.', 4, NULL, 2, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, N'Bachelor of Science (Honors)(Fashion Technology)', N'B.Sc.(F.C.', 4, NULL, 2, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, N'Master of Science [F.C.Sc.]', N'M.Sc.(F.C.', 4, NULL, 3, 1, 4, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, N'Post Graduate Diploma', N'PG Diploma', 4, NULL, 5, 1, 4, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, N'Post Graduate Diploma (Fashion Technology)', N'PG Diploma', 4, NULL, 5, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.900' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, N'Bachelor of Design', N'B. Des', 5, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 48, 96, 4, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, N'Bachelor of VIsual Arts', N'BVA', 5, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 48, 96, 4, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, N'Certificate Course for in-service Foreign/Indian Students', N'CIM', 5, NULL, 1, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (38, N'Diploma in Visual Arts', N'DVA', 5, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 48, 96, 4, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, N'Master of Design', N'M. Des', 5, NULL, 3, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, N'Master of Museology', N'MAFINE (MU', 5, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, N'Master of Visual Arts', N'MVA', 5, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, N'Post Diploma in Visual Arts', N'PDVA', 5, NULL, 6, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, N'One Year In-service Post-Graduate Diploma in Museology', N'PGDM', 5, NULL, 5, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, N'Bachelor of Arts and Bachelor of Laws (Honors) Integrated Five Years Law Degree Course in Social Science and Language', N'B.A.LL.B. ', 7, NULL, 2, 1, 5, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 60, 120, 5, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, N'Bachelor of Law (General)', N'LL.B. (Gen', 7, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.903' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, N'Bachelor of Law (Special)', N'LL.B. (Spe', 7, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, N'Master of Laws', N'LL.M.', 7, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, N'Post Graduate Diploma in Labour Practice', N'P.G.D.L.P.', 7, NULL, 5, 1, 5, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, N'Post Graduate Diploma in Taxation Practice', N'P.G.D.T.P.', 7, NULL, 5, 1, 5, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, N'Bachelor of Journalism and Mass Communciation', N'BJMC', 6, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, N'Master of Journalism and Mass Communication', N'MJMC', 6, NULL, 3, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, N'Three Year Evening MBA Programme', N'MBA', 8, NULL, 3, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.950' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, N'Master of Science in Nursing', N'M. Sc. Nur', 9, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.953' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, N'Post Basic B.Sc. Nursing', N'PBBSc Nurs', 9, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.953' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, N'Bachelor of Performing Arts', N'B.P.A.', 10, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.953' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, N'Master of Performing Arts', N'M.P.A.', 10, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.953' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, N'Post Graduate Diploma in Natuvangam', N'P.G.Diplom', 10, NULL, 5, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.953' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, N'Bachelor of Pharmacy', N'B.Pharm.', 11, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.957' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, N'Master of Pharmacy', N'M.Pharm.', 11, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.957' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, N'Bachelor of Computer Applications', N'BCA', 12, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.957' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, N'Bachelor of Environment Science', N'BSC (Env)', 12, NULL, 2, 1, 5, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.957' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (62, N'Bachelor of Science (Honors)', N'BSc (Hons)', 12, NULL, 2, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.970' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (63, N'Master of Science', N'MSC', 12, NULL, 3, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.970' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (64, N'PG Diploms in Applied Biochemistry', N'PGDAB', 12, NULL, 5, 1, 4, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:36.997' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (65, N'Bachelor of Social Work', N'BSW', 13, NULL, 2, 1, 4, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (66, N'Post Graduate Diploma', N'P G Diploma', 13, NULL, 3, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (67, N'Master of Human Resource Management', N'MHRM', 13, NULL, 3, 1, 5, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (68, N'Master of Social Work', N'MSW', 13, NULL, 3, 1, 4, 1, 2, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (69, N'Bachelor  of Architecture', N'B. ARCH.', 14, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 60, 120, 5, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (70, N'Bachelor of Engineering', N'B.E.-Met.&', 14, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 48, 96, 4, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.010' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (71, N'Bachelor of Engineering Part Time Degree Course', N'B.E.-PTD', 14, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 48, 96, 4, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.013' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (72, N'Post B.Sc.Diploma in Textile Chemistry', N'B.Sc. D.T.', 14, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.013' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (73, N'Diploma  Engineering', N'D.T.C.', 14, NULL, 4, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.013' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (74, N'Diploma  Engineering', N'D.T.T.', 14, NULL, 4, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.013' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (75, N'Master of Engineering', N'M.E.', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (76, N'Master of Science (Financial Mathematics)', N'M.Sc.(Fina', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (77, N'Master of Science (Applied Mathematics)', N'M.Sc.(Appl', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (78, N'Master of Science in Applied Chemistry', N'M.Sc.(Appl', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (79, N'Master of Science in  Applied Physics', N'M.Sc.(Appl', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (80, N'Master of Science (Materials Science) Nanotechnology', N'M.Sc.(Mate', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.017' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (81, N'Master of Urban and Regional Planning', N'M.U.R.P.', 14, NULL, 3, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 24, 48, 2, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.020' AS DateTime), 1000000024, CAST(N'2021-05-15T16:54:15.187' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (82, N'Post B.Sc. Bachelor of Enginnering-Pre Electronics', N'Post B.Sc.', 14, NULL, 2, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.020' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (83, N'Post Graduate Diploma', N'P G Diplom', 14, NULL, 5, 1, 4, 1, 3, 0, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.020' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (84, N'Master of Science', N'MSC', 12, NULL, 3, 1, 4, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 12, 24, 1, 1, 0, 1202100007, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (85, N'Diploma', N'Diploma', 14, N'null', 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (86, N'Diploma in Architectural Assistanceship', N'D.Arch', 14, NULL, 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (87, N'Test1 Programme', N'Test1', 15, NULL, 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (88, N'Test2 Programme', N'Test2', 15, NULL, 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (89, N'Test3 Programme', N'Test3', 15, NULL, 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 36, 72, 3, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (90, N'Certificate Course', N'Certificat', 4, N'Certificate Course in Hotel Interior', 1, 1, 2, 1, 2, 1, 0, 1300, 1000, 150, 144, 12, 24, 1, 1, 1, 1000000024, CAST(N'2021-05-18T11:47:20.673' AS DateTime), 1000000024, CAST(N'2021-05-18T12:06:49.283' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (91, N'Certificate Course in Tabla', N'Certifiate', 10, N'Certificate Course of Tabla', 1, 1, 2, 1, 2, 0, 0, 1200, 1000, 150, 144, 12, 24, 1, 1, 0, 1000000024, CAST(N'2021-05-18T12:13:23.530' AS DateTime), 1000000024, CAST(N'2021-05-18T12:21:54.300' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (92, N'Test4 Programme', N'Test4', 15, N'Test1 Programme', 5, 1, 4, 1, 3, 0, 1, NULL, NULL, NULL, NULL, 45, 45, 1, 1, 0, 1202100007, CAST(N'2021-02-19T12:55:37.020' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (93, N'B.Sc.(Supplementary)', N'SSBSC(SUPP', 12, N'B.Sc.(Supplementary)', 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 12, 24, 1, 1, 0, 1000000024, CAST(N'2021-05-28T12:40:47.113' AS DateTime), NULL, NULL)
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (94, N'Master of Computer Application', N'M.C.A', 14, N'Master of Computer Application', 3, 1, 4, 1, 3, 0, 0, 0, 0, 0, 0, 24, 48, 2, 1, 0, 1000000024, CAST(N'2021-05-28T12:43:16.857' AS DateTime), 1000000024, CAST(N'2021-05-29T11:33:36.430' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (95, N'M.Sc.(Cell and Molecular Biology)-[5 Year Integrated Program]', N'M.Sc.(CMB)', 12, N'M.Sc.(Cell and Molecular Biology)-[5 Year Integrated Program]', 3, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 60, 120, 5, 1, 0, 1000000024, CAST(N'2021-05-28T12:48:50.167' AS DateTime), 1000000024, CAST(N'2021-06-02T10:58:50.603' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (106, N'Bachelor of Arts in Psychology', N'B.A.(Psych', 3, N'Bachelor of Arts in Education Psychology', 2, 1, 4, 1, 1, 1, 0, 0, 0, 0, 0, 36, 72, 3, 1, 0, 1000000024, CAST(N'2021-06-02T12:30:22.230' AS DateTime), 1000000024, CAST(N'2021-06-02T12:38:14.497' AS DateTime))
INSERT [dbo].[MstProgramme] ([Id], [ProgrammeName], [ProgrammeCode], [FacultyId], [ProgrammeDescription], [ProgrammeLevelId], [ProgrammeModeId], [ProgrammeTypeId], [InstructionMediumId], [EvaluationId], [IsCBCS], [IsSepartePassingHead], [MaxMarks], [MinMarks], [MaxCredits], [MinCredits], [ProgrammeDuration], [ProgrammeValidity], [TotalParts], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (107, N'Master of Arts in Psychology', N'M.A.(Psych', 3, N'Master of Arts in Education Psychology', 3, 1, 4, 1, 1, 1, 0, 0, 0, 0, 0, 24, 48, 2, 1, 0, 1000000024, CAST(N'2021-06-02T12:42:32.463' AS DateTime), NULL, NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MstFaculty]    Script Date: 02-07-2021 11:18:48 ******/
ALTER TABLE [dbo].[MstFaculty] ADD  CONSTRAINT [IX_MstFaculty] UNIQUE NONCLUSTERED 
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MstFaculty1]    Script Date: 02-07-2021 11:18:48 ******/
ALTER TABLE [dbo].[MstFaculty] ADD  CONSTRAINT [IX_MstFaculty1] UNIQUE NONCLUSTERED 
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DemoFacutlyPrograme]  WITH CHECK ADD  CONSTRAINT [FK_DemoFacutlyPrograme_MstFaculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[MstFaculty] ([Id])
GO
ALTER TABLE [dbo].[DemoFacutlyPrograme] CHECK CONSTRAINT [FK_DemoFacutlyPrograme_MstFaculty]
GO
ALTER TABLE [dbo].[DemoFacutlyPrograme]  WITH CHECK ADD  CONSTRAINT [FK_DemoFacutlyPrograme_MstProgramme] FOREIGN KEY([ProgrammeId])
REFERENCES [dbo].[MstProgramme] ([Id])
GO
ALTER TABLE [dbo].[DemoFacutlyPrograme] CHECK CONSTRAINT [FK_DemoFacutlyPrograme_MstProgramme]
GO
ALTER TABLE [dbo].[FacultyProgrammeDemo]  WITH CHECK ADD  CONSTRAINT [FK_FacultyProgrammeDemo_MstFaculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[MstFaculty] ([Id])
GO
ALTER TABLE [dbo].[FacultyProgrammeDemo] CHECK CONSTRAINT [FK_FacultyProgrammeDemo_MstFaculty]
GO
ALTER TABLE [dbo].[FacultyProgrammeDemo]  WITH CHECK ADD  CONSTRAINT [FK_FacultyProgrammeDemo_MstProgramme] FOREIGN KEY([ProgrammeId])
REFERENCES [dbo].[MstProgramme] ([Id])
GO
ALTER TABLE [dbo].[FacultyProgrammeDemo] CHECK CONSTRAINT [FK_FacultyProgrammeDemo_MstProgramme]
GO
ALTER TABLE [dbo].[MstProgramme]  WITH CHECK ADD  CONSTRAINT [FK_MstProgramme_MstFaculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[MstFaculty] ([Id])
GO
ALTER TABLE [dbo].[MstProgramme] CHECK CONSTRAINT [FK_MstProgramme_MstFaculty]
GO
/****** Object:  StoredProcedure [dbo].[DemoFacultyProgrammeAdd]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacultyProgrammeAdd]
	-- Add the parameters for the stored procedure here
	--@Id INT = 0,
	@FacultyId INT=0,
	@ProgrammeId INT = 0,
	@preferenceNo INT = 0,
	@Message nvarchar(Max) OUTPUT,
	@UserId bigint,
	@UserTime DATETIME
AS

BEGIN
	BEGIN TRY	
			BEGIN
					IF NOT EXISTS ( SELECT * FROM DemoFacutlyPrograme where FacultyId = @FacultyId and ProgrammeId = @ProgrammeId)
					BEGIN
					SET @preferenceNo = (SELECT ISNULL(MAX(preferenceNo)+1,1) FROM DemoFacutlyPrograme where FacultyId = @FacultyId)
					--SET @Id =  (select ISNULL(MAX(Id)+1,1) from DemoFacutlyPrograme)
				

					--SET IDENTITY_INSERT FacultyInstituteMap ON
	
					INSERT INTO DemoFacutlyPrograme
					(
						--Id,
						FacultyId, ProgrammeId,preferenceNo,IsActive, CreatedBy, CreatedOn, IsDeleted
					)
					VALUES
					(
						--@Id,
						@FacultyId , @ProgrammeId,@preferenceNo, 'True', @UserId, @UserTime, 'False' 
					)
					--SET IDENTITY_INSERT FacultyInstituteMap OFF
						SET @Message = 'TRUE'
					END
					ELSE
					BEGIN 
					SET @Message = 'Record already exists.'
					END
			END
		END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DemoFacultyProgrammeAddMulti]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacultyProgrammeAddMulti]
@DemoFacutlyProgrameAdd DemoFacutlyProgrameAdd ReadOnly,
@Message NVARCHAR(MAX) OUTPUT
	
AS

BEGIN
	BEGIN TRY
		BEGIN
				
				
				
				INSERT INTO DemoFacutlyPrograme
				(
					   FacultyId
					   ,ProgrammeId
					  ,PreferenceNo					  
					  , IsActive
					  , CreatedBy
					  , CreatedOn					  
					  , IsDeleted
				)
				SELECT DFPA.FacultyId,
				DFPA.ProgrammeId,
				DFPA.PreferenceNo,
				DFPA.IsActive,
				DFPA.UserId,
				DFPA.UserTime,
				DFPA.IsDeleted
				
				FROM @DemoFacutlyProgrameAdd DFPA
				
				SET @Message = 'TRUE'
				
				
				
				
		END
	END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DemoFacultyProgrammeDelete]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jay Shah
-- Create date: 01/12/2020
-- Description:	Stored procedure for Delete the records in MstSubject table
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacultyProgrammeDelete] 
	-- Add the parameters for the stored procedure here
	@Id INT,
	
	@Message nvarchar(Max) OUTPUT,
	@UserId bigint = 0,
	@UserTime DATETIME
AS
BEGIN
	BEGIN TRY
		BEGIN
			IF EXISTS(select * from DemoFacutlyPrograme where Id = @Id and IsDeleted = 'False')
			BEGIN
				UPDATE DemoFacutlyPrograme
				SET IsDeleted = 'True',
				ModifiedBy = @UserId,
				ModifiedOn = @UserTime
				WHERE Id = @Id
				
				SET @Message = 'TRUE'
			END
			ELSE
			BEGIN				
				SET @Message = 'Record Not Found.'
		END
	END

	END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DemoFacultyProgrammeDeleteById]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bhushan Pendse	
-- Create date: 30-03-2021
-- Description:	Stored procedure for Delete the records in ApplicationPreference table
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacultyProgrammeDeleteById] 
	-- Add the parameters for the stored procedure here
@FacultyId INT = 0
,@Message NVARCHAR(Max) OUTPUT

AS
BEGIN
	BEGIN TRY
		BEGIN
			IF EXISTS(SELECT Id, IsDeleted FROM DemoFacutlyPrograme WHERE FacultyId = @FacultyId)
			BEGIN
				Delete from DemoFacutlyPrograme
				WHERE FacultyId = @FacultyId
				
				SET @Message = 'TRUE'
			END
			ELSE
			BEGIN				
				SET @Message = 'Record Not Found.'
		END
	END

	END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DemoFacultyProgrammeEdit]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacultyProgrammeEdit]
	-- Add the parameters for the stored procedure here
	@Id INT=0,
	@FacultyId INT=0,
	@ProgrammeId INT = 0,
	@preferenceNo INT = 0,
	@Message nvarchar(Max) OUTPUT,
	@UserId bigint,
	@UserTime DATETIME
	
AS
BEGIN
	BEGIN TRY
		BEGIN
			IF NOT EXISTS ( SELECT * FROM DemoFacutlyPrograme where FacultyId = @FacultyId and ProgrammeId = @ProgrammeId AND preferenceNo = @preferenceNo)
		BEGIN
				UPDATE DemoFacutlyPrograme
				SET 
				FacultyId = @FacultyId,
				ProgrammeId = @ProgrammeId,
				preferenceNo = @preferenceNo,
				ModifiedBy = @UserId,
				ModifiedOn = @UserTime
				
				WHERE Id = @Id
				
				SET @Message = 'TRUE'
		END
		ELSE
		BEGIN
				SET @Message = 'Record Not Found.'
		END
		END
	END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DemoFacutlyProgrameGet]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bhushan Pendse	
-- Create date: 03/12/2020
-- Description:	Stored procedure for fetching records in MstSubject table
-- =============================================
CREATE PROCEDURE [dbo].[DemoFacutlyProgrameGet]

AS
BEGIN
 
Select  DemoFacutlyPrograme.Id 
,DemoFacutlyPrograme.FacultyId as FacultyId
,DemoFacutlyPrograme.ProgrammeId as ProgrammeId
,DemoFacutlyPrograme.preferenceNo
,DemoFacutlyPrograme.IsActive
,DemoFacutlyPrograme.CreatedBy
,DemoFacutlyPrograme.CreatedOn
,DemoFacutlyPrograme.ModifiedBy
,DemoFacutlyPrograme.ModifiedOn
,DemoFacutlyPrograme.IsDeleted
,MstFaculty.FacultyName
,MstProgramme.ProgrammeName

from DemoFacutlyPrograme

Inner Join MstProgramme on DemoFacutlyPrograme.ProgrammeId = MstProgramme.Id
Inner Join MstFaculty on DemoFacutlyPrograme.FacultyId = MstFaculty.Id
Where  DemoFacutlyPrograme.IsDeleted = 'False'

ORDER BY DemoFacutlyPrograme.CreatedOn DESC , DemoFacutlyPrograme.ModifiedOn DESC

 
END
GO
/****** Object:  StoredProcedure [dbo].[FacultyProgrammeDemoAdd]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FacultyProgrammeDemoAdd]
	-- Add the parameters for the stored procedure here
	@Id INT = 0,
	@FacultyId INT=0,
	@ProgrammeId INT = 0,
	@Message nvarchar(Max) OUTPUT,
	@UserId bigint,
	@UserTime DATETIME
AS

BEGIN
	BEGIN TRY	
			BEGIN
					IF NOT EXISTS ( SELECT * FROM FacultyProgrammeDemo where FacultyId = @FacultyId and ProgrammeId = @ProgrammeId)
					BEGIN
					--SET @preferenceNo = (SELECT ISNULL(MAX(preferenceNo)+1,1) FROM DemoFacutlyPrograme where FacultyId = @FacultyId)
					SET @Id =  (select ISNULL(MAX(Id)+1,1) from FacultyProgrammeDemo)
				

					--SET IDENTITY_INSERT FacultyInstituteMap ON
	
					INSERT INTO FacultyProgrammeDemo
					(
						Id,FacultyId, ProgrammeId,IsActive, CreatedBy, CreatedOn, IsDeleted
					)
					VALUES
					(
						@Id,@FacultyId , @ProgrammeId, 'True', @UserId, @UserTime, 'False' 
					)
					--SET IDENTITY_INSERT FacultyInstituteMap OFF
						SET @Message = 'TRUE'
					END
					ELSE
					BEGIN 
					SET @Message = 'Record already exists.'
					END
			END
		END TRY

	BEGIN CATCH
		SET @Message = ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FacutlyProgrameDemo_Delete]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FacutlyProgrameDemo_Delete] 
	@FacultyId INT,
	@ProgrammeId INT,
	@MESSAGE nvarchar(MAX) OUTPUT
AS
BEGIN
	BEGIN try
	BEGIN
	IF EXISTS(SELECT * FROM FacultyProgrammeDemo WHERE FacultyId = @FacultyId AND ProgrammeId=@ProgrammeId AND IsDeleted = 'FALSE')
	BEGIN
    DELETE FROM FacultyProgrammeDemo	
	WHERE FacultyId = @FacultyId AND 
	ProgrammeId=@ProgrammeId 

	SET @MESSAGE = 'TRUE'
	END
	
	ELSE
		BEGIN
				SET @MESSAGE = 'Record Not Found.'
		END
	 
	END
	END try

	BEGIN CATCH
		SET @MESSAGE = ERROR_MESSAGE()
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[FacutlyProgrameDemoGet]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bhushan Pendse	
-- Create date: 03/12/2020
-- Description:	Stored procedure for fetching records in MstSubject table
-- =============================================
CREATE PROCEDURE [dbo].[FacutlyProgrameDemoGet]

AS
BEGIN
 
Select  FacultyProgrammeDemo.Id 
,FacultyProgrammeDemo.FacultyId as FacultyId
,FacultyProgrammeDemo.ProgrammeId as ProgrammeId
,FacultyProgrammeDemo.IsActive
,FacultyProgrammeDemo.CreatedBy
,FacultyProgrammeDemo.CreatedOn
,FacultyProgrammeDemo.ModifiedBy
,FacultyProgrammeDemo.ModifiedOn
,FacultyProgrammeDemo.IsDeleted
,MstFaculty.FacultyName
,MstProgramme.ProgrammeName

from FacultyProgrammeDemo

Inner Join MstProgramme on FacultyProgrammeDemo.ProgrammeId = MstProgramme.Id
Inner Join MstFaculty on FacultyProgrammeDemo.FacultyId = MstFaculty.Id
Where  FacultyProgrammeDemo.IsDeleted = 'False'

ORDER BY FacultyProgrammeDemo.CreatedOn ASC , FacultyProgrammeDemo.ModifiedOn ASC

 
END
GO
/****** Object:  StoredProcedure [dbo].[MstFacultyGet]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jay Shah	
-- Create date: 01/12/2020
-- Description:	Stored procedure for fetching records in MstFaculty table
-- =============================================
CREATE PROCEDURE [dbo].[MstFacultyGet]

AS

BEGIN
	
	SELECT   MstFaculty.Id,
			 MstFaculty.FacultyName, 
			 MstFaculty.FacultyCode, 
			 MstFaculty.FacultyAddress, 
			 MstFaculty.CityName, 
			 MstFaculty.Pincode, 
			 MstFaculty.FacultyContactNo, 
			 MstFaculty.FacultyFaxNo, 
			 MstFaculty.FacultyEmail, 
			 MstFaculty.FacultyUrl, 
			 MstFaculty.IsActive,
			 CASE WHEN (MstFaculty.IsActive='TRUE') THEN 'ACTIVE' ELSE 'SUSPENDED' END AS IsActiveSts			 
	
	FROM MstFaculty

	WHERE  MstFaculty.IsDeleted = 'FALSE'
	
	ORDER BY MstFaculty.ModifiedOn DESC,
			 MstFaculty.CreatedOn DESC
	
END
GO
/****** Object:  StoredProcedure [dbo].[MstProgrammeGet]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bhavita Soni
-- Create date: 05-12-2020
-- Description:	Stored procedure for fetching records in MstProgramme table
-- =============================================
CREATE PROCEDURE [dbo].[MstProgrammeGet]
	
  AS
BEGIN
	SELECT
	  MstProgramme.Id
	, MstProgramme.ProgrammeName
	, MstProgramme.ProgrammeCode
	, MstProgramme.FacultyId
	, MstFaculty.FacultyName
	, MstProgramme.ProgrammeDescription
	, MstProgrammeLevel.ProgrammeLevelName
	, MstProgramme.ProgrammeLevelId
	, MstProgramme.ProgrammeModeId
	, MstProgrammeMode.ProgrammeModeName
	, MstProgrammeType.ProgrammeTypeName
	, MstEvaluation.EvaluationName
	, MstInstructionMedium.InstructionMediumName
	, MstProgramme.ProgrammeTypeId
	, MstProgramme.InstructionMediumId
	, MstProgramme.EvaluationId
	, MstProgramme.IsCBCS
	, CASE WHEN (MstProgramme.IsCBCS = 'TRUE') THEN 'YES' ELSE 'NO' END AS IsCBCSSts
	, MstProgramme.IsSepartePassingHead
	, CASE WHEN (MstProgramme.IsSepartePassingHead = 'TRUE') THEN 'YES' ELSE 'NO' END AS IsSepPassHeadSts
	, MstProgramme.MaxMarks
	, MstProgramme.MinMarks
	, MstProgramme.MaxCredits
	, MstProgramme.MinCredits
	, MstProgramme.ProgrammeDuration
	, MstProgramme.ProgrammeValidity
	, MstProgramme.TotalParts
	, MstProgramme.IsActive
	, MstProgramme.CreatedBy
	, MstProgramme.CreatedOn
	, MstProgramme.ModifiedBy
	, MstProgramme.ModifiedOn
	, MstProgramme.IsDeleted
	, CASE WHEN (MstProgramme.IsActive='TRUE') THEN 'ACTIVE' ELSE 'SUSPENDED' END AS IsActiveSts
	FROM MstProgramme 
	INNER JOIN MstFaculty ON MstFaculty.Id = MstProgramme.FacultyId
	INNER JOIN MstEvaluation ON MstEvaluation.Id = MstProgramme.EvaluationId
	INNER JOIN MstInstructionMedium ON MstInstructionMedium.Id = MstProgramme.InstructionMediumId
	INNER JOIN MstProgrammeLevel ON MstProgrammeLevel.Id = MstProgramme.ProgrammeLevelId
	INNER JOIN MstProgrammeMode ON MstProgrammeMode.Id = MstProgramme.ProgrammeModeId
	INNER JOIN MstProgrammeType ON MstProgrammeType.Id = MstProgramme.ProgrammeTypeId
	WHERE MstProgramme.IsDeleted = 'FALSE'
	ORDER BY MstProgramme.CreatedOn DESC,
	MstProgramme.ModifiedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[MstProgrammeGetByFacId]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MstProgrammeGetByFacId]
    @FacultyId INT = 0
   
  AS
BEGIN
   
    SELECT
      MstProgramme.Id
    , MstProgramme.ProgrammeName
    , MstProgramme.ProgrammeCode
    , MstProgramme.FacultyId
    , MstFaculty.FacultyName
	, DemoFacutlyPrograme.Id as DemoFacutlyProgrameId
	, DemoFacutlyPrograme.ProgrammeId
    
    , CASE WHEN (MstProgramme.IsActive='TRUE') THEN 'ACTIVE' ELSE 'SUSPENDED' END AS IsActiveSts
	,CASE WHEN (DemoFacutlyPrograme.Id Is NULL) THEN 0 ELSE 1 END AS ProgChecked
    FROM MstProgramme
    INNER JOIN MstFaculty ON MstFaculty.Id = MstProgramme.FacultyId
    LEFT JOIN DemoFacutlyPrograme ON DemoFacutlyPrograme.ProgrammeId = MstProgramme.Id

    WHERE MstProgramme.IsDeleted = 'FALSE' AND MstFaculty.Id = @FacultyId
    ORDER BY MstProgramme.CreatedOn DESC,
    MstProgramme.ModifiedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[MstProgrammeGetByFId]    Script Date: 02-07-2021 11:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MstProgrammeGetByFId]
    @FacultyId INT = 0
   
  AS
BEGIN
   
    SELECT
      MstProgramme.Id
    , MstProgramme.ProgrammeName
    , MstProgramme.ProgrammeCode
    , MstProgramme.FacultyId
    , MstFaculty.FacultyName
	,MstProgramme.IsActive
	,MstProgramme.IsDeleted
	, CASE WHEN (MstProgramme.IsActive='TRUE') THEN 'ACTIVE' ELSE 'SUSPENDED' END AS IsActiveSts
	
    FROM MstProgramme
    INNER JOIN MstFaculty ON MstFaculty.Id = MstProgramme.FacultyId
    

    WHERE MstProgramme.IsDeleted = 'FALSE' AND MstFaculty.Id = @FacultyId
    ORDER BY MstProgramme.CreatedOn DESC,
    MstProgramme.ModifiedOn DESC
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short Name of the Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address of the Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code of the city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'CityName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pincode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'Pincode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contact No of Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax no of Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyFaxNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email Id of Head of Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Website Url of the Faculty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'FacultyUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inactive in case name change or modified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Soft Delete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Faculty Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstFaculty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the Programme (Bachelor of Commerce)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short name of the Programme (B.Com.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Faculty from which the programme is offered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'FacultyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Level of Programme like Certificate, Under Graduate, Diploma' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeLevelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mode of Programme: Regular or Distance ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeModeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type: General/Technical/Research' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Medium of Instruction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'InstructionMediumId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Evaluation : Marks/Direct Grade/Indirect Grade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'EvaluationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Programme duration in Months' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Validity of Programme in Months' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'ProgrammeValidity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Year or Parts of the Programme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstProgramme', @level2type=N'COLUMN',@level2name=N'TotalParts'
GO
USE [master]
GO
ALTER DATABASE [DemoMSU] SET  READ_WRITE 
GO
