/****** Object:  Table [dbo].[CategoryTable]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryTable]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryTable]
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryTable](
	[CategoryId] [int] NULL,
	[CateGoryName] [varchar](200) NULL,
	[ParentCategoryId] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CategoryTable] ([CategoryId], [CateGoryName], [ParentCategoryId]) VALUES (1, N'Desktop', 0)
INSERT [dbo].[CategoryTable] ([CategoryId], [CateGoryName], [ParentCategoryId]) VALUES (2, N'PC', 1)
INSERT [dbo].[CategoryTable] ([CategoryId], [CateGoryName], [ParentCategoryId]) VALUES (3, N'Mac', 1)
INSERT [dbo].[CategoryTable] ([CategoryId], [CateGoryName], [ParentCategoryId]) VALUES (4, N'pc1', 2)
INSERT [dbo].[CategoryTable] ([CategoryId], [CateGoryName], [ParentCategoryId]) VALUES (5, N'mac1', 3)
