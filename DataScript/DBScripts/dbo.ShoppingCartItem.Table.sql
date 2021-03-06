/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartItem]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCartItem]
GO
/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShoppingCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [uniqueidentifier] NULL CONSTRAINT [DF__ShoppingC__Custo__54CB950F]  DEFAULT (newsequentialid()),
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Currency] [nchar](10) NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[RevisedPrice] [decimal](18, 2) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Shopping__3214EC07955A49FA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ShoppingCartItem] ON 

INSERT [dbo].[ShoppingCartItem] ([Id], [Customer_Id], [ProductId], [Quantity], [Currency], [ProductPrice], [RevisedPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1032, N'7fba3969-82f8-4113-ae98-b94909254237', 5, 1, N'INR       ', CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-06-10 23:17:10.047' AS DateTime), CAST(N'2020-06-10 23:17:10.047' AS DateTime))
INSERT [dbo].[ShoppingCartItem] ([Id], [Customer_Id], [ProductId], [Quantity], [Currency], [ProductPrice], [RevisedPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2069, N'2d460cc4-4d61-4288-8250-2a39ef666cc6', 10, 1, N'INR       ', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-07-12 22:07:46.797' AS DateTime), CAST(N'2020-07-12 22:07:46.983' AS DateTime))
INSERT [dbo].[ShoppingCartItem] ([Id], [Customer_Id], [ProductId], [Quantity], [Currency], [ProductPrice], [RevisedPrice], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3081, N'66058376-8f6d-4906-8444-61b38080537e', 2, 1, N'INR       ', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-07-20 20:10:16.303' AS DateTime), CAST(N'2020-07-20 20:10:16.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShoppingCartItem] OFF
