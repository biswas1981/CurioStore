/****** Object:  StoredProcedure [dbo].[sp_ProductAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductAttribute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ProductAttribute]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductAttribute]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ProductAttribute] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ProductAttribute] @Id                 INT = NULL, 
                                            @ProductID          INT = NULL, 
                                            @ProductDescription NVARCHAR(max) = NULL, 
                                            @ProductInformation NVARCHAR(max) = NULL, 
                                            @CreatedOnUtc       DATETIME = NULL, 
                                            @UpdatedOnUtc       DATETIME = NULL, 
                                            @Mode               VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO productattribute 
                        ( 
                         productid, 
                         productdescription, 
                         productinformation, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @ProductID, 
                        @ProductDescription, 
                        @ProductInformation, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   productattribute 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   productattribute 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT * 
          FROM   productattribute 
          WHERE  productid = @ProductID 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [productattribute] 
          SET   
                [productid] = @ProductID, 
                [productdescription] = @ProductDescription, 
                [productinformation] = @ProductInformation, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   productattribute 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM productattribute 
          WHERE  ProductID = @ProductID 
      END 
GO
