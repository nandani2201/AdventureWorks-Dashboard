

SELECT
      c.[CustomerKey] as CustomerKey,
      c.[firstname] as [First Name],
      c.[lastname] as [LastName],
      c.firstname + ' ' + lastname As [Full Name],
      CASE c.Gender WHEN 'M' THEN 'MALE' WHEN 'F' THEN 'FEMALE' END AS gender, 
     c.[datefirstpurchase] as [DateFirstPurchase],
      --[CommuteDistance]
      g.city as [customer city] -- joined in customer city from geography table  
  FROM 
  [dbo].[DimCustomer] AS c
  LEFT JOIN dbo.DimGeography as g on g.GeographyKey = c.GeographyKey
  order by 
  CustomerKey asc  

 DROP TABLE IF EXISTS [dbo].[DimCustomerCleaned]; 
 CREATE TABLE [dbo].[DimCustomerCleaned](
     [CustomerKey] INT, 
     [Firstname] NVARCHAR(50),
     [Lastname] NVARCHAR(50),
     [Gender] NVARCHAR(10),
     [DateFirstpurchase] DATE,
     [Customer city] NVARCHAR(100)
);

INSERT INTO [dbo].[DimCustomerCleaned] (
      [CustomerKey],
      [Firstname] ,
     [Lastname], 
     [Gender] ,
     [DateFirstpurchase],
     [Customer city]
)
SELECT  
      c.[CustomerKey],
      c.[FirstName],
      c.[LastName], 
      CASE c.Gender WHEN 'M' THEN 'MALE' WHEN 'F' THEN 'FEMALE' END AS gender, 
      c.[datefirstpurchase],
      g.city as [customer city] -- joined in customer city from geography table  
  FROM 
    [AdventureWorksDW].[dbo].[DimCustomer] AS c
  LEFT JOIN dbo.DimGeography as g on g.GeographyKey = c.GeographyKey
  order by 
  CustomerKey asc ;

  select * from [dbo].[DimCustomerCleaned];



