/****** Object:  Schema [marketing]    Script Date: 7/25/2020 5:30:03 PM ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'marketing')
DROP SCHEMA [marketing]
GO
/****** Object:  Schema [marketing]    Script Date: 7/25/2020 5:30:03 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'marketing')
EXEC sys.sp_executesql N'CREATE SCHEMA [marketing]'

GO
