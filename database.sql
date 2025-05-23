USE [DeviceShop]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 16.04.2025 1:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoriesId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Length] [int] NULL,
	[Count] [int] NOT NULL,
	[TypeMaterialId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractId] [int] IDENTITY(1,1) NOT NULL,
	[DateContract] [date] NULL,
	[NameProvider] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[DetailsId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Count] [float] NOT NULL,
	[UnitId] [int] NOT NULL,
	[TypeDetailsId] [int] NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[GostId] [int] NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[DetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrance]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrance](
	[EntranceId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[ContractId] [int] NULL,
	[NameItem] [nvarchar](100) NULL,
	[Count] [int] NULL,
	[CostOne] [int] NULL,
	[CostTotal] [int] NULL,
 CONSTRAINT [PK_Entrance] PRIMARY KEY CLUSTERED 
(
	[EntranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SerialNumber] [nvarchar](50) NULL,
	[InstallationDate] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentFailure]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentFailure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[FailureReasonId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[Notes] [nvarchar](1000) NULL,
	[ReportedBy] [nvarchar](100) NULL,
	[FixedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FailureReason]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FailureReason](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gost]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gost](
	[GostId] [int] IDENTITY(1,1) NOT NULL,
	[GostName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gost] PRIMARY KEY CLUSTERED 
(
	[GostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCharacteristics]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCharacteristics](
	[CharacteristicId] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Unit] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductCharacteristics] PRIMARY KEY CLUSTERED 
(
	[CharacteristicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[UnitId] [int] NOT NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificationComponents]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationComponents](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationId] [int] NOT NULL,
	[AccessoriesId] [int] NULL,
	[DetailsId] [int] NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SpecificationComponents] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificationOperations]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationOperations](
	[OperationId] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationId] [int] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_SpecificationOperations] PRIMARY KEY CLUSTERED 
(
	[OperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[SpecificationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED 
(
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDetails]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDetails](
	[TypeDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[TypeDetailsName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_TypeDetails] PRIMARY KEY CLUSTERED 
(
	[TypeDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMaterial]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaterial](
	[TypeMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[TypeMaterialName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeMaterial] PRIMARY KEY CLUSTERED 
(
	[TypeMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 16.04.2025 1:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (3, 21, N'MSI MAG B550 TOMAHAWK AM4', 3, 300, 1, 6, CAST(3112.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (5, 13, N'16Gb 3200MHz Kingston HyperX Fury 2x8Gb KIT', 3, NULL, 1, 7, CAST(7947.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (6, 14, N'DDR4 Corsair 8Gb 2133MHz', 3, NULL, 1, 7, CAST(4032.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (7, 20, N'2Tb SATA-III Western Digital Red', 3, NULL, 1, 4, CAST(6959.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (8, 15, N'PCcooler GI-D56A HALO RGB', 3, 151, 1, 5, CAST(2953.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (9, 16, N'DeepCool Gammaxx L360 V2', 3, 120, 1, 3, CAST(6347.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (11, 12, N'6-32 UNC с полукруглой головкой Phillips
', 3, 282, 1, 3, CAST(24000.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (12, 19, N'Intel Core i7 8700K OEM Coffee Lake 1151v2', 3, NULL, 1, 8, CAST(28990.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoriesId], [ArticleId], [Name], [UnitId], [Length], [Count], [TypeMaterialId], [Price]) VALUES (13, 17, N'1200W Corsair HX1200i', 3, 140, 1, 1, CAST(22697.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Accessories] OFF
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (1, N'BP02')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (2, N'D012')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (3, N'D63')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (4, N'FM10FZ')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (5, N'FS01PB')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (6, N'FS1054AA')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (7, N'G226V')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (8, N'M6X90')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (9, N'PN 84')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (10, N'V6313')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (11, N'WI')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (12, N'В3')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (13, N'Д29')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (14, N'Д35')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (15, N'З187')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (16, N'З195')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (17, N'З197')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (18, N'з245')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (19, N'И14')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (20, N'И50')
INSERT [dbo].[Article] ([ArticleId], [ArticleName]) VALUES (21, N'М12')
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (1, CAST(N'2023-01-10' AS Date), N'ООО "Компьютерные системы"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (2, CAST(N'2023-02-15' AS Date), N'АО "ЭлектронКомплект"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (3, CAST(N'2023-03-20' AS Date), N'ЗАО "ТехноПоставка"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (4, CAST(N'2023-04-05' AS Date), N'ИП Иванов А.В. (Компьютерные компоненты)')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (5, CAST(N'2023-05-12' AS Date), N'ООО "ДельтаТехнологии"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (6, CAST(N'2023-06-18' AS Date), N'ООО "Хардверные решения"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (7, CAST(N'2023-07-22' AS Date), N'АО "Кремниевые технологии"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (8, CAST(N'2023-08-30' AS Date), N'ИП Петрова С.М. (Комплектующие)')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (9, CAST(N'2022-11-15' AS Date), N'ООО "Старые поставщики"')
INSERT [dbo].[Contract] ([ContractId], [DateContract], [NameProvider]) VALUES (10, CAST(N'2022-09-10' AS Date), N'ЗАО "Бывшие партнеры"')
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (1, 9, N'6-32 UNC с полукруглой головкой Phillips', 1018, 3, 1, CAST(120.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (2, 10, N'Zalman Thermal Grease ZM-STC7', 4, 1, 4, CAST(440.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (3, 8, N'6-32 UNC с шестигранной головкой с фланцем', 1336, 3, 2, CAST(500.99 AS Decimal(6, 2)), 8)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (4, 1, N'4-40 UNC', 2063, 3, 1, CAST(499.99 AS Decimal(6, 2)), 4)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (5, 2, N'6-32 × 6,5 + 4 мм для материнской платы', 1, 3, 3, CAST(40.00 AS Decimal(6, 2)), 1)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (6, 4, N'16 KB5 x 10 мм для вентиляторов', 2789, 3, 1, CAST(9.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (7, 6, N'9 standoff 6-32 × 6,5 + 4 мм для материнской платы', 1640, 3, 1, CAST(30.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (8, 5, N'M3 × 5 мм для жесткого диска 2,5 дюйма', 12, 3, 2, CAST(2.94 AS Decimal(6, 2)), 3)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (9, 3, N'6-32 × 6 мм для блока питания', 4, 2, 1, CAST(500.00 AS Decimal(6, 2)), 5)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (10, 11, N'6-32 × 6 мм для лотка для дисков 2,5 дюйма', 7, 2, 1, CAST(28.77 AS Decimal(6, 2)), 6)
INSERT [dbo].[Details] ([DetailsId], [ArticleId], [Name], [Count], [UnitId], [TypeDetailsId], [Price], [GostId]) VALUES (13, 7, N'DeepCool Z3
', 1.4, 1, 4, CAST(1040.00 AS Decimal(6, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (4, N'Конвейерная линия сборки ПК', N'Автоматизированная линия для сборки компьютеров', N'ASSM-2023-001', CAST(N'2023-01-15' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (5, N'Тестовая станция №1', N'Стенд для стресс-тестирования готовой продукции', N'TEST-2023-105', CAST(N'2023-02-10' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (6, N'Паяльная станция Weller', N'Профессиональная станция для монтажа/демонтажа компонентов', N'SOLD-2022-045', CAST(N'2022-11-20' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (7, N'Упаковочный автомат', N'Автомат для упаковки готовой продукции в коробки', N'PACK-2023-012', CAST(N'2023-03-05' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (8, N'Сервер хранения данных', N'Хранилище производственной документации и баз данных', N'SRV-2023-101', CAST(N'2023-04-01' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (9, N'Резервный сервер', N'Дублирующий сервер на случай аварии', N'SRV-BKP-101', CAST(N'2023-04-15' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (10, N'ИБП Eaton 9PX', N'Источник бесперебойного питания для критичного оборудования', N'UPS-2023-205', CAST(N'2023-05-10' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (11, N'Система вентиляции цеха', N'Централизованная система охлаждения производства', N'VENT-2022-301', CAST(N'2022-10-01' AS Date), 1)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (12, N'Принтер этикеток Zebra', N'Промышленный принтер для печати этикеток', N'PRN-2021-087', CAST(N'2021-08-15' AS Date), 0)
INSERT [dbo].[Equipment] ([Id], [Name], [Description], [SerialNumber], [InstallationDate], [IsActive]) VALUES (13, N'Сканер штрих-кодов', N'Стационарный сканер для учета комплектующих', N'SCN-2022-033', CAST(N'2022-09-10' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipmentFailure] ON 

INSERT [dbo].[EquipmentFailure] ([Id], [EquipmentId], [FailureReasonId], [StartTime], [EndTime], [Notes], [ReportedBy], [FixedBy]) VALUES (1, 5, 9, CAST(N'2025-04-15T23:45:00.000' AS DateTime), NULL, N'йцуйцуйуйц', N'jook3', NULL)
INSERT [dbo].[EquipmentFailure] ([Id], [EquipmentId], [FailureReasonId], [StartTime], [EndTime], [Notes], [ReportedBy], [FixedBy]) VALUES (2, 11, 12, CAST(N'2025-04-15T23:50:00.000' AS DateTime), CAST(N'2025-04-15T23:50:39.150' AS DateTime), N'2343', N'jook3', N'jook3')
SET IDENTITY_INSERT [dbo].[EquipmentFailure] OFF
GO
SET IDENTITY_INSERT [dbo].[FailureReason] ON 

INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (7, N'Короткое замыкание в цепи', N'Электрическая', 1)
INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (8, N'Перегорел предохранитель', N'Электрическая', 1)
INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (9, N'Нестабильное напряжение питания', N'Электрическая', 1)
INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (10, N'Выход из строя блока питания', N'Электрическая', 1)
INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (12, N'Деформация механических частей', N'Механическая', 1)
INSERT [dbo].[FailureReason] ([Id], [Description], [Category], [IsActive]) VALUES (13, N'Сбой прошивки устройства', N'Программная', 1)
SET IDENTITY_INSERT [dbo].[FailureReason] OFF
GO
SET IDENTITY_INSERT [dbo].[Gost] ON 

INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (1, N'ГОСТ 16093-2004')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (2, N'ГОСТ 1759.0-87')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (3, N'ГОСТ 24705-2004')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (4, N'ГОСТ 6357-81')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (5, N'ГОСТ 7798-70')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (6, N'ГОСТ 7798-71')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (7, N'ГОСТ 9.032-74')
INSERT [dbo].[Gost] ([GostId], [GostName]) VALUES (8, N'ГОСТ Р 55739-2013')
SET IDENTITY_INSERT [dbo].[Gost] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [UnitId], [Price]) VALUES (1, N'Игровой компьютер', N'Компьютер на базе Intel Core i7', 3, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [UnitId], [Price]) VALUES (2, N'Офисный компьютер', N'Компьютер для офисных задач', 3, CAST(85000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeDetails] ON 

INSERT [dbo].[TypeDetails] ([TypeDetailsId], [TypeDetailsName]) VALUES (1, N'Винт                                              ')
INSERT [dbo].[TypeDetails] ([TypeDetailsId], [TypeDetailsName]) VALUES (2, N'Крестообразный винт                               ')
INSERT [dbo].[TypeDetails] ([TypeDetailsId], [TypeDetailsName]) VALUES (3, N'Позиционирующая стойка                            ')
INSERT [dbo].[TypeDetails] ([TypeDetailsId], [TypeDetailsName]) VALUES (4, N'Термопаста                                        ')
SET IDENTITY_INSERT [dbo].[TypeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMaterial] ON 

INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (1, N'Блок питания')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (2, N'Видеокарта')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (3, N'Водяная система охлаждения')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (4, N'Жесткий диск')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (5, N'Кулер')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (6, N'Материнская плата')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (7, N'Оперативная память')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (8, N'Процессор')
INSERT [dbo].[TypeMaterial] ([TypeMaterialId], [TypeMaterialName]) VALUES (9, N'Твердотельные диски SSD')
SET IDENTITY_INSERT [dbo].[TypeMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (1, N'г')
INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (2, N'упак')
INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (3, N'шт')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
/****** Object:  Index [UC_Specifications_ProductId]    Script Date: 16.04.2025 1:29:51 ******/
ALTER TABLE [dbo].[Specifications] ADD  CONSTRAINT [UC_Specifications_ProductId] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipment] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FailureReason] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Specifications] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Specifications] ADD  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleId])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Article]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_TypeMaterial] FOREIGN KEY([TypeMaterialId])
REFERENCES [dbo].[TypeMaterial] ([TypeMaterialId])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_TypeMaterial]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Unit]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleId])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Article]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Gost] FOREIGN KEY([GostId])
REFERENCES [dbo].[Gost] ([GostId])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Gost]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_TypeDetails] FOREIGN KEY([TypeDetailsId])
REFERENCES [dbo].[TypeDetails] ([TypeDetailsId])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_TypeDetails]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Unit]
GO
ALTER TABLE [dbo].[Entrance]  WITH CHECK ADD  CONSTRAINT [FK_Entrance_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[Entrance] CHECK CONSTRAINT [FK_Entrance_Contract]
GO
ALTER TABLE [dbo].[EquipmentFailure]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentFailure_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipment] ([Id])
GO
ALTER TABLE [dbo].[EquipmentFailure] CHECK CONSTRAINT [FK_EquipmentFailure_Equipment]
GO
ALTER TABLE [dbo].[EquipmentFailure]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentFailure_FailureReason] FOREIGN KEY([FailureReasonId])
REFERENCES [dbo].[FailureReason] ([Id])
GO
ALTER TABLE [dbo].[EquipmentFailure] CHECK CONSTRAINT [FK_EquipmentFailure_FailureReason]
GO
ALTER TABLE [dbo].[ProductCharacteristics]  WITH CHECK ADD  CONSTRAINT [FK_ProductCharacteristics_Specifications] FOREIGN KEY([SpecificationId])
REFERENCES [dbo].[Specifications] ([SpecificationId])
GO
ALTER TABLE [dbo].[ProductCharacteristics] CHECK CONSTRAINT [FK_ProductCharacteristics_Specifications]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Unit]
GO
ALTER TABLE [dbo].[SpecificationComponents]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationComponents_Accessories] FOREIGN KEY([AccessoriesId])
REFERENCES [dbo].[Accessories] ([AccessoriesId])
GO
ALTER TABLE [dbo].[SpecificationComponents] CHECK CONSTRAINT [FK_SpecificationComponents_Accessories]
GO
ALTER TABLE [dbo].[SpecificationComponents]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationComponents_Details] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[Details] ([DetailsId])
GO
ALTER TABLE [dbo].[SpecificationComponents] CHECK CONSTRAINT [FK_SpecificationComponents_Details]
GO
ALTER TABLE [dbo].[SpecificationComponents]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationComponents_Specifications] FOREIGN KEY([SpecificationId])
REFERENCES [dbo].[Specifications] ([SpecificationId])
GO
ALTER TABLE [dbo].[SpecificationComponents] CHECK CONSTRAINT [FK_SpecificationComponents_Specifications]
GO
ALTER TABLE [dbo].[SpecificationOperations]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationOperations_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipment] ([Id])
GO
ALTER TABLE [dbo].[SpecificationOperations] CHECK CONSTRAINT [FK_SpecificationOperations_Equipment]
GO
ALTER TABLE [dbo].[SpecificationOperations]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationOperations_Specifications] FOREIGN KEY([SpecificationId])
REFERENCES [dbo].[Specifications] ([SpecificationId])
GO
ALTER TABLE [dbo].[SpecificationOperations] CHECK CONSTRAINT [FK_SpecificationOperations_Specifications]
GO
ALTER TABLE [dbo].[Specifications]  WITH CHECK ADD  CONSTRAINT [FK_Specifications_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Specifications] CHECK CONSTRAINT [FK_Specifications_Products]
GO
ALTER TABLE [dbo].[SpecificationComponents]  WITH CHECK ADD  CONSTRAINT [CK_SpecificationComponents_Reference] CHECK  (([AccessoriesId] IS NOT NULL AND [DetailsId] IS NULL OR [AccessoriesId] IS NULL AND [DetailsId] IS NOT NULL))
GO
ALTER TABLE [dbo].[SpecificationComponents] CHECK CONSTRAINT [CK_SpecificationComponents_Reference]
GO
