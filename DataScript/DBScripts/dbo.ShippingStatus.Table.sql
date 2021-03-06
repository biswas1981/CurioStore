/****** Object:  Table [dbo].[ShippingStatus]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingStatus]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingStatus]
GO
/****** Object:  Table [dbo].[ShippingStatus]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nchar](50) NULL
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ShippingStatus] ON 

INSERT [dbo].[ShippingStatus] ([Id], [Status]) VALUES (1, N'Ordered                                           ')
INSERT [dbo].[ShippingStatus] ([Id], [Status]) VALUES (2, N'In Transit                                        ')
INSERT [dbo].[ShippingStatus] ([Id], [Status]) VALUES (3, N'Pick Up                                           ')
INSERT [dbo].[ShippingStatus] ([Id], [Status]) VALUES (4, N'Delivered                                         ')
INSERT [dbo].[ShippingStatus] ([Id], [Status]) VALUES (5, N'Delivery Failed                                   ')
SET IDENTITY_INSERT [dbo].[ShippingStatus] OFF
