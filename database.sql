USE [DeviceShop]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Article]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Details]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Entrance]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Gost]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[TypeDetails]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[TypeMaterial]    Script Date: 09.04.2025 16:30:43 ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 09.04.2025 16:30:43 ******/
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
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Unit1] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Unit1]
GO
ALTER TABLE [dbo].[Entrance]  WITH CHECK ADD  CONSTRAINT [FK_Entrance_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[Entrance] CHECK CONSTRAINT [FK_Entrance_Contract]
GO
