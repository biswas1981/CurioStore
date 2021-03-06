/****** Object:  Table [dbo].[Customer_CustomerRole_Mapping]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_CustomerRole_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[Customer_CustomerRole_Mapping]
GO
/****** Object:  Table [dbo].[Customer_CustomerRole_Mapping]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_CustomerRole_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer_CustomerRole_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [int] NULL,
	[CustomerRole_Id] [int] NULL,
 CONSTRAINT [PK__Customer__3214EC0723AC2661] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Customer_CustomerRole_Mapping] ON 

INSERT [dbo].[Customer_CustomerRole_Mapping] ([Id], [Customer_Id], [CustomerRole_Id]) VALUES (3, 1, 1)
INSERT [dbo].[Customer_CustomerRole_Mapping] ([Id], [Customer_Id], [CustomerRole_Id]) VALUES (4, 4, 3)
INSERT [dbo].[Customer_CustomerRole_Mapping] ([Id], [Customer_Id], [CustomerRole_Id]) VALUES (6, 2, 1)
INSERT [dbo].[Customer_CustomerRole_Mapping] ([Id], [Customer_Id], [CustomerRole_Id]) VALUES (7, 5, 3)
SET IDENTITY_INSERT [dbo].[Customer_CustomerRole_Mapping] OFF
