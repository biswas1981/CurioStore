/****** Object:  Table [dbo].[Enquiry]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enquiry]') AND type in (N'U'))
DROP TABLE [dbo].[Enquiry]
GO
/****** Object:  Table [dbo].[Enquiry]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enquiry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enquiry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomerName] [nvarchar](1000) NULL,
	[CustomerAddress] [nvarchar](1000) NULL,
	[Phone] [nvarchar](20) NULL,
	[EmailID] [nvarchar](100) NULL,
	[Action] [nvarchar](100) NULL,
	[CreatedOnUTC] [datetime] NULL,
 CONSTRAINT [PK__Enquiry__3214EC07587A0583] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Enquiry] ON 

INSERT [dbo].[Enquiry] ([Id], [ProductID], [CustomerName], [CustomerAddress], [Phone], [EmailID], [Action], [CreatedOnUTC]) VALUES (1, 8, N'Anindya Chatterjee', N'Flat 903, B3, Kumar Park Infinia, Fursungi, Bhekrai Nagar', N'08308848923', N'anindya.chatterjee4@gmail.com', N'Enquired', CAST(N'2020-06-24 18:01:11.867' AS DateTime))
SET IDENTITY_INSERT [dbo].[Enquiry] OFF
