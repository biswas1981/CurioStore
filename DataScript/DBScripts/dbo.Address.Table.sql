/****** Object:  Table [dbo].[Address]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGUID] [uniqueidentifier] NULL,
	[FirstName] [nvarchar](1000) NULL,
	[LastName] [nvarchar](1000) NULL,
	[CompanyName] [nvarchar](1000) NULL,
	[Country] [nvarchar](1000) NULL,
	[StreetAddress1] [nvarchar](max) NULL,
	[StreetAddress2] [nvarchar](max) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Address__3214EC077E67D8AA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [CustomerGUID], [FirstName], [LastName], [CompanyName], [Country], [StreetAddress1], [StreetAddress2], [City], [State], [ZipCode], [Status], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', N'Anindya', N'Chatterjee', N'', N'India', N'Flat 903, B3, Kumar Park Infinia, Fursungi,', N'Bhekrai Nagar', N'Pune', N'MAHARASHTRA', N'412308', 1, CAST(N'2020-05-31 17:24:28.740' AS DateTime), CAST(N'2020-05-31 17:24:28.740' AS DateTime))
INSERT [dbo].[Address] ([Id], [CustomerGUID], [FirstName], [LastName], [CompanyName], [Country], [StreetAddress1], [StreetAddress2], [City], [State], [ZipCode], [Status], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'66058376-8f6d-4906-8444-61b38080537e', N'Sunder Rao', N'Swarna', N'', N'India', N'B/138, Survey Park, Santoshpur', N'Kolkata 700075, West Bengal', N'Kolkata', N'West Bengal', N'700075', 1, CAST(N'2020-07-20 20:17:53.757' AS DateTime), CAST(N'2020-07-20 20:17:53.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[Address] OFF
