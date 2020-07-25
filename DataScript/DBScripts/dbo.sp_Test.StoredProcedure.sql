/****** Object:  StoredProcedure [dbo].[sp_Test]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Test]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Test]
GO
/****** Object:  StoredProcedure [dbo].[sp_Test]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Test]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Test] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Test]
	@TestName	  nchar(100) = NULL,
	@Mode         VARCHAR(25) 
AS
IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO CategoryTable 
                        (
                         CateGoryName) 
            VALUES     (
                        @TestName) 
        END

GO
