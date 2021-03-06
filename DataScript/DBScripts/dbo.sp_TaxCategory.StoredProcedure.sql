/****** Object:  StoredProcedure [dbo].[sp_TaxCategory]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TaxCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TaxCategory]
GO
/****** Object:  StoredProcedure [dbo].[sp_TaxCategory]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TaxCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_TaxCategory] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_TaxCategory] @Id                INT = NULL, 
                                       @TaxCategory       NVARCHAR(max) = NULL, 
                                       @TaxCategoryNumber NVARCHAR(max) = NULL, 
                                       @Percentage        DECIMAL(18, 4) = NULL, 
									   @IsActive		  INT = NULL,
                                       @CreatedOnUtc      DATETIME = NULL, 
                                       @UpdatedOnUtc      DATETIME = NULL, 
                                       @Mode              VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO taxcategory 
                        ( 
                         taxcategory, 
                         taxcategorynumber, 
                         percentage, 
						 isactive,
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @TaxCategory, 
                        @TaxCategoryNumber, 
                        @Percentage, 
						@IsActive,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   taxcategory Where IsActive = '1'
      END 

	  IF ( @Mode = 'ActiceTax' ) 
      BEGIN 
          SELECT * 
          FROM   taxcategory Where IsActive = '1'
      END 

	  IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   taxcategory 
          WHERE  TaxCategory = @TaxCategory 
      END

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   taxcategory 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [taxcategory] 
          SET   
                [taxcategory] = @TaxCategory, 
                [taxcategorynumber] = @TaxCategoryNumber, 
                [percentage] = @Percentage, 
				[isactive] = @IsActive,
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   taxcategory 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM taxcategory 
          WHERE  id = @Id 
      END 
GO
