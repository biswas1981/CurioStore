/****** Object:  Table [dbo].[TaxCategory]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxCategory]') AND type in (N'U'))
DROP TABLE [dbo].[TaxCategory]
GO
/****** Object:  Table [dbo].[TaxCategory]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaxCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaxCategory] [nvarchar](max) NULL,
	[TaxCategoryNumber] [nvarchar](max) NULL,
	[Percentage] [decimal](18, 4) NULL,
	[IsActive] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__TaxCateg__3214EC07E9478A6A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TaxCategory] ON 

INSERT [dbo].[TaxCategory] ([Id], [TaxCategory], [TaxCategoryNumber], [Percentage], [IsActive], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'GST', N'AFAFS548701236', CAST(18.0000 AS Decimal(18, 4)), 1, CAST(N'2020-05-04 16:35:42.343' AS DateTime), CAST(N'2020-05-04 16:43:03.850' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaxCategory] OFF
