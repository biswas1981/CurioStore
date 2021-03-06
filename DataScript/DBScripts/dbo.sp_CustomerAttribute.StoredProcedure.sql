/****** Object:  StoredProcedure [dbo].[sp_CustomerAttribute]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerAttribute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CustomerAttribute]
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerAttribute]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_CustomerAttribute] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_CustomerAttribute] @Id                INT = NULL, 
                                             @Customer_Id       UNIQUEIDENTIFIER 
= NULL, 
                                             @Customer_Name     NVARCHAR (1000) 
= NULL, 
                                             @Customer_Email    NVARCHAR (1000) 
= NULL, 
                                             @Customer_Phone    NVARCHAR (1000) 
= NULL, 
                                             @Customer_Address  NVARCHAR (max) = 
NULL, 
                                             @Customer_Address2 NVARCHAR (max) = 
NULL, 
                                             @Customer_Zip      NVARCHAR (50) = 
NULL, 
                                             @OTP_Verified      INT = NULL, 
                                             @Customer_Active   INT = NULL, 
                                             @Created_Date      DATETIME = NULL, 
                                             @Created_By        NVARCHAR (1000) 
= NULL, 
                                             @Modified_Date     DATETIME = NULL, 
                                             @Modified_By       NVARCHAR (1000) 
= NULL, 
                                             @Mode              VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO customerattribute 
                        ( 
                         customer_id, 
                         customer_name, 
                         customer_email, 
                         customer_phone, 
                         customer_address, 
                         customer_address2, 
                         customer_zip, 
                         otp_verified, 
                         customer_active, 
                         created_date, 
                         created_by, 
                         modified_date, 
                         modified_by) 
            VALUES     ( 
                        @Customer_Id, 
                        @Customer_Name, 
                        @Customer_Email, 
                        @Customer_Phone, 
                        @Customer_Address, 
                        @Customer_Address2, 
                        @Customer_Zip, 
                        @OTP_Verified, 
                        @Customer_Active, 
                        @Created_Date, 
                        @Created_By, 
                        @Modified_Date, 
                        @Modified_By) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   customerattribute 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   customerattribute 
          WHERE  customer_id = @Customer_Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [customerattribute] 
          SET   
                [customer_id] = @Customer_Id, 
                [customer_name] = @Customer_Name, 
                [customer_email] = @Customer_Email, 
                [customer_phone] = @Customer_Phone, 
                [customer_address] = @Customer_Address, 
                [customer_address2] = @Customer_Address2, 
                [customer_zip] = @Customer_Zip, 
                [otp_verified] = @OTP_Verified, 
                [customer_active] = @Customer_Active, 
                [created_date] = @Created_Date, 
                [created_by] = @Created_By, 
                [modified_date] = @Modified_Date, 
                [modified_by] = @Modified_By 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   customerattribute 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM customerattribute 
          WHERE  customer_id = @Customer_Id 
      END 
GO
