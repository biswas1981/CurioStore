/****** Object:  Table [dbo].[Product]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](400) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Published] [int] NULL,
	[CP_INR] [decimal](18, 2) NULL,
	[CP_USD] [decimal](18, 2) NULL,
	[CP_Euro] [decimal](18, 2) NULL,
	[CP_GBP] [decimal](18, 2) NULL,
	[OP_INR] [decimal](18, 2) NULL,
	[OP_USD] [decimal](18, 2) NULL,
	[OP_Euro] [decimal](18, 2) NULL,
	[OP_GBP] [decimal](18, 2) NULL,
	[PC_INR] [decimal](18, 2) NULL,
	[PC_USD] [decimal](18, 2) NULL,
	[PC_Euro] [decimal](18, 2) NULL,
	[PC_GBP] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[TaxCategoryId] [int] NULL,
	[OrderMinimumQuantity] [int] NULL,
	[OrderMaximumQuantity] [int] NULL,
	[Stock] [int] NULL,
	[NotReturnable] [int] NULL,
	[IsGiftCard] [int] NULL,
	[IsRental] [int] NULL,
	[MarkAsNew] [int] NULL,
	[CategoryID] [int] NULL,
	[ManufacturerID] [int] NULL,
	[VendorID] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__Product__3214EC071B6CDF2D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Underwood Marathi Typewriter', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">This Underwood Wide Carriage Manual Typewriter from Circa 1940 is a rare piece. A collector&rsquo;s dream it is in unaltered Vintage Condition. It is a working unit, grey in colour with chrome plated trim on three sides.</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">This Underwood Wide Carriage Manual Typewriter from Circa 1940 is a rare piece. A collector&rsquo;s dream it is in unaltered Vintage Condition. It is a working unit, grey in colour with chrome plated trim on three sides.</span></p>', 1, CAST(100000.00 AS Decimal(18, 2)), CAST(1330.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(1060.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(1060.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(1197.00 AS Decimal(18, 2)), CAST(1080.00 AS Decimal(18, 2)), CAST(954.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 0, 0, 0, 0, 0, 16, 1, 1, CAST(N'2020-04-28 19:08:26.157' AS DateTime), CAST(N'2020-07-11 21:46:38.283' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Aga Khan Palace', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Watercolour painting by Sudeep Saini on handmade textured paper 18" x 12"</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Watercolour painting by Sudeep Saini on handmade textured paper 18" x 12"</span></p>', 1, CAST(40000.00 AS Decimal(18, 2)), CAST(528.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)), CAST(428.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)), CAST(428.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(396.00 AS Decimal(18, 2)), CAST(360.00 AS Decimal(18, 2)), CAST(321.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 6, 0, 0, 1, 0, 16, 2, 1, CAST(N'2020-05-08 22:10:13.737' AS DateTime), CAST(N'2020-07-20 15:24:50.363' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Voigtländer Camera Perkeo (6x6)', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">The Perkeo cameras are a series of folding cameras made by Voigtl&auml;nder in the 1950''s for 6&times;6 cm (2&frac14;-inch square) exposures on 120 or 620 film. They are vertical folders (that is, the front door opens sideways in relation to the body, not downward). Their design owes something to the Bessa 66. The cameras all have a small telescopic viewfinder[1] built into the plated metal top housing, and a cold shoe.</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">The Perkeo cameras are a series of folding cameras made by Voigtl&auml;nder in the 1950''s for 6&times;6 cm (2&frac14;-inch square) exposures on 120 or 620 film. They are vertical folders (that is, the front door opens sideways in relation to the body, not downward). Their design owes something to the Bessa 66. The cameras all have a small telescopic viewfinder[1] built into the plated metal top housing, and a cold shoe.</span></p>', 1, CAST(25000.00 AS Decimal(18, 2)), CAST(332.50 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(265.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(265.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(266.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 1, 0, 0, 0, 0, 16, 1, 1, CAST(N'2020-05-08 22:14:13.317' AS DateTime), CAST(N'2020-06-12 18:58:31.330' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Voigtlander Zett 150 Projector', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">This projector was advertised in the 1950''s as &ldquo;the smallest powerful projector in the world. Solid and expertly made&rdquo;. It is a great example of German technology and inventiveness. As the manual says: &ldquo;The Zett 150 is the portable projector for the modern man. It takes only a little space in your brief case and you can conveniently carry it with you to your friends homes, to your club or on a business trip&rdquo;. An amazing display piece!</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">This projector was advertised in the 1950''s as &ldquo;the smallest powerful projector in the world. Solid and expertly made&rdquo;. It is a great example of German technology and inventiveness. As the manual says: &ldquo;The Zett 150 is the portable projector for the modern man. It takes only a little space in your brief case and you can conveniently carry it with you to your friends homes, to your club or on a business trip&rdquo;. An amazing display piece!</span></p>', 1, CAST(20000.00 AS Decimal(18, 2)), CAST(266.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), CAST(199.50 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), CAST(159.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 7, 0, 0, 0, 0, 16, 2, 1, CAST(N'2020-05-09 10:12:33.850' AS DateTime), CAST(N'2020-06-12 18:58:31.327' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'1930 United Kingdom Penny', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">The 1930 UK penny obverse features the bare head of King George V facing left. The surrounding legend: ''GEORGIVS V DEI GRA:BRITT:OMN:REX FID:DEF:IND:IMP:'' Condition: VF</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">The 1930 UK penny obverse features the bare head of King George V facing left. The surrounding legend: ''GEORGIVS V DEI GRA:BRITT:OMN:REX FID:DEF:IND:IMP:'' Condition: VF</span></p>', 1, CAST(1500.00 AS Decimal(18, 2)), CAST(19.80 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(16.05 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(16.05 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(13.20 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(10.70 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 5, 0, 0, 0, 0, 35, 1, 1, CAST(N'2020-05-09 14:04:17.277' AS DateTime), CAST(N'2020-07-11 21:59:37.493' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Bell & Howell 8mm Movie Camera', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Bell &amp; Howell Electric Eye with 3 lens Turret 8mm vintage film movie camera. Comes with original brown leather case from the 1950''s</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Bell &amp; Howell Electric Eye with 3 lens Turret 8mm vintage film movie camera. Comes with original brown leather case from the 1950''s</span></p>', 1, CAST(25000.00 AS Decimal(18, 2)), CAST(332.50 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(265.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(265.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(266.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 4, 0, 0, 0, 0, 16, 4, 1, CAST(N'2020-05-09 14:07:12.303' AS DateTime), CAST(N'2020-06-11 20:06:20.967' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Oil on canvas by Shaila Gorhe', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Nrityavishkar1 20&rdquo; x 24&rdquo; Oil on Canvas</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Nrityavishkar1 20&rdquo; x 24&rdquo; Oil on Canvas</span></p>', 1, CAST(75000.00 AS Decimal(18, 2)), CAST(990.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(802.50 AS Decimal(18, 2)), CAST(75000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(802.50 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)), CAST(924.00 AS Decimal(18, 2)), CAST(840.00 AS Decimal(18, 2)), CAST(749.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 0, 0, 0, 1, 0, 16, 1, 1, CAST(N'2020-05-10 09:29:34.587' AS DateTime), CAST(N'2020-07-14 21:57:57.210' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Teakwood horse bust', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Crafted in teakwood of height - 2 Ft. By Sequeira Fine Art</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Crafted in teakwood of height - 2 Ft. By Sequeira Fine Art</span></p>', 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 0, 10, 0, 0, 1, 0, 42, 9, 1, CAST(N'2020-06-22 16:20:22.090' AS DateTime), CAST(N'2020-07-14 21:57:42.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Kodak Corousal S Slide Projector', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">In 1963, Hans Gugelot and Reinhold H&auml;cker designed the slide projector with the rotatable "Karusell" for Kodak&nbsp;</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">In 1963, Hans Gugelot and Reinhold H&auml;cker designed the slide projector with the rotatable "Karusell" for Kodak . This icon of industrial design is a rarity. Not only is it in my gallery but also in the Museum of Modern Art in New York where it is acknowledged as &ldquo;one of the finest examples of modern design&rdquo; . https://www.nytimes.com/2013/01/21/arts/design/its-a-spaceship-no-its-a-time-machine.html The enduring quality of Gugelot and H&auml;cker&rsquo;s design ensured that the 50-year-old German model does, at least, live on in museum collections, like MoMA and in design history books. The projectors may have been left to gather dust, but the memory of the beautifully subtle Carousel-S is as moving as the images it once brought to life on screen. See also MoMA PS1on https://www.moma.org/collection/works/3342</span></p>', 1, CAST(20000.00 AS Decimal(18, 2)), CAST(264.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(214.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(214.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(132.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(107.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, 5, 0, 0, 0, 0, 27, 6, 1, CAST(N'2020-06-23 10:32:57.000' AS DateTime), CAST(N'2020-07-20 14:28:27.717' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Burma teakwood gothic altar', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Crafted in Burma teakwood of size 4 ft x 3 ft. by Sequeira Fine Art</span></p>', N'<p><span style="color: #555555; font-family: Montserrat, sans-serif;">Crafted in Burma teakwood of size 4 ft x 3 ft. by Sequeira Fine Art</span></p>', 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 10, 0, 0, 1, 0, 41, 15, 1, CAST(N'2020-06-23 12:51:46.303' AS DateTime), CAST(N'2020-07-14 21:58:06.413' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Test', N'<p>Test</p>', N'<p>Test</p>', 1, CAST(5000.00 AS Decimal(18, 2)), CAST(66.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(53.50 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(16.05 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(13.20 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(10.70 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 0, 0, 0, 1, 0, 32, 2, 1, CAST(N'2020-07-02 21:57:40.937' AS DateTime), CAST(N'2020-07-14 21:57:25.023' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1011, N'101 Strings - Gypsy Campfires', N'<p>101 Strings - Gypsy Campfires</p>', N'<p>101 Strings - Gypsy Campfires</p>', 1, CAST(1200.00 AS Decimal(18, 2)), CAST(15.84 AS Decimal(18, 2)), CAST(14.40 AS Decimal(18, 2)), CAST(12.84 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14.40 AS Decimal(18, 2)), CAST(12.84 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(15.84 AS Decimal(18, 2)), CAST(14.40 AS Decimal(18, 2)), CAST(12.84 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 0, 0, 0, 1, 0, 16, 4, 1, CAST(N'2020-07-16 16:53:01.187' AS DateTime), CAST(N'2020-07-20 14:28:36.073' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductName], [ShortDescription], [FullDescription], [Published], [CP_INR], [CP_USD], [CP_Euro], [CP_GBP], [OP_INR], [OP_USD], [OP_Euro], [OP_GBP], [PC_INR], [PC_USD], [PC_Euro], [PC_GBP], [Discount], [TaxCategoryId], [OrderMinimumQuantity], [OrderMaximumQuantity], [Stock], [NotReturnable], [IsGiftCard], [IsRental], [MarkAsNew], [CategoryID], [ManufacturerID], [VendorID], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1012, N'Dark yellow lace cut out swing dress', N'<p><span style="color: #777777; font-family: poppins;">Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.</span></p>', N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-family: poppins; color: #777777;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>
<ul style="box-sizing: border-box; margin: 0px 0px 1.5rem; list-style: none; padding: 0px; color: #333333; font-family: Poppins, sans-serif;">
<li style="box-sizing: border-box; position: relative; padding-left: 1.3rem;">Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>
<li style="box-sizing: border-box; position: relative; padding-left: 1.3rem;">Vivamus finibus vel mauris ut vehicula.</li>
<li style="box-sizing: border-box; position: relative; padding-left: 1.3rem;">Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>
</ul>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-family: poppins; color: #777777;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>', 1, CAST(5880.00 AS Decimal(18, 2)), CAST(77.62 AS Decimal(18, 2)), CAST(70.56 AS Decimal(18, 2)), CAST(62.92 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(53.50 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(59.40 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(48.15 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, 10, 0, 0, 1, 0, 36, 1, 1, CAST(N'2020-07-19 20:21:34.063' AS DateTime), CAST(N'2020-07-19 20:21:34.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
