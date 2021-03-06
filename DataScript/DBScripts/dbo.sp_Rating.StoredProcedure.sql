/****** Object:  StoredProcedure [dbo].[sp_Rating]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rating]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Rating]
GO
/****** Object:  StoredProcedure [dbo].[sp_Rating]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rating]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Rating] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Rating] @Id           INT = NULL, 
                                  @ProductID    INT = NULL, 
                                  @CustomerName NVARCHAR(1000) = NULL, 
                                  @Rating       FLOAT = NULL, 
                                  @ReviewTitle  NVARCHAR(100) = NULL, 
                                  @Review       NVARCHAR(1000) = NULL, 
                                  @LikeCount    INT = NULL, 
                                  @DislikeCount INT = NULL, 
                                  @ReviewStatus INT = NULL, 
                                  @CreatedOnUTC DATETIME = NULL, 
                                  @Mode         VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO rating 
                        (
                         productid, 
                         customername, 
                         rating, 
                         reviewtitle, 
                         review, 
                         likecount, 
                         dislikecount, 
                         reviewstatus, 
                         createdonutc) 
            VALUES     (
                        @ProductID, 
                        @CustomerName, 
                        @Rating, 
                        @ReviewTitle, 
                        @Review, 
                        @LikeCount, 
                        @DislikeCount, 
                        @ReviewStatus, 
                        @CreatedOnUTC) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   rating 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   rating 
          WHERE  ProductID = @ProductID AND CustomerName != 'Guest'
      END
	  
	  IF ( @Mode = 'ViewByProductID' ) 
      BEGIN 
          SELECT AVG(Rating) As RatingValue, Count(*)
          FROM   rating 
          WHERE  ProductID = @ProductID 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [rating] 
          SET   
                [productid] = @ProductID, 
                [customername] = @CustomerName, 
                [rating] = @Rating, 
                [reviewtitle] = @ReviewTitle, 
                [review] = @Review, 
                [likecount] = @LikeCount, 
                [dislikecount] = @DislikeCount, 
                [reviewstatus] = @ReviewStatus, 
                [createdonutc] = @CreatedOnUTC 
				WHERE  ProductID = @ProductID
      END 

	  IF ( @Mode = 'UpdateLike' ) 
      BEGIN 
          UPDATE [rating] 
          SET                   
                [likecount] = @LikeCount + 1
				WHERE  ProductID = @ProductID And Id = @Id
      END 

	  IF ( @Mode = 'UpdateUnlike' ) 
      BEGIN 
          UPDATE [rating] 
          SET                   
                [dislikecount] = @DislikeCount + 1
				WHERE  ProductID = @ProductID And Id = @Id
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   rating 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM rating 
          WHERE  id = @Id 
      END 
GO
