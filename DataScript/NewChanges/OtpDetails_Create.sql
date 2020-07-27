

/****** Object:  Table [dbo].[OtpDetails]    Script Date: 27-07-2020 14:32:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OtpDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RefCustomerGuid] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[OTP] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[Prupose] [nvarchar](50) NULL,
 CONSTRAINT [PK_OtpDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


