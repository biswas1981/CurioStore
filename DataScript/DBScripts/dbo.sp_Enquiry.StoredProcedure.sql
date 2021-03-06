/****** Object:  StoredProcedure [dbo].[sp_Enquiry]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Enquiry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Enquiry]
GO
/****** Object:  StoredProcedure [dbo].[sp_Enquiry]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Enquiry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Enquiry] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Enquiry] @Id              INT = NULL, 
                                   @ProductID       INT = NULL, 
                                   @CustomerName    NVARCHAR(1000) = NULL, 
                                   @CustomerAddress NVARCHAR(1000) = NULL, 
                                   @Phone           NVARCHAR(20) = NULL, 
                                   @EmailID         NVARCHAR(100) = NULL, 
                                   @Action          NVARCHAR(100) = NULL, 
                                   @CreatedOnUTC    DATETIME = NULL, 
                                   @Mode            VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      IF NOT EXISTS (SELECT * 
                     FROM   enquiry) 
        BEGIN 
            INSERT INTO enquiry 
                        (
                         productid, 
                         customername, 
                         customeraddress, 
                         phone, 
                         emailid, 
                         action, 
                         createdonutc) 
            VALUES     (
                        @ProductID, 
                        @CustomerName, 
                        @CustomerAddress, 
                        @Phone, 
                        @EmailID, 
                        @Action, 
                        @CreatedOnUTC) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   enquiry 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   enquiry 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [enquiry] 
          SET   
                [productid] = @ProductID, 
                [customername] = @CustomerName, 
                [customeraddress] = @CustomerAddress, 
                [phone] = @Phone, 
                [emailid] = @EmailID, 
                [action] = @Action, 
                [createdonutc] = @CreatedOnUTC 				
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   enquiry 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM enquiry 
          WHERE  id = @Id 
      END 
GO
