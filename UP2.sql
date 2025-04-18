USE [master]
GO
/****** Object:  Database [Ospinnikova_Daria_UP2]    Script Date: 19.12.2024 20:24:24 ******/
CREATE DATABASE [Ospinnikova_Daria_UP2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dostochka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Dostochka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dostochka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Dostochka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ospinnikova_Daria_UP2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET RECOVERY FULL 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET  MULTI_USER 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ospinnikova_Daria_UP2', N'ON'
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ospinnikova_Daria_UP2]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](100) NOT NULL,
	[birth_date] [date] NOT NULL,
	[passport_data] [varchar](100) NOT NULL,
	[bank_details] [varchar](100) NOT NULL,
	[has_family] [bit] NOT NULL,
	[health_status] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_type_id] [int] NULL,
	[material_name] [varchar](100) NOT NULL,
	[supplier_id] [int] NULL,
	[quantity_per_package] [int] NOT NULL,
	[unit_of_measure] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[image_url] [varchar](200) NULL,
	[cost] [decimal](10, 2) NOT NULL,
	[quantity_in_stock] [int] NOT NULL,
	[min_allowed_quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[material_type_id] [int] IDENTITY(1,1) NOT NULL,
	[material_type] [varchar](50) NOT NULL,
	[defect_rate] [decimal](5, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[material_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[production_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[partner_id] [int] NULL,
	[order_date] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[total_cost] [decimal](10, 2) NOT NULL,
	[payment_status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[partner_id] [int] IDENTITY(1,1) NOT NULL,
	[partner_type] [varchar](50) NOT NULL,
	[partner_name] [varchar](100) NOT NULL,
	[director_name] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[legal_address] [varchar](200) NOT NULL,
	[inn] [varchar](20) NULL,
	[rating] [int] NOT NULL,
 CONSTRAINT [PK__Partners__576F1B2795BA44D4] PRIMARY KEY CLUSTERED 
(
	[partner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[personnel_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[equipment_access] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[personnel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_id] [int] NULL,
	[product_name] [varchar](100) NOT NULL,
	[article] [varchar](50) NOT NULL,
	[min_partner_cost] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[product_type_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type] [varchar](50) NOT NULL,
	[type_coefficient] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesHistory]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesHistory](
	[sale_id] [int] IDENTITY(1,1) NOT NULL,
	[partner_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[sale_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_type] [varchar](50) NOT NULL,
	[supplier_name] [varchar](100) NOT NULL,
	[inn] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyHistory]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyHistory](
	[supply_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NULL,
	[material_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[supply_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 19.12.2024 20:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[warehouse_id] [int] IDENTITY(1,1) NOT NULL,
	[material_id] [int] NULL,
	[quantity_received] [int] NOT NULL,
	[quantity_reserved] [int] NOT NULL,
	[quantity_issued] [int] NOT NULL,
	[quantity_written_off] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employee_id], [full_name], [birth_date], [passport_data], [bank_details], [has_family], [health_status]) VALUES (1, N'Иванов Иван Иванович', CAST(N'1980-05-15' AS Date), N'4505 123456', N'Сбербанк 1234567890123456', 1, N'Здоров')
INSERT [dbo].[Employees] ([employee_id], [full_name], [birth_date], [passport_data], [bank_details], [has_family], [health_status]) VALUES (2, N'Петров Петр Петрович', CAST(N'1975-11-22' AS Date), N'4506 654321', N'ВТБ 9876543210987654', 0, N'Аллергия на пыль')
INSERT [dbo].[Employees] ([employee_id], [full_name], [birth_date], [passport_data], [bank_details], [has_family], [health_status]) VALUES (3, N'Сидорова Анна Сергеевна', CAST(N'1990-03-10' AS Date), N'4507 112233', N'Газпромбанк 1122334455667788', 1, N'Здорова')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([material_id], [material_type_id], [material_name], [supplier_id], [quantity_per_package], [unit_of_measure], [description], [image_url], [cost], [quantity_in_stock], [min_allowed_quantity]) VALUES (1, 1, N'Материал 1', NULL, 100, N'кг', N'Описание материала 1', N'http://example.com/material1.jpg', CAST(100.50 AS Decimal(10, 2)), 500, 100)
INSERT [dbo].[Materials] ([material_id], [material_type_id], [material_name], [supplier_id], [quantity_per_package], [unit_of_measure], [description], [image_url], [cost], [quantity_in_stock], [min_allowed_quantity]) VALUES (2, 2, N'Материал 2', NULL, 200, N'л', N'Описание материала 2', N'http://example.com/material2.jpg', CAST(200.75 AS Decimal(10, 2)), 1000, 200)
INSERT [dbo].[Materials] ([material_id], [material_type_id], [material_name], [supplier_id], [quantity_per_package], [unit_of_measure], [description], [image_url], [cost], [quantity_in_stock], [min_allowed_quantity]) VALUES (3, 3, N'Материал 3', NULL, 50, N'шт', N'Описание материала 3', N'http://example.com/material3.jpg', CAST(50.25 AS Decimal(10, 2)), 250, 50)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([material_type_id], [material_type], [defect_rate]) VALUES (1, N'Тип материала 1', CAST(0.0010 AS Decimal(5, 4)))
INSERT [dbo].[MaterialType] ([material_type_id], [material_type], [defect_rate]) VALUES (2, N'Тип материала 2', CAST(0.0095 AS Decimal(5, 4)))
INSERT [dbo].[MaterialType] ([material_type_id], [material_type], [defect_rate]) VALUES (3, N'Тип материала 3', CAST(0.0028 AS Decimal(5, 4)))
INSERT [dbo].[MaterialType] ([material_type_id], [material_type], [defect_rate]) VALUES (4, N'Тип материала 4', CAST(0.0055 AS Decimal(5, 4)))
INSERT [dbo].[MaterialType] ([material_type_id], [material_type], [defect_rate]) VALUES (5, N'Тип материала 5', CAST(0.0034 AS Decimal(5, 4)))
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price], [production_date]) VALUES (1, 1, 1, 10, CAST(4456.90 AS Decimal(10, 2)), CAST(N'2023-01-15' AS Date))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price], [production_date]) VALUES (2, NULL, 2, 20, CAST(7330.99 AS Decimal(10, 2)), CAST(N'2023-02-15' AS Date))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price], [production_date]) VALUES (3, NULL, 3, 5, CAST(1799.33 AS Decimal(10, 2)), CAST(N'2023-03-15' AS Date))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [partner_id], [order_date], [status], [total_cost], [payment_status]) VALUES (1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'В обработке', CAST(10000.50 AS Decimal(10, 2)), N'Не оплачено')
INSERT [dbo].[Orders] ([order_id], [partner_id], [order_date], [status], [total_cost], [payment_status]) VALUES (2, 2, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Выполнен', CAST(20000.75 AS Decimal(10, 2)), N'Оплачено')
INSERT [dbo].[Orders] ([order_id], [partner_id], [order_date], [status], [total_cost], [payment_status]) VALUES (3, 3, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Отменен', CAST(5000.25 AS Decimal(10, 2)), N'Не оплачено')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (1, N'ЗАО', N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 88)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (2, N'ООО', N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (3, N'ПАО', N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (4, N'ОАО', N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (5, N'ЗАО', N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (6, N'ООО', N'4365356', N'543', N'35', N'453', N'3453', NULL, 543)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (7, N'ООО', N'впаа', N'вп', N'354', N'345', N'вап', NULL, 45)
INSERT [dbo].[Partners] ([partner_id], [partner_type], [partner_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (8, N'ЗАО', N'234', N'234', N'243', N'423', N'234', NULL, 4234)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Personnel] ON 

INSERT [dbo].[Personnel] ([personnel_id], [employee_id], [equipment_access]) VALUES (1, 1, N'Доступ ко всему оборудованию')
INSERT [dbo].[Personnel] ([personnel_id], [employee_id], [equipment_access]) VALUES (2, 2, N'Доступ к станкам')
INSERT [dbo].[Personnel] ([personnel_id], [employee_id], [equipment_access]) VALUES (3, 3, N'Доступ к компьютерам')
SET IDENTITY_INSERT [dbo].[Personnel] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_type_id], [product_name], [article], [min_partner_cost]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_type_id], [product_name], [article], [min_partner_cost]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_type_id], [product_name], [article], [min_partner_cost]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_type_id], [product_name], [article], [min_partner_cost]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_type_id], [product_name], [article], [min_partner_cost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([product_type_id], [product_type], [type_coefficient]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[ProductType] ([product_type_id], [product_type], [type_coefficient]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[ProductType] ([product_type_id], [product_type], [type_coefficient]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[ProductType] ([product_type_id], [product_type], [type_coefficient]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesHistory] ON 

INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (2, 1, 3, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (3, 1, 4, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (5, 2, 5, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (6, 2, 3, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (7, 2, 1, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (8, 3, 1, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (9, 3, 2, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (11, 4, 3, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (12, 4, 5, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (13, 5, 3, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (14, 5, 4, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (15, 5, 1, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesHistory] ([sale_id], [partner_id], [product_id], [quantity], [sale_date]) VALUES (16, 5, 2, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SalesHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([supplier_id], [supplier_type], [supplier_name], [inn]) VALUES (1, N'Тип поставщика 1', N'Поставщик 1', N'1234567890')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_type], [supplier_name], [inn]) VALUES (2, N'Тип поставщика 2', N'Поставщик 2', N'0987654321')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_type], [supplier_name], [inn]) VALUES (3, N'Тип поставщика 3', N'Поставщик 3', N'1122334455')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplyHistory] ON 

INSERT [dbo].[SupplyHistory] ([supply_id], [supplier_id], [material_id], [quantity], [supply_date]) VALUES (1, 1, 1, 1000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SupplyHistory] ([supply_id], [supplier_id], [material_id], [quantity], [supply_date]) VALUES (2, 2, 2, 2000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SupplyHistory] ([supply_id], [supplier_id], [material_id], [quantity], [supply_date]) VALUES (3, 3, 3, 500, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SupplyHistory] OFF
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([material_type_id])
REFERENCES [dbo].[MaterialType] ([material_type_id])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__partner___52593CB8] FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([partner_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__partner___52593CB8]
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([product_type_id])
REFERENCES [dbo].[ProductType] ([product_type_id])
GO
ALTER TABLE [dbo].[SalesHistory]  WITH CHECK ADD  CONSTRAINT [FK__SalesHist__partn__5535A963] FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([partner_id])
GO
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK__SalesHist__partn__5535A963]
GO
ALTER TABLE [dbo].[SalesHistory]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[SupplyHistory]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[Materials] ([material_id])
GO
ALTER TABLE [dbo].[SupplyHistory]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[Materials] ([material_id])
GO
USE [master]
GO
ALTER DATABASE [Ospinnikova_Daria_UP2] SET  READ_WRITE 
GO
