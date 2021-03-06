/****** Object:  StoredProcedure [dbo].[sp_ProductImage]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ProductImage]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductImage]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ProductImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ProductImage] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ProductImage] @Id           INT = NULL, 
                                        @ProductID    INT = NULL, 
                                        @ImageURL     NVARCHAR(max) = NULL, 
										@ThumbImageURL     NVARCHAR(max) = NULL, 
										@GalleryImageURL     NVARCHAR(max) = NULL, 
										@Sequences	  INT = NULL,
                                        @CreatedOnUtc DATETIME = NULL, 
                                        @UpdatedOnUtc DATETIME = NULL, 
                                        @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO productimage 
                        (
                         productid, 
                         imageurl,
						 ThumbImageURL,
						 GalleryImageURL,
						 sequences,
                         createdonutc, 
                         updatedonutc) 
            VALUES     (
                        @ProductID, 
                        @ImageURL, 
						@ThumbImageURL,
						@GalleryImageURL,
						@Sequences,
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   productimage 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   productimage 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT * 
          FROM   productimage 
          WHERE  productid = @ProductID 
      END

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [productimage] 
          SET                    
                [imageurl] = @ImageURL,
				[ThumbImageURL] = @ThumbImageURL,
				[GalleryImageURL] = @GalleryImageURL,
				[sequences] = @Sequences, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id
      END 
	  IF ( @Mode = 'UpdateSeq' ) 
      BEGIN 
          UPDATE [productimage] 
          SET   
				[sequences] = @Sequences, 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   productimage 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM productimage 
          WHERE  ProductID = @ProductID 
      END 

	   IF ( @Mode = 'DeleteImage' ) 
      BEGIN 
          DELETE FROM productimage 
          WHERE  id = @id 
      END 
GO
