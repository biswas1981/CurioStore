/****** Object:  StoredProcedure [dbo].[sp_OrderItems]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_OrderItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_OrderItems]
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderItems]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_OrderItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_OrderItems] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_OrderItems] @Id                    INT = NULL, 
                                      @OrderItemGuid         NVARCHAR(1000) = NULL, 
                                      @ProductId             INT = NULL, 
                                      @Quantity              INT = NULL, 
                                      @UnitPriceInclTax      DECIMAL(18, 2) = NULL, 
                                      @UnitPriceExclTax      DECIMAL(18, 2) = NULL, 
                                      @PriceInclTax          DECIMAL(18, 2) = NULL, 
                                      @PriceExclTax          DECIMAL(18, 2) = NULL, 
                                      @DiscountAmountInclTax DECIMAL(18, 2) = NULL, 
                                      @DiscountAmountExclTax DECIMAL(18, 2) = NULL, 
                                      @CreatedOnUtc          DATETIME = NULL, 
                                      @UpdatedOnUtc          DATETIME = NULL, 
                                      @Mode                  VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO orderitems 
                        (
                         orderitemguid, 
                         productid, 
                         quantity, 
                         unitpriceincltax, 
                         unitpriceexcltax, 
                         priceincltax, 
                         priceexcltax, 
                         discountamountincltax, 
                         discountamountexcltax, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @OrderItemGuid, 
                        @ProductId, 
                        @Quantity, 
                        @UnitPriceInclTax, 
                        @UnitPriceExclTax, 
                        @PriceInclTax, 
                        @PriceExclTax, 
                        @DiscountAmountInclTax, 
                        @DiscountAmountExclTax, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   orderitems
      END 

	  IF ( @Mode = 'GetTotal' ) 
      BEGIN 
          SELECT Sum(priceincltax) As Total
          FROM   orderitems Where OrderItemGuid = @OrderItemGuid
      END 

	  

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   orderitems 
          WHERE  id = @Id 
      END 
	  IF ( @Mode = 'ViewByOrderID' ) 
      BEGIN 
          SELECT * 
          FROM   orderitems 
          Where OrderItemGuid = @OrderItemGuid
      END 

	  IF ( @Mode = 'ViewByOrder' ) 
      BEGIN 
          SELECT OI.ProductId, Pro.ProductName, ProImg.GalleryImageURL ,OI.Quantity, OI.PriceExclTax, Ord.CustomerCurrencyCode, ord.OrderGUID, OI.CreatedOnUtc
          FROM   orderitems OI 
		  JOIN Product Pro ON OI.ProductId = Pro.Id
          JOIN Orders Ord ON OI.OrderItemGuid = Ord.OrderGUID
		  Join ProductImage ProImg ON OI.ProductId = ProImg.ProductID
		  Where OI.OrderItemGuid = @OrderItemGuid AND ProImg.Sequences = '0'
      END

	  IF ( @Mode = 'ViewByProduct' ) 
      BEGIN 
          SELECT OI.ProductId, Pro.ProductName, OI.Quantity, OI.UnitPriceExclTax, OI.PriceExclTax, Ord.CustomerCurrencyCode, Ord.OrderSubtotalExclTax, Ord.OrderSubtotalInclTax, Ord.OrderShippingCharge, Ord.OrderTotal
          FROM   orderitems OI 
		  JOIN Product Pro ON OI.ProductId = Pro.Id
          JOIN Orders Ord ON OI.OrderItemGuid = Ord.OrderGUID
		  Where OI.OrderItemGuid = @OrderItemGuid
      END

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [orderitems] 
          SET   
                [orderitemguid] = @OrderItemGuid, 
                [productid] = @ProductId, 
                [quantity] = @Quantity, 
                [unitpriceincltax] = @UnitPriceInclTax, 
                [unitpriceexcltax] = @UnitPriceExclTax, 
                [priceincltax] = @PriceInclTax, 
                [priceexcltax] = @PriceExclTax, 
                [discountamountincltax] = @DiscountAmountInclTax, 
                [discountamountexcltax] = @DiscountAmountExclTax,
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

	  

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   orderitems 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM orderitems 
          WHERE  id = @Id 
      END 
GO
