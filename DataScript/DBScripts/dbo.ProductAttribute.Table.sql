/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
DROP TABLE [dbo].[ProductAttribute]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductInformation] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK__ProductA__3214EC07C1033E42] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProductAttribute] ON 

INSERT [dbo].[ProductAttribute] ([Id], [ProductID], [ProductDescription], [ProductInformation], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, 2, N'<p><span style="color: #111111; font-family: ''Amazon Ember'', Arial, sans-serif; font-size: 13px; text-align: justify;">AC input 100-240V for worldwide compatibility. Over voltage/ Over current protection. High temperature protection, Low ripple operating noise, high gloss Casing.NOTE: Please check your laptop model no. before purchasing: This is only compatible with 13" MB-Pro without HD display and MB-Unibody (Mid 2010 and Late 2009). NOT COMPATIBLE WITH: MB-Air 11/13 and MB-Pro With HD Display. WORKS WITH: MB Pro (13-inch, Mid 2012), MB Pro (13-inch, Late 2011), MB Pro (13-inch, Early 2011), MB Pro (13-inch, Mid 2010), MB unibody (13-inch, Mid 2010), MB unibody (13-inch, Late 2009), Unibody MB (Mid 2010), Unibody MB (Late 2009).&nbsp;</span><span class="a-text-bold" style="box-sizing: border-box; color: #111111; font-family: ''Amazon Ember'', Arial, sans-serif; font-size: 13px; text-align: justify; font-weight: 700 !important;"><u style="box-sizing: border-box;">NOT COMPATIBLE WITH: MB Air 11/13 and MB Pro With HD Display</u></span></p>', N'<table style="border-collapse: collapse; width: 605px; table-layout: fixed; color: #333333; font-family: Arial; font-size: 12px; margin-bottom: 0px !important;" border="0" cellspacing="0" cellpadding="0">
<tbody style="box-sizing: border-box;">
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Brand</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">Artis</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Model</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">AR-60W-MG1</td>
</tr>
<tr class="size-weight" style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Item Weight</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px;">249 g</td>
</tr>
<tr class="size-weight" style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Product Dimensions</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px;">6.5 x 2.5 x 6.5 cm</td>
</tr>
<tr class="item-model-number" style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Item model number</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px;">AR-60W-MG1</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Compatible Devices</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">Laptops</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Included Components</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">Compatible Laptop Adapter</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Wattage</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">60 Watts</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Batteries Included</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">No</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Batteries Required</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">No</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Material</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">Non-Recyled Virgin Plastic</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Has Auto Focus</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">No</td>
</tr>
<tr style="box-sizing: border-box;">
<td class="label" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; color: #666666; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; background-color: #f5f5f5; width: 211px;">Programmable Buttons</td>
<td class="value" style="box-sizing: border-box; vertical-align: top; padding: 3px 1px 3px 10px; font-family: Arial; font-size: 12px; border-top: 1px dotted #cccccc; line-height: 18px; word-break: break-word;">No</td>
</tr>
</tbody>
</table>', CAST(N'2020-05-03 18:23:51.233' AS DateTime), CAST(N'2020-05-03 18:23:51.343' AS DateTime))
INSERT [dbo].[ProductAttribute] ([Id], [ProductID], [ProductDescription], [ProductInformation], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, 9, N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #999999; font-family: Montserrat, sans-serif;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 11pt;">Kodak Corousal S Slide Projector with Projar, ISCO G&ouml;ttingen 100 mm lens in fully working condition.</span></em></p>
<table style="border-spacing: 0px; border-collapse: collapse; color: #999999; font-family: Montserrat, sans-serif;" width="615">
<tbody style="box-sizing: border-box;">
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Year</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">1963</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Item weight</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">-</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Product dimensions</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">6 x 11 1/4 x 10 5/8" (15.2 x 28.6 x 27 cm)</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Colour</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">Light &amp; dark grey</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Material type</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">Painted aluminum and plastic</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Number of items</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">1</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Cosmetic condition</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">This item is in fair condition.&nbsp;has usage marks. See photos</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Working condition</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">Yes</p>
</td>
</tr>
<tr style="box-sizing: border-box;">
<td style="box-sizing: border-box; padding: 0px;" width="160">
<p style="box-sizing: border-box; margin: 0px 0px 10px;"><span style="box-sizing: border-box; font-weight: bold;">Package includes</span></p>
</td>
<td style="box-sizing: border-box; padding: 0px;" width="455">
<p style="box-sizing: border-box; margin: 0px 0px 10px;">1.&nbsp;Power cable<br style="box-sizing: border-box;" />2. Projector with corousel</p>
</td>
</tr>
</tbody>
</table>', N'', CAST(N'2020-06-23 10:33:45.537' AS DateTime), CAST(N'2020-06-23 10:33:45.537' AS DateTime))
INSERT [dbo].[ProductAttribute] ([Id], [ProductID], [ProductDescription], [ProductInformation], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, 10, N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #999999; font-family: Montserrat, sans-serif;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 12pt;">The current size shown in the picture is&nbsp;4 ft x 3 ft.</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #999999; font-family: Montserrat, sans-serif;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-family: georgia, palatino; font-size: 12pt;">Customized sizes available.<br style="box-sizing: border-box;" /><br style="box-sizing: border-box;" />Available in teakwood or Rosewood.</span></em></p>', N'', CAST(N'2020-06-23 12:52:24.093' AS DateTime), CAST(N'2020-06-23 12:52:24.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
