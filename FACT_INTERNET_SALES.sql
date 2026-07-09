DROP TABLE IF EXISTS [dbo].[FactInternetSalesCleaned] 

SELECT  [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[SalesOrderLineNumber]
      ,[SalesAmount]
  FROM [AdventureWorksDW].[dbo].[FactInternetSales]
  where left (OrderDateKey,4) >= 2019
  order by 
       OrderDateKey ASC


       
  CREATE TABLE [dbo].[FactInternetSalesCleaned] (
    [ProductKey] INT,
    [OrderDateKey] INT,
    [DueDateKey] INT,
    [ShipDateKey] INT,
    [CustomerKey] INT,
    [SalesOrderNumber] NVARCHAR(50),
    [SalesAmount] DECIMAL(18, 2)
);
INSERT INTO [dbo].[FactInternetSalesCleaned] (
    [ProductKey],
    [OrderDateKey],
    [DueDateKey],
    [ShipDateKey],
    [CustomerKey],
    [SalesOrderNumber],
    [SalesAmount]
)
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [SalesAmount]
FROM 
 [dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= 2019
ORDER BY
  OrderDateKey ASC

  select * from [dbo].[FactInternetSalesCleaned]