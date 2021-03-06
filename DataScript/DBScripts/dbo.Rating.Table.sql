/****** Object:  Table [dbo].[Rating]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rating]') AND type in (N'U'))
DROP TABLE [dbo].[Rating]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/25/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rating]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomerName] [nvarchar](1000) NULL,
	[Rating] [float] NULL,
	[ReviewTitle] [nvarchar](100) NULL,
	[Review] [nvarchar](1000) NULL,
	[LikeCount] [int] NULL,
	[DislikeCount] [int] NULL,
	[ReviewStatus] [int] NULL,
	[CreatedOnUTC] [datetime] NULL,
 CONSTRAINT [PK__Rating__3214EC07D3FBEC82] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [ProductID], [CustomerName], [Rating], [ReviewTitle], [Review], [LikeCount], [DislikeCount], [ReviewStatus], [CreatedOnUTC]) VALUES (1, 8, N'Guest', 2.5, N'', N'', 0, 0, 1, CAST(N'2020-06-27 12:56:03.530' AS DateTime))
INSERT [dbo].[Rating] ([Id], [ProductID], [CustomerName], [Rating], [ReviewTitle], [Review], [LikeCount], [DislikeCount], [ReviewStatus], [CreatedOnUTC]) VALUES (3, 8, N'Anindya Chatterjee', 4.5, N'Good, perfect size', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cum dolores assumenda asperiores facilis porro reprehenderit animi culpa atque blanditiis commodi perspiciatis doloremque, possimus, explicabo, autem fugit beatae quae voluptas!', 2, 1, 1, CAST(N'2020-06-27 13:12:43.347' AS DateTime))
INSERT [dbo].[Rating] ([Id], [ProductID], [CustomerName], [Rating], [ReviewTitle], [Review], [LikeCount], [DislikeCount], [ReviewStatus], [CreatedOnUTC]) VALUES (4, 10, N'Anindya Chatterjee', 3.5, N'Nice Wood Quality', N'This awesome ', 0, 0, 1, CAST(N'2020-06-30 16:45:13.210' AS DateTime))
INSERT [dbo].[Rating] ([Id], [ProductID], [CustomerName], [Rating], [ReviewTitle], [Review], [LikeCount], [DislikeCount], [ReviewStatus], [CreatedOnUTC]) VALUES (5, 1011, N'Anindya Chatterjee', 4.5, N'Nice Colors', N'Beautiful 4 K image with bright color combination', 0, 0, 1, CAST(N'2020-07-19 10:02:03.117' AS DateTime))
INSERT [dbo].[Rating] ([Id], [ProductID], [CustomerName], [Rating], [ReviewTitle], [Review], [LikeCount], [DislikeCount], [ReviewStatus], [CreatedOnUTC]) VALUES (6, 11, N'', 3.5, N'', N'', 0, 0, 1, CAST(N'2020-07-19 17:19:09.590' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
