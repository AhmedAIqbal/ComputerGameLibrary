USE [master]
GO
/****** Object:  Database [ComputerGameLibrary]    Script Date: 20/10/2019 01:20:00 ******/
CREATE DATABASE [ComputerGameLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComputerGameLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ComputerGameLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComputerGameLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ComputerGameLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ComputerGameLibrary] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComputerGameLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComputerGameLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComputerGameLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComputerGameLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ComputerGameLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComputerGameLibrary] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ComputerGameLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [ComputerGameLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [ComputerGameLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComputerGameLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComputerGameLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComputerGameLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComputerGameLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ComputerGameLibrary', N'ON'
GO
ALTER DATABASE [ComputerGameLibrary] SET QUERY_STORE = OFF
GO
USE [ComputerGameLibrary]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 20/10/2019 01:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Games]    Script Date: 20/10/2019 01:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Genre] [nvarchar](max) NULL,
	[YearPublished] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameUsers]    Script Date: 20/10/2019 01:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.GameUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
insert into GameUsers select 'test','test'
insert into Games select 'STREET FIGHTER V','ACTION',2018,20
insert into Games select 'TEKKEN 7','ACTION',2017,25
insert into Games select 'FIFA 2019','SPORTS',2019,20
insert into Games select 'MORTAL KOMBAT 11','ACTION',2019,30
insert into Games select 'MARIO','ADVENTURE',2016,19.99
GO
USE [master]
GO
ALTER DATABASE [ComputerGameLibrary] SET  READ_WRITE 
GO
