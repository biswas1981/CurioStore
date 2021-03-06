/****** Object:  Table [dbo].[ProductTier]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTier]') AND type in (N'U'))
DROP TABLE [dbo].[ProductTier]
GO
/****** Object:  Table [dbo].[ProductTier]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductTier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [nvarchar](400) NULL,
	[Price] [decimal](18, 4) NULL,
	[Price_USD] [decimal](18, 2) NULL,
	[Price_EURO] [decimal](18, 2) NULL,
	[Price_GBP] [decimal](18, 2) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__ProductT__3214EC07725B4E27] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProductTier] ON 

INSERT [dbo].[ProductTier] ([Id], [ProductID], [Quantity], [Price], [Price_USD], [Price_EURO], [Price_GBP], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, 1, N'300 gm', CAST(750.0000 AS Decimal(18, 4)), CAST(9.83 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(7.88 AS Decimal(18, 2)), CAST(N'2020-04-29 20:57:45.257' AS DateTime), CAST(N'2020-04-29 20:57:45.257' AS DateTime))
INSERT [dbo].[ProductTier] ([Id], [ProductID], [Quantity], [Price], [Price_USD], [Price_EURO], [Price_GBP], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, 1, N'500 gm', CAST(150.0000 AS Decimal(18, 4)), CAST(1.97 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.58 AS Decimal(18, 2)), CAST(N'2020-04-29 20:09:54.873' AS DateTime), CAST(N'2020-04-29 20:09:54.873' AS DateTime))
INSERT [dbo].[ProductTier] ([Id], [ProductID], [Quantity], [Price], [Price_USD], [Price_EURO], [Price_GBP], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, 1, N'770 gm', CAST(250.0000 AS Decimal(18, 4)), CAST(3.28 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(2.63 AS Decimal(18, 2)), CAST(N'2020-05-03 20:28:41.783' AS DateTime), CAST(N'2020-05-03 20:47:56.313' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductTier] OFF
