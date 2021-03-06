/****** Object:  StoredProcedure [dbo].[sp_Address]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Address]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Address]
GO
/****** Object:  StoredProcedure [dbo].[sp_Address]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Address]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Address] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Address] @Id             INT = NULL, 
                                   @CustomerGUID   UNIQUEIDENTIFIER = NULL, 
                                   @FirstName      NVARCHAR(1000) = NULL, 
                                   @LastName       NVARCHAR(1000) = NULL, 
                                   @CompanyName    NVARCHAR(1000) = NULL, 
                                   @Country        NVARCHAR(1000) = NULL, 
                                   @StreetAddress1 NVARCHAR(max) = NULL, 
                                   @StreetAddress2 NVARCHAR(max) = NULL, 
                                   @City           NVARCHAR(100) = NULL, 
                                   @State          NVARCHAR(100) = NULL, 
                                   @ZipCode        NVARCHAR(100) = NULL, 
                                   @Status         INT = NULL, 
                                   @CreatedOnUtc   DATETIME = NULL, 
                                   @UpdatedOnUtc   DATETIME = NULL, 
                                   @Mode           VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO address 
                        (
                         customerguid, 
                         firstname, 
                         lastname, 
                         companyname, 
                         country, 
                         streetaddress1, 
                         streetaddress2, 
                         city, 
                         state, 
                         zipcode, 
                         status, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @CustomerGUID, 
                        @FirstName, 
                        @LastName, 
                        @CompanyName, 
                        @Country, 
                        @StreetAddress1, 
                        @StreetAddress2, 
                        @City, 
                        @State, 
                        @ZipCode, 
                        @Status, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   address 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   address 
          WHERE  id = @Id 
      END
	  
	  IF ( @Mode = 'ViewByCustID' ) 
      BEGIN 
          SELECT * 
          FROM   address 
          WHERE  CustomerGUID = @CustomerGUID 
      END
	  
	  IF ( @Mode = 'ActiveByCustID' ) 
      BEGIN 
          SELECT * 
          FROM   address 
          WHERE  CustomerGUID = @CustomerGUID AND Status = '1'
      END 

	  IF ( @Mode = 'UpdateStatus' ) 
      BEGIN 
          UPDATE [address] 
          SET                   
                [status] = @Status, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [address] 
          SET   
                [customerguid] = @CustomerGUID, 
                [firstname] = @FirstName, 
                [lastname] = @LastName, 
                [companyname] = @CompanyName, 
                [country] = @Country, 
                [streetaddress1] = @StreetAddress1, 
                [streetaddress2] = @StreetAddress2, 
                [city] = @City, 
                [state] = @State, 
                [zipcode] = @ZipCode, 
                [status] = @Status, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   address 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM address 
          WHERE  id = @Id 
      END 
GO
