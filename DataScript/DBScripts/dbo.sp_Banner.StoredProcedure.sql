/****** Object:  StoredProcedure [dbo].[sp_Banner]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Banner]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Banner]
GO
/****** Object:  StoredProcedure [dbo].[sp_Banner]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Banner]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Banner] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Banner] @Id           INT = NULL, 
                                  @BannerURL    NVARCHAR(max) = NULL, 
                                  @Sequences    INT = NULL, 
                                  @BannerText   NVARCHAR(max) = NULL, 
                                  @BannerLink   NVARCHAR(max) = NULL, 
                                  @CreatedOnUtc DATETIME = NULL, 
                                  @UpdatedOnUtc DATETIME = NULL, 
                                  @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO banner 
                        (
                         bannerurl, 
                         sequences, 
                         bannertext, 
                         bannerlink, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @BannerURL, 
                        @Sequences, 
                        @BannerText, 
                        @BannerLink, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   banner 
      END 

	  IF(@Mode ='ViewOrder')
	  BEGIN
	  Select * from Banner Order By Sequences
	  END

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   banner 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [banner] 
          SET   
                [bannerurl] = @BannerURL, 
                [sequences] = @Sequences, 
                [bannertext] = @BannerText, 
                [bannerlink] = @BannerLink, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   banner 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM banner 
          WHERE  id = @Id 
      END 
GO
