/****** Object:  Table [dbo].[Wishlist]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wishlist]') AND type in (N'U'))
DROP TABLE [dbo].[Wishlist]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wishlist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Wishlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGUID] [nvarchar](1000) NULL,
	[ProductID] [int] NULL,
	[Currency] [nvarchar](50) NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Wishlist__3214EC07EACB0C5A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([Id], [CustomerGUID], [ProductID], [Currency], [ProductPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'77ccf824-6c67-4fed-9471-da161350de1c', 2, N'INR', CAST(40000.00 AS Decimal(18, 2)), CAST(N'2020-07-01 09:23:36.563' AS DateTime), CAST(N'2020-07-01 09:23:36.563' AS DateTime))
INSERT [dbo].[Wishlist] ([Id], [CustomerGUID], [ProductID], [Currency], [ProductPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'894622a1-e95b-4b56-ad69-abbe9f452201', 11, N'INR', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2020-07-22 12:21:27.000' AS DateTime), CAST(N'2020-07-22 12:21:27.000' AS DateTime))
INSERT [dbo].[Wishlist] ([Id], [CustomerGUID], [ProductID], [Currency], [ProductPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', 10, N'INR', CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-07-22 12:22:59.000' AS DateTime), CAST(N'2020-07-22 12:22:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
