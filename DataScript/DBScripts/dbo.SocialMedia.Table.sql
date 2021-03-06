/****** Object:  Table [dbo].[SocialMedia]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SocialMedia]') AND type in (N'U'))
DROP TABLE [dbo].[SocialMedia]
GO
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SocialMedia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SocialMedia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Facebook] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Youtube] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
	[LogoURL] [nvarchar](max) NULL,
 CONSTRAINT [PK__SocialMe__3214EC07DB3F4B20] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SocialMedia] ON 

INSERT [dbo].[SocialMedia] ([Id], [Facebook], [Twitter], [Youtube], [Instagram], [LogoURL]) VALUES (2, N'https://www.facebook.com/CURIOGALLERY/', N'https://twitter.com/collectablesgallore', N'http://www.youtube.com/user/collectablesgallore', N'https://plus.google.com/+collectablesgallore', N'E:\SunderWebsite\Curio\Curio\Curio\CommonFiles\new_logo.png')
SET IDENTITY_INSERT [dbo].[SocialMedia] OFF
