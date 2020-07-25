/****** Object:  StoredProcedure [dbo].[sp_Dashboard]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Dashboard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Dashboard]
GO
/****** Object:  StoredProcedure [dbo].[sp_Dashboard]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Dashboard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Dashboard] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Dashboard] 
AS
Select * From Product
GO;
GO
