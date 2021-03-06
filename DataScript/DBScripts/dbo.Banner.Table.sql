/****** Object:  Table [dbo].[Banner]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banner]') AND type in (N'U'))
DROP TABLE [dbo].[Banner]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banner]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BannerURL] [nvarchar](max) NULL,
	[Sequences] [int] NULL,
	[BannerText] [nvarchar](max) NULL,
	[BannerLink] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Banner__3214EC07A92D6487] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([Id], [BannerURL], [Sequences], [BannerText], [BannerLink], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'../Images/Banners/banner-1.jpg', 0, N'Vinyl Records', N'https://www.google.com/', CAST(N'2020-05-07 19:28:11.007' AS DateTime), CAST(N'2020-05-07 19:28:11.007' AS DateTime))
INSERT [dbo].[Banner] ([Id], [BannerURL], [Sequences], [BannerText], [BannerLink], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'../Images/Banners/banner-2.jpg', 1, N'Typewriter', N'https://www.google.com/', CAST(N'2020-05-07 19:28:46.467' AS DateTime), CAST(N'2020-05-07 19:28:46.467' AS DateTime))
INSERT [dbo].[Banner] ([Id], [BannerURL], [Sequences], [BannerText], [BannerLink], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'../Images/Banners/banner-3.jpg', 2, N'Slide Projector', N'https://www.google.com/', CAST(N'2020-05-07 19:29:45.703' AS DateTime), CAST(N'2020-05-07 19:29:45.703' AS DateTime))
INSERT [dbo].[Banner] ([Id], [BannerURL], [Sequences], [BannerText], [BannerLink], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'../Images/Banners/banner-4.jpg', 3, N'Old Bank Notes', N'https://www.google.com/', CAST(N'2020-05-07 19:31:27.833' AS DateTime), CAST(N'2020-05-07 19:31:27.833' AS DateTime))
INSERT [dbo].[Banner] ([Id], [BannerURL], [Sequences], [BannerText], [BannerLink], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'../Images/Banners/banner-5.jpg', 4, N'Oil Painting', N'https://www.google.com/', CAST(N'2020-05-07 19:32:21.947' AS DateTime), CAST(N'2020-05-07 21:01:01.073' AS DateTime))
SET IDENTITY_INSERT [dbo].[Banner] OFF
