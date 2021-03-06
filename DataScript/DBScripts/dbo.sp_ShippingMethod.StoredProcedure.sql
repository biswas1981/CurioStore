/****** Object:  StoredProcedure [dbo].[sp_ShippingMethod]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ShippingMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ShippingMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_ShippingMethod]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ShippingMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ShippingMethod] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ShippingMethod] @Id             INT = NULL, 
                                          @ShipmentMethod NVARCHAR(max) = NULL, 
                                          @Description    NVARCHAR(max) = NULL, 
                                          @CreatedOnUtc   DATETIME = NULL, 
                                          @UpdatedOnUtc   DATETIME = NULL, 
                                          @Mode           VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO shippingmethod 
                        ( 
                         shipmentmethod, 
                         description, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @ShipmentMethod, 
                        @Description, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   shippingmethod 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   shippingmethod 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [shippingmethod] 
          SET   
                [shipmentmethod] = @ShipmentMethod, 
                [description] = @Description,
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   shippingmethod 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM shippingmethod 
          WHERE  id = @Id 
      END 
GO
