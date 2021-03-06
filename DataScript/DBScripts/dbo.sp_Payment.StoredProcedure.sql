/****** Object:  StoredProcedure [dbo].[sp_Payment]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Payment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Payment]
GO
/****** Object:  StoredProcedure [dbo].[sp_Payment]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Payment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Payment] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Payment] @Id           INT = NULL, 
                                   @PaymentName  NVARCHAR(50) = NULL, 
                                   @Merchant_Key NVARCHAR(50) = NULL, 
                                   @SALT         NVARCHAR(50) = NULL, 
                                   @BASE_URL     NVARCHAR(1000) = NULL, 
                                   @CreatedOnUtc DATETIME = NULL, 
                                   @UpdatedOnUtc DATETIME = NULL, 
								   @Status NVARCHAR(50) = NULL,
                                   @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO payment 
                        ( 
                         paymentname, 
                         merchant_key, 
                         salt, 
                         base_url, 
                         createdonutc, 
                         updatedonutc,
						 status) 
            VALUES     ( 
                        @PaymentName, 
                        @Merchant_Key, 
                        @SALT, 
                        @BASE_URL, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc,
						@Status) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   payment 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   payment 
          WHERE  id = @Id 
      END
	  
	  IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   payment 
          WHERE  PaymentName = @PaymentName 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [payment] 
          SET   
                [paymentname] = @PaymentName, 
                [merchant_key] = @Merchant_Key, 
                [salt] = @SALT, 
                [base_url] = @BASE_URL, 
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc,
				[Status] = @Status
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   payment 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM payment 
          WHERE  id = @Id 
      END 
GO
