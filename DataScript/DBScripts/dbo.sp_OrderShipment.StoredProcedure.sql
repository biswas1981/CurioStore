/****** Object:  StoredProcedure [dbo].[sp_OrderShipment]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_OrderShipment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_OrderShipment]
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderShipment]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_OrderShipment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_OrderShipment] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_OrderShipment] @Id                 INT = NULL, 
                                         @OrderID            NVARCHAR(1000) = NULL, 
                                         @ProductID          INT = NULL, 
                                         @Ordered            INT = NULL, 
                                         @OrderDate          DATETIME = NULL, 
                                         @PickUp             INT = NULL, 
                                         @PickUpDate         DATETIME = NULL, 
                                         @InTransit          INT = NULL, 
                                         @InTransitDate      DATETIME = NULL, 
                                         @Delivered          INT = NULL, 
                                         @DeliveredDate      DATETIME = NULL, 
                                         @DeliveryFailed     INT = NULL, 
                                         @DeliveryFailedDate DATETIME = NULL, 
                                         @Mode               VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO ordershipment 
                        (
                         orderid, 
                         productid, 
                         ordered, 
                         orderdate, 
                         pickup, 
                         pickupdate, 
                         intransit, 
                         intransitdate, 
                         delivered, 
                         delivereddate, 
                         deliveryfailed, 
                         deliveryfaileddate) 
            VALUES     (
                        @OrderID, 
                        @ProductID, 
                        @Ordered, 
                        @OrderDate, 
                        @PickUp, 
                        @PickUpDate, 
                        @InTransit, 
                        @InTransitDate, 
                        @Delivered, 
                        @DeliveredDate, 
                        @DeliveryFailed, 
                        @DeliveryFailedDate) 
        END 

		IF ( @Mode = 'UpdateAllShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET                   
                [ordered] = @Ordered, 
                [orderdate] = @OrderDate, 
                [pickup] = @PickUp, 
                [pickupdate] = @PickUpDate, 
                [intransit] = @InTransit, 
                [intransitdate] = @InTransitDate, 
                [delivered] = @Delivered, 
                [delivereddate] = @DeliveredDate, 
                [deliveryfailed] = @DeliveryFailed, 
                [deliveryfaileddate] = @DeliveryFailedDate 
				Where OrderID = @OrderID
      END

	  IF ( @Mode = 'UpdateOrderedShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET                   
                [ordered] = @Ordered, 
                [orderdate] = @OrderDate                
				Where OrderID = @OrderID
      END
	  IF ( @Mode = 'UpdatePickShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET   
                [pickup] = @PickUp, 
                [pickupdate] = @PickUpDate 
				Where OrderID = @OrderID
      END
	  IF ( @Mode = 'UpdateInTransitShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET   
                [intransit] = @InTransit, 
                [intransitdate] = @InTransitDate                 
				Where OrderID = @OrderID
      END
	  IF ( @Mode = 'UpdateDeliveredShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET   
                [delivered] = @Delivered, 
                [delivereddate] = @DeliveredDate
				Where OrderID = @OrderID
      END
	  IF ( @Mode = 'UpdateDeliveredFailedShipping' ) 
		BEGIN 
          UPDATE [ordershipment] 
          SET    
                [deliveryfailed] = @DeliveryFailed, 
                [deliveryfaileddate] = @DeliveryFailedDate 
				Where OrderID = @OrderID
      END

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   ordershipment 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   ordershipment 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [ordershipment] 
          SET   
                [orderid] = @OrderID, 
                [productid] = @ProductID, 
                [ordered] = @Ordered, 
                [orderdate] = @OrderDate, 
                [pickup] = @PickUp, 
                [pickupdate] = @PickUpDate, 
                [intransit] = @InTransit, 
                [intransitdate] = @InTransitDate, 
                [delivered] = @Delivered, 
                [delivereddate] = @DeliveredDate, 
                [deliveryfailed] = @DeliveryFailed, 
                [deliveryfaileddate] = @DeliveryFailedDate 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   ordershipment 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM ordershipment 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'GetMyOrders' ) 
      BEGIN 
           Select Pro.ProductName, Ship.Ordered, Ship.OrderDate, Ship.PickUp, Ship.PickUpDate, Ship.InTransit, Ship.InTransitDate, Ship.Delivered, Ship.DeliveredDate, Ship.DeliveryFailed, Ship.DeliveryFailedDate
			From OrderShipment Ship 
			JOIN Product Pro ON Pro.id = Ship.ProductID
			Where OrderID = @OrderID
      END 
GO
