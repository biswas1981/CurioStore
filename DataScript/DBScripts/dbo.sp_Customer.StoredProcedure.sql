/****** Object:  StoredProcedure [dbo].[sp_Customer]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Customer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Customer]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Customer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Customer] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Customer] @Id                      INT = NULL, 
                                    @CustomerGuid            UNIQUEIDENTIFIER = 
NULL, 
                                    @Username                NVARCHAR (1000) = 
NULL, 
                                    @Email                   NVARCHAR (1000) = 
NULL, 
                                    @EmailToRevalidate       NVARCHAR (1000) = 
NULL, 
                                    @AdminComment            NVARCHAR (1000) = 
NULL, 
                                    @IsTaxExempt             INT = NULL, 
                                    @AffiliateId             INT = NULL, 
                                    @VendorId                INT = NULL, 
                                    @HasShoppingCartItems    INT = NULL, 
                                    @RequireReLogin          INT = NULL, 
                                    @FailedLoginAttempts     INT = NULL, 
                                    @CannotLoginUntilDateUtc DATETIME = NULL, 
                                    @Active                  INT = NULL, 
                                    @Deleted                 INT = NULL, 
                                    @IsSystemAccount         INT = NULL, 
                                    @SystemName              NVARCHAR (1000) = 
NULL, 
                                    @LastIpAddress           NVARCHAR (1000) = 
NULL, 
                                    @CreatedOnUtc            DATETIME = NULL, 
                                    @LastLoginDateUtc        DATETIME = NULL, 
                                    @LastActivityDateUtc     DATETIME = NULL, 
                                    @RegisteredInStoreId     INT = NULL, 
                                    @BillingAddress_Id       INT = NULL, 
                                    @ShippingAddress_Id      INT = NULL, 
                                    @Mode                    VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
       
        BEGIN 
            INSERT INTO customer 
                        (customerguid, 
                         username, 
                         email, 
                         emailtorevalidate, 
                         admincomment, 
                         istaxexempt, 
                         affiliateid, 
                         vendorid, 
                         hasshoppingcartitems, 
                         requirerelogin, 
                         failedloginattempts, 
                         cannotloginuntildateutc, 
                         active, 
                         deleted, 
                         issystemaccount, 
                         systemname, 
                         lastipaddress, 
                         createdonutc, 
                         lastlogindateutc, 
                         lastactivitydateutc, 
                         registeredinstoreid, 
                         billingaddress_id, 
                         shippingaddress_id) 
            VALUES     (@CustomerGuid, 
                        @Username, 
                        @Email, 
                        @EmailToRevalidate, 
                        @AdminComment, 
                        @IsTaxExempt, 
                        @AffiliateId, 
                        @VendorId, 
                        @HasShoppingCartItems, 
                        @RequireReLogin, 
                        @FailedLoginAttempts, 
                        @CannotLoginUntilDateUtc, 
                        @Active, 
                        @Deleted, 
                        @IsSystemAccount, 
                        @SystemName, 
                        @LastIpAddress, 
                        @CreatedOnUtc, 
                        @LastLoginDateUtc, 
                        @LastActivityDateUtc, 
                        @RegisteredInStoreId, 
                        @BillingAddress_Id, 
                        @ShippingAddress_Id) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   customer 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   customer 
          WHERE  CustomerGuid = @CustomerGuid 
      END 

	  IF ( @Mode = 'GetCustID' ) 
      BEGIN 
          SELECT * 
          FROM   customer 
          WHERE  Username = @Username 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [customer] 
          SET   
                [customerguid] = @CustomerGuid, 
                [username] = @Username, 
                [email] = @Email, 
                [emailtorevalidate] = @EmailToRevalidate, 
                [admincomment] = @AdminComment, 
                [istaxexempt] = @IsTaxExempt, 
                [affiliateid] = @AffiliateId, 
                [vendorid] = @VendorId, 
                [hasshoppingcartitems] = @HasShoppingCartItems, 
                [requirerelogin] = @RequireReLogin, 
                [failedloginattempts] = @FailedLoginAttempts, 
                [cannotloginuntildateutc] = @CannotLoginUntilDateUtc, 
                [active] = @Active, 
                [deleted] = @Deleted, 
                [issystemaccount] = @IsSystemAccount, 
                [systemname] = @SystemName, 
                [lastipaddress] = @LastIpAddress, 
                [createdonutc] = @CreatedOnUtc, 
                [lastlogindateutc] = @LastLoginDateUtc, 
                [lastactivitydateutc] = @LastActivityDateUtc, 
                [registeredinstoreid] = @RegisteredInStoreId, 
                [billingaddress_id] = @BillingAddress_Id, 
                [shippingaddress_id] = @ShippingAddress_Id 
				WHERE CustomerGuid = @CustomerGuid
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   customer 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM customer 
          WHERE  id = @Id 
      END 

	IF (@Mode = 'UpdateLoginCount')
	BEGIN
	UPDATE [customer]
	SET [lastlogindateutc] = @LastLoginDateUtc,
	[lastactivitydateutc] = @LastActivityDateUtc, 
	[lastipaddress] = @LastIpAddress   
	WHERE CustomerGuid = @CustomerGuid
	END
GO
