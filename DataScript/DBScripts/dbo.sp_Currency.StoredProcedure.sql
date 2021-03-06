/****** Object:  StoredProcedure [dbo].[sp_Currency]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Currency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Currency]
GO
/****** Object:  StoredProcedure [dbo].[sp_Currency]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Currency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Currency] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Currency] @Id            INT = NULL, 
                                    @Name          NVARCHAR(50) = NULL, 
                                    @CurrencyCode  NVARCHAR(50) = NULL, 
                                    @Rate          DECIMAL(18, 4) = NULL, 
                                    @DisplayLocale NVARCHAR(50) = NULL, 
                                    @CreatedOnUtc  DATETIME = NULL, 
                                    @UpdatedOnUtc  DATETIME = NULL, 
                                    @Mode          VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
       
        BEGIN 
            INSERT INTO currency 
                        (
                         NAME, 
                         currencycode, 
                         rate, 
                         displaylocale, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @Name, 
                        @CurrencyCode, 
                        @Rate, 
                        @DisplayLocale, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   currency 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   currency 
          WHERE  id = @Id 
      END 

    IF (@Mode = 'Update' ) 
      BEGIN 
          UPDATE [currency] 
          SET    
                [name] = @Name, 
                [currencycode] = @CurrencyCode, 
                [rate] = @Rate, 
                [displaylocale] = @DisplayLocale, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   currency 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM currency 
          WHERE  id = @Id 
      END 
GO
