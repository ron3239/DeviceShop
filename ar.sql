CREATE [DeviceShop]
GO
USE [DeviceShop]
GO

/****** Object:  Table [dbo].[Accessories]    Script Date: 26.03.2025 11:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Accessories](
	[AccessoriesId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Length] [nchar](50) NULL,
	[Count] [int] NOT NULL,
	[TypeMaterialId] [int] NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

