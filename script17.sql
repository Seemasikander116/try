USE [master]
GO
/****** Object:  Database [hamarawa_learning]    Script Date: 12/3/2020 11:40:40 PM ******/
CREATE DATABASE [hamarawa_learning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hamarawa_learning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\hamarawa_learning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hamarawa_learning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\hamarawa_learning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hamarawa_learning] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hamarawa_learning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hamarawa_learning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hamarawa_learning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hamarawa_learning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hamarawa_learning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hamarawa_learning] SET ARITHABORT OFF 
GO
ALTER DATABASE [hamarawa_learning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hamarawa_learning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hamarawa_learning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hamarawa_learning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hamarawa_learning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hamarawa_learning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hamarawa_learning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hamarawa_learning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hamarawa_learning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hamarawa_learning] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hamarawa_learning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hamarawa_learning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hamarawa_learning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hamarawa_learning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hamarawa_learning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hamarawa_learning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hamarawa_learning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hamarawa_learning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hamarawa_learning] SET  MULTI_USER 
GO
ALTER DATABASE [hamarawa_learning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hamarawa_learning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hamarawa_learning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hamarawa_learning] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hamarawa_learning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hamarawa_learning] SET QUERY_STORE = OFF
GO
USE [hamarawa_learning]
GO
/****** Object:  User [NT Service\MSSQL$SQLEXPRESS01]    Script Date: 12/3/2020 11:40:40 PM ******/
CREATE USER [NT Service\MSSQL$SQLEXPRESS01] FOR LOGIN [NT Service\MSSQL$SQLEXPRESS01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Digital_Learning]    Script Date: 12/3/2020 11:40:41 PM ******/
CREATE SCHEMA [Digital_Learning]
GO
/****** Object:  Schema [education]    Script Date: 12/3/2020 11:40:41 PM ******/
CREATE SCHEMA [education]
GO
/****** Object:  Table [Digital_Learning].[AdvisoryBoard]    Script Date: 12/3/2020 11:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[AdvisoryBoard](
	[Board_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Short_Description] [nvarchar](max) NOT NULL,
	[Long_Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AdvisoryBoard] PRIMARY KEY CLUSTERED 
(
	[Board_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Announcement]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Announcement](
	[Announcement_Id] [int] IDENTITY(1,1) NOT NULL,
	[Announcement_Title] [nvarchar](500) NOT NULL,
	[Announcement_Body] [text] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[Announcement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Answer]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Article]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Article](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[imgPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[longDes] [nvarchar](max) NULL,
	[statusId] [int] NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Article_TypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ArticleComments]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ArticleComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[CommentDescription] [nvarchar](250) NOT NULL,
	[Rating] [int] NOT NULL,
	[CommentedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ArticleComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ArticleType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ArticleType](
	[Article_TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Article_Typename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ArticleType] PRIMARY KEY CLUSTERED 
(
	[Article_TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[AssignmentResult]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[AssignmentResult](
	[AssignmentResultd] [int] NOT NULL,
	[SubmitId] [int] NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AssignmentResult] PRIMARY KEY CLUSTERED 
(
	[AssignmentResultd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Bank]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Blog]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Blog_TypeId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[imgPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[longDes] [nvarchar](max) NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[BlogType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[BlogType](
	[Blog_TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Blog_Typename] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BlogType] PRIMARY KEY CLUSTERED 
(
	[Blog_TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[BusinessOffer]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[BusinessOffer](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[imgPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[longDes] [nvarchar](max) NULL,
	[statusId] [int] NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Article_TypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_BusinessOffer] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[BusinessOfferType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[BusinessOfferType](
	[Article_TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Article_Typename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessOfferType] PRIMARY KEY CLUSTERED 
(
	[Article_TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Catigory]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Catigory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Catigory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Certificate]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Certificate](
	[Certificate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Certificate_Type_Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Issue_Date] [date] NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[Certificate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[CertificateType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[CertificateType](
	[Certificate_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Certificate_Type_Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CertificateType] PRIMARY KEY CLUSTERED 
(
	[Certificate_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Client]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Client](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](13) NOT NULL,
	[Cnic] [varchar](50) NULL,
	[Contact_No] [varchar](13) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[ConfirmPassword] [varchar](13) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Client&SchoolComplain]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Client&SchoolComplain](
	[complain_Id] [int] IDENTITY(1,1) NOT NULL,
	[complain_description] [nvarchar](500) NOT NULL,
	[complain_date] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[replymsg] [nvarchar](500) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Client&SchoolComplain] PRIMARY KEY CLUSTERED 
(
	[complain_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ClientCertificate]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ClientCertificate](
	[Certificate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Certificate_Type_Id] [int] NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Issue_Date] [datetime] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[Percentage] [decimal](18, 0) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ClientCertificate] PRIMARY KEY CLUSTERED 
(
	[Certificate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ClientMessage]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ClientMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[MessageToPost] [nvarchar](max) NOT NULL,
	[From] [nvarchar](max) NULL,
	[DatePosted] [datetime] NOT NULL,
	[Role_ID] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_ClientMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ClientReply]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ClientReply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NOT NULL,
	[ReplyFrom] [nvarchar](max) NOT NULL,
	[ReplyMessage] [nvarchar](max) NOT NULL,
	[ReplyDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ClientReplies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Collaborations]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Collaborations](
	[CallobrationId] [int] IDENTITY(1,1) NOT NULL,
	[CallobrationName] [nvarchar](50) NOT NULL,
	[CallobrationTitle] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[Description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Collaborations] PRIMARY KEY CLUSTERED 
(
	[CallobrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Comments]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Comments](
	[Comment_Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[Body] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Course]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Course](
	[courseId] [int] IDENTITY(1,1) NOT NULL,
	[courseDescription] [nvarchar](500) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[VideoLink] [nvarchar](max) NULL,
	[Role_Id] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[imageLink] [nvarchar](max) NULL,
	[duration] [datetime] NULL,
	[longDes] [nvarchar](max) NULL,
	[courseType] [nvarchar](50) NOT NULL,
	[Class_Id] [int] NULL,
	[AssignTo] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Course_1] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[CourseAprov]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[CourseAprov](
	[AproveId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CoureName] [varchar](220) NOT NULL,
 CONSTRAINT [PK_CourseAprov] PRIMARY KEY CLUSTERED 
(
	[AproveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[CourseAssignToTeacher]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[CourseAssignToTeacher](
	[Assign_Id] [int] IDENTITY(1,1) NOT NULL,
	[Class_Id] [int] NOT NULL,
	[courseId] [int] NOT NULL,
	[School_Id] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Assign_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Day]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Department]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Department](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[departmentBoard]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[departmentBoard](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_departmentBoard] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Discussion]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Discussion](
	[ThreadId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[PostDate] [datetime] NOT NULL,
	[ThreadTitle] [nvarchar](150) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[SectionId] [int] NULL,
 CONSTRAINT [PK_Discussion] PRIMARY KEY CLUSTERED 
(
	[ThreadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Donar]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Donar](
	[DonarId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Nic] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Donar] PRIMARY KEY CLUSTERED 
(
	[DonarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Event]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Event_Start_Time] [datetime] NOT NULL,
	[Event_End_Time] [datetime] NOT NULL,
	[Event_Start_Date] [date] NOT NULL,
	[Event_End_Date] [date] NOT NULL,
	[Event_Description] [nvarchar](max) NOT NULL,
	[Event_Venue] [varchar](500) NOT NULL,
	[Event_VenueImage] [nvarchar](max) NULL,
	[Event_VenueVideo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Exam]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Exam](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[ExamName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[HelpCategory]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[HelpCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HelpCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Helpe]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Helpe](
	[HelpId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Nic] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Helpe] PRIMARY KEY CLUSTERED 
(
	[HelpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[KidsStory]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[KidsStory](
	[StoryId] [int] IDENTITY(1,1) NOT NULL,
	[StoryTitle] [nvarchar](200) NOT NULL,
	[imgPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[longDes] [nvarchar](max) NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StoryTypeId] [int] NOT NULL,
	[SchoolId] [int] NULL,
	[statusId] [int] NULL,
 CONSTRAINT [PK_KidsStory] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[KidsStoryType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[KidsStoryType](
	[KidsStoryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[KidsStoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KidsStoryType] PRIMARY KEY CLUSTERED 
(
	[KidsStoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[KidTalent]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[KidTalent](
	[telentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[VedioPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[LongDes] [nvarchar](max) NULL,
	[statusId] [int] NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_KidTalent] PRIMARY KEY CLUSTERED 
(
	[telentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Lecture]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Lecture](
	[LectureId] [int] IDENTITY(1,1) NOT NULL,
	[Lecturename] [nvarchar](150) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[LectureUrl] [nvarchar](max) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VideoLink] [nvarchar](max) NULL,
	[Lecture_Description] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[LectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[loginTable]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[loginTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](13) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_loginTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ManualTest]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ManualTest](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[Duration] [datetime] NOT NULL,
	[TestUrl] [nvarchar](max) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UploadTest] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Messages]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[MessageToPost] [nvarchar](max) NOT NULL,
	[From] [nvarchar](max) NULL,
	[DatePosted] [datetime] NOT NULL,
	[SchoolId] [int] NULL,
	[Class_Id] [int] NULL,
	[Role_ID] [int] NULL,
	[UserId] [int] NULL,
	[courseId] [int] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[OnlineTest]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[OnlineTest](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionName] [nvarchar](500) NOT NULL,
	[IsMultiple] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ClassId] [int] NULL,
	[Duration] [nvarchar](20) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[OnlineTestAnswers]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[OnlineTestAnswers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [varchar](500) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_OnlineTestAnswers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[OnlineTestQuestionOptions]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[OnlineTestQuestionOptions](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionName] [varchar](500) NOT NULL,
 CONSTRAINT [PK_OnlineTestQuestionOptions] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[OnlineTestResults]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[OnlineTestResults](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [varchar](500) NOT NULL,
	[UserId] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_OnlineTestResults] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Options]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Options](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionName] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[PaymentConfirmation]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[PaymentConfirmation](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[BankId] [int] NOT NULL,
	[Account_No] [nvarchar](100) NOT NULL,
	[TransactionTypeId] [int] NOT NULL,
	[TransactionSlipNumber] [nvarchar](150) NOT NULL,
	[SlipUrl] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[IBAN] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_PaymentConfirmation] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Post]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](250) NOT NULL,
	[PostText] [nvarchar](max) NOT NULL,
	[PostDate] [datetime] NOT NULL,
	[ThreadId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Question]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsMultiple] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[QuizContext]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[QuizContext](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[IsMultiple] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[QuizContextResult]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[QuizContextResult](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [varchar](500) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Replies]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Replies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NOT NULL,
	[ReplyFrom] [nvarchar](max) NULL,
	[ReplyMessage] [nvarchar](max) NOT NULL,
	[ReplyDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Replies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[ResultClient]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[ResultClient](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [varchar](500) NOT NULL,
 CONSTRAINT [PK_ResultClient] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[RoleName]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[RoleName](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoleName] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[School]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[School](
	[School_Id] [int] IDENTITY(1,1) NOT NULL,
	[School_Name] [nvarchar](50) NOT NULL,
	[School_Image] [nvarchar](50) NOT NULL,
	[School_Contactno] [varchar](13) NOT NULL,
	[School_Address] [varchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[School_Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](13) NOT NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[School_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[SchoolAssignments]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[SchoolAssignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentName] [nvarchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[AssignmentUrl] [nvarchar](max) NOT NULL,
	[Duration] [datetime] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_SchoolAssignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Section]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](500) NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Status]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Status](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statustype] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Student]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [varchar](13) NOT NULL,
	[RegisterationDate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Class_Id] [int] NOT NULL,
	[School_Id] [int] NOT NULL,
	[Password] [varchar](13) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[Section_Id] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[StudentComplain]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[StudentComplain](
	[complain_id] [int] IDENTITY(1,1) NOT NULL,
	[complain_description] [nvarchar](250) NOT NULL,
	[complain_date] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[School_Id] [int] NOT NULL,
	[ReplyMsg] [nvarchar](500) NULL,
 CONSTRAINT [PK_StudentComplain] PRIMARY KEY CLUSTERED 
(
	[complain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[StudentHistory]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[StudentHistory](
	[StudentHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[LastClass] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastClassSection] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StudentHistory] PRIMARY KEY CLUSTERED 
(
	[StudentHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[StudentMaster]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[StudentMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Exam_Id] [int] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[RegNo] [nvarchar](max) NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_StudentMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[StudentResult]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[StudentResult](
	[StudentResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[Percentage] [decimal](18, 0) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SectionId] [int] NOT NULL,
	[StudentMasterId] [int] NULL,
	[Exam_Id] [int] NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[StudentResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[SubmitAssignment]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[SubmitAssignment](
	[UploadId] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[UploadUrl] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubmitAssignment] PRIMARY KEY CLUSTERED 
(
	[UploadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[SubmitManualTest]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[SubmitManualTest](
	[UploadId] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Uploadurl] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubmitManualTest] PRIMARY KEY CLUSTERED 
(
	[UploadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Subscribers]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Subscribers](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[Create_On] [datetime] NOT NULL,
	[sub_email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[SuperAdmin]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[SuperAdmin](
	[ad_Id] [int] IDENTITY(1,1) NOT NULL,
	[ad_email] [nvarchar](50) NOT NULL,
	[ad_password] [varchar](13) NOT NULL,
	[ad_name] [varchar](50) NOT NULL,
	[ad_imageurl] [nvarchar](max) NULL,
 CONSTRAINT [PK_SuperAdmin] PRIMARY KEY CLUSTERED 
(
	[ad_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Tbl_Class]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Tbl_Class](
	[Class_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Teacher]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [varchar](13) NOT NULL,
	[Class_Id] [int] NOT NULL,
	[School_Id] [int] NOT NULL,
	[Password] [varchar](13) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Reg_No] [nvarchar](20) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[Team]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[Team](
	[Team_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Short_Description] [nvarchar](max) NOT NULL,
	[Long_Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[TechnicTip]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[TechnicTip](
	[tipsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[VedioPath] [nvarchar](max) NOT NULL,
	[shortDes] [nvarchar](max) NULL,
	[longDes] [nvarchar](max) NULL,
	[statusId] [int] NULL,
	[views] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NULL,
 CONSTRAINT [PK_TechnicTip] PRIMARY KEY CLUSTERED 
(
	[tipsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[TimeTable]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[TimeTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[StartTime] [int] NOT NULL,
	[EndTime] [int] NOT NULL,
	[AllocationStatus] [nvarchar](max) NULL,
	[DayId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[TranscationType]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[TranscationType](
	[TranscationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TranscationType] PRIMARY KEY CLUSTERED 
(
	[TranscationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[UserEnrollInCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[UserEnrollInCourse](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[statusId] [int] NULL,
	[Enrolldate] [datetime] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsUserActive] [bit] NULL,
	[UserId] [int] NOT NULL,
	[RegistrationId] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserEnrollInCourse] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[UserFeedback]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[UserFeedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[SchoolId] [int] NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_UserFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[webadd]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[webadd](
	[addId] [int] IDENTITY(1,1) NOT NULL,
	[linq] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_webadd] PRIMARY KEY CLUSTERED 
(
	[addId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Digital_Learning].[WebsiteReview]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Digital_Learning].[WebsiteReview](
	[reviewId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_WebsiteReview] PRIMARY KEY CLUSTERED 
(
	[reviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Digital_Learning].[OnlineTest] ADD  CONSTRAINT [DF_Questions_IsMultiple]  DEFAULT ((0)) FOR [IsMultiple]
GO
ALTER TABLE [Digital_Learning].[OnlineTest] ADD  CONSTRAINT [DF_Questions_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Digital_Learning].[Question] ADD  CONSTRAINT [DF_Question_IsMultiple]  DEFAULT ((0)) FOR [IsMultiple]
GO
ALTER TABLE [Digital_Learning].[TimeTable] ADD  CONSTRAINT [DF_TimeTable_AllocationStatus]  DEFAULT ((1)) FOR [AllocationStatus]
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse] ADD  CONSTRAINT [DF_ClientEnrollInCourse_IsUserActive]  DEFAULT ((1)) FOR [IsUserActive]
GO
ALTER TABLE [Digital_Learning].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Announcement] CHECK CONSTRAINT [FK_Announcement_RoleName]
GO
ALTER TABLE [Digital_Learning].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleType] FOREIGN KEY([Article_TypeId])
REFERENCES [Digital_Learning].[ArticleType] ([Article_TypeId])
GO
ALTER TABLE [Digital_Learning].[Article] CHECK CONSTRAINT [FK_Article_ArticleType]
GO
ALTER TABLE [Digital_Learning].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Article] CHECK CONSTRAINT [FK_Article_RoleName]
GO
ALTER TABLE [Digital_Learning].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Status] FOREIGN KEY([statusId])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[Article] CHECK CONSTRAINT [FK_Article_Status]
GO
ALTER TABLE [Digital_Learning].[ArticleComments]  WITH CHECK ADD  CONSTRAINT [FK_ArticleComments_Article] FOREIGN KEY([ArticleId])
REFERENCES [Digital_Learning].[Article] ([ArticleId])
GO
ALTER TABLE [Digital_Learning].[ArticleComments] CHECK CONSTRAINT [FK_ArticleComments_Article]
GO
ALTER TABLE [Digital_Learning].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_Course]
GO
ALTER TABLE [Digital_Learning].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_School]
GO
ALTER TABLE [Digital_Learning].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_SchoolAssignments] FOREIGN KEY([AssignmentId])
REFERENCES [Digital_Learning].[SchoolAssignments] ([AssignmentId])
GO
ALTER TABLE [Digital_Learning].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_SchoolAssignments]
GO
ALTER TABLE [Digital_Learning].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_Student] FOREIGN KEY([StudentId])
REFERENCES [Digital_Learning].[Student] ([Id])
GO
ALTER TABLE [Digital_Learning].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_Student]
GO
ALTER TABLE [Digital_Learning].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_SubmitAssignment] FOREIGN KEY([SubmitId])
REFERENCES [Digital_Learning].[SubmitAssignment] ([UploadId])
GO
ALTER TABLE [Digital_Learning].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_SubmitAssignment]
GO
ALTER TABLE [Digital_Learning].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogType] FOREIGN KEY([Blog_TypeId])
REFERENCES [Digital_Learning].[BlogType] ([Blog_TypeId])
GO
ALTER TABLE [Digital_Learning].[Blog] CHECK CONSTRAINT [FK_Blog_BlogType]
GO
ALTER TABLE [Digital_Learning].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_CertificateType] FOREIGN KEY([Certificate_Type_Id])
REFERENCES [Digital_Learning].[CertificateType] ([Certificate_Type_Id])
GO
ALTER TABLE [Digital_Learning].[Certificate] CHECK CONSTRAINT [FK_Certificate_CertificateType]
GO
ALTER TABLE [Digital_Learning].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Client] FOREIGN KEY([UserId])
REFERENCES [Digital_Learning].[Client] ([UserId])
GO
ALTER TABLE [Digital_Learning].[Certificate] CHECK CONSTRAINT [FK_Certificate_Client]
GO
ALTER TABLE [Digital_Learning].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Status] FOREIGN KEY([status])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[Client] CHECK CONSTRAINT [FK_Client_Status]
GO
ALTER TABLE [Digital_Learning].[Client&SchoolComplain]  WITH CHECK ADD  CONSTRAINT [FK_Client&SchoolComplain_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Client&SchoolComplain] CHECK CONSTRAINT [FK_Client&SchoolComplain_RoleName]
GO
ALTER TABLE [Digital_Learning].[ClientCertificate]  WITH CHECK ADD  CONSTRAINT [FK_ClientCertificate_CertificateType] FOREIGN KEY([Certificate_Type_Id])
REFERENCES [Digital_Learning].[CertificateType] ([Certificate_Type_Id])
GO
ALTER TABLE [Digital_Learning].[ClientCertificate] CHECK CONSTRAINT [FK_ClientCertificate_CertificateType]
GO
ALTER TABLE [Digital_Learning].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blog] FOREIGN KEY([BlogId])
REFERENCES [Digital_Learning].[Blog] ([BlogId])
GO
ALTER TABLE [Digital_Learning].[Comments] CHECK CONSTRAINT [FK_Comments_Blog]
GO
ALTER TABLE [Digital_Learning].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Comments] CHECK CONSTRAINT [FK_Comments_RoleName]
GO
ALTER TABLE [Digital_Learning].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Class] FOREIGN KEY([Class_Id])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Course] CHECK CONSTRAINT [FK_Course_Class]
GO
ALTER TABLE [Digital_Learning].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Course] CHECK CONSTRAINT [FK_Course_RoleName]
GO
ALTER TABLE [Digital_Learning].[CourseAprov]  WITH CHECK ADD  CONSTRAINT [FK_CourseAprov_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[CourseAprov] CHECK CONSTRAINT [FK_CourseAprov_Course]
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Class] FOREIGN KEY([Class_Id])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Class]
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Course] FOREIGN KEY([courseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Course]
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_School] FOREIGN KEY([School_Id])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_School]
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [Digital_Learning].[Teacher] ([Id])
GO
ALTER TABLE [Digital_Learning].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Teacher]
GO
ALTER TABLE [Digital_Learning].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Discussion] CHECK CONSTRAINT [FK_Discussion_Class]
GO
ALTER TABLE [Digital_Learning].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[Discussion] CHECK CONSTRAINT [FK_Discussion_Course]
GO
ALTER TABLE [Digital_Learning].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_Discussion] FOREIGN KEY([ThreadId])
REFERENCES [Digital_Learning].[Discussion] ([ThreadId])
GO
ALTER TABLE [Digital_Learning].[Discussion] CHECK CONSTRAINT [FK_Discussion_Discussion]
GO
ALTER TABLE [Digital_Learning].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Discussion] CHECK CONSTRAINT [FK_Discussion_RoleName]
GO
ALTER TABLE [Digital_Learning].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[Discussion] CHECK CONSTRAINT [FK_Discussion_School]
GO
ALTER TABLE [Digital_Learning].[Helpe]  WITH CHECK ADD  CONSTRAINT [FK_Helpe_HelpCategory] FOREIGN KEY([CategoryId])
REFERENCES [Digital_Learning].[HelpCategory] ([CategoryId])
GO
ALTER TABLE [Digital_Learning].[Helpe] CHECK CONSTRAINT [FK_Helpe_HelpCategory]
GO
ALTER TABLE [Digital_Learning].[KidsStory]  WITH CHECK ADD  CONSTRAINT [FK_KidsStory_KidsStoryType] FOREIGN KEY([StoryTypeId])
REFERENCES [Digital_Learning].[KidsStoryType] ([KidsStoryTypeId])
GO
ALTER TABLE [Digital_Learning].[KidsStory] CHECK CONSTRAINT [FK_KidsStory_KidsStoryType]
GO
ALTER TABLE [Digital_Learning].[KidsStory]  WITH CHECK ADD  CONSTRAINT [FK_KidsStory_Status] FOREIGN KEY([statusId])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[KidsStory] CHECK CONSTRAINT [FK_KidsStory_Status]
GO
ALTER TABLE [Digital_Learning].[KidTalent]  WITH CHECK ADD  CONSTRAINT [FK_KidTalent_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[KidTalent] CHECK CONSTRAINT [FK_KidTalent_RoleName]
GO
ALTER TABLE [Digital_Learning].[KidTalent]  WITH CHECK ADD  CONSTRAINT [FK_KidTalent_Status] FOREIGN KEY([statusId])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[KidTalent] CHECK CONSTRAINT [FK_KidTalent_Status]
GO
ALTER TABLE [Digital_Learning].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Lecture] CHECK CONSTRAINT [FK_Lecture_Class]
GO
ALTER TABLE [Digital_Learning].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[Lecture] CHECK CONSTRAINT [FK_Lecture_Course]
GO
ALTER TABLE [Digital_Learning].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[Lecture] CHECK CONSTRAINT [FK_Lecture_School]
GO
ALTER TABLE [Digital_Learning].[loginTable]  WITH CHECK ADD  CONSTRAINT [FK_loginTable_RoleName] FOREIGN KEY([RoleID])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[loginTable] CHECK CONSTRAINT [FK_loginTable_RoleName]
GO
ALTER TABLE [Digital_Learning].[ManualTest]  WITH CHECK ADD  CONSTRAINT [FK_ManualTest_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[ManualTest] CHECK CONSTRAINT [FK_ManualTest_Class]
GO
ALTER TABLE [Digital_Learning].[ManualTest]  WITH CHECK ADD  CONSTRAINT [FK_ManualTest_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[ManualTest] CHECK CONSTRAINT [FK_ManualTest_School]
GO
ALTER TABLE [Digital_Learning].[ManualTest]  WITH CHECK ADD  CONSTRAINT [FK_ManualTest_Teacher] FOREIGN KEY([UserId])
REFERENCES [Digital_Learning].[Teacher] ([Id])
GO
ALTER TABLE [Digital_Learning].[ManualTest] CHECK CONSTRAINT [FK_ManualTest_Teacher]
GO
ALTER TABLE [Digital_Learning].[ManualTest]  WITH CHECK ADD  CONSTRAINT [FK_TestFile_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[ManualTest] CHECK CONSTRAINT [FK_TestFile_Course]
GO
ALTER TABLE [Digital_Learning].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Course] FOREIGN KEY([courseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[Messages] CHECK CONSTRAINT [FK_Messages_Course]
GO
ALTER TABLE [Digital_Learning].[OnlineTest]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTest_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[OnlineTest] CHECK CONSTRAINT [FK_OnlineTest_Course]
GO
ALTER TABLE [Digital_Learning].[OnlineTest]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTest_OnlineTest] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[OnlineTest] ([QuestionId])
GO
ALTER TABLE [Digital_Learning].[OnlineTest] CHECK CONSTRAINT [FK_OnlineTest_OnlineTest]
GO
ALTER TABLE [Digital_Learning].[OnlineTest]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTest_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[OnlineTest] CHECK CONSTRAINT [FK_OnlineTest_RoleName]
GO
ALTER TABLE [Digital_Learning].[OnlineTest]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[OnlineTest] CHECK CONSTRAINT [FK_Questions_Class]
GO
ALTER TABLE [Digital_Learning].[OnlineTestAnswers]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTestAnswers_OnlineTest] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[OnlineTest] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[OnlineTestAnswers] CHECK CONSTRAINT [FK_OnlineTestAnswers_OnlineTest]
GO
ALTER TABLE [Digital_Learning].[OnlineTestAnswers]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTestAnswers_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[OnlineTestAnswers] CHECK CONSTRAINT [FK_OnlineTestAnswers_RoleName]
GO
ALTER TABLE [Digital_Learning].[OnlineTestQuestionOptions]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTestQuestionOptions_OnlineTest] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[OnlineTest] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[OnlineTestQuestionOptions] CHECK CONSTRAINT [FK_OnlineTestQuestionOptions_OnlineTest]
GO
ALTER TABLE [Digital_Learning].[OnlineTestResults]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTestResults_OnlineTestResults] FOREIGN KEY([ResultId])
REFERENCES [Digital_Learning].[OnlineTestResults] ([ResultId])
GO
ALTER TABLE [Digital_Learning].[OnlineTestResults] CHECK CONSTRAINT [FK_OnlineTestResults_OnlineTestResults]
GO
ALTER TABLE [Digital_Learning].[OnlineTestResults]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTestResults_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[OnlineTestResults] CHECK CONSTRAINT [FK_OnlineTestResults_RoleName]
GO
ALTER TABLE [Digital_Learning].[Options]  WITH CHECK ADD  CONSTRAINT [FK_Options_QuizContext] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[QuizContext] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[Options] CHECK CONSTRAINT [FK_Options_QuizContext]
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_PaymentConfirmation_Bank] FOREIGN KEY([BankId])
REFERENCES [Digital_Learning].[Bank] ([BankId])
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation] CHECK CONSTRAINT [FK_PaymentConfirmation_Bank]
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_PaymentConfirmation_Client] FOREIGN KEY([UserId])
REFERENCES [Digital_Learning].[Client] ([UserId])
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation] CHECK CONSTRAINT [FK_PaymentConfirmation_Client]
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_PaymentConfirmation_TranscationType] FOREIGN KEY([TransactionTypeId])
REFERENCES [Digital_Learning].[TranscationType] ([TranscationTypeId])
GO
ALTER TABLE [Digital_Learning].[PaymentConfirmation] CHECK CONSTRAINT [FK_PaymentConfirmation_TranscationType]
GO
ALTER TABLE [Digital_Learning].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Post] CHECK CONSTRAINT [FK_Post_Class]
GO
ALTER TABLE [Digital_Learning].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[Post] CHECK CONSTRAINT [FK_Post_Course]
GO
ALTER TABLE [Digital_Learning].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Discussion] FOREIGN KEY([ThreadId])
REFERENCES [Digital_Learning].[Discussion] ([ThreadId])
GO
ALTER TABLE [Digital_Learning].[Post] CHECK CONSTRAINT [FK_Post_Discussion]
GO
ALTER TABLE [Digital_Learning].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[Post] CHECK CONSTRAINT [FK_Post_RoleName]
GO
ALTER TABLE [Digital_Learning].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Catigory] FOREIGN KEY([CategoryId])
REFERENCES [Digital_Learning].[Catigory] ([CategoryId])
GO
ALTER TABLE [Digital_Learning].[Question] CHECK CONSTRAINT [FK_Question_Catigory]
GO
ALTER TABLE [Digital_Learning].[QuizContextResult]  WITH CHECK ADD  CONSTRAINT [FK_QuizContextResult_QuizContext] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[QuizContext] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[QuizContextResult] CHECK CONSTRAINT [FK_QuizContextResult_QuizContext]
GO
ALTER TABLE [Digital_Learning].[ResultClient]  WITH CHECK ADD  CONSTRAINT [FK_ResultClient_Client] FOREIGN KEY([UserId])
REFERENCES [Digital_Learning].[Client] ([UserId])
GO
ALTER TABLE [Digital_Learning].[ResultClient] CHECK CONSTRAINT [FK_ResultClient_Client]
GO
ALTER TABLE [Digital_Learning].[ResultClient]  WITH CHECK ADD  CONSTRAINT [FK_ResultClient_Question] FOREIGN KEY([QuestionId])
REFERENCES [Digital_Learning].[Question] ([QuestionId])
GO
ALTER TABLE [Digital_Learning].[ResultClient] CHECK CONSTRAINT [FK_ResultClient_Question]
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments]  WITH CHECK ADD  CONSTRAINT [FK_SchoolAssignments_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments] CHECK CONSTRAINT [FK_SchoolAssignments_Class]
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments]  WITH CHECK ADD  CONSTRAINT [FK_SchoolAssignments_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments] CHECK CONSTRAINT [FK_SchoolAssignments_Course]
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments]  WITH CHECK ADD  CONSTRAINT [FK_SchoolAssignments_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[SchoolAssignments] CHECK CONSTRAINT [FK_SchoolAssignments_School]
GO
ALTER TABLE [Digital_Learning].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([Class_Id])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [Digital_Learning].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_School] FOREIGN KEY([School_Id])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[Student] CHECK CONSTRAINT [FK_Student_School]
GO
ALTER TABLE [Digital_Learning].[StudentComplain]  WITH CHECK ADD  CONSTRAINT [FK_StudentComplain_School] FOREIGN KEY([School_Id])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[StudentComplain] CHECK CONSTRAINT [FK_StudentComplain_School]
GO
ALTER TABLE [Digital_Learning].[StudentComplain]  WITH CHECK ADD  CONSTRAINT [FK_StudentComplain_Student] FOREIGN KEY([UserId])
REFERENCES [Digital_Learning].[Student] ([Id])
GO
ALTER TABLE [Digital_Learning].[StudentComplain] CHECK CONSTRAINT [FK_StudentComplain_Student]
GO
ALTER TABLE [Digital_Learning].[StudentHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentHistory_Student] FOREIGN KEY([StudentId])
REFERENCES [Digital_Learning].[Student] ([Id])
GO
ALTER TABLE [Digital_Learning].[StudentHistory] CHECK CONSTRAINT [FK_StudentHistory_Student]
GO
ALTER TABLE [Digital_Learning].[StudentMaster]  WITH CHECK ADD  CONSTRAINT [FK_StudentMaster_Exam] FOREIGN KEY([Exam_Id])
REFERENCES [Digital_Learning].[Exam] ([ExamId])
GO
ALTER TABLE [Digital_Learning].[StudentMaster] CHECK CONSTRAINT [FK_StudentMaster_Exam]
GO
ALTER TABLE [Digital_Learning].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Class] FOREIGN KEY([Exam_Id])
REFERENCES [Digital_Learning].[Exam] ([ExamId])
GO
ALTER TABLE [Digital_Learning].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Class]
GO
ALTER TABLE [Digital_Learning].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_School]
GO
ALTER TABLE [Digital_Learning].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Section] FOREIGN KEY([SectionId])
REFERENCES [Digital_Learning].[Section] ([SectionID])
GO
ALTER TABLE [Digital_Learning].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Section]
GO
ALTER TABLE [Digital_Learning].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentId])
REFERENCES [Digital_Learning].[Student] ([Id])
GO
ALTER TABLE [Digital_Learning].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [Digital_Learning].[SubmitAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssignment_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[SubmitAssignment] CHECK CONSTRAINT [FK_SubmitAssignment_School]
GO
ALTER TABLE [Digital_Learning].[SubmitAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssignment_SchoolAssignments] FOREIGN KEY([AssignmentId])
REFERENCES [Digital_Learning].[SchoolAssignments] ([AssignmentId])
GO
ALTER TABLE [Digital_Learning].[SubmitAssignment] CHECK CONSTRAINT [FK_SubmitAssignment_SchoolAssignments]
GO
ALTER TABLE [Digital_Learning].[SubmitManualTest]  WITH CHECK ADD  CONSTRAINT [FK_SubmitManualTest_ManualTest] FOREIGN KEY([TestId])
REFERENCES [Digital_Learning].[ManualTest] ([TestId])
GO
ALTER TABLE [Digital_Learning].[SubmitManualTest] CHECK CONSTRAINT [FK_SubmitManualTest_ManualTest]
GO
ALTER TABLE [Digital_Learning].[SubmitManualTest]  WITH CHECK ADD  CONSTRAINT [FK_SubmitManualTest_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[SubmitManualTest] CHECK CONSTRAINT [FK_SubmitManualTest_School]
GO
ALTER TABLE [Digital_Learning].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Class] FOREIGN KEY([Class_Id])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[Teacher] CHECK CONSTRAINT [FK_Teacher_Class]
GO
ALTER TABLE [Digital_Learning].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_School] FOREIGN KEY([School_Id])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[Teacher] CHECK CONSTRAINT [FK_Teacher_School]
GO
ALTER TABLE [Digital_Learning].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Department] FOREIGN KEY([Department_ID])
REFERENCES [Digital_Learning].[Department] ([Department_ID])
GO
ALTER TABLE [Digital_Learning].[Team] CHECK CONSTRAINT [FK_Team_Department]
GO
ALTER TABLE [Digital_Learning].[TechnicTip]  WITH CHECK ADD  CONSTRAINT [FK_TechnicTip_RoleName] FOREIGN KEY([Role_Id])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[TechnicTip] CHECK CONSTRAINT [FK_TechnicTip_RoleName]
GO
ALTER TABLE [Digital_Learning].[TechnicTip]  WITH CHECK ADD  CONSTRAINT [FK_TechnicTip_Status] FOREIGN KEY([statusId])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[TechnicTip] CHECK CONSTRAINT [FK_TechnicTip_Status]
GO
ALTER TABLE [Digital_Learning].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[TimeTable] CHECK CONSTRAINT [FK_Table_1_School]
GO
ALTER TABLE [Digital_Learning].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Class] FOREIGN KEY([ClassId])
REFERENCES [Digital_Learning].[Tbl_Class] ([Class_Id])
GO
ALTER TABLE [Digital_Learning].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Class]
GO
ALTER TABLE [Digital_Learning].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
GO
ALTER TABLE [Digital_Learning].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Course]
GO
ALTER TABLE [Digital_Learning].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Day] FOREIGN KEY([DayId])
REFERENCES [Digital_Learning].[Day] ([Id])
GO
ALTER TABLE [Digital_Learning].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Day]
GO
ALTER TABLE [Digital_Learning].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Section] FOREIGN KEY([SectionId])
REFERENCES [Digital_Learning].[Section] ([SectionID])
GO
ALTER TABLE [Digital_Learning].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Section]
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserEnrollInCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse] CHECK CONSTRAINT [FK_UserEnrollInCourse_Course]
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserEnrollInCourse_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse] CHECK CONSTRAINT [FK_UserEnrollInCourse_RoleName]
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserEnrollInCourse_Status] FOREIGN KEY([statusId])
REFERENCES [Digital_Learning].[Status] ([statusId])
GO
ALTER TABLE [Digital_Learning].[UserEnrollInCourse] CHECK CONSTRAINT [FK_UserEnrollInCourse_Status]
GO
ALTER TABLE [Digital_Learning].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_Course] FOREIGN KEY([CourseId])
REFERENCES [Digital_Learning].[Course] ([courseId])
ON DELETE CASCADE
GO
ALTER TABLE [Digital_Learning].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_Course]
GO
ALTER TABLE [Digital_Learning].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_RoleName] FOREIGN KEY([RoleId])
REFERENCES [Digital_Learning].[RoleName] ([Role_ID])
GO
ALTER TABLE [Digital_Learning].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_RoleName]
GO
ALTER TABLE [Digital_Learning].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_School] FOREIGN KEY([SchoolId])
REFERENCES [Digital_Learning].[School] ([School_Id])
GO
ALTER TABLE [Digital_Learning].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_School]
GO
ALTER TABLE [Digital_Learning].[UserFeedback]  WITH CHECK ADD  CONSTRAINT [FK_UserFeedback_UserFeedback] FOREIGN KEY([FeedbackId])
REFERENCES [Digital_Learning].[UserFeedback] ([FeedbackId])
GO
ALTER TABLE [Digital_Learning].[UserFeedback] CHECK CONSTRAINT [FK_UserFeedback_UserFeedback]
GO
/****** Object:  StoredProcedure [Digital_Learning].[get_AnotherDatabase]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_AnotherDatabase]
AS
BEGIN
Select * from hamarawa_preprozameen.preprozameen.jobs order by
jobId desc;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_Certificate]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_Certificate]
AS
BEGIN
SELECT [Certificate_Id],[Issue_Date],[CourseName],[Percentage],[UserName] FROM ClientCertificate WHERE Certificate_Id=(SELECT max(Certificate_Id) FROM ClientCertificate);

END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_ClientProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_ClientProfileData]
@UserId int
AS
BEGIN
SELECT [Email],[UserName],[Contact_No],[Image],[Password] FROM
[Digital_Learning].Client where UserId =@UserId
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_forum]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [Digital_Learning].[get_forum]
AS
BEGIN
SELECT ClientMessage.Subject,ClientMessage.MessageToPost,ClientReply.ReplyMessage,ClientReply.ReplyFrom,loginTable.Name
FROM Digital_Learning.ClientMessage
INNER JOIN Digital_Learning.loginTable ON ClientMessage.UserId = loginTable.UserId
INNER JOIN Digital_Learning.ClientReply ON ClientMessage.Id = ClientReply.MessageId
where ClientMessage.Role_ID=loginTable.RoleID;

END


GO
/****** Object:  StoredProcedure [Digital_Learning].[get_OurCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_OurCourse]
AS
BEGIN
SELECT courseId,courseName FROM Course where Class_Id IS NULL;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_OurCourseMain]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_OurCourseMain]
AS
BEGIN
SELECT courseId,courseName,imageLink FROM Course where Class_Id
IS NULL ORDER BY courseId desc
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SchoolClass]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [Digital_Learning].[get_SchoolClass]
@SchoolId int
AS
BEGIN
SELECT Class_Id,Name FROM Tbl_Class where SchoolId=@SchoolId;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SchoolCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_SchoolCourse]
@User_Id int,
@Role_Id int
AS
BEGIN
SELECT courseId,courseName FROM Course where User_Id=@User_Id
AND Role_Id=@Role_Id;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SchoolProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_SchoolProfileData]
@School_Id int
AS
BEGIN
SELECT [School_Image],[School_Email],[School_Name],
[School_Contactno],[Password] FROM [Digital_Learning].School where
School_Id =@School_Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SchoolSection]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_SchoolSection]
@SchoolId int
AS
BEGIN
SELECT SectionID,SectionName FROM Section where
SchoolId=@SchoolId;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SchoolStudent]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [Digital_Learning].[get_SchoolStudent]
@School_Id int
AS
BEGIN
SELECT Id,RegNo FROM Student where School_Id=@School_Id;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_StudentEnrollCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_StudentEnrollCourse]
@RegNo nvarchar(20),
@Class_Id int
AS
BEGIN
SELECT Course.courseId, Course.courseName
FROM Digital_Learning.Course
INNER JOIN [Digital_Learning].UserEnrollInCourse ON Course.courseId =
UserEnrollInCourse.CourseId
INNER JOIN [Digital_Learning].Tbl_Class ON Course.Class_Id =
Tbl_Class.Class_Id
INNER JOIN [Digital_Learning].Student ON
UserEnrollInCourse.RegistrationId = Student.RegNo
 WHERE UserEnrollInCourse.RegistrationId=@RegNo AND
Tbl_Class.Class_Id=@Class_Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_StudentProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_StudentProfileData]
@Id int
AS
BEGIN
SELECT [Email],[Name],[ContactNo],[Password],[ImagePath] FROM
[Digital_Learning].Student where Id =@Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_StudentRegisterationNoSimilarCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_StudentRegisterationNoSimilarCourse]
@Id int
AS
BEGIN
SELECT UserEnrollInCourse.EnrollmentId,
UserEnrollInCourse.RegistrationId
FROM [Digital_Learning].UserEnrollInCourse
INNER JOIN [Digital_Learning].Course ON
[Digital_Learning].UserEnrollInCourse.courseId =
[Digital_Learning].Course.courseId
INNER JOIN [Digital_Learning].CourseAssignToTeacher ON
[Digital_Learning].UserEnrollInCourse.CourseId =
CourseAssignToTeacher.courseId
INNER JOIN [Digital_Learning].Teacher ON
[Digital_Learning].CourseAssignToTeacher.TeacherId = Teacher.Id
INNER JOIN [Digital_Learning].Student ON
UserEnrollInCourse.RegistrationId = Student.RegNo
 WHERE Teacher.Id=@Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_SuperAdminProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_SuperAdminProfileData]
@ad_Id int
AS
BEGIN
SELECT [ad_email],[ad_name],[ad_imageurl],[ad_password] FROM
[Digital_Learning].SuperAdmin where ad_Id =@ad_Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_TeacherAssignedCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_TeacherAssignedCourse]
@TeacherId int,
@Class_Id int
AS
BEGIN
SELECT Course.courseId, Course.courseName
FROM Digital_Learning.Course
INNER JOIN [Digital_Learning].CourseAssignToTeacher ON Course.courseId
= CourseAssignToTeacher.CourseId
INNER JOIN [Digital_Learning].Tbl_Class ON Course.Class_Id =
Tbl_Class.Class_Id
INNER JOIN [Digital_Learning].Teacher ON
CourseAssignToTeacher.TeacherId = [Digital_Learning].Teacher.Id
 WHERE CourseAssignToTeacher.TeacherId=@TeacherId AND
Tbl_Class.Class_Id=@Class_Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_TeacherProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_TeacherProfileData]
@Id int
AS
BEGIN
SELECT [Email],[Name],[Contact],[Password],[Image] FROM
[Digital_Learning].Teacher where Id =@Id
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_TeacherSchool]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_TeacherSchool]
@School_Id int
AS
BEGIN
SELECT Id,Name FROM Teacher where School_Id=@School_Id;
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[get_TeacherStudentSimilarCourse]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[get_TeacherStudentSimilarCourse]
@RegNo nvarchar(20),
@Id int
AS
BEGIN
SELECT Course.courseId, Course.courseName
FROM Digital_Learning.Course
INNER JOIN [Digital_Learning].CourseAssignToTeacher ON Course.courseId
= [Digital_Learning].CourseAssignToTeacher.courseId
INNER JOIN [Digital_Learning].UserEnrollInCourse ON
[Digital_Learning].CourseAssignToTeacher.courseId =
[Digital_Learning].UserEnrollInCourse.CourseId
INNER JOIN [Digital_Learning].Teacher ON
[Digital_Learning].CourseAssignToTeacher.TeacherId = Teacher.Id
INNER JOIN [Digital_Learning].Student ON
UserEnrollInCourse.RegistrationId = Student.RegNo
 WHERE Teacher.Id=@Id AND UserEnrollInCourse.RegistrationId=@RegNo
END

GO
/****** Object:  StoredProcedure [Digital_Learning].[update_SuperAdminProfileData]    Script Date: 12/3/2020 11:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Digital_Learning].[update_SuperAdminProfileData]
@ad_Id int,
@ad_email nvarchar(50),
@ad_name varchar(50),
@ad_imageurl nvarchar(max)
AS
BEGIN
UPDATE [Digital_Learning].SuperAdmin SET [ad_email]=@ad_email
,[ad_name]=@ad_name,
[ad_imageurl]=@ad_imageurl where ad_Id =@ad_Id
END

GO
USE [master]
GO
ALTER DATABASE [hamarawa_learning] SET  READ_WRITE 
GO
