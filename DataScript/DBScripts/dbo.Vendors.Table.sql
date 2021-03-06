/****** Object:  Table [dbo].[Vendors]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendors]') AND type in (N'U'))
DROP TABLE [dbo].[Vendors]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [nvarchar](400) NULL,
	[VendorEmail] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[PictureURL] [nvarchar](max) NULL,
	[VendorAddress] [nvarchar](max) NULL,
	[Active] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Vendors__3214EC07C82C80F9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([Id], [VendorName], [VendorEmail], [Description], [PictureURL], [VendorAddress], [Active], [Deleted], [CreatedOnUtc]) VALUES (1, N'Curio', N'admin@curio.gallery', N'', N'../Images/Vendors/1536666931_gmail.jpeg', N'<p>Pune, India</p>', 1, 0, CAST(N'2020-04-14 21:30:02.973' AS DateTime))
INSERT [dbo].[Vendors] ([Id], [VendorName], [VendorEmail], [Description], [PictureURL], [VendorAddress], [Active], [Deleted], [CreatedOnUtc]) VALUES (2, N'Sudeep Saini', N'sudeep@curio.gallery', N'', N'../Images/Vendors/Sudeep.jpeg', N'<p>Pune, India</p>', 1, 0, CAST(N'2020-04-14 21:37:13.183' AS DateTime))
INSERT [dbo].[Vendors] ([Id], [VendorName], [VendorEmail], [Description], [PictureURL], [VendorAddress], [Active], [Deleted], [CreatedOnUtc]) VALUES (3, N'Shaila Gorhe', N'shaila@curio.gallery', NULL, N'../Images/Vendors/1536666931_gmail.jpeg', N'<p>Pune, India</p>', 1, 0, CAST(N'2020-04-14 21:37:13.183' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vendors] OFF
