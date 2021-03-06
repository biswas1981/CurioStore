/****** Object:  StoredProcedure [dbo].[sp_Customer_CustomerRole_Mapping]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Customer_CustomerRole_Mapping]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Customer_CustomerRole_Mapping]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_CustomerRole_Mapping]    Script Date: 7/25/2020 5:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Customer_CustomerRole_Mapping]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Customer_CustomerRole_Mapping] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Customer_CustomerRole_Mapping] @Id              INT = 
NULL, 
                                                         @Customer_Id     INT = 
NULL, 
                                                         @CustomerRole_Id INT = 
NULL, 
                                                         @Mode 
VARCHAR(25) 
AS 
    IF( @Mode = 'insert' ) 
      
        BEGIN 
            INSERT INTO customer_customerrole_mapping 
                        (
                         customer_id, 
                         customerrole_id) 
            VALUES     ( 
                        @Customer_Id, 
                        @CustomerRole_Id) 
        END 

    IF ( @Mode = 'View' ) 
      BEGIN 
          SELECT * 
          FROM   customer_customerrole_mapping 
      END 

    IF ( @Mode = 'ViewByID' ) 
      BEGIN 
          SELECT * 
          FROM   customer_customerrole_mapping 
          WHERE  id = @Id 
      END 

	  IF ( @Mode = 'ViewByCustID' ) 
      BEGIN 
          SELECT * 
          FROM   customer_customerrole_mapping 
          WHERE  Customer_Id = @Customer_Id 
      END 

    IF ( @Mode = 'Update' ) 
      BEGIN 
          UPDATE [customer_customerrole_mapping] 
          SET    
                [customer_id] = @Customer_Id, 
                [customerrole_id] = @CustomerRole_Id 
      END 

    IF ( @Mode = 'GetCount' ) 
      BEGIN 
          SELECT Count(*) 
          FROM   customer_customerrole_mapping 
      END 

    IF ( @Mode = 'Delete' ) 
      BEGIN 
          DELETE FROM customer_customerrole_mapping 
          WHERE  id = @Id 
      END 
GO
