/****** Object:  StoredProcedure [dbo].[sp_Orders]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Orders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Orders]
GO
/****** Object:  StoredProcedure [dbo].[sp_Orders]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Orders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Orders] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Orders] @Id                             INT = NULL, 
                                  @OrderGUID					  UNIQUEIDENTIFIER = NULL, 
                                  @CustomerGUID                   NVARCHAR(1000) = NULL, 
                                  @CustomerIP                     NVARCHAR(1000) = NULL, 
                                  @BillingAddressID               INT = NULL, 
                                  @ShippingAddressID              INT = NULL, 
                                  @PickupAddressID                INT = NULL, 
                                  @OrderStatusId                  INT = NULL, 
                                  @ShippingStatusId               INT = NULL, 
                                  @PaymentMethod                  NVARCHAR(1000) = NULL, 
                                  @CustomerCurrencyCode           NVARCHAR(10) = NULL, 
                                  @TAXIDNumber                    NVARCHAR(1000) = NULL, 
                                  @OrderSubtotalInclTax           DECIMAL(18, 2) = NULL, 
                                  @OrderSubtotalExclTax           DECIMAL(18, 2) = NULL, 
                                  @OrderDiscount                  DECIMAL(18, 2) = NULL, 
                                  @OrderShippingCharge            DECIMAL(18, 2) = NULL, 
                                  @PaymentMethodAdditionalFee     DECIMAL(18, 2) = NULL, 
                                  @TaxRates                       DECIMAL(18, 2) = NULL, 
                                  @OrderTotal                     DECIMAL(18, 2) = NULL, 
                                  @RefundedAmount                 DECIMAL(18, 2) = NULL, 
                                  @RewardPointsHistoryEntryId     INT = NULL, 
                                  @AllowStoringCreditCardNumber   INT = NULL, 
                                  @CardType                       NVARCHAR(1000) = NULL, 
                                  @BankName                       NVARCHAR(1000) = NULL, 
                                  @CardNumber                     NVARCHAR(50) = NULL, 
                                  @CardCvv2                       NVARCHAR(50) = NULL, 
                                  @CardExpirationMonth            NVARCHAR(50) = NULL, 
                                  @CardExpirationYear             NVARCHAR(50) = NULL, 
                                  @AuthorizationTransactionId     NVARCHAR(1000) = NULL, 
                                  @AuthorizationTransactionCode   NVARCHAR(1000) = NULL, 
                                  @AuthorizationTransactionResult NVARCHAR(1000) = NULL, 
                                  @CaptureTransactionId           NVARCHAR(1000) = NULL, 
                                  @CaptureTransactionResult       NVARCHAR(1000) = NULL, 
								  @RefNumber					  NVARCHAR(1000) = NULL, 
                                  @PaidDateUtc                    DATETIME = NULL, 
                                  @ShippingMethod                 NVARCHAR(1000) = NULL, 
                                  @Deleted                        INT = NULL, 
                                  @CreatedOnUtc                   DATETIME = NULL, 
                                  @UpdatedOnUtc                   DATETIME = NULL, 
                                  @Mode                           VARCHAR(25)
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO orders 
                        (
                         orderguid, 
                         customerguid, 
                         customerip, 
                         billingaddressid, 
                         shippingaddressid, 
                         pickupaddressid, 
                         orderstatusid, 
                         shippingstatusid, 
                         paymentmethod, 
                         customercurrencycode, 
                         taxidnumber, 
                         ordersubtotalincltax, 
                         ordersubtotalexcltax, 
                         orderdiscount, 
                         ordershippingcharge, 
                         paymentmethodadditionalfee, 
                         taxrates, 
                         ordertotal, 
                         refundedamount, 
                         rewardpointshistoryentryid, 
                         allowstoringcreditcardnumber, 
                         cardtype, 
                         bankname, 
                         cardnumber, 
                         cardcvv2, 
                         cardexpirationmonth, 
                         cardexpirationyear, 
                         authorizationtransactionid, 
                         authorizationtransactioncode, 
                         authorizationtransactionresult, 
                         capturetransactionid, 
                         capturetransactionresult, 
						 refnumber,
                         paiddateutc, 
                         shippingmethod, 
                         deleted, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @OrderGUID, 
                        @CustomerGUID, 
                        @CustomerIP, 
                        @BillingAddressID, 
                        @ShippingAddressID, 
                        @PickupAddressID, 
                        @OrderStatusId, 
                        @ShippingStatusId, 
                        @PaymentMethod, 
                        @CustomerCurrencyCode, 
                        @TAXIDNumber, 
                        @OrderSubtotalInclTax, 
                        @OrderSubtotalExclTax, 
                        @OrderDiscount, 
                        @OrderShippingCharge, 
                        @PaymentMethodAdditionalFee, 
                        @TaxRates, 
                        @OrderTotal, 
                        @RefundedAmount, 
                        @RewardPointsHistoryEntryId, 
                        @AllowStoringCreditCardNumber, 
                        @CardType, 
                        @BankName, 
                        @CardNumber, 
                        @CardCvv2, 
                        @CardExpirationMonth, 
                        @CardExpirationYear, 
                        @AuthorizationTransactionId, 
                        @AuthorizationTransactionCode, 
                        @AuthorizationTransactionResult, 
                        @CaptureTransactionId, 
                        @CaptureTransactionResult, 
						@RefNumber,
                        @PaidDateUtc, 
                        @ShippingMethod, 
                        @Deleted, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   orders Order By CreatedOnUtc DESC
      END

	  IF ( @Mode = 'ViewByOrderID' ) 
      BEGIN 
          SELECT * 
          FROM   orders Where OrderGUID = @OrderGUID
      END

	  IF ( @Mode = 'ViewByCustomerID' ) 
      BEGIN 
          SELECT * 
          FROM   orders 
          WHERE  CustomerGUID = @CustomerGUID Order By CreatedOnUtc DESC
      END 

	  IF ( @Mode = 'GetShipStatus' ) 
      BEGIN 
          SELECT *
          FROM   ShippingStatus 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   orders 
          WHERE  id = @Id 
      END 
	  IF ( @Mode = 'GetTotal' ) 
      BEGIN 
          SELECT Sum(OrderTotal) As Total
          FROM   orders Where OrderGUID = @OrderGUID
      END 
	  IF ( @Mode = 'GetTotalOrders' ) 
      BEGIN 
          Select Ord.Id, Ord.AuthorizationTransactionResult, SS.Status, Addr.FirstName + ' ' + Addr.LastName As CustomerName, Ord.CreatedOnUtc, Ord.OrderSubtotalInclTax
			From Orders Ord
			JOIN Address Addr ON Ord.CustomerGUID = Addr.CustomerGUID
			JOIN ShippingStatus SS ON Ord.ShippingStatusId = SS.Id
			Order By Ord.CreatedOnUtc DESC
      END 
	  IF ( @Mode = 'GetSpecificOrderInfo' ) 
      BEGIN 
          Select ORD.OrderGUID, SS.Status, Addr.FirstName + ' ' + Addr.LastName As CustomerName, ORD.CustomerIP, ORD.OrderSubtotalExclTax,
ORD.OrderShippingCharge, ORD.OrderSubtotalInclTax - ORD.OrderSubtotalExclTax As TAX, ORD.PaymentMethodAdditionalFee,
ORD.OrderSubtotalInclTax, ORD.PaymentMethod,ORD.CustomerCurrencyCode, ORD.AuthorizationTransactionResult, ORD.CreatedOnUtc, 
Addr.StreetAddress1 + ', ' + Addr.StreetAddress2 + ', ' + Addr.City + ', ' + Addr.State + ', ' + Addr.ZipCode As BillingAddress,
SS.Status
From Orders ORD 
JOIN ShippingStatus SS ON ORD.ShippingStatusId = SS.Id
JOIN Address Addr ON Ord.CustomerGUID = Addr.CustomerGUID
Where ORD.Id = @Id
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [orders] 
          SET   
                [orderguid] = @OrderGUID, 
                [customerguid] = @CustomerGUID, 
                [customerip] = @CustomerIP, 
                [billingaddressid] = @BillingAddressID, 
                [shippingaddressid] = @ShippingAddressID, 
                [pickupaddressid] = @PickupAddressID, 
                [orderstatusid] = @OrderStatusId, 
                [shippingstatusid] = @ShippingStatusId, 
                [paymentmethod] = @PaymentMethod, 
                [customercurrencycode] = @CustomerCurrencyCode, 
                [taxidnumber] = @TAXIDNumber, 
                [ordersubtotalincltax] = @OrderSubtotalInclTax, 
                [ordersubtotalexcltax] = @OrderSubtotalExclTax, 
                [orderdiscount] = @OrderDiscount, 
                [ordershippingcharge] = @OrderShippingCharge, 
                [paymentmethodadditionalfee] = @PaymentMethodAdditionalFee, 
                [taxrates] = @TaxRates, 
                [ordertotal] = @OrderTotal, 
                [refundedamount] = @RefundedAmount, 
                [rewardpointshistoryentryid] = @RewardPointsHistoryEntryId, 
                [allowstoringcreditcardnumber] = @AllowStoringCreditCardNumber, 
                [cardtype] = @CardType, 
                [bankname] = @BankName, 
                [cardnumber] = @CardNumber, 
                [cardcvv2] = @CardCvv2, 
                [cardexpirationmonth] = @CardExpirationMonth, 
                [cardexpirationyear] = @CardExpirationYear, 
                [authorizationtransactionid] = @AuthorizationTransactionId, 
                [authorizationtransactioncode] = @AuthorizationTransactionCode, 
                [authorizationtransactionresult] = @AuthorizationTransactionResult, 
                [capturetransactionid] = @CaptureTransactionId, 
                [capturetransactionresult] = @CaptureTransactionResult, 
				[refnumber] = @RefNumber,
                [paiddateutc] = @PaidDateUtc, 
                [shippingmethod] = @ShippingMethod, 
                [deleted] = @Deleted, 
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id
      END 

	  IF ( @Mode = 'UpdatePayment' ) 
      BEGIN 
          UPDATE [orders] 
          SET                   
                [orderstatusid] = @OrderStatusId,                 
                [authorizationtransactionresult] = @AuthorizationTransactionResult,     
				[CaptureTransactionResult] = @CaptureTransactionResult,           
                [updatedonutc] = @UpdatedOnUtc 
				Where OrderGUID = @OrderGUID
      END 

	  IF ( @Mode = 'UpdateShipStatus' ) 
      BEGIN 
          UPDATE [orders] 
          SET      
				[ShippingStatusId] = @ShippingStatusId,         
                [updatedonutc] = @UpdatedOnUtc 
				Where OrderGUID = @OrderGUID
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   orders 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM orders 
          WHERE  id = @Id 
      END 
GO
