/****** Object:  StoredProcedure [dbo].[sp_CustomerPassword]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CustomerPassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerPassword]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_CustomerPassword] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_CustomerPassword] @Id               INT = NULL, 
                                            @CustomerId       UNIQUEIDENTIFIER = 
NULL, 
                                            @Password         NVARCHAR(1000) = 
NULL, 
                                            @PasswordFormatId INT = NULL, 
                                            @PasswordSalt     NVARCHAR(50) = 
NULL, 
                                            @CreatedOnUtc     DATETIME = NULL, 
                                            @Mode             VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO customerpassword 
                        (customerid, 
                         password, 
                         passwordformatid, 
                         passwordsalt, 
                         createdonutc) 
            VALUES     (@CustomerId, 
                        @Password, 
                        @PasswordFormatId, 
                        @PasswordSalt, 
                        @CreatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   customerpassword 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   customerpassword 
          WHERE  customerid = @CustomerId 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [customerpassword] 
          SET    
                [customerid] = @CustomerId, 
                [password] = @Password, 
                [passwordformatid] = @PasswordFormatId, 
                [passwordsalt] = @PasswordSalt, 
                [createdonutc] = @CreatedOnUtc 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   customerpassword 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM customerpassword 
          WHERE  customerid = @CustomerId 
      END 

	IF (@Mode = 'ValidatePassword')
	BEGIN
	SELECT CustomerPassword.Password
	FROM CustomerPassword
	INNER JOIN Customer ON CustomerPassword.CustomerId=Customer.CustomerGuid
	Where CustomerPassword.Password = @Password
	END
GO
