/****** Object:  StoredProcedure [dbo].[sp_ShoppingCartItem]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ShoppingCartItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ShoppingCartItem]
GO
/****** Object:  StoredProcedure [dbo].[sp_ShoppingCartItem]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ShoppingCartItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ShoppingCartItem] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ShoppingCartItem] @Id           INT = NULL, 
                                            @CustomerId   UNIQUEIDENTIFIER = NULL, 
                                            @ProductId    INT = NULL, 
                                            @Quantity     INT = NULL, 
											@Currency	  nchar(10) = NULL,
                                            @ProductPrice DECIMAL(18, 2) = NULL, 
											@RevisedPrice DECIMAL(18, 2) = NULL,
                                            @CreatedOnUtc DATETIME = NULL, 
                                            @UpdatedOnUtc DATETIME = NULL, 
                                            @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO shoppingcartitem 
                        (
                         customer_id, 
                         productid, 
                         quantity, 
						 currency,
                         productprice,
						 revisedprice, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @CustomerId, 
                        @ProductId, 
                        @Quantity, 
						@Currency,
                        @ProductPrice, 
						@RevisedPrice,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   shoppingcartitem 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   shoppingcartitem 
          WHERE  customer_id = @CustomerId 
      END 
	  IF ( @Mode = 'ViewCartByID' ) 
      BEGIN 
          SELECT SC.*, Pro.Stock
          FROM   shoppingcartitem SC
		  JOIN Product Pro ON SC.ProductId = Pro.Id
          WHERE  customer_id = @CustomerId
      END
	  IF ( @Mode = 'ViewByCustomerProduct' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   shoppingcartitem 
          WHERE  customer_id = @CustomerId And productid = @ProductId 
      END 

	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT * 
          FROM   shoppingcartitem 
          WHERE  productid = @ProductId 
      END

	  IF(@Mode = 'GetMyCartItems')
	  BEGIN
	  SELECT ProductName,Currency,Quantity, ProductPrice, ThumbImageURL, RevisedPrice
		FROM Product Pro 
		JOIN ShoppingCartItem Cart ON Pro.Id = Cart.ProductId
		JOIN ProductImage Img ON Pro.id = Img.ProductID		
		Where Pro.Id = @ProductId AND Img.Sequences = '0'
		END

		IF(@Mode = 'NoStockCheck')
		BEGIN
			Select Count(*)
			From ShoppingCartItem SC
			JOIN Product Pro ON SC.ProductId = Pro.Id
			Where SC.Customer_Id = @CustomerId AND Pro.Stock = '0'
		END

		IF(@Mode = 'GetCartTotal')
		BEGIN
		SELECT SUM(ProductPrice) As Total
		FROM ShoppingCartItem
		WHERE Customer_Id = @CustomerId
		END

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [shoppingcartitem] 
          SET   
                [customer_id] = @CustomerId, 
                [productid] = @ProductId, 
                [quantity] = @Quantity, 
				[currency] = @Currency,
                [productprice] = @ProductPrice, 
				[revisedprice] = @RevisedPrice,
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc
				WHERE  customer_id = @CustomerId  
      END 

	  IF ( @Mode = 'UpdateRevised' ) 
      BEGIN 
          UPDATE [shoppingcartitem] 
          SET   
               
				[revisedprice] = @RevisedPrice,
                [updatedonutc] = @UpdatedOnUtc
				WHERE  customer_id = @CustomerId AND productid = @ProductId
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   shoppingcartitem 
		  WHERE  customer_id = @CustomerId
      END 

	  IF(@Mode = 'ValidateItem')
	  	  BEGIN
		  SELECT Count(*)  FROM shoppingcartitem
		  WHERE Customer_Id = @CustomerId And ProductId = @ProductId
		  END

    IF ( @Mode = 'DeleteAll' ) 
      BEGIN 
          DELETE FROM shoppingcartitem 
          WHERE  customer_id = @CustomerId
      END 

	  IF ( @Mode = 'DeleteByID' ) 
      BEGIN 
          DELETE FROM shoppingcartitem 
          WHERE  id = @Id
      END 
IF ( @Mode = 'DeleteByCustID' ) 
      BEGIN 
          DELETE FROM shoppingcartitem 
          WHERE  Customer_Id = @CustomerId
      END 

GO
