/****** Object:  Table [dbo].[CustomerPassword]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPassword]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerPassword]
GO
/****** Object:  Table [dbo].[CustomerPassword]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPassword]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerPassword](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NULL CONSTRAINT [DF__CustomerP__Custo__236943A5]  DEFAULT (newsequentialid()),
	[Password] [nvarchar](1000) NULL,
	[PasswordFormatId] [int] NULL,
	[PasswordSalt] [nvarchar](50) NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Customer__3214EC071D28FB31] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[CustomerPassword] ON 

INSERT [dbo].[CustomerPassword] ([Id], [CustomerId], [Password], [PasswordFormatId], [PasswordSalt], [CreatedOnUtc]) VALUES (1, N'7fba3969-82f8-4113-ae98-b94909254237', N'UD2+7kWeLuAcRvZOvUOsXQ==', 1, N'F7p4fL8=', CAST(N'2020-04-01 13:34:09.343' AS DateTime))
INSERT [dbo].[CustomerPassword] ([Id], [CustomerId], [Password], [PasswordFormatId], [PasswordSalt], [CreatedOnUtc]) VALUES (3, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', N'ca2FceFPuIYpBW0RiYyGZw==', 1, N'F7p4fL8=', CAST(N'2020-05-14 12:47:30.337' AS DateTime))
INSERT [dbo].[CustomerPassword] ([Id], [CustomerId], [Password], [PasswordFormatId], [PasswordSalt], [CreatedOnUtc]) VALUES (4, N'66058376-8f6d-4906-8444-61b38080537e', N'xQcrRMMxDc4=', 1, N'F7p4fL8=', CAST(N'2020-07-20 16:18:35.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerPassword] OFF
