/****** Object:  StoredProcedure [dbo].[sp_Manufacturer]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Manufacturer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Manufacturer]
GO
/****** Object:  StoredProcedure [dbo].[sp_Manufacturer]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Manufacturer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Manufacturer] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Manufacturer] @Id               INT = NULL, 
                                        @ManufacturerName NVARCHAR(400) = NULL, 
                                        @Description      NVARCHAR(max) = NULL, 
                                        @PictureURL       NVARCHAR(max) = NULL, 
                                        @DisplayOrder     INT = NULL, 
                                        @Published        INT = NULL, 
                                        @Deleted          INT = NULL, 
                                        @CreatedOnUtc     DATETIME = NULL, 
                                        @Mode             VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO manufacturer 
                        ( 
                         manufacturername, 
                         description, 
                         pictureurl, 
                         displayorder, 
                         published, 
                         deleted, 
                         createdonutc) 
            VALUES     (
                        @ManufacturerName, 
                        @Description, 
                        @PictureURL, 
                        @DisplayOrder, 
                        @Published, 
                        @Deleted, 
                        @CreatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   manufacturer Where Published = '1' order by DisplayOrder ASC
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   manufacturer 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   manufacturer 
          WHERE  ManufacturerName = @ManufacturerName 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [manufacturer] 
          SET   
                [manufacturername] = @ManufacturerName, 
                [description] = @Description, 
                [pictureurl] = @PictureURL, 
                [displayorder] = @DisplayOrder, 
                [published] = @Published, 
                [deleted] = @Deleted, 
                [createdonutc] = @CreatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   manufacturer 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM manufacturer 
          WHERE  id = @Id 
      END 

	  IF(@Mode = 'GetManufacturerCount')
	  BEGIN
		Select M.Id, M.ManufacturerName, COUNT(p.ManufacturerID) as Count From Manufacturer As M
Left Join Product As p ON p.ManufacturerID = M.Id
Group By M.Id, M.ManufacturerName
	  END
GO
