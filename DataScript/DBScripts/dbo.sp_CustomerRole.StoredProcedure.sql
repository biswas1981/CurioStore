/****** Object:  StoredProcedure [dbo].[sp_CustomerRole]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CustomerRole]
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerRole]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CustomerRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_CustomerRole] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_CustomerRole] @Id                      INT = NULL, 
                                        @Name                    NVARCHAR (1000) 
= NULL, 
                                        @FreeShipping            INT = NULL, 
                                        @TaxExempt               INT = NULL, 
                                        @Active                  INT = NULL, 
                                        @IsSystemRole            INT = NULL, 
                                        @SystemName              NVARCHAR (1000) 
= NULL, 
                                        @EnablePasswordLifetime  INT = NULL, 
                                        @OverrideTaxDisplayType  INT = NULL, 
                                        @DefaultTaxDisplayTypeId INT = NULL, 
                                        @PurchasedWithProductId  INT = NULL, 
                                        @Mode                    VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO customerrole 
                        (id, 
                         NAME, 
                         freeshipping, 
                         taxexempt, 
                         active, 
                         issystemrole, 
                         systemname, 
                         enablepasswordlifetime, 
                         overridetaxdisplaytype, 
                         defaulttaxdisplaytypeid, 
                         purchasedwithproductid) 
            VALUES     (@Id, 
                        @Name, 
                        @FreeShipping, 
                        @TaxExempt, 
                        @Active, 
                        @IsSystemRole, 
                        @SystemName, 
                        @EnablePasswordLifetime, 
                        @OverrideTaxDisplayType, 
                        @DefaultTaxDisplayTypeId, 
                        @PurchasedWithProductId) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   customerrole 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   customerrole 
          WHERE  id = @Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [customerrole] 
          SET   [id] = @Id, 
                [name] = @Name, 
                [freeshipping] = @FreeShipping, 
                [taxexempt] = @TaxExempt, 
                [active] = @Active, 
                [issystemrole] = @IsSystemRole, 
                [systemname] = @SystemName, 
                [enablepasswordlifetime] = @EnablePasswordLifetime, 
                [overridetaxdisplaytype] = @OverrideTaxDisplayType, 
                [defaulttaxdisplaytypeid] = @DefaultTaxDisplayTypeId, 
                [purchasedwithproductid] = @PurchasedWithProductId 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   customerrole 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM customerrole 
          WHERE  id = @Id 
      END 
GO
