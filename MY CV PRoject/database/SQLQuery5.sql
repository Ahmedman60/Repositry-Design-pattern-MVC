/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ProductID]
      ,[ProdName]
      ,[Qty]
      ,[Avialable]
  FROM [test1].[dbo].[Products]