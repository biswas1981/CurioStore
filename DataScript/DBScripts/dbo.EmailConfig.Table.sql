/****** Object:  Table [dbo].[EmailConfig]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailConfig]') AND type in (N'U'))
DROP TABLE [dbo].[EmailConfig]
GO
/****** Object:  Table [dbo].[EmailConfig]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Host] [nvarchar](max) NULL,
	[Port] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[SendEmailTo] [nvarchar](max) NULL,
 CONSTRAINT [PK__EmailCon__3214EC07D690E9AC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EmailConfig] ON 

INSERT [dbo].[EmailConfig] ([Id], [EmailAddress], [DisplayName], [Host], [Port], [UserName], [Password], [SendEmailTo]) VALUES (1, N'anindya.chatterjee4@gmail.com', N'Anindya Chatterjee', N'smtp.gmail.com', N'587', N'anindya.chatterjee4', N'ca2FceFPuIYpBW0RiYyGZw==', N'anindya.chatterjee4@gmail.com')
SET IDENTITY_INSERT [dbo].[EmailConfig] OFF
