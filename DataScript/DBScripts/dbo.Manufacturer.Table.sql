/****** Object:  Table [dbo].[Manufacturer]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Manufacturer]') AND type in (N'U'))
DROP TABLE [dbo].[Manufacturer]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Manufacturer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](400) NULL,
	[Description] [nvarchar](max) NULL,
	[PictureURL] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[Published] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Manufact__3214EC071D2E1ECD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (1, N'Remington', N'', N'../Images/Manufacturer/Reington.png', 0, 1, 0, CAST(N'2020-04-14 22:09:26.783' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (2, N'Royal', N'', N'../Images/Manufacturer/79eafdccd571408e54d6742ded4827ee.jpg', 1, 1, 0, CAST(N'2020-04-14 22:12:02.137' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (3, N'Brother', N'', N'../Images/Manufacturer/btother.png', 2, 1, 0, CAST(N'2020-05-18 17:29:55.480' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (4, N'Minolta', N'', N'../Images/Manufacturer/Minolta.png', 3, 1, 0, CAST(N'2020-05-18 17:32:56.923' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (5, N'Yashica', N'', N'../Images/Manufacturer/Yashica.png', 4, 1, 0, CAST(N'2020-05-18 17:34:15.827' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (6, N'Kodak', N'', N'../Images/Manufacturer/Kodak.png', 5, 1, 0, CAST(N'2020-05-24 20:16:07.257' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (7, N'Grundig', N'', N'../Images/Manufacturer/Grundig.png', 6, 1, 0, CAST(N'2020-05-24 20:17:39.650' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (8, N'Bolex', N'', N'../Images/Manufacturer/Bolex.png', 7, 1, 0, CAST(N'2020-05-24 20:18:52.710' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (9, N'Agfa', N'', N'../Images/Manufacturer/Agfa.png', 8, 1, 0, CAST(N'2020-05-24 20:20:06.073' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (10, N'Revere', N'', N'../Images/Manufacturer/Revere.png', 9, 1, 0, CAST(N'2020-05-24 20:25:07.217' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (11, N'Sawyers', N'', N'../Images/Manufacturer/Sawyers.jpg', 10, 1, 0, CAST(N'2020-05-24 20:27:36.520' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (12, N'Sankyo', N'', N'../Images/Manufacturer/Sankyo.png', 11, 1, 0, CAST(N'2020-05-24 20:30:21.243' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (13, N'Aiwa', N'', N'../Images/Manufacturer/Aiwa.png', 12, 1, 0, CAST(N'2020-05-24 20:31:24.710' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (14, N'Telefunken', N'', N'../Images/Manufacturer/Telefunken.png', 13, 1, 0, CAST(N'2020-05-24 20:34:43.230' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (15, N'Smith Corona', N'', N'../Images/Manufacturer/Smith Coron.png', 14, 1, 0, CAST(N'2020-05-24 20:37:30.033' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (16, N'Olympia', N'', N'../Images/Manufacturer/Olympia.png', 15, 1, 0, CAST(N'2020-05-24 20:39:18.720' AS DateTime))
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName], [Description], [PictureURL], [DisplayOrder], [Published], [Deleted], [CreatedOnUtc]) VALUES (17, N'Underwood', N'', N'../Images/Manufacturer/Underwood.png', 16, 1, 0, CAST(N'2020-05-24 20:43:37.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
