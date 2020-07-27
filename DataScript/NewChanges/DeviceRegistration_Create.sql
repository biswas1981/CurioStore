
/****** Object:  Table [dbo].[DeviceRegistration]    Script Date: 26-07-2020 09:27:13 ******/

/* Keep Device with its token and user information  */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[DeviceRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IMEI_Number] [nvarchar](100) NOT NULL,
	[AccessToken] [nvarchar](500) NOT NULL,
	[RefreshToken] [nvarchar](500) NOT NULL,
	[ExpiryTime] [datetime] NOT NULL,
	[RefCustomerGuid] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_DeviceRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


