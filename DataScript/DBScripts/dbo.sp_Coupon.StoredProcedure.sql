/****** Object:  StoredProcedure [dbo].[sp_Coupon]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Coupon]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Coupon]
GO
/****** Object:  StoredProcedure [dbo].[sp_Coupon]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Coupon]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Coupon] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Coupon] @Id           INT = NULL, 
                                  @CustomerGUID NVARCHAR(1000) = NULL, 
                                  @ProductID    INT = NULL, 
                                  @Coupon       NVARCHAR(1000) = NULL, 
                                  @Status       NVARCHAR(50) = NULL, 
								  @CouponOption NVARCHAR(50) = NULL, 
								  @CouponValue  DECIMAL(18, 2) = NULL, 
                                  @CreatedOnUtc DATETIME = NULL, 
                                  @UpdatedOnUtc DATETIME = NULL, 
                                  @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO coupon 
                        ( 
                         customerguid, 
                         productid, 
                         coupon, 
                         status, 
						 couponoption,
						 couponvalue,
                         createdonutc, 
                         updatedonutc) 
            VALUES     ( 
                        @CustomerGUID, 
                        @ProductID, 
                        @Coupon, 
                        @Status, 
						@CouponOption,
						@CouponValue,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          Select Coup.Id, Coup.CustomerGUID, CustAttr.Customer_Name, Coup.Coupon, Coup.Status, Coup.CouponOption, Coup.CouponValue  
			From Coupon Coup
			JOIN CustomerAttribute CustAttr ON Coup.CustomerGUID = CustAttr.Customer_Id
      END 

	  IF ( @Mode = 'ValidateCoupon' ) 
      BEGIN 
          Select * From Coupon Where CustomerGUID = @CustomerGUID AND Coupon = @Coupon AND Status = '1'
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   coupon 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [coupon] 
          SET   
                
                [productid] = @ProductID, 
                [coupon] = @Coupon, 
                [status] = @Status, 
				[couponoption] = @CouponOption,
				[couponvalue] = @CouponValue,
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

	  

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   coupon 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM coupon 
          WHERE  id = @Id 
      END 
GO
