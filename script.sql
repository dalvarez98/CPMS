USE [master]
GO
/****** Object:  Database [CPMS Database]    Script Date: 6/24/2022 4:12:29 PM ******/
CREATE DATABASE [CPMS Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CPMS Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CPMS Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CPMS Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CPMS Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CPMS Database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CPMS Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CPMS Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CPMS Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CPMS Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CPMS Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CPMS Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [CPMS Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CPMS Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CPMS Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CPMS Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CPMS Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CPMS Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CPMS Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CPMS Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CPMS Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CPMS Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CPMS Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CPMS Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CPMS Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CPMS Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CPMS Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CPMS Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CPMS Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CPMS Database] SET RECOVERY FULL 
GO
ALTER DATABASE [CPMS Database] SET  MULTI_USER 
GO
ALTER DATABASE [CPMS Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CPMS Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CPMS Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CPMS Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CPMS Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CPMS Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CPMS Database', N'ON'
GO
ALTER DATABASE [CPMS Database] SET QUERY_STORE = OFF
GO
USE [CPMS Database]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 6/24/2022 4:12:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleInitial] [nvarchar](5) NULL,
	[LastName] [nvarchar](100) NULL,
	[Affiliation] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](2) NULL,
	[ZipCode] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaperSubmission]    Script Date: 6/24/2022 4:12:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaperSubmission](
	[PaperSubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NULL,
	[SubmissionAllowed] [smallint] NULL,
	[PaperTitle] [nvarchar](100) NULL,
	[Filename] [nvarchar](100) NULL,
	[Topic] [nvarchar](500) NULL,
 CONSTRAINT [PK_PaperSubmission] PRIMARY KEY CLUSTERED 
(
	[PaperSubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviewer]    Script Date: 6/24/2022 4:12:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviewer](
	[ReviewerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleInitial] [nvarchar](5) NULL,
	[LastName] [nvarchar](50) NULL,
	[Affiliation] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](2) NULL,
	[ZipCode] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[Topic] [nvarchar](500) NULL,
 CONSTRAINT [PK_Reviewer] PRIMARY KEY CLUSTERED 
(
	[ReviewerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewerPaperSubmission]    Script Date: 6/24/2022 4:12:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewerPaperSubmission](
	[ReviewerPaperSubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewerID] [int] NULL,
	[PaperSubmissionID] [int] NULL,
	[SubmissionAllowed] [smallint] NULL,
	[Appropriateness] [smallint] NULL,
	[Timeliness] [smallint] NULL,
	[Supportive] [smallint] NULL,
	[Technical] [smallint] NULL,
	[Scope] [smallint] NULL,
	[Citation] [smallint] NULL,
	[Originality] [smallint] NULL,
	[ContentComment] [nvarchar](500) NULL,
	[Organization] [smallint] NULL,
	[Clarity] [smallint] NULL,
	[Mechanics] [smallint] NULL,
	[WrittenComment] [nvarchar](500) NULL,
	[Suitability] [smallint] NULL,
	[Potential] [smallint] NULL,
	[OralComments] [nvarchar](500) NULL,
	[Rating] [smallint] NULL,
	[RatingComments] [nvarchar](500) NULL,
 CONSTRAINT [PK_ReviewerPaperSubmission] PRIMARY KEY CLUSTERED 
(
	[ReviewerPaperSubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaperSubmission]  WITH CHECK ADD  CONSTRAINT [FK_PaperSubmission_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[PaperSubmission] CHECK CONSTRAINT [FK_PaperSubmission_Author]
GO
ALTER TABLE [dbo].[ReviewerPaperSubmission]  WITH CHECK ADD  CONSTRAINT [FK_ReviewerPaperSubmission_PaperSubmission] FOREIGN KEY([PaperSubmissionID])
REFERENCES [dbo].[PaperSubmission] ([PaperSubmissionID])
GO
ALTER TABLE [dbo].[ReviewerPaperSubmission] CHECK CONSTRAINT [FK_ReviewerPaperSubmission_PaperSubmission]
GO
ALTER TABLE [dbo].[ReviewerPaperSubmission]  WITH CHECK ADD  CONSTRAINT [FK_ReviewerPaperSubmission_Reviewer] FOREIGN KEY([ReviewerID])
REFERENCES [dbo].[Reviewer] ([ReviewerID])
GO
ALTER TABLE [dbo].[ReviewerPaperSubmission] CHECK CONSTRAINT [FK_ReviewerPaperSubmission_Reviewer]
GO
USE [master]
GO
ALTER DATABASE [CPMS Database] SET  READ_WRITE 
GO
