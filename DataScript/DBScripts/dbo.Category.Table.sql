/****** Object:  Table [dbo].[Category]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentCategoryId] [int] NULL,
	[PictureUrl] [nvarchar](max) NULL,
	[Published] [int] NULL,
	[Deleted] [int] NULL,
	[Display_Order] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[TempPID] [nvarchar](max) NULL,
 CONSTRAINT [PK__Category__3214EC07567008BA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (16, N'Vintage', N'<p>Vintage</p>', 0, N'../Images/Categories/vintage.jpg', 1, 0, 0, NULL, CAST(N'2020-04-15 20:12:55.383' AS DateTime), N'Vintage')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (26, N'Projectors', N'<p><span style="color: #2e2e2e; font-family: ''Source Sans Pro'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #f4f4f4;">Projectors&nbsp;</span></p>', 16, N'../Images/Categories/Projector.jpg', 1, 0, 1, NULL, CAST(N'2020-04-15 20:13:45.320' AS DateTime), N'Vintage > Projectors')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (27, N'Slide Projectors', N'<p><span style="color: #2e2e2e; font-family: ''Source Sans Pro'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #f4f4f4;">Slide Projectors</span></p>', 26, N'../Images/Categories/sideprojector.jpg', 1, 0, 2, NULL, CAST(N'2020-04-15 21:31:06.653' AS DateTime), N'Vintage > Projectors > Slide Projectors')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (28, N'Slim Projectors', N'<p><span style="color: #2e2e2e; font-family: ''Source Sans Pro'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #f4f4f4;">Film Projectors</span></p>', 26, N'../Images/Categories/Filmprojejctor.jpg', 1, 0, 3, NULL, CAST(N'2020-04-15 21:31:33.203' AS DateTime), N'Vintage > Projectors > Slim Projectors')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (29, N'Typewriters', N'<p><span style="color: #2e2e2e; font-family: ''Source Sans Pro'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #f4f4f4;">Typewriters</span></p>', 16, N'../Images/Categories/typewritter.jpg', 1, 0, 5, CAST(N'2020-04-15 21:20:37.877' AS DateTime), CAST(N'2020-04-15 21:20:37.100' AS DateTime), N'Vintage > Typewriters')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (30, N'Music', N'', 16, N'../Images/Categories/adrian-korte-5gn2soeAc40-unsplash.jpg', 1, 0, 6, CAST(N'2020-05-24 19:43:38.863' AS DateTime), CAST(N'2020-05-24 19:43:38.863' AS DateTime), N'Vintage > Music')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (31, N'Vinyl Records', N'', 30, N'../Images/Categories/adrian-korte-5gn2soeAc40-unsplash.jpg', 1, 0, 7, CAST(N'2020-05-24 19:45:07.310' AS DateTime), CAST(N'2020-05-24 19:45:07.310' AS DateTime), N'Vintage > Music > Vinyl Records')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (32, N'Players', N'', 30, N'../Images/Categories/victrola-record-players-tPnamdFNf5k-unsplash.jpg', 1, 0, 8, CAST(N'2020-05-24 19:46:02.967' AS DateTime), CAST(N'2020-05-24 19:46:02.967' AS DateTime), N'Vintage > Music > Players')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (33, N'Film Cameras', N'', 16, N'../Images/Categories/daniel-jerico-vacviL9Hy_I-unsplash.jpg', 1, 0, 9, CAST(N'2020-05-24 19:47:12.777' AS DateTime), CAST(N'2020-05-24 19:47:12.777' AS DateTime), N'Vintage > Film Cameras')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (34, N'Coins', N'', 16, N'../Images/Categories/michael-longmire-3Mu0iQgLQto-unsplash.jpg', 1, 0, 10, CAST(N'2020-05-24 19:48:01.107' AS DateTime), CAST(N'2020-05-24 19:48:01.107' AS DateTime), N'Vintage > Coins')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (35, N'Bank Notes', N'', 16, N'../Images/Categories/ishant-mishra-hDHt5F9X7l0-unsplash.jpg', 1, 0, 11, CAST(N'2020-05-24 19:49:21.583' AS DateTime), CAST(N'2020-05-24 19:49:21.583' AS DateTime), N'Vintage >  Bank Notes')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (36, N'Fine Arts', N'', 0, N'../Images/Categories/jr-korpa-A7OBevOU088-unsplash.jpg', 1, 0, 12, CAST(N'2020-05-24 19:50:19.433' AS DateTime), CAST(N'2020-05-24 19:50:19.433' AS DateTime), N'Fine arts')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (37, N'Original paintings', N'', 36, N'../Images/Categories/nika-akin-jGGu3tI85EE-unsplash.jpg', 1, 0, 13, CAST(N'2020-05-24 19:51:03.020' AS DateTime), CAST(N'2020-05-24 19:51:03.020' AS DateTime), N'Fine arts > Original paintings')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (38, N'Oil', N'', 37, N'../Images/Categories/europeana-_iVTRQStm8E-unsplash.jpg', 1, 0, 14, CAST(N'2020-05-24 19:51:54.907' AS DateTime), CAST(N'2020-05-24 19:51:54.907' AS DateTime), N'Fine arts > Original paintings > Oil')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (39, N'Acrylic', N'', 37, N'../Images/Categories/pawel-czerwinski-yn97LNy0bao-unsplash.jpg', 1, 0, 15, CAST(N'2020-05-24 19:52:45.420' AS DateTime), CAST(N'2020-05-24 19:52:45.420' AS DateTime), N'Fine arts > Original paintings > Acrylic')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (40, N'Watercolour', N'', 37, N'../Images/Categories/europeana-MzgH8QtPJbg-unsplash.jpg', 1, 0, 16, CAST(N'2020-05-24 19:53:41.197' AS DateTime), CAST(N'2020-05-24 19:53:41.197' AS DateTime), N'Fine arts > Original paintings > Watercolour')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (41, N'Others', N'', 37, N'../Images/Categories/crystal-de-passille-chabot-TTwwVG4Isjw-unsplash.jpg', 1, 0, 17, CAST(N'2020-05-24 19:54:32.163' AS DateTime), CAST(N'2020-05-24 19:54:32.163' AS DateTime), N'Fine arts > Original paintings > Others')
INSERT [dbo].[Category] ([Id], [Name], [Description], [ParentCategoryId], [PictureUrl], [Published], [Deleted], [Display_Order], [CreatedOnUtc], [UpdatedOnUtc], [TempPID]) VALUES (42, N'Limited edition prints', N'', 36, N'../Images/Categories/birmingham-museums-trust-gicORd8AWXc-unsplash.jpg', 1, 0, 18, CAST(N'2020-05-24 19:55:16.127' AS DateTime), CAST(N'2020-05-24 19:55:16.127' AS DateTime), N'Fine arts > Limited edition prints')
SET IDENTITY_INSERT [dbo].[Category] OFF
