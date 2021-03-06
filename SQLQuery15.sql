USE [master]
GO
/****** Object:  Database [JPortal]    Script Date: 10/20/2015 9:54:41 AM ******/
CREATE DATABASE [JPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JPortal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JPortal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JPortal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [JPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JPortal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [JPortal] SET  MULTI_USER 
GO
ALTER DATABASE [JPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JPortal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JPortal', N'ON'
GO
USE [JPortal]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicantApprovals]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicantApprovals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostedBy] [nvarchar](128) NULL,
	[ApplicantID] [nvarchar](128) NULL,
	[JobListID] [int] NULL,
	[ApprovalStatu] [int] NULL,
	[APproveDate] [datetime] NULL,
 CONSTRAINT [PK_ApplicantApprovals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Certifications]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[NameOfTheBody] [nvarchar](250) NULL,
	[CertficateName] [nvarchar](250) NULL,
	[DateObtained] [datetime] NULL,
 CONSTRAINT [PK_Certifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Educations]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Educations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Name] [nvarchar](256) NULL,
	[Course] [nvarchar](200) NULL,
	[Qualification] [varchar](100) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_Educations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobCategories]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NULL,
 CONSTRAINT [PK_JobCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobLists]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobCategoryID] [int] NULL,
	[PostedBy] [nvarchar](128) NULL,
	[JobTitle] [varchar](250) NULL,
	[JobLocation] [varchar](250) NULL,
	[CompanyName] [varchar](250) NULL,
	[RequiredYearsExpreince] [varchar](10) NULL,
	[DesiredCourse] [varchar](300) NULL,
	[JobDetails] [varchar](5000) NULL,
	[JobDescription] [varchar](max) NULL,
	[Salary] [nvarchar](250) NULL,
	[StateID] [int] NULL,
	[Country] [int] NULL,
	[PostedDate] [datetime] NULL,
	[ExpDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_JobLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPreferences]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[CategoryID] [int] NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_JobPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobsApplies]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobsApplies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobListID] [int] NULL,
	[PostedByID] [nvarchar](128) NULL,
	[ApplyUserID] [nvarchar](128) NULL,
	[AppliedDate] [datetime] NULL,
 CONSTRAINT [PK_JobsApplies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_MaritalStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Img] [varchar](500) NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Referees]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[PoneNumber] [nvarchar](20) NULL,
	[Relation] [nvarchar](100) NULL,
 CONSTRAINT [PK_Referees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sexes]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sexes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sex1] [varchar](10) NULL,
 CONSTRAINT [PK_Sexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[SkillName] [nvarchar](300) NULL,
	[Level] [varchar](50) NULL,
	[YearOfExprience] [int] NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[States]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[SexId] [int] NULL,
	[MaritalStatusId] [int] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [varchar](500) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WorkedExpres]    Script Date: 10/20/2015 9:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkedExpres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[CompanyName] [varchar](500) NULL,
	[Industry] [varchar](100) NULL,
	[Address] [varchar](300) NULL,
	[PositionHeld] [varchar](250) NULL,
	[JobDescription] [varchar](max) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_WorkedExpres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201506271812149_InitialCreate', N'JobPortal.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829E7A0E522B97B38B6D60EF2275927372BAB9609D2DFAB6A025DA11562255894A1314FD657DE84FEA5FE850A26489175D6CC5768A05161139FC66381C92C3E1D07FFEFEC7F8C35318588F384E7C4A26F6D1E8D0B63071A9E793E5C44ED9E2DB77F687F7FFFCC7F8C20B9FAC1F0BBA134E072D4932B11F188B4E1D27711F70889251E8BB314DE8828D5C1A3AC8A3CEF1E1E177CED1918301C2062CCB1A7F4A09F3439C7DC0E7941217472C45C135F570908872A89965A8D60D0A711221174FECFFD3F91D8D190A4639AD6D9D053E0239663858D816228432C440CAD3CF099EB19892E52C820214DC3F4718E8162848B090FE7445DEB52387C7BC23CEAA6101E5A609A3614FC0A313A119476EBE967EED5273A0BB0BD0317BE6BDCEF437B1AF3C9C157DA201284066783A0D624E3CB1AF4B1667497483D9A86838CA212F6380FB85C65F4755C403AB73BB83D2928E4787FCDF81354D0396C6784270CA62141C5877E93CF0DD1FF0F33DFD8AC9E4E468BE3879F7E62DF24EDEFE079FBCA9F614FA0A74B50228BA8B698463900D2FCAFEDB96536FE7C80DCB669536B956C0966052D8D6357AFA88C9923DC074397E675B97FE13F68A12615C9F890F73081AB13885CF9B3408D03CC065BDD3C893FFDFC0F5F8CDDB41B8DEA0477F990DBDC41F264E0CF3EA130EB2DAE4C18FF2E9551BEF2F82EC32A621FFAEDB575EFB6546D3D8E59DA146927B142F31AB4B377656C6DBC9A439D4F0665DA0EEBF69734955F3D692F20EAD33130A16DB9E0D85BC2FCBB7B3C59D45110C5E665A5C234D06276F5523A9ED815552ACCCE6A8ABD910E8CEDF7915BC08911F0CB00C76E002FEC7C28F435CF6F27B0A4687486F99EF5092C02AE0FD0F250F0DA2C39F03883EC36E1A8371CE180AA317E776F74009BE49C339B7F9EDF11A6C68EE7FA197C86534BE20BCD5C6781FA9FB95A6EC8278E788E1CFCC2D00F9E7BD1F760718449C33D7C5497209C68CBD2905F7BA00BC22ECE4B8371C5F9E76ED864C03E4877A3F445A48BF14A42B5F444FA1F82306329D4FD224EA47BAF44937510B52B3A83945ABA882ACAFA81CAC9BA482D22C6846D02A674E359897978DD0F06E5E06BBFF7EDE669BB7692DA8A871062B24FE2F26388665CCBB438CE198AC46A0CBBAB10B67211B3ECEF4C5F7A68CD38F28488766B5D66CC81681E1674306BBFFB32113138A1F7D8F7B251D0E3F0531C077A2D79FABDAE79C24D9B6A743AD9BDB66BE9D35C0345DCE9284BA7E360B34612F11B4A8CB0F3E9CD51EC1C87B234741A06360E83EDFF2A004FA66CB46754BCE718019B6CEDC3C2C3845898B3C558DD021AF8760C58EAA116C150DA90BF76F8527583A8E7923C40F4109CC549F30755AF8C4F52314B46A496AD9710BE37D2F79C835E738C284336CD54417E6FAE00717A0E4230D4A9B86C64EC5E29A0DD1E0B59AC6BCCD855D8DBB1293D88A4DB6F8CE06BB14FEDB8B1866B3C6B6609CCD2AE922803190B70B03156795AE06201F5CF6CD40A51393C140854BB51503AD6B6C07065A57C9AB33D0FC88DA75FCA5F3EABE9967FDA0BCFD6DBD515D3BB0CD9A3EF6CC3473DF13DA30688163D53CCFE7BC123F31CDE10CE414E7B344B8BAB28970F01966F590CDCADFD5FAA14E33886C444D802B436B011557800A9032A17A0857C4F21AA5135E440FD822EED6082BD67E09B662032A76F52AB44268BE30958DB3D3E9A3EC59690D8A91773A2C54703406212F5EF58E77508A292EAB2AA68B2FDCC71BAE744C0C4683825A3C5783928ACE0CAEA5C234DBB5A473C8FAB8641B6949729F0C5A2A3A33B896848DB62B49E314F4700B3652517D0B1F68B215918E72B729EBC64E9E1F250AC68E21916A7C8DA2C827CB4A629528B1667956D5F4DB59FF84A330C770DC449377544A5B726234464B2CD5026B90F4D28F13768E189A231EE7997AA142A6DD5B0DCB7FC1B2BA7DAA8358EC030535FF3B6FA15CDCD7765AD515110897D0BF90FB3359105D33FAFAE6164F7343018A3571FB290DD29098DD2B73EBFCF6AEDA3E2F5111C68E24BFE23E29BA529CDCBAE23B0D8B3A250619A2D277597F98CC102665179E6755DD266FD48C5204A7AA28A680D5CE86CDE4C4F4182AD93BEC3F52AD082F33A7444A4A154014F5C4A86435286095BAEEA8F5C4932A66BDA63BA2945D528594AA7A4859CD21A90959AD580BCFA0513D45770E6AD648155DADED8EACC91FA9426BAAD7C0D6C82CD77547D5A498548135D5DDB157F926F212BAC7BB96F1CCB2E6B6951F6A37DBB70C182FB31E0EB3ED55EEEEAB4095E29E58E2765E0113E57B694BC693DD9AB694473236B325038679D5A9DD79D7179DC68B7A3366ED22BBB6B0375DE49BF1FA59EC8BDA8572AC93494AEEE5F14E3AC68DC591AAFDD18C72C6CA496CAB50236CEACF09C3E188138C663F07D3C0C77C092F08AE11F117386179F2867D7C78742CBDBCD99F57304E927881E6486A7A0A531FB32DE461914714BB0F2856B322367829B2025502CE57C4C34F13FBD7ACD56916BBE07F65C507D655F299F83FA750711FA7D8FA4DCDF21C2673BEF978B5A7EF1CBA6BF5EAA72F79D303EB368619736A1D4ABA5C6784EBAF1F7A499337DD409AB5DF44BCDE09557B74A0459526C4FA6F0CE63E1BE47D4121E537217AFA575FD1B46F083642D4BC13180A6F10159ADE01AC83657C03E0C127CBDE00F4EBACFE4DC03AA219DF03F8A43F98FC1AA0FB3254B4DCE156A339116D6349CAF4DC9A4DBD516AE5AEF72625E97AA389AE2656F780DB20797A0DCB786579C783ED8E9AB4E2C1B07769DA2F9E4BBC2FE9C3ABC48EDD660D6F3351B8E142E86F951FBC07196D9A0C9DDD67016FDBD64C51DC3D4FA5EC97EBBB67C626F2B6769FD1BB6D63338579F7DCD87AE5EDEE99ADED6AFFDCB1A575DE42779E85AB2614196E6374B1E0B62CDB3C700E27FC390523C83DCAFC71A43EADAB2925B585E18AC4CCD49C4F263356268EC257A16866DBAFAF62C36FECACA069666BC8C26CE22DD6FF46DE82A699B721B77117F9C1DAEC425DCE76CB3AD694FEF49AF2816B3D69493F6FF3591BAFD65F53FAEF204AA9CD1EC31DF1EBC9F61D4425434E9D1ED9BDEA752FEC9D955F5284FD3BF1972B08FEBB8A04BBB55DB3A4B9220B5A6CDE9244058914A1B9C60C79B0A59EC5CC5F209741358F3167AFBBB3B81DBFE99863EF8ADCA62C4A19741987F3A016F0E24E4013FF2C85B92EF3F836CA7EA864882E80983E8FCDDF92EF533FF04AB92F3531210304F72E4444978F25E391DDE573897443494720A1BED229BAC761140058724B66E811AF231B98DF47BC44EEF32A026802691F88BADAC7E73E5AC6284C04C6AA3D7C820D7BE1D3FBBF00B18766D750540000, N'6.1.3-40302')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'80a7a791-c003-4d62-b602-1baffed9f720', N'Administrator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'80a7a791-c003-4d62-b602-1baffed9f789', N'Applicant')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'80a7a791-c003-4d62-b602-1baffed9f777', N'Recruiter')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c199025-e046-4d75-9551-4995d0353ff0', N'80a7a791-c003-4d62-b602-1baffed9f789')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6c199025-e046-4d75-9551-4995d0353ff0', N'chuksoranye4@yahoo.com', 0, N'AFEp8WEYwTBvUaSZQD7swvYwgBF/+seOQFfa0fU5Up8bs+KKl1ESiivvI2IrfTRUUg==', N'7a4f225e-271e-4414-965e-d8cf35fb86c8', NULL, 0, 0, NULL, 1, 0, N'chuksoranye4@yahoo.com')
GO
SET IDENTITY_INSERT [dbo].[Certifications] ON 

GO
INSERT [dbo].[Certifications] ([Id], [UserId], [NameOfTheBody], [CertficateName], [DateObtained]) VALUES (4, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Microsoft', N'MCPD', CAST(0x0000A4CF00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Certifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

GO
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'Nigeria')
GO
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'Non-Nigeria')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Educations] ON 

GO
INSERT [dbo].[Educations] ([Id], [UserID], [Name], [Course], [Qualification], [FromDate], [ToDate]) VALUES (2, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Nnamdi Azikiwe University', N'Production Technology', N'B.Tech', CAST(0x0000A56600000000 AS DateTime), CAST(0x0000A57A00000000 AS DateTime))
GO
INSERT [dbo].[Educations] ([Id], [UserID], [Name], [Course], [Qualification], [FromDate], [ToDate]) VALUES (5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'karros', N'karrox', N'B.Tech', CAST(0x0000A4C800000000 AS DateTime), CAST(0x0000A4DD00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Educations] OFF
GO
SET IDENTITY_INSERT [dbo].[JobCategories] ON 

GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (1, N'Banking & Finance')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (2, N'Manufacturing')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (3, N'FMCG / Conglomerate')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (4, N'Engineering')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (5, N'Information Technology')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (6, N'Oil & Gas')
GO
INSERT [dbo].[JobCategories] ([Id], [CategoryName]) VALUES (7, N'Agriculture / Farming')
GO
SET IDENTITY_INSERT [dbo].[JobCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[JobLists] ON 

GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (1, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'IT Manager', N'Lagos', N'Bolingo Hotel and Towers', N'5 years', N'Physics', N'Bolingo Hotel and Towers - A beautiful city in Nigeria with illustrious sights and a rich blend of culture and cosmopolitan glamour. If this is what you seek, then come stay at the Bolingo Hotel and Towers, located in the thriving business district.', N'To oversee the I-T department', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (2, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Traffic Personnel', N'Lagos', N'WFM 91.7', N'2 years', N'Computer Science', N'WFM 91.7, Nigeria''s first and only radio station dedicated to women and their families. WFM 91.7 was launched at Holiday Inn, Mayfair, recently by Toun Okewale Sonaiya, a former broadcaster with RayPower FM, Lagos, Nigeria.
An initiative of St. Ives Communications, which she described as a "family business," the station will hit the Nigerian airwaves from October 1, when it will start it''s test transmission.
Licensed by the Nigerian Broadcasting Corporation (NBC) to operate on the airwaves of just two states, Lagos and Ogun.', N'Interested candidates must have a minimum of 5 years hands on experience in a media company preferably a radio station.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (3, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Graphic Designer', N'Lagos', N'Supermart Nigeria', N'1 year', N'Mathematics or Related Science Course', N'Supermart.ng Nigeria, Nigeria''s leading online supermarket. If you desire to work in a fast-paced environment, and experience rapid personal and career growth while making a tremendous impact in society, then this might be the company for you. We offer a truly entrepreneurial experience in a fast paced, yet structured environment, work within a proudly Nigerian company built by young, talented and dynamic entrepreneurs. We operate a structured yet fun and easy-going work environment and also a management trainee and in-house entrepreneurial mentorship program.', N'A graphic designer is responsible for creating design solutions that have a high visual impact. The role involves listening to clients and understanding their needs before making design decisions.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (4, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Web Developer/Grapics Designer', N'Lagos', N'Get Events Limited', N'3 years', N'Computer Science', N'Get Events Limited is an E-commerce/Internet firm in need of suitable candidates for this position', N'Designing campaign banner', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (5, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'IT Manager', N'Lagos', N'Bolingo Hotel and Towers', N'7 years', N'Computer Science', N'Bolingo Hotel and Towers - A beautiful city in Nigeria with illustrious sights and a rich blend of culture and cosmopolitan glamour. If this is what you seek, then come stay at the Bolingo Hotel and Towers, located in the thriving business district.', N'To oversee the I-T department', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (6, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Traffic Personnel', N'Lagos', N'WFM 91.7', N'5 years', N'Computer Science', N'WFM 91.7, Nigeria''s first and only radio station dedicated to women and their families. WFM 91.7 was launched at Holiday Inn, Mayfair, recently by Toun Okewale Sonaiya, a former broadcaster with RayPower FM, Lagos, Nigeria.
An initiative of St. Ives Communications, which she described as a "family business," the station will hit the Nigerian airwaves from October 1, when it will start it''s test transmission.
Licensed by the Nigerian Broadcasting Corporation (NBC) to operate on the airwaves of just two states, Lagos and Ogun.', N'Interested candidates must have a minimum of 5 years hands on experience in a media company preferably a radio station.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (7, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Graphic Designer', N'Lagos', N'Supermart Nigeria', N'2 years', N'Science or Engineering', N'Supermart.ng Nigeria, Nigeria''s leading online supermarket. If you desire to work in a fast-paced environment, and experience rapid personal and career growth while making a tremendous impact in society, then this might be the company for you. We offer a truly entrepreneurial experience in a fast paced, yet structured environment, work within a proudly Nigerian company built by young, talented and dynamic entrepreneurs. We operate a structured yet fun and easy-going work environment and also a management trainee and in-house entrepreneurial mentorship program.', N'A graphic designer is responsible for creating design solutions that have a high visual impact. The role involves listening to clients and understanding their needs before making design decisions.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (8, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Web Developer/Grapics Designer', N'Lagos', N'Get Events Limited', N'3 years', N'Computer Science', N'Get Events Limited is an E-commerce/Internet firm in need of suitable candidates for this position', N'Designing campaign banner', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (9, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'IT Manager', N'Lagos', N'Bolingo Hotel and Towers', N'4 years', N'Physics', N'Bolingo Hotel and Towers - A beautiful city in Nigeria with illustrious sights and a rich blend of culture and cosmopolitan glamour. If this is what you seek, then come stay at the Bolingo Hotel and Towers, located in the thriving business district.', N'To oversee the I-T department', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (10, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Traffic Personnel', N'Lagos', N'WFM 91.7', N'5 years', N'Software Engineering', N'WFM 91.7, Nigeria''s first and only radio station dedicated to women and their families. WFM 91.7 was launched at Holiday Inn, Mayfair, recently by Toun Okewale Sonaiya, a former broadcaster with RayPower FM, Lagos, Nigeria.
An initiative of St. Ives Communications, which she described as a "family business," the station will hit the Nigerian airwaves from October 1, when it will start it''s test transmission.
Licensed by the Nigerian Broadcasting Corporation (NBC) to operate on the airwaves of just two states, Lagos and Ogun.', N'Interested candidates must have a minimum of 5 years hands on experience in a media company preferably a radio station.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (11, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Graphic Designer', N'Lagos', N'Supermart Nigeria', N'7 years', N'Information Technology', N'Supermart.ng Nigeria, Nigeria''s leading online supermarket. If you desire to work in a fast-paced environment, and experience rapid personal and career growth while making a tremendous impact in society, then this might be the company for you. We offer a truly entrepreneurial experience in a fast paced, yet structured environment, work within a proudly Nigerian company built by young, talented and dynamic entrepreneurs. We operate a structured yet fun and easy-going work environment and also a management trainee and in-house entrepreneurial mentorship program.', N'A graphic designer is responsible for creating design solutions that have a high visual impact. The role involves listening to clients and understanding their needs before making design decisions.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (12, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Web Developer/Grapics Designer', N'Lagos', N'Get Events Limited', N'9 years', N'Related Course', N'Get Events Limited is an E-commerce/Internet firm in need of suitable candidates for this position', N'Designing campaign banner', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (13, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'IT Manager', N'Lagos', N'Bolingo Hotel and Towers', N'10 years', N'Physics', N'Bolingo Hotel and Towers - A beautiful city in Nigeria with illustrious sights and a rich blend of culture and cosmopolitan glamour. If this is what you seek, then come stay at the Bolingo Hotel and Towers, located in the thriving business district.', N'To oversee the I-T department', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (14, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Traffic Personnel', N'Lagos', N'WFM 91.7', N'2 years', N'Electronics', N'WFM 91.7, Nigeria''s first and only radio station dedicated to women and their families. WFM 91.7 was launched at Holiday Inn, Mayfair, recently by Toun Okewale Sonaiya, a former broadcaster with RayPower FM, Lagos, Nigeria.
An initiative of St. Ives Communications, which she described as a "family business," the station will hit the Nigerian airwaves from October 1, when it will start it''s test transmission.
Licensed by the Nigerian Broadcasting Corporation (NBC) to operate on the airwaves of just two states, Lagos and Ogun.', N'Interested candidates must have a minimum of 5 years hands on experience in a media company preferably a radio station.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (15, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Graphic Designer', N'Lagos', N'Supermart Nigeria', N'3 years', N'Electronics', N'Supermart.ng Nigeria, Nigeria''s leading online supermarket. If you desire to work in a fast-paced environment, and experience rapid personal and career growth while making a tremendous impact in society, then this might be the company for you. We offer a truly entrepreneurial experience in a fast paced, yet structured environment, work within a proudly Nigerian company built by young, talented and dynamic entrepreneurs. We operate a structured yet fun and easy-going work environment and also a management trainee and in-house entrepreneurial mentorship program.', N'A graphic designer is responsible for creating design solutions that have a high visual impact. The role involves listening to clients and understanding their needs before making design decisions.', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (16, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Web Developer/Grapics Designer', N'Lagos', N'Get Events Limited', N'2 years', N'Computer Science', N'Get Events Limited is an E-commerce/Internet firm in need of suitable candidates for this position', N'Designing campaign banner', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
INSERT [dbo].[JobLists] ([Id], [JobCategoryID], [PostedBy], [JobTitle], [JobLocation], [CompanyName], [RequiredYearsExpreince], [DesiredCourse], [JobDetails], [JobDescription], [Salary], [StateID], [Country], [PostedDate], [ExpDate], [Status]) VALUES (17, 5, N'6c199025-e046-4d75-9551-4995d0353ff0', N'IT Manager', N'Lagos', N'Bolingo Hotel and Towers', N'2 years', N'Computer Science', N'Bolingo Hotel and Towers - A beautiful city in Nigeria with illustrious sights and a rich blend of culture and cosmopolitan glamour. If this is what you seek, then come stay at the Bolingo Hotel and Towers, located in the thriving business district.', N'To oversee the I-T department', N'N100,000.00 - N150,000.00 per month', 1, 1, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[JobLists] OFF
GO
SET IDENTITY_INSERT [dbo].[JobPreferences] ON 

GO
INSERT [dbo].[JobPreferences] ([Id], [UserID], [CategoryID], [StateID]) VALUES (4, N'6c199025-e046-4d75-9551-4995d0353ff0', 1, 4)
GO
INSERT [dbo].[JobPreferences] ([Id], [UserID], [CategoryID], [StateID]) VALUES (5, N'6c199025-e046-4d75-9551-4995d0353ff0', 3, 6)
GO
INSERT [dbo].[JobPreferences] ([Id], [UserID], [CategoryID], [StateID]) VALUES (6, N'6c199025-e046-4d75-9551-4995d0353ff0', 2, 5)
GO
SET IDENTITY_INSERT [dbo].[JobPreferences] OFF
GO
SET IDENTITY_INSERT [dbo].[JobsApplies] ON 

GO
INSERT [dbo].[JobsApplies] ([Id], [JobListID], [PostedByID], [ApplyUserID], [AppliedDate]) VALUES (4, 4, N'6c199025-e046-4d75-9551-4995d0353ff0', N'6c199025-e046-4d75-9551-4995d0353ff0', CAST(0x0000A4E7018242AD AS DateTime))
GO
INSERT [dbo].[JobsApplies] ([Id], [JobListID], [PostedByID], [ApplyUserID], [AppliedDate]) VALUES (5, 1, N'6c199025-e046-4d75-9551-4995d0353ff0', N'6c199025-e046-4d75-9551-4995d0353ff0', CAST(0x0000A4E900CACAA1 AS DateTime))
GO
INSERT [dbo].[JobsApplies] ([Id], [JobListID], [PostedByID], [ApplyUserID], [AppliedDate]) VALUES (6, 15, N'6c199025-e046-4d75-9551-4995d0353ff0', N'6c199025-e046-4d75-9551-4995d0353ff0', CAST(0x0000A4E900CB4BBA AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[JobsApplies] OFF
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus] ON 

GO
INSERT [dbo].[MaritalStatus] ([Id], [Status]) VALUES (1, N'Single')
GO
INSERT [dbo].[MaritalStatus] ([Id], [Status]) VALUES (2, N'Married')
GO
INSERT [dbo].[MaritalStatus] ([Id], [Status]) VALUES (3, N'Divorced')
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Passport] ON 

GO
INSERT [dbo].[Passport] ([Id], [UserID], [Img]) VALUES (14, N'6c199025-e046-4d75-9551-4995d0353ff0', N'PassportsImg/1f610370-4a64-43ef-8ce5-07db13e39d1e.jpg')
GO
SET IDENTITY_INSERT [dbo].[Passport] OFF
GO
SET IDENTITY_INSERT [dbo].[Referees] ON 

GO
INSERT [dbo].[Referees] ([Id], [UserID], [Name], [Email], [PoneNumber], [Relation]) VALUES (3, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Oranye Emeka', N'emyoranye@yahoo.com', N'08035570377', N'Brother')
GO
SET IDENTITY_INSERT [dbo].[Referees] OFF
GO
SET IDENTITY_INSERT [dbo].[Sexes] ON 

GO
INSERT [dbo].[Sexes] ([Id], [Sex1]) VALUES (1, N'Male')
GO
INSERT [dbo].[Sexes] ([Id], [Sex1]) VALUES (2, N'Female')
GO
SET IDENTITY_INSERT [dbo].[Sexes] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

GO
INSERT [dbo].[Skills] ([Id], [UserID], [SkillName], [Level], [YearOfExprience]) VALUES (1, N'6c199025-e046-4d75-9551-4995d0353ff0', N'HTML 5', N'Expert', 10)
GO
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

GO
INSERT [dbo].[States] ([Id], [CountryId], [Name]) VALUES (1, 1, N'Abia')
GO
INSERT [dbo].[States] ([Id], [CountryId], [Name]) VALUES (4, 1, N'Adamawa')
GO
INSERT [dbo].[States] ([Id], [CountryId], [Name]) VALUES (5, 1, N'Akwa-Ibom')
GO
INSERT [dbo].[States] ([Id], [CountryId], [Name]) VALUES (6, 1, N'Anambra')
GO
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

GO
INSERT [dbo].[UserDetails] ([Id], [UserID], [FirstName], [LastName], [MiddleName], [SexId], [MaritalStatusId], [PhoneNumber], [Address], [StateId], [CountryId]) VALUES (6, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Chukwuka', N'Oranye', N'Uchenna', 1, 1, N'08035570378', N'18 Omoniyi Street, Shangisha/Magodo,Lagos', 6, 1)
GO
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkedExpres] ON 

GO
INSERT [dbo].[WorkedExpres] ([Id], [UserID], [CompanyName], [Industry], [Address], [PositionHeld], [JobDescription], [FromDate], [ToDate]) VALUES (1, N'6c199025-e046-4d75-9551-4995d0353ff0', N'Pethahiah Rehoboth Inl', N'Telecommunication', N'All Season Plaza', N'Software Developer', N'Software Developer', CAST(0x0000A4CD00000000 AS DateTime), CAST(0x0000A4CE00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[WorkedExpres] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_ApplicantApproval_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ApplicantApproval_AspNetUsers] ON [dbo].[ApplicantApprovals]
(
	[ApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_ApplicantApproval_AspNetUsers1]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ApplicantApproval_AspNetUsers1] ON [dbo].[ApplicantApprovals]
(
	[PostedBy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ApplicantApproval_JobList]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ApplicantApproval_JobList] ON [dbo].[ApplicantApprovals]
(
	[JobListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_Certification_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Certification_AspNetUsers] ON [dbo].[Certifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_Education_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Education_AspNetUsers] ON [dbo].[Educations]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_JobList_JobCategory]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobList_JobCategory] ON [dbo].[JobLists]
(
	[JobCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_JobPreference_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobPreference_AspNetUsers] ON [dbo].[JobPreferences]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_JobPreference_AspNetUsers1]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobPreference_AspNetUsers1] ON [dbo].[JobPreferences]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_JobPreference_JobCategory]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobPreference_JobCategory] ON [dbo].[JobPreferences]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_JobPreference_State]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobPreference_State] ON [dbo].[JobPreferences]
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_JobsApply_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobsApply_AspNetUsers] ON [dbo].[JobsApplies]
(
	[PostedByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_JobsApply_AspNetUsers1]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobsApply_AspNetUsers1] ON [dbo].[JobsApplies]
(
	[ApplyUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_JobsApply_JobList]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_JobsApply_JobList] ON [dbo].[JobsApplies]
(
	[JobListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_Referee_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Referee_AspNetUsers] ON [dbo].[Referees]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_Skill_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Skill_AspNetUsers] ON [dbo].[Skills]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_State_Country]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_State_Country] ON [dbo].[States]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_UserDetail_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDetail_AspNetUsers] ON [dbo].[UserDetails]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDetail_Country]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDetail_Country] ON [dbo].[UserDetails]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDetail_MaritalStatu]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDetail_MaritalStatu] ON [dbo].[UserDetails]
(
	[MaritalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDetail_Sex]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDetail_Sex] ON [dbo].[UserDetails]
(
	[SexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDetail_State]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDetail_State] ON [dbo].[UserDetails]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_WorkedExpre_AspNetUsers]    Script Date: 10/20/2015 9:54:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_WorkedExpre_AspNetUsers] ON [dbo].[WorkedExpres]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicantApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ApplicantApproval_AspNetUsers] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicantApprovals] CHECK CONSTRAINT [FK_ApplicantApproval_AspNetUsers]
GO
ALTER TABLE [dbo].[ApplicantApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ApplicantApproval_AspNetUsers1] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicantApprovals] CHECK CONSTRAINT [FK_ApplicantApproval_AspNetUsers1]
GO
ALTER TABLE [dbo].[ApplicantApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ApplicantApproval_JobList] FOREIGN KEY([JobListID])
REFERENCES [dbo].[JobLists] ([Id])
GO
ALTER TABLE [dbo].[ApplicantApprovals] CHECK CONSTRAINT [FK_ApplicantApproval_JobList]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Certifications]  WITH CHECK ADD  CONSTRAINT [FK_Certification_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Certifications] CHECK CONSTRAINT [FK_Certification_AspNetUsers]
GO
ALTER TABLE [dbo].[Educations]  WITH CHECK ADD  CONSTRAINT [FK_Education_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Educations] CHECK CONSTRAINT [FK_Education_AspNetUsers]
GO
ALTER TABLE [dbo].[JobLists]  WITH CHECK ADD  CONSTRAINT [FK_JobList_JobCategory] FOREIGN KEY([JobCategoryID])
REFERENCES [dbo].[JobCategories] ([Id])
GO
ALTER TABLE [dbo].[JobLists] CHECK CONSTRAINT [FK_JobList_JobCategory]
GO
ALTER TABLE [dbo].[JobLists]  WITH CHECK ADD  CONSTRAINT [FK_JobLists_Countries] FOREIGN KEY([Country])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[JobLists] CHECK CONSTRAINT [FK_JobLists_Countries]
GO
ALTER TABLE [dbo].[JobLists]  WITH CHECK ADD  CONSTRAINT [FK_JobLists_States] FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[JobLists] CHECK CONSTRAINT [FK_JobLists_States]
GO
ALTER TABLE [dbo].[JobPreferences]  WITH CHECK ADD  CONSTRAINT [FK_JobPreference_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobPreferences] CHECK CONSTRAINT [FK_JobPreference_AspNetUsers]
GO
ALTER TABLE [dbo].[JobPreferences]  WITH CHECK ADD  CONSTRAINT [FK_JobPreference_AspNetUsers1] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobPreferences] CHECK CONSTRAINT [FK_JobPreference_AspNetUsers1]
GO
ALTER TABLE [dbo].[JobPreferences]  WITH CHECK ADD  CONSTRAINT [FK_JobPreference_JobCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[JobCategories] ([Id])
GO
ALTER TABLE [dbo].[JobPreferences] CHECK CONSTRAINT [FK_JobPreference_JobCategory]
GO
ALTER TABLE [dbo].[JobPreferences]  WITH CHECK ADD  CONSTRAINT [FK_JobPreference_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[JobPreferences] CHECK CONSTRAINT [FK_JobPreference_State]
GO
ALTER TABLE [dbo].[JobsApplies]  WITH CHECK ADD  CONSTRAINT [FK_JobsApply_AspNetUsers] FOREIGN KEY([PostedByID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobsApplies] CHECK CONSTRAINT [FK_JobsApply_AspNetUsers]
GO
ALTER TABLE [dbo].[JobsApplies]  WITH CHECK ADD  CONSTRAINT [FK_JobsApply_AspNetUsers1] FOREIGN KEY([ApplyUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobsApplies] CHECK CONSTRAINT [FK_JobsApply_AspNetUsers1]
GO
ALTER TABLE [dbo].[JobsApplies]  WITH CHECK ADD  CONSTRAINT [FK_JobsApply_JobList] FOREIGN KEY([JobListID])
REFERENCES [dbo].[JobLists] ([Id])
GO
ALTER TABLE [dbo].[JobsApplies] CHECK CONSTRAINT [FK_JobsApply_JobList]
GO
ALTER TABLE [dbo].[JobsApplies]  WITH CHECK ADD  CONSTRAINT [FK_JobsApply_JobsApply] FOREIGN KEY([Id])
REFERENCES [dbo].[JobsApplies] ([Id])
GO
ALTER TABLE [dbo].[JobsApplies] CHECK CONSTRAINT [FK_JobsApply_JobsApply]
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD  CONSTRAINT [FK_Passport_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Passport] CHECK CONSTRAINT [FK_Passport_AspNetUsers]
GO
ALTER TABLE [dbo].[Referees]  WITH CHECK ADD  CONSTRAINT [FK_Referee_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Referees] CHECK CONSTRAINT [FK_Referee_AspNetUsers]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skill_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skill_AspNetUsers]
GO
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetail_AspNetUsers]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetail_Country]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_MaritalStatu] FOREIGN KEY([MaritalStatusId])
REFERENCES [dbo].[MaritalStatus] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetail_MaritalStatu]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_Sex] FOREIGN KEY([SexId])
REFERENCES [dbo].[Sexes] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetail_Sex]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetail_State]
GO
ALTER TABLE [dbo].[WorkedExpres]  WITH CHECK ADD  CONSTRAINT [FK_WorkedExpre_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WorkedExpres] CHECK CONSTRAINT [FK_WorkedExpre_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [JPortal] SET  READ_WRITE 
GO
