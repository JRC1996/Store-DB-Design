USE [master]
GO
/****** Object:  Database [Sales_system]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE DATABASE [Sales_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sales_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Sales_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sales_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Sales_system_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sales_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sales_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales_system] SET RECOVERY FULL 
GO
ALTER DATABASE [Sales_system] SET  MULTI_USER 
GO
ALTER DATABASE [Sales_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sales_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sales_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sales_system', N'ON'
GO
ALTER DATABASE [Sales_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sales_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sales_system]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[IdBrands] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[IdBrands] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[IdCartItems] [int] IDENTITY(1,1) NOT NULL,
	[IdProducts] [int] NOT NULL,
	[IdCarts] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[IdCartItems] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[IdCarts] [int] IDENTITY(1,1) NOT NULL,
	[IdUsers] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
	[IdCartStatus] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[IdCarts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartStatus]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartStatus](
	[IdCartStatus] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](50) NOT NULL,
	[Description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_CartStatus] PRIMARY KEY CLUSTERED 
(
	[IdCartStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[IdCategories] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdCategories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipalities]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipalities](
	[IdMunicipality] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IdProvinces] [int] NOT NULL,
 CONSTRAINT [PK_Municipalities] PRIMARY KEY CLUSTERED 
(
	[IdMunicipality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[IdPermissions] [int] IDENTITY(1,1) NOT NULL,
	[PermissionCode] [varchar](50) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[Category] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[IdPermissions] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IdProducts] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[IdBrands] [int] NOT NULL,
	[IdCategories] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[ImageURL] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IdProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[IdProvinces] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[IdProvinces] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRoles] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesPermissions]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPermissions](
	[IdRolesPermissions] [int] IDENTITY(1,1) NOT NULL,
	[IdRoles] [int] NOT NULL,
	[IdPermissions] [int] NOT NULL,
 CONSTRAINT [PK_RolesPermissions] PRIMARY KEY CLUSTERED 
(
	[IdRolesPermissions] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[IdSales] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsers] [int] NOT NULL,
	[Contact] [varchar](50) NOT NULL,
	[IdSector] [int] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[IdTransaction] [varchar](50) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[IdSalesStatus] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[IdSales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[IdSalesDetails] [bigint] NOT NULL,
	[IdSales] [bigint] NOT NULL,
	[IdProducts] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sales Details] PRIMARY KEY CLUSTERED 
(
	[IdSalesDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesStatus]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesStatus](
	[IdSalesStatus] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_SalesStatus] PRIMARY KEY CLUSTERED 
(
	[IdSalesStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sectors]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sectors](
	[IdSectors] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IdMunicipalities] [int] NOT NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[IdSectors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUsers] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Reset] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 28/2/2025 12:01:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[IdUserRoles] [int] IDENTITY(1,1) NOT NULL,
	[IdUsers] [int] NOT NULL,
	[IdRoles] [int] NOT NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[IdUserRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description_Brand]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Description_Brand] ON [dbo].[Brands]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisterDate]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_RegisterDate] ON [dbo].[Brands]
(
	[RegisterDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description_Cat]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Description_Cat] ON [dbo].[Categories]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisterDate]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_RegisterDate] ON [dbo].[Categories]
(
	[RegisterDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdProvinces_Sectors]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdProvinces_Sectors] ON [dbo].[Municipalities]
(
	[IdProvinces] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name_Municipalites]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name_Municipalites] ON [dbo].[Municipalities]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name_Provinces]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name_Provinces] ON [dbo].[Provinces]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdClient]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdClient] ON [dbo].[Sales]
(
	[IdUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdSector]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdSector] ON [dbo].[Sales]
(
	[IdSector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdTransaction]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdTransaction] ON [dbo].[Sales]
(
	[IdTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SaleDate]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_SaleDate] ON [dbo].[Sales]
(
	[SaleDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdProducts_SalesDetails]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdProducts_SalesDetails] ON [dbo].[SalesDetails]
(
	[IdProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdSales_SalesDetails]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdSales_SalesDetails] ON [dbo].[SalesDetails]
(
	[IdSales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdMunicipalities_Sectors]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_IdMunicipalities_Sectors] ON [dbo].[Sectors]
(
	[IdMunicipalities] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name_Sectors]    Script Date: 28/2/2025 12:01:45 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name_Sectors] ON [dbo].[Sectors]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_IdCa]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_UpdateAt]  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Table_1_CreationDate]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_SaleDate]  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Reset]  DEFAULT ((0)) FOR [Reset]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([IdCarts])
REFERENCES [dbo].[Carts] ([IdCarts])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([IdProducts])
REFERENCES [dbo].[Products] ([IdProducts])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_CartStatus] FOREIGN KEY([IdCartStatus])
REFERENCES [dbo].[CartStatus] ([IdCartStatus])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_CartStatus]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([IdUsers])
REFERENCES [dbo].[Users] ([IdUsers])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Municipalities]  WITH CHECK ADD  CONSTRAINT [FK_Municipalities_Provinces] FOREIGN KEY([IdProvinces])
REFERENCES [dbo].[Provinces] ([IdProvinces])
GO
ALTER TABLE [dbo].[Municipalities] CHECK CONSTRAINT [FK_Municipalities_Provinces]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([IdBrands])
REFERENCES [dbo].[Brands] ([IdBrands])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([IdCategories])
REFERENCES [dbo].[Categories] ([IdCategories])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Permissions] FOREIGN KEY([IdPermissions])
REFERENCES [dbo].[Permissions] ([IdPermissions])
GO
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Permissions]
GO
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Roles] FOREIGN KEY([IdRoles])
REFERENCES [dbo].[Roles] ([IdRoles])
GO
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Roles]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SalesStatus] FOREIGN KEY([IdSalesStatus])
REFERENCES [dbo].[SalesStatus] ([IdSalesStatus])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_SalesStatus]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Sectors] FOREIGN KEY([IdSector])
REFERENCES [dbo].[Sectors] ([IdSectors])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Sectors]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Users] FOREIGN KEY([IdUsers])
REFERENCES [dbo].[Users] ([IdUsers])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Users]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_Sales Details_Products] FOREIGN KEY([IdProducts])
REFERENCES [dbo].[Products] ([IdProducts])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_Sales Details_Products]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_Sales Details_Sales] FOREIGN KEY([IdSales])
REFERENCES [dbo].[Sales] ([IdSales])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_Sales Details_Sales]
GO
ALTER TABLE [dbo].[Sectors]  WITH CHECK ADD  CONSTRAINT [FK_Sectors_Municipalities] FOREIGN KEY([IdMunicipalities])
REFERENCES [dbo].[Municipalities] ([IdMunicipality])
GO
ALTER TABLE [dbo].[Sectors] CHECK CONSTRAINT [FK_Sectors_Municipalities]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([IdRoles])
REFERENCES [dbo].[Roles] ([IdRoles])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([IdUsers])
REFERENCES [dbo].[Users] ([IdUsers])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [Sales_system] SET  READ_WRITE 
GO
