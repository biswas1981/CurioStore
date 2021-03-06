/****** Object:  Table [dbo].[Coupon]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coupon]') AND type in (N'U'))
DROP TABLE [dbo].[Coupon]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coupon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGUID] [nvarchar](1000) NULL,
	[ProductID] [int] NULL,
	[Coupon] [nvarchar](1000) NULL,
	[Status] [nvarchar](50) NULL,
	[CouponOption] [nvarchar](50) NULL,
	[CouponValue] [decimal](18, 2) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Coupon__3214EC07E76347D3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([Id], [CustomerGUID], [ProductID], [Coupon], [Status], [CouponOption], [CouponValue], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', 4, N'0n2tg4', N'1', N'3', CAST(830.00 AS Decimal(18, 2)), CAST(N'2020-06-10 18:02:10.987' AS DateTime), CAST(N'2020-06-10 22:44:43.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[Coupon] OFF
