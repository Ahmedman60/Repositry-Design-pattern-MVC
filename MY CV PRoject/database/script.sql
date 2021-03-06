USE [master]
GO
/****** Object:  Database [test1]    Script Date: 10/16/2018 5:48:49 PM ******/
CREATE DATABASE [test1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MOHAMEDSQL\MSSQL\DATA\test1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MOHAMEDSQL\MSSQL\DATA\test1_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test1] SET ARITHABORT OFF 
GO
ALTER DATABASE [test1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test1] SET RECOVERY FULL 
GO
ALTER DATABASE [test1] SET  MULTI_USER 
GO
ALTER DATABASE [test1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [test1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'test1', N'ON'
GO
USE [test1]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
	[notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
	[address] [nvarchar](150) NULL,
	[city] [nvarchar](50) NULL,
	[DeptID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvID] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [int] NULL,
	[InvDate] [datetime] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoicesDetails]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesDetails](
	[InvID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_InvoicesDetails] PRIMARY KEY CLUSTERED 
(
	[InvID] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [nvarchar](50) NULL,
	[Qty] [int] NULL,
	[Avialable] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[aprov]    Script Date: 10/16/2018 5:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[aprov]
AS
SELECT        ProductID, ProdName, Qty
FROM            dbo.Products
WHERE        (Avialable = 1)

GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[InvoicesDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesDetails_Invoices] FOREIGN KEY([InvID])
REFERENCES [dbo].[Invoices] ([InvID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoicesDetails] CHECK CONSTRAINT [FK_InvoicesDetails_Invoices]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'aprov'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'aprov'
GO
USE [master]
GO
ALTER DATABASE [test1] SET  READ_WRITE 
GO
