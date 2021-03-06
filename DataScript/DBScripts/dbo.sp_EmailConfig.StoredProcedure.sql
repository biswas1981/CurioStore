/****** Object:  StoredProcedure [dbo].[sp_EmailConfig]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EmailConfig]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_EmailConfig]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmailConfig]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EmailConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_EmailConfig] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_EmailConfig] @Id           INT = NULL, 
                                       @EmailAddress NVARCHAR(max) = NULL, 
                                       @DisplayName  NVARCHAR(max) = NULL, 
                                       @Host         NVARCHAR(max) = NULL, 
                                       @Port         NVARCHAR(max) = NULL, 
                                       @UserName     NVARCHAR(max) = NULL, 
                                       @Password     NVARCHAR(max) = NULL, 
                                       @SendEmailTo  NVARCHAR(max) = NULL, 
                                       @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO emailconfig 
                        ( 
                         emailaddress, 
                         displayname, 
                         host, 
                         port, 
                         username, 
                         password, 
                         sendemailto) 
            VALUES     (
                        @EmailAddress, 
                        @DisplayName, 
                        @Host, 
                        @Port, 
                        @UserName, 
                        @Password, 
                        @SendEmailTo) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   emailconfig 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   emailconfig 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [emailconfig] 
          SET   
                [emailaddress] = @EmailAddress, 
                [displayname] = @DisplayName, 
                [host] = @Host, 
                [port] = @Port, 
                [username] = @UserName, 
                [password] = @Password, 
                [sendemailto] = @SendEmailTo 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   emailconfig 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM emailconfig 
          WHERE  id = @Id 
      END 
GO
