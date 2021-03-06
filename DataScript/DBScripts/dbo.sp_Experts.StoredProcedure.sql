/****** Object:  StoredProcedure [dbo].[sp_Experts]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Experts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Experts]
GO
/****** Object:  StoredProcedure [dbo].[sp_Experts]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Experts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Experts] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Experts] @Id           INT = NULL, 
                                   @Heading      NVARCHAR(50) = NULL, 
                                   @Title        NVARCHAR(max) = NULL, 
                                   @Expert       NVARCHAR(100) = NULL, 
                                   @Description  NVARCHAR(max) = NULL, 
                                   @Since        NVARCHAR(100) = NULL, 
                                   @Email        NVARCHAR(100) = NULL, 
                                   @Location     NVARCHAR(100) = NULL, 
								   @ExpertImage  NVARCHAR(max) = NULL, 
                                   @CreatedOnUtc DATETIME = NULL, 
                                   @UpdatedOnUtc DATETIME = NULL, 
                                   @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO experts 
                        (
                         heading, 
                         title, 
                         expert, 
                         description, 
                         since, 
                         email, 
                         location, 
						 expertimage,
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @Heading, 
                        @Title, 
                        @Expert, 
                        @Description, 
                        @Since, 
                        @Email, 
                        @Location, 
						@ExpertImage,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   experts 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   experts 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [experts] 
          SET   
                [heading] = @Heading, 
                [title] = @Title, 
                [expert] = @Expert, 
                [description] = @Description, 
                [since] = @Since, 
                [email] = @Email, 
                [location] = @Location, 
				[ExpertImage] = @ExpertImage,
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   experts 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM experts 
          WHERE  id = @Id 
      END 
GO
