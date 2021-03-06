/****** Object:  Table [dbo].[Customer]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGuid] [uniqueidentifier] NULL,
	[Username] [nvarchar](1000) NULL,
	[Email] [nvarchar](1000) NULL,
	[EmailToRevalidate] [nvarchar](1000) NULL,
	[AdminComment] [nvarchar](1000) NULL,
	[IsTaxExempt] [int] NULL,
	[AffiliateId] [int] NULL,
	[VendorId] [int] NULL,
	[HasShoppingCartItems] [int] NULL,
	[RequireReLogin] [int] NULL,
	[FailedLoginAttempts] [int] NULL,
	[CannotLoginUntilDateUtc] [datetime] NULL,
	[Active] [int] NULL,
	[Deleted] [int] NULL,
	[IsSystemAccount] [int] NULL,
	[SystemName] [nvarchar](1000) NULL,
	[LastIpAddress] [nvarchar](1000) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[LastLoginDateUtc] [datetime] NULL,
	[LastActivityDateUtc] [datetime] NULL,
	[RegisteredInStoreId] [int] NULL,
	[BillingAddress_Id] [int] NULL,
	[ShippingAddress_Id] [int] NULL,
 CONSTRAINT [PK__Customer__3214EC07B3AD5B9D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CustomerGuid], [Username], [Email], [EmailToRevalidate], [AdminComment], [IsTaxExempt], [AffiliateId], [VendorId], [HasShoppingCartItems], [RequireReLogin], [FailedLoginAttempts], [CannotLoginUntilDateUtc], [Active], [Deleted], [IsSystemAccount], [SystemName], [LastIpAddress], [CreatedOnUtc], [LastLoginDateUtc], [LastActivityDateUtc], [RegisteredInStoreId], [BillingAddress_Id], [ShippingAddress_Id]) VALUES (2, N'7fba3969-82f8-4113-ae98-b94909254237', N'admin', N'anindya.chatterjee4@gmail.com', N'', N'', 0, 0, 0, 0, 0, 0, CAST(N'2020-03-31 00:00:00.000' AS DateTime), 1, 0, 0, N'', N'192.168.31.88', CAST(N'2020-04-01 13:34:04.680' AS DateTime), CAST(N'2020-04-01 13:34:04.680' AS DateTime), CAST(N'2020-04-01 13:34:04.683' AS DateTime), 1, 1, 1)
INSERT [dbo].[Customer] ([Id], [CustomerGuid], [Username], [Email], [EmailToRevalidate], [AdminComment], [IsTaxExempt], [AffiliateId], [VendorId], [HasShoppingCartItems], [RequireReLogin], [FailedLoginAttempts], [CannotLoginUntilDateUtc], [Active], [Deleted], [IsSystemAccount], [SystemName], [LastIpAddress], [CreatedOnUtc], [LastLoginDateUtc], [LastActivityDateUtc], [RegisteredInStoreId], [BillingAddress_Id], [ShippingAddress_Id]) VALUES (4, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', N'anindya.chatterjee4@gmail.com', N'anindya.chatterjee4@gmail.com', N'', N'', 0, 0, 0, 0, 0, 0, CAST(N'2020-05-13 00:00:00.000' AS DateTime), 1, 0, 0, N'', N'192.168.31.88', CAST(N'2020-05-14 12:47:08.123' AS DateTime), CAST(N'2020-05-14 12:47:09.233' AS DateTime), CAST(N'2020-05-14 12:47:10.427' AS DateTime), 1, 1, 1)
INSERT [dbo].[Customer] ([Id], [CustomerGuid], [Username], [Email], [EmailToRevalidate], [AdminComment], [IsTaxExempt], [AffiliateId], [VendorId], [HasShoppingCartItems], [RequireReLogin], [FailedLoginAttempts], [CannotLoginUntilDateUtc], [Active], [Deleted], [IsSystemAccount], [SystemName], [LastIpAddress], [CreatedOnUtc], [LastLoginDateUtc], [LastActivityDateUtc], [RegisteredInStoreId], [BillingAddress_Id], [ShippingAddress_Id]) VALUES (5, N'66058376-8f6d-4906-8444-61b38080537e', N'sdsrao@gmail.com', N'sdsrao@gmail.com', N'', N'', 0, 0, 0, 0, 0, 0, CAST(N'2020-07-19 00:00:00.000' AS DateTime), 1, 0, 0, N'', N'192.168.31.88', CAST(N'2020-07-20 16:18:35.723' AS DateTime), CAST(N'2020-07-20 16:18:35.723' AS DateTime), CAST(N'2020-07-20 16:18:35.723' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
