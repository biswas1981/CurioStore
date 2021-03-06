/****** Object:  Table [dbo].[CustomerAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAttribute]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerAttribute]
GO
/****** Object:  Table [dbo].[CustomerAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAttribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [uniqueidentifier] NULL CONSTRAINT [DF__CustomerA__Custo__17036CC0]  DEFAULT (newsequentialid()),
	[Customer_Name] [nvarchar](1000) NULL,
	[Customer_Email] [nvarchar](1000) NULL,
	[Customer_Phone] [nvarchar](1000) NULL,
	[Customer_Address] [nvarchar](max) NULL,
	[Customer_Address2] [nvarchar](max) NULL,
	[Customer_Zip] [nvarchar](50) NULL,
	[OTP_Verified] [int] NULL,
	[Customer_Active] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Created_By] [nvarchar](1000) NULL,
	[Modified_Date] [datetime] NULL,
	[Modified_By] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Customer__3214EC0793631544] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[CustomerAttribute] ON 

INSERT [dbo].[CustomerAttribute] ([Id], [Customer_Id], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [Customer_Address2], [Customer_Zip], [OTP_Verified], [Customer_Active], [Created_Date], [Created_By], [Modified_Date], [Modified_By]) VALUES (1, N'7fba3969-82f8-4113-ae98-b94909254237', N'Admin', N'anindya.chatterjee4@gmail.com', N'8308848923', N'', N'', N'', 1, 1, CAST(N'2020-04-01 13:34:15.930' AS DateTime), N'System Admin', CAST(N'2020-04-01 13:34:16.423' AS DateTime), N'System Admin')
INSERT [dbo].[CustomerAttribute] ([Id], [Customer_Id], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [Customer_Address2], [Customer_Zip], [OTP_Verified], [Customer_Active], [Created_Date], [Created_By], [Modified_Date], [Modified_By]) VALUES (3, N'f2da5110-b7cb-4ee6-a23b-1d798abd3860', N'Anindya Chatterjee', N'anindya.chatterjee4@gmail.com', N'8308848923', N'', N'', N'', 1, 1, CAST(N'2020-05-14 12:47:35.047' AS DateTime), N'System Admin', CAST(N'2020-05-14 12:47:35.847' AS DateTime), N'System Admin')
INSERT [dbo].[CustomerAttribute] ([Id], [Customer_Id], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [Customer_Address2], [Customer_Zip], [OTP_Verified], [Customer_Active], [Created_Date], [Created_By], [Modified_Date], [Modified_By]) VALUES (4, N'66058376-8f6d-4906-8444-61b38080537e', N'Sunder Rao', N'sdsrao@gmail.com', N'Swarna', N'', N'', N'', 1, 1, CAST(N'2020-07-20 16:18:35.823' AS DateTime), N'System Admin', CAST(N'2020-07-20 16:18:35.823' AS DateTime), N'System Admin')
SET IDENTITY_INSERT [dbo].[CustomerAttribute] OFF
