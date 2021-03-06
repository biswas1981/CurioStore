/****** Object:  StoredProcedure [dbo].[sp_ProductTier]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductTier]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ProductTier]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductTier]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductTier]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ProductTier] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ProductTier] @Id           INT = NULL, 
                                       @ProductID    INT = NULL, 
                                       @Quantity     NVARCHAR(400) = NULL, 
                                       @Price        DECIMAL(18, 4) = NULL, 
									   @Price_USD	 DECIMAL(18, 2) = NULL, 
									   @Price_EURO	 DECIMAL(18, 2) = NULL,
									   @Price_GBP	 DECIMAL(18, 2) = NULL,
                                       @CreatedOnUtc DATETIME = NULL, 
                                       @UpdatedOnUtc DATETIME = NULL, 
                                       @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO producttier 
                        ( 
                         productid, 
                         quantity, 
                         price,
						 price_usd,
						 price_euro,
						 price_gbp,
                         createdonutc, 
                         updatedonutc) 
            VALUES     ( 
                        @ProductID, 
                        @Quantity, 
                        @Price, 
						@Price_USD,
						@Price_EURO,
						@Price_GBP,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   producttier 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   producttier 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT * 
          FROM   producttier 
          WHERE  productid = @ProductID 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [producttier] 
          SET    
                [productid] = @ProductID, 
                [quantity] = @Quantity, 
                [price] = @Price, 
				[price_usd] = @Price_USD,
				[price_euro] = @Price_EURO,
				[price_gbp] = @Price_GBP,
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   producttier 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM producttier 
          WHERE  id = @Id 
      END 
GO
