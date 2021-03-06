/****** Object:  Table [dbo].[ShippingMethod]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingMethod]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingMethod]
GO
/****** Object:  Table [dbo].[ShippingMethod]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingMethod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentMethod] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Shipping__3214EC07A49C9C85] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ShippingMethod] ON 

INSERT [dbo].[ShippingMethod] ([Id], [ShipmentMethod], [Description], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'By Weight', N'This method will be calculated by weights', CAST(N'2020-05-04 18:47:53.787' AS DateTime), CAST(N'2020-05-04 18:52:58.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShippingMethod] OFF
