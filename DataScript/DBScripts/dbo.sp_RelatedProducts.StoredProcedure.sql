/****** Object:  StoredProcedure [dbo].[sp_RelatedProducts]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RelatedProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_RelatedProducts]
GO
/****** Object:  StoredProcedure [dbo].[sp_RelatedProducts]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RelatedProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_RelatedProducts] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_RelatedProducts] @Id           INT = NULL, 
                                           @ProductID    INT = NULL, 
                                           @CreatedOnUtc DATETIME = NULL, 
                                           @UpdatedOnUtc DATETIME = NULL, 
                                           @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO relatedproducts 
                        ( 
                         productid, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     ( 
                        @ProductID, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   relatedproducts 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   relatedproducts 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT * 
          FROM   relatedproducts 
          WHERE  productid = @ProductID 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [relatedproducts] 
          SET  
                [productid] = @ProductID, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   relatedproducts 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM relatedproducts 
          WHERE  id = @Id 
      END 
GO
