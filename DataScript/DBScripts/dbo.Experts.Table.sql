/****** Object:  Table [dbo].[Experts]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Experts]') AND type in (N'U'))
DROP TABLE [dbo].[Experts]
GO
/****** Object:  Table [dbo].[Experts]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Experts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Experts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](50) NULL,
	[Title] [nvarchar](max) NULL,
	[Expert] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Since] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NULL,
	[ExpertImage] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Experts__3214EC0781C1F1C3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Experts] ON 

INSERT [dbo].[Experts] ([Id], [Heading], [Title], [Expert], [Description], [Since], [Email], [Location], [ExpertImage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Swapnil', N'Hi, I''m Swapnil and my Dad Namdeo Kharatmal', N'Vinyls & Turntable Curators', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">The pleasure Vinyl Records give, cannot be overstated. A turntable playing a vinyl record of your choice fills the room with warm sound and takes the listeners on a nostalgic trip.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">This is what prompted us to enter the world of vintage vinyls and turntables.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">In his youth, my father had a record player, and the fond memories associated with the music remained with him. The player has long since been scrapped. But his dream was to own a record player and listen to his collection of vinyls.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">I presented my father a turntable for his birthday. Thus began our collection &hellip;.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">We started looking for more turntables/records and collected more than 40 turntables which we&nbsp;restored to their original state.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">We have been pursuing this hobby for more than 15 years now and are thrilled with what we discover each day.&nbsp;</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">Contact us for anything regrading vinyls and turntables; we are happy to help.</span></p>', N'Year 2004', N'swapnil@curio.gallery ', N'Pune, India', N'../Web/assets/images/Experts/swapnil.jpg', CAST(N'2020-05-22 14:40:47.220' AS DateTime), CAST(N'2020-05-22 14:40:47.220' AS DateTime))
INSERT [dbo].[Experts] ([Id], [Heading], [Title], [Expert], [Description], [Since], [Email], [Location], [ExpertImage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Aditi', N'Hi I''m Aditi', N'Indian & international coins', N'<p><span style="color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;">Hello! I&rsquo;m&nbsp;Aditi Dubey Lee. I''m a Writer, Social Entrepreneur and Designer. Passionate about history, crafts and cultures. My writing experiences include extensive research on coinage and their history. In my free time, I can be found drinking a lot of chai and creating art.</span></p>', N'Year 2000', N'aditi@curio.gallery', N'Mumbai, India', N'../Web/assets/images/Experts/aditi.jpeg', CAST(N'2020-05-22 14:51:26.390' AS DateTime), CAST(N'2020-05-22 14:51:26.390' AS DateTime))
INSERT [dbo].[Experts] ([Id], [Heading], [Title], [Expert], [Description], [Since], [Email], [Location], [ExpertImage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Mohan', N'Hi I''m Mohan', N'Typewriter Curator', N'<p><span style="color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;">Hello! I&rsquo;m Maohan Kanade.&nbsp;The whirring of typewriter keys and the ping of the bell still continues, its been my passion and profession.</span></p>', N'Year 1950', N'mohan@curio.gallery', N'Pune, India', N'../Web/assets/images/Experts/unnamed.jpg', CAST(N'2020-05-22 14:52:14.087' AS DateTime), CAST(N'2020-05-22 14:52:14.087' AS DateTime))
INSERT [dbo].[Experts] ([Id], [Heading], [Title], [Expert], [Description], [Since], [Email], [Location], [ExpertImage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Sudeep', N'Hi I''m Sudeep', N'Restorer Designer & Archivist', N'<p><span style="color: #333333; font-family: Montserrat, sans-serif; font-size: 14px;">Hello! I&rsquo;m&nbsp;Sudeep Saini. I''m an Artist, Art Curator &amp; Restorer Designer &amp; Archivist. I have completed RESTORATION &amp; CONSERVATION SPECIALIZATION at LORENZO DE MEDICI INSTITUTE, FLORENCE, ITALY</span></p>', N'Year 2000', N'sudeep@curio.gallery', N'Mumbai, India', N'../Web/assets/images/Experts/Sudeep.jpg', CAST(N'2020-05-22 14:53:09.787' AS DateTime), CAST(N'2020-05-22 14:53:09.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[Experts] OFF
