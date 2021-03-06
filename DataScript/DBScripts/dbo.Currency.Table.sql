/****** Object:  Table [dbo].[Currency]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currency]') AND type in (N'U'))
DROP TABLE [dbo].[Currency]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[Rate] [decimal](18, 4) NULL,
	[DisplayLocale] [nvarchar](50) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Currency__3214EC07A64A8BAB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Name], [CurrencyCode], [Rate], [DisplayLocale], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Indian Rupee', N'INR', CAST(1.0000 AS Decimal(18, 4)), N'en-IN', CAST(N'2020-04-03 22:07:00.407' AS DateTime), CAST(N'2020-06-01 12:04:24.547' AS DateTime))
INSERT [dbo].[Currency] ([Id], [Name], [CurrencyCode], [Rate], [DisplayLocale], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'US Dollar', N'USD', CAST(0.0132 AS Decimal(18, 4)), N'en-US', CAST(N'2020-04-03 22:44:17.030' AS DateTime), CAST(N'2020-06-01 12:04:26.917' AS DateTime))
INSERT [dbo].[Currency] ([Id], [Name], [CurrencyCode], [Rate], [DisplayLocale], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Euro', N'EUR', CAST(0.0120 AS Decimal(18, 4)), N'en-eu', CAST(N'2020-04-03 22:47:13.820' AS DateTime), CAST(N'2020-06-01 12:04:44.240' AS DateTime))
INSERT [dbo].[Currency] ([Id], [Name], [CurrencyCode], [Rate], [DisplayLocale], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'British Pound', N'GBP', CAST(0.0107 AS Decimal(18, 4)), N'en-GB', CAST(N'2020-04-04 22:09:55.843' AS DateTime), CAST(N'2020-06-01 12:04:29.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[Currency] OFF
