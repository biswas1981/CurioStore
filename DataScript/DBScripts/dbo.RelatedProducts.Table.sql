/****** Object:  Table [dbo].[RelatedProducts]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelatedProducts]') AND type in (N'U'))
DROP TABLE [dbo].[RelatedProducts]
GO
/****** Object:  Table [dbo].[RelatedProducts]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelatedProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RelatedProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__RelatedP__3214EC07458850A4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[RelatedProducts] ON 

INSERT [dbo].[RelatedProducts] ([Id], [ProductID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, 1, CAST(N'2020-05-03 21:54:44.417' AS DateTime), CAST(N'2020-05-03 21:54:44.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[RelatedProducts] OFF
