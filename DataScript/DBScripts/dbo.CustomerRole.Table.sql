/****** Object:  Table [dbo].[CustomerRole]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerRole]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerRole]
GO
/****** Object:  Table [dbo].[CustomerRole]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerRole](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[FreeShipping] [int] NULL,
	[TaxExempt] [int] NULL,
	[Active] [int] NULL,
	[IsSystemRole] [int] NULL,
	[SystemName] [nvarchar](1000) NULL,
	[EnablePasswordLifetime] [int] NULL,
	[OverrideTaxDisplayType] [int] NULL,
	[DefaultTaxDisplayTypeId] [int] NULL,
	[PurchasedWithProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[CustomerRole] ([Id], [Name], [FreeShipping], [TaxExempt], [Active], [IsSystemRole], [SystemName], [EnablePasswordLifetime], [OverrideTaxDisplayType], [DefaultTaxDisplayTypeId], [PurchasedWithProductId]) VALUES (1, N'Administrators', 0, 0, 1, 1, N'Administrators', 0, 0, 0, 0)
INSERT [dbo].[CustomerRole] ([Id], [Name], [FreeShipping], [TaxExempt], [Active], [IsSystemRole], [SystemName], [EnablePasswordLifetime], [OverrideTaxDisplayType], [DefaultTaxDisplayTypeId], [PurchasedWithProductId]) VALUES (2, N'Forum Moderators', 0, 0, 1, 1, N'ForumModerators', 0, 0, 0, 0)
INSERT [dbo].[CustomerRole] ([Id], [Name], [FreeShipping], [TaxExempt], [Active], [IsSystemRole], [SystemName], [EnablePasswordLifetime], [OverrideTaxDisplayType], [DefaultTaxDisplayTypeId], [PurchasedWithProductId]) VALUES (3, N'Registered', 0, 0, 1, 1, N'Registered', 0, 0, 0, 0)
INSERT [dbo].[CustomerRole] ([Id], [Name], [FreeShipping], [TaxExempt], [Active], [IsSystemRole], [SystemName], [EnablePasswordLifetime], [OverrideTaxDisplayType], [DefaultTaxDisplayTypeId], [PurchasedWithProductId]) VALUES (4, N'Guests', 0, 0, 1, 1, N'Guests', 0, 0, 0, 0)
INSERT [dbo].[CustomerRole] ([Id], [Name], [FreeShipping], [TaxExempt], [Active], [IsSystemRole], [SystemName], [EnablePasswordLifetime], [OverrideTaxDisplayType], [DefaultTaxDisplayTypeId], [PurchasedWithProductId]) VALUES (5, N'Vendors', 0, 0, 1, 1, N'Vendors', 0, 0, 0, 0)
