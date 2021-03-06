/****** Object:  StoredProcedure [dbo].[sp_Category]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Category]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Category]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Category]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Category] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Category] @Id               INT = NULL, 
                                    @Name             NVARCHAR(400) = NULL, 
                                    @Description      NVARCHAR(max) = NULL, 
                                    @ParentCategoryId INT = NULL, 
                                    @PictureUrl       NVARCHAR(max) = NULL, 
                                    @Published        INT = NULL, 
                                    @Deleted          INT = NULL, 
                                    @Display_Order    INT = NULL, 
                                    @CreatedOnUtc     DATETIME = NULL, 
                                    @UpdatedOnUtc     DATETIME = NULL, 
									@TempPID		  NVARCHAR(max) = NULL, 
                                    @Mode             VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
       
        BEGIN 
            INSERT INTO category 
                        (
                         NAME, 
                         description, 
                         parentcategoryid, 
                         pictureurl, 
                         published, 
                         deleted, 
                         display_order, 
                         createdonutc, 
                         updatedonutc,
						 TempPID) 
            VALUES     (
                        @Name, 
                        @Description, 
                        @ParentCategoryId, 
                        @PictureUrl, 
                        @Published, 
                        @Deleted, 
                        @Display_Order, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc,
						@TempPID) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   category 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   category 
          WHERE  id = @Id 
      END 

	IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   category 
          WHERE  Name = @Name 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [category] 
          SET   
                [name] = @Name, 
                [description] = @Description, 
                [parentcategoryid] = @ParentCategoryId, 
                [pictureurl] = @PictureUrl, 
                [published] = @Published, 
                [deleted] = @Deleted, 
                [display_order] = @Display_Order, 
                [createdonutc] = @CreatedOnUtc, 
                [updatedonutc] = @UpdatedOnUtc,
				[TempPID] = @TempPID
				WHERE  id = @Id
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   category 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM category 
          WHERE  id = @Id 
      END 
	IF(@Mode = 'getCategoryCount')
	BEGIN
	SELECT c.Id,c.Name, COUNT(p.CategoryID) as Count, c.PictureUrl AS nproducts
FROM Category AS c
LEFT JOIN Product AS p ON p.CategoryID=c.Id
GROUP BY c.Id, c.Name, c.PictureUrl
	END
	IF(@Mode = 'GetParentID')
	BEGIN
		with CTE as
(
    select Id, Name, ParentCategoryId
    from Category
    where ParentCategoryId = 0
    
    union all
    
    select c.Id, CAST(p.Name + ' > ' + c.Name as nvarchar(400)), c.ParentCategoryId
    from Category as c
    join CTE as p on p.Id = c.ParentCategoryId
)

select * from CTE
order by Name
	END
GO
