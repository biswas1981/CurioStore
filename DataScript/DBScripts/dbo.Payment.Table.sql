/****** Object:  Table [dbo].[Payment]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
DROP TABLE [dbo].[Payment]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](50) NULL,
	[Merchant_Key] [nvarchar](50) NULL,
	[SALT] [nvarchar](50) NULL,
	[BASE_URL] [nvarchar](1000) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK__Payment__3214EC07679A3FB7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [PaymentName], [Merchant_Key], [SALT], [BASE_URL], [CreatedOnUtc], [UpdatedOnUtc], [Status]) VALUES (1, N'PayUMoney', N'15PgXo6C', N'uxpieAp4LX', N'https://sandboxsecure.payu.in', CAST(N'2020-04-05 12:19:38.227' AS DateTime), CAST(N'2020-04-05 12:19:38.227' AS DateTime), N'Active')
SET IDENTITY_INSERT [dbo].[Payment] OFF
