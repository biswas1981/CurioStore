/****** Object:  StoredProcedure [dbo].[sp_Vendors]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Vendors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Vendors]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendors]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Vendors]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Vendors] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Vendors] @Id            INT = NULL, 
                                   @VendorName    NVARCHAR(400) = NULL, 
                                   @VendorEmail   NVARCHAR(max) = NULL, 
                                   @Description   NVARCHAR(max) = NULL, 
                                   @PictureURL    NVARCHAR(max) = NULL, 
                                   @VendorAddress NVARCHAR(max) = NULL, 
                                   @Active        INT = NULL, 
                                   @Deleted       INT = NULL, 
                                   @CreatedOnUtc  DATETIME = NULL, 
                                   @Mode          VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO vendors 
                        ( 
                         vendorname, 
                         vendoremail, 
                         description, 
                         pictureurl, 
                         vendoraddress, 
                         active, 
                         deleted, 
                         createdonutc) 
            VALUES     (
                        @VendorName, 
                        @VendorEmail, 
                        @Description, 
                        @PictureURL, 
                        @VendorAddress, 
                        @Active, 
                        @Deleted, 
                        @CreatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   vendors 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   vendors 
          WHERE  id = @Id 
      END 
	  IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   vendors 
          WHERE  VendorName = @VendorName 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [vendors] 
          SET   
                [vendorname] = @VendorName, 
                [vendoremail] = @VendorEmail, 
                [description] = @Description, 
                [pictureurl] = @PictureURL, 
                [vendoraddress] = @VendorAddress, 
                [active] = @Active, 
                [deleted] = @Deleted, 
                [createdonutc] = @CreatedOnUtc 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   vendors 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM vendors 
          WHERE  id = @Id 
      END 
GO
