/****** Object:  StoredProcedure [dbo].[sp_Wishlist]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Wishlist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Wishlist]
GO
/****** Object:  StoredProcedure [dbo].[sp_Wishlist]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Wishlist]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Wishlist] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Wishlist] @Id           INT = NULL, 
                                    @CustomerGUID NVARCHAR(1000) = NULL, 
                                    @ProductID    INT = NULL, 
									@Currency	  nvarchar(50) = NULL,
									@ProductPrice DECIMAL(18, 2) = NULL, 
                                    @CreatedOnUtc DATETIME = NULL, 
                                    @UpdatedOnUtc DATETIME = NULL, 
                                    @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      IF NOT EXISTS (SELECT * 
                     FROM   wishlist Where CustomerGUID = @CustomerGUID And productid = @ProductID)
        BEGIN 
            INSERT INTO wishlist 
                        (
                         customerguid, 
                         productid, 
						 currency,
						 productprice,
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @CustomerGUID, 
                        @ProductID, 
						@Currency,
						@ProductPrice,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   wishlist 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   wishlist 
          WHERE  CustomerGUID = @CustomerGUID And productid = @ProductID
      END 

	  IF ( @Mode = 'ViewByCutomerID' ) 
      BEGIN 
		  SELECT Pro.ProductName,Wish.Currency,Pro.Stock, Wish.ProductPrice, Img.ThumbImageURL, Pro.Id, Wish.Id
		FROM Product Pro 
		JOIN Wishlist Wish ON Pro.Id = Wish.ProductId
		JOIN ProductImage Img ON Pro.id = Img.ProductID		
		Where Img.Sequences = '0' And Wish.CustomerGUID = @CustomerGUID         
          
      END

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [wishlist] 
          SET   
                [customerguid] = @CustomerGUID, 
                [productid] = @ProductID, 
				[currency] = @Currency,
				[productprice] = @ProductPrice,
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   wishlist WHERE  CustomerGUID = @CustomerGUID
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM wishlist 
          WHERE  id = @Id AND CustomerGUID = @CustomerGUID
      END 
GO
