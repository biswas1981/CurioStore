/****** Object:  StoredProcedure [dbo].[sp_Product]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Product]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Product]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Product]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Product] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Product] @Id                   INT = NULL, 
                                   @ProductName          NVARCHAR(400) = NULL, 
                                   @ShortDescription     NVARCHAR(max) = NULL, 
                                   @FullDescription      NVARCHAR(max) = NULL, 
                                   @Published            INT = NULL, 
                                   @CP_INR               DECIMAL(18, 2) = NULL, 
                                   @CP_USD               DECIMAL(18, 2) = NULL, 
                                   @CP_Euro              DECIMAL(18, 2) = NULL, 
                                   @CP_GBP               DECIMAL(18, 2) = NULL, 
                                   @OP_INR               DECIMAL(18, 2) = NULL, 
                                   @OP_USD               DECIMAL(18, 2) = NULL, 
                                   @OP_Euro              DECIMAL(18, 2) = NULL, 
                                   @OP_GBP               DECIMAL(18, 2) = NULL, 
                                   @PC_INR               DECIMAL(18, 2) = NULL, 
                                   @PC_USD               DECIMAL(18, 2) = NULL, 
                                   @PC_Euro              DECIMAL(18, 2) = NULL, 
                                   @PC_GBP               DECIMAL(18, 2) = NULL, 
                                   @Discount             DECIMAL(18, 2) = NULL, 
                                   @TaxCategoryId        INT = NULL, 
                                   @OrderMinimumQuantity INT = NULL, 
                                   @OrderMaximumQuantity INT = NULL, 
								   @Stock				 INT = NULL,
                                   @NotReturnable        INT = NULL, 
                                   @IsGiftCard           INT = NULL, 
                                   @IsRental             INT = NULL, 
                                   @MarkAsNew            INT = NULL, 
                                   @CategoryID           INT = NULL, 
                                   @ManufacturerID       INT = NULL, 
                                   @VendorID             INT = NULL, 
                                   @CreatedOnUtc         DATETIME = NULL, 
                                   @UpdatedOnUtc         DATETIME = NULL, 
                                   @Mode                 VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO product 
                        (
                         productname, 
                         shortdescription, 
                         fulldescription, 
                         published, 
                         cp_inr, 
                         cp_usd, 
                         cp_euro, 
                         cp_gbp, 
                         op_inr, 
                         op_usd, 
                         op_euro, 
                         op_gbp, 
                         pc_inr, 
                         pc_usd, 
                         pc_euro, 
                         pc_gbp, 
                         discount, 
                         taxcategoryid, 
                         orderminimumquantity, 
                         ordermaximumquantity,
						 stock,
                         notreturnable, 
                         isgiftcard, 
                         isrental, 
                         markasnew, 
                         categoryid, 
                         manufacturerid, 
                         vendorid, 
                         createdonutc, 
                         updatedonutc) 
            VALUES     ( 
                        @ProductName, 
                        @ShortDescription, 
                        @FullDescription, 
                        @Published, 
                        @CP_INR, 
                        @CP_USD, 
                        @CP_Euro, 
                        @CP_GBP, 
                        @OP_INR, 
                        @OP_USD, 
                        @OP_Euro, 
                        @OP_GBP, 
                        @PC_INR, 
                        @PC_USD, 
                        @PC_Euro, 
                        @PC_GBP, 
                        @Discount, 
                        @TaxCategoryId, 
                        @OrderMinimumQuantity, 
                        @OrderMaximumQuantity, 
						@Stock,
                        @NotReturnable, 
                        @IsGiftCard, 
                        @IsRental, 
                        @MarkAsNew, 
                        @CategoryID, 
                        @ManufacturerID, 
                        @VendorID, 
                        @CreatedOnUtc, 
                        @UpdatedOnUtc) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   product 
      END 

	  IF ( @Mode = 'FeaturedItems' ) 
      BEGIN 
          SELECT * 
          FROM   product Where IsRental='1' order by CreatedOnUtc DESC
      END 
IF ( @Mode = 'StockReduce' ) 
      BEGIN 
          Update [Product]
		  Set 
		  [stock] = @Stock,
		  [updatedonutc] = @UpdatedOnUtc 
		WHERE  id = @Id 
      END

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   product 
          WHERE  id = @Id 
      END 
	  IF(@Mode ='ViewAllProducts')
	  BEGIN
	  SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1'
	  END

	  IF(@Mode = 'GetProductDetails')
	  Begin
	  SELECT ProductName, ShortDescription, CP_INR, CP_USD, CP_Euro, CP_GBP, ImageURL, Sequences, ThumbImageURL, GalleryImageURL, Stock
		FROM Product Pro JOIN ProductImage Img 
		ON (Pro.Id = img.ProductID)
		Where Pro.Id = @Id
	  END

	  IF(@Mode = 'GetSingleProductDetails')
	  Begin
	  SELECT Pro.Id, ProductName, ShortDescription, CP_INR, CP_USD, CP_Euro, CP_GBP, ImageURL, Sequences, ThumbImageURL, GalleryImageURL, Stock
		FROM Product Pro JOIN ProductImage Img 
		ON (Pro.Id = img.ProductID)
		Where Pro.Id = @Id AND Sequences = '0'
	  END

	  IF ( @Mode = 'ViewByName' ) 
      BEGIN 
          SELECT * 
          FROM   product 
          WHERE  productname = @ProductName 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [product] 
          SET   
                [productname] = @ProductName, 
                [shortdescription] = @ShortDescription, 
                [fulldescription] = @FullDescription, 
                [published] = @Published, 
                [cp_inr] = @CP_INR, 
                [cp_usd] = @CP_USD, 
                [cp_euro] = @CP_Euro, 
                [cp_gbp] = @CP_GBP, 
                [op_inr] = @OP_INR, 
                [op_usd] = @OP_USD, 
                [op_euro] = @OP_Euro, 
                [op_gbp] = @OP_GBP, 
                [pc_inr] = @PC_INR, 
                [pc_usd] = @PC_USD, 
                [pc_euro] = @PC_Euro, 
                [pc_gbp] = @PC_GBP, 
                [discount] = @Discount, 
                [taxcategoryid] = @TaxCategoryId, 
                [orderminimumquantity] = @OrderMinimumQuantity, 
                [ordermaximumquantity] = @OrderMaximumQuantity,
				[stock] = @Stock,
                [notreturnable] = @NotReturnable, 
                [isgiftcard] = @IsGiftCard, 
                [isrental] = @IsRental, 
                [markasnew] = @MarkAsNew, 
                [categoryid] = @CategoryID, 
                [manufacturerid] = @ManufacturerID, 
                [vendorid] = @VendorID,                 
                [updatedonutc] = @UpdatedOnUtc 
				WHERE  id = @Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   product 
      END 

	  IF(@Mode = 'LowStock')
	  BEGIN
		Select * From Product Where Stock <= '2'
	  END

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM product 
          WHERE  id = @Id 
      END 

	  IF(@Mode = 'SortbyNASC')
	  BEGIN
		SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1'
		order by Pro.ProductName ASC
	  END

	  IF(@Mode = 'SortbyNDESC')
	  BEGIN
		SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1' order by Pro.ProductName DESC
	  END

	 -- IF(@Mode = 'SortbyRating')
	 -- BEGIN
		--Select * From Product order by ProductName DESC
	 -- END
	 IF(@Mode = 'SortbyPASC')
	  BEGIN
		SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1' order by Pro.CP_INR ASC
	  END
	  IF(@Mode = 'SortbyPDESC')
	  BEGIN
		SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1' order by Pro.CP_INR DESC
	  END
	  IF(@Mode = 'SortbyDate')
	  BEGIN
		SELECT Pro.[Id],[ProductName],[CP_INR],[CP_USD],[CP_Euro],[CP_GBP],[Discount],[MarkAsNew],[GalleryImageURL],[Name],[ShortDescription],[VendorID], Pro.[CategoryID], Pro.[ManufacturerID], Pro.Stock
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1' order by Pro.CreatedOnUtc ASC
	  END

	  IF(@Mode ='SearchProduct')
	  BEGIN
	  SELECT Pro.[Id],[ProductName],[GalleryImageURL],Cat.[Name]
	  From Product Pro
	  JOIN ProductImage Img ON Pro.id = Img.ProductID
	  JOIN Category Cat ON Pro.CategoryID = Cat.Id
	  Where Img.Sequences = '0' AND Pro.Published = '1'
	  END
GO
