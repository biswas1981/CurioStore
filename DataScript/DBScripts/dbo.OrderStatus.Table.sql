/****** Object:  Table [dbo].[OrderStatus]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderStatus]') AND type in (N'U'))
DROP TABLE [dbo].[OrderStatus]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nchar](20) NULL,
	[Description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (1, N'Pending payment     ', N'Order received, no payment initiated. Awaiting payment (unpaid).')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (2, N'Failed              ', N'Payment failed or was declined (unpaid) or requires authentication (SCA). Note that this status may not show immediately and instead show as Pending until verified')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (3, N'Processing          ', N'Payment received (paid) and stock has been reduced; order is awaiting fulfillment. ')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (4, N'Completed           ', N'Order fulfilled and complete – requires no further action')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (5, N'On hold             ', N'Awaiting payment – stock is reduced, but you need to confirm payment.')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (6, N'Canceled            ', N'Canceled by an admin or the customer – stock is increased, no further action required.')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (7, N'Refunded            ', N'Refunded by an admin – no further action required.')
INSERT [dbo].[OrderStatus] ([Id], [OrderStatus], [Description]) VALUES (9, N'Non-Authenticated   ', N'Awaiting action by the customer to authenticate the transaction and/or complete SCA requirements')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
