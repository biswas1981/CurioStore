/****** Object:  Table [dbo].[OrderShipment]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderShipment]') AND type in (N'U'))
DROP TABLE [dbo].[OrderShipment]
GO
/****** Object:  Table [dbo].[OrderShipment]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderShipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderShipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](1000) NULL,
	[ProductID] [int] NULL,
	[Ordered] [int] NULL,
	[OrderDate] [datetime] NULL,
	[PickUp] [int] NULL,
	[PickUpDate] [datetime] NULL,
	[InTransit] [int] NULL,
	[InTransitDate] [datetime] NULL,
	[Delivered] [int] NULL,
	[DeliveredDate] [datetime] NULL,
	[DeliveryFailed] [int] NULL,
	[DeliveryFailedDate] [datetime] NULL,
 CONSTRAINT [PK__OrderShi__3214EC07178B4AB5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OrderShipment] ON 

INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (1, N'18ecaffe-8c0c-48ab-ab11-ac4e48741ccf', 4, 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (2, N'18ecaffe-8c0c-48ab-ab11-ac4e48741ccf', 5, 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (3, N'18ecaffe-8c0c-48ab-ab11-ac4e48741ccf', 3, 1, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime), 0, CAST(N'2020-06-12 18:58:31.297' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (4, N'01671587-a444-4199-a1bf-fd54e3870c5f', 9, 1, CAST(N'2020-07-12 20:19:46.557' AS DateTime), 0, CAST(N'2020-07-12 20:19:46.557' AS DateTime), 0, CAST(N'2020-07-12 20:19:46.557' AS DateTime), 0, CAST(N'2020-07-12 20:19:46.557' AS DateTime), 0, CAST(N'2020-07-12 20:19:46.557' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (5, N'854f7b4f-9a45-4690-889a-8697136bbd88', 9, 1, CAST(N'2020-07-20 14:28:20.323' AS DateTime), 1, CAST(N'2020-07-20 14:28:20.323' AS DateTime), 0, CAST(N'2020-07-20 14:28:20.323' AS DateTime), 0, CAST(N'2020-07-20 14:28:20.323' AS DateTime), 0, CAST(N'2020-07-20 14:28:20.323' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (6, N'854f7b4f-9a45-4690-889a-8697136bbd88', 1011, 1, CAST(N'2020-07-20 14:28:31.840' AS DateTime), 0, CAST(N'2020-07-20 14:28:31.840' AS DateTime), 0, CAST(N'2020-07-20 14:28:31.840' AS DateTime), 0, CAST(N'2020-07-20 14:28:31.840' AS DateTime), 0, CAST(N'2020-07-20 14:28:31.840' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (7, N'f642626b-e8d1-4f0f-be7d-9cb768793da7', 2, 1, CAST(N'2020-07-20 15:24:16.270' AS DateTime), 0, CAST(N'2020-07-20 15:24:16.270' AS DateTime), 0, CAST(N'2020-07-20 15:24:16.270' AS DateTime), 0, CAST(N'2020-07-20 15:24:16.270' AS DateTime), 0, CAST(N'2020-07-20 15:24:16.270' AS DateTime))
INSERT [dbo].[OrderShipment] ([Id], [OrderID], [ProductID], [Ordered], [OrderDate], [PickUp], [PickUpDate], [InTransit], [InTransitDate], [Delivered], [DeliveredDate], [DeliveryFailed], [DeliveryFailedDate]) VALUES (8, N'8f153771-4886-4fde-b265-366c4a1fcadf', 2, 1, CAST(N'2020-07-20 15:24:50.357' AS DateTime), 1, CAST(N'2020-07-20 15:24:50.357' AS DateTime), 1, CAST(N'2020-07-20 15:24:50.357' AS DateTime), 1, CAST(N'2020-07-20 15:24:50.357' AS DateTime), 0, CAST(N'2020-07-20 15:24:50.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderShipment] OFF
