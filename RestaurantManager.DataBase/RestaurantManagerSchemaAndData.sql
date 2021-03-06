USE [master]
GO
/****** Object:  Database [RestaurantManager]    Script Date: 02-Jul-17 8:13:34 PM ******/
CREATE DATABASE [RestaurantManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantManager', FILENAME = N'C:\Program Files\MSSQLSERVER\MSSQL11.MSSQLSERVER\MSSQL\DATA\RestaurantManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RestaurantManager_log', FILENAME = N'C:\Program Files\MSSQLSERVER\MSSQL11.MSSQLSERVER\MSSQL\DATA\RestaurantManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RestaurantManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantManager] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RestaurantManager]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[UnitTypeAmount] [int] NOT NULL,
	[MenuItemTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Sets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItemsMenuTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemsMenuTypes](
	[MenuItemId] [int] NOT NULL,
	[MenuTypeId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItemsProducts]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemsProducts](
	[Product_Id] [int] NOT NULL,
	[MenuItem_Id] [int] NOT NULL,
 CONSTRAINT [PK_SetsProducts] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC,
	[MenuItem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItemTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_SetTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MenuTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[UnitTypeAmount] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_UnitTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (4, N'Крем супа от моркови', 4.6000, CAST(0x0000A79F0129F690 AS DateTime), 2, 300, 1)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (11, N'Бисквитена торта', 0.9900, CAST(0x0000A79F013EDD64 AS DateTime), 2, 400, 4)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (13, N'Шопска салата', 4.0000, CAST(0x0000A79F013F15FE AS DateTime), 2, 223, 2)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (14, N'Шкембе чорба', 3.4000, CAST(0x0000A79F013F297A AS DateTime), 2, 122, 1)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (15, N'Крем супа от тиквички', 7.5000, CAST(0x0000A79F013F51EC AS DateTime), 4, 23, 1)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (16, N'Пилешка кълцаница', 5.9900, CAST(0x0000A79F013F5C0D AS DateTime), 2, 23, 3)
INSERT [dbo].[MenuItems] ([Id], [Name], [Price], [CreatedOn], [UnitTypeId], [UnitTypeAmount], [MenuItemTypeId]) VALUES (17, N'Пилешка супа', 5.6786, CAST(0x0000A79F013F632F AS DateTime), 2, 33, 2)
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
SET IDENTITY_INSERT [dbo].[MenuItemTypes] ON 

INSERT [dbo].[MenuItemTypes] ([Id], [Name], [OrderId]) VALUES (1, N'Супи', 1)
INSERT [dbo].[MenuItemTypes] ([Id], [Name], [OrderId]) VALUES (2, N'Салати', 2)
INSERT [dbo].[MenuItemTypes] ([Id], [Name], [OrderId]) VALUES (3, N'Основни', 3)
INSERT [dbo].[MenuItemTypes] ([Id], [Name], [OrderId]) VALUES (4, N'Десерти', 4)
SET IDENTITY_INSERT [dbo].[MenuItemTypes] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [CreatedOn], [ProductTypeId], [UnitTypeAmount], [UnitTypeId]) VALUES (3, N'Зеле', 2.0000, N'Зеленце', CAST(0x0000816300000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [CreatedOn], [ProductTypeId], [UnitTypeAmount], [UnitTypeId]) VALUES (14, N'Моркови', 3.0000, N'Морковче', CAST(0x0000816300000000 AS DateTime), 1, 2, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (1, N'Зеленчуци           ')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
SET IDENTITY_INSERT [dbo].[UnitTypes] ON 

INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (2, N'гр')
INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (4, N'мл')
SET IDENTITY_INSERT [dbo].[UnitTypes] OFF
/****** Object:  Index [IX_FK_Sets_SetTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Sets_SetTypes] ON [dbo].[MenuItems]
(
	[MenuItemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SetsProducts_Sets]    Script Date: 02-Jul-17 8:13:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SetsProducts_Sets] ON [dbo].[MenuItemsProducts]
(
	[MenuItem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_ProductTypes]    Script Date: 02-Jul-17 8:13:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_ProductTypes] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_UnitType]    Script Date: 02-Jul-17 8:13:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_UnitType] ON [dbo].[Products]
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MenuItems] ADD  CONSTRAINT [DF_Recipes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitTypes] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_Recipes_UnitTypes]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_Sets_SetTypes] FOREIGN KEY([MenuItemTypeId])
REFERENCES [dbo].[MenuItemTypes] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_Sets_SetTypes]
GO
ALTER TABLE [dbo].[MenuItemsMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemsMenuTypes_MenuItems] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItems] ([Id])
GO
ALTER TABLE [dbo].[MenuItemsMenuTypes] CHECK CONSTRAINT [FK_MenuItemsMenuTypes_MenuItems]
GO
ALTER TABLE [dbo].[MenuItemsMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemsMenuTypes_MenuTypes] FOREIGN KEY([MenuTypeId])
REFERENCES [dbo].[MenuTypes] ([Id])
GO
ALTER TABLE [dbo].[MenuItemsMenuTypes] CHECK CONSTRAINT [FK_MenuItemsMenuTypes_MenuTypes]
GO
ALTER TABLE [dbo].[MenuItemsProducts]  WITH CHECK ADD  CONSTRAINT [FK_SetsProducts_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[MenuItemsProducts] CHECK CONSTRAINT [FK_SetsProducts_Products]
GO
ALTER TABLE [dbo].[MenuItemsProducts]  WITH CHECK ADD  CONSTRAINT [FK_SetsProducts_Sets] FOREIGN KEY([MenuItem_Id])
REFERENCES [dbo].[MenuItems] ([Id])
GO
ALTER TABLE [dbo].[MenuItemsProducts] CHECK CONSTRAINT [FK_SetsProducts_Sets]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_UnitType] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitTypes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_UnitType]
GO
USE [master]
GO
ALTER DATABASE [RestaurantManager] SET  READ_WRITE 
GO
