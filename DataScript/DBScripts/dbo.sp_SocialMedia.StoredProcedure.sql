/****** Object:  StoredProcedure [dbo].[sp_SocialMedia]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SocialMedia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SocialMedia]
GO
/****** Object:  StoredProcedure [dbo].[sp_SocialMedia]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SocialMedia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SocialMedia] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_SocialMedia] @Id        INT = NULL, 
                                       @Facebook  NVARCHAR(max) = NULL, 
                                       @Twitter   NVARCHAR(max) = NULL, 
                                       @Youtube   NVARCHAR(max) = NULL, 
                                       @Instagram NVARCHAR(max) = NULL,
									   @LogoURL  NVARCHAR(max) = NULL,
                                       @Mode      VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO socialmedia 
                        ( 
                         facebook, 
                         twitter, 
                         youtube, 
                         instagram,
						 LogoURL) 
            VALUES     ( 
                        @Facebook, 
                        @Twitter, 
                        @Youtube, 
                        @Instagram,
						@LogoURL) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   socialmedia 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   socialmedia 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [socialmedia] 
          SET   
                [facebook] = @Facebook, 
                [twitter] = @Twitter, 
                [youtube] = @Youtube, 
                [instagram] = @Instagram,
				[LogoURL] = @LogoURL
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   socialmedia 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM socialmedia 
          WHERE  id = @Id 
      END 
GO
