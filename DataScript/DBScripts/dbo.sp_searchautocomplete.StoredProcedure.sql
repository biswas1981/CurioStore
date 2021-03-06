/****** Object:  StoredProcedure [dbo].[sp_searchautocomplete]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_searchautocomplete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_searchautocomplete]
GO
/****** Object:  StoredProcedure [dbo].[sp_searchautocomplete]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_searchautocomplete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_searchautocomplete] AS' 
END
GO
ALTER Procedure [dbo].[sp_searchautocomplete] 
@ProductName nvarchar(50)
AS
BEGIN
	Select ProductName From Product
	Where ProductName Like '%' + @ProductName + '%'
END
GO
