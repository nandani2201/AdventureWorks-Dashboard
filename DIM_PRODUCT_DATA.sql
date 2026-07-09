 DROP TABLE IF EXISTS [dbo].[DimProductCleaned];
  CREATE TABLE [dbo].[DimProductCleaned]
  (
        [ProductKey] int , 
        [ProductItemCode] NVARCHAR(50),
        [ProductName] NVARCHAR(255),
        [Subcategory] NVARCHAR(255),
        [ProductCategory] NVARCHAR(255),
        [ProductColor] NVARCHAR(50),
        [ProductSize] NVARCHAR(50),
        [ProductLine] NVARCHAR(50),
        [ProductModel Name] NVARCHAR(255),
        [ProductDescription] NVARCHAR(MAX),
        [ProductStatus] NVARCHAR(50)
    );

    INSERT INTO [dbo].[DimProductCleaned]
    (
        [ProductKey],
        [ProductItemCode],
        [ProductName] ,
        [Subcategory] ,
        [ProductCategory],
        [ProductColor] ,
        [ProductSize] ,
        [ProductLine] ,
        [ProductModel Name],
        [ProductDescription],
        [ProductStatus]
)
SELECT  
        p.[ProductKey],
        p.[ProductAlternateKey] AS [ProductItemCode], 
        p.[EnglishProductName] AS [Product Name],
        ps.EnglishProductSubcategoryName AS [Sub Category], -- joined in from sub category table 
        pc.EnglishProductCategoryName AS [Product Category],
      p.[Color] AS [Product Color],
      p.[Size] AS [Product Size],
      p.[ProductLine] AS [Product Line],
      p.[ModelName] AS [Product Model Name],
     P.[EnglishDescription] As [Product Description],
     isnull (p.Status ,'Outdated') AS [Product Status]
  FROM [AdventureWorksDW].[dbo].[DimProduct] as p

  LEFT JOIN DBO.DimProductSubcategory AS ps 
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  LEFT JOIN dbo.DimProductCategory AS pc
           ON ps.productCategorykey = pc.ProductCategoryKey

  order by 
  p.Productkey asc
  
  select * from [dbo].[DimProductCleaned];

  