
 DROP TABLE IF EXISTS [dbo].[DimDateCleaned];
 CREATE TABLE [dbo].[DimDateCleaned] (
  [DateKey] INT,
  [Date] Date,
  [Day] NVARCHAR(50),
  [Month] NVARCHAR(50),
  [MonthShort] NVARCHAR(3),
  [MonthNo] INT,
  [Quarter] INT,
  [Year] INT
  );
  INSERT INTO [dbo].[DimDateCleaned] ([DateKey], [Date], [Day], [Month], [MonthShort], [MonthNo], [Quarter], [Year])
  SELECT
       [Datekey],
       [FullDateAlternateKey] AS Date,
       [EnglishDayNameOfWeek] AS DAY,
       [EnglishMonthName] AS MONTH,
       LEFT([EnglishMonthName],3) AS MONTHSHORT,
       [MonthNumberOfYear] AS MONTHNO,
       [CalendarQuarter] AS QUARTER,
       [CalendarYear]  AS YEAR 
   FROM [AdventureWorksDW].[dbo].[DimDate]
   WHERE CalendarYear >= 2019;

SELECT * FROM [dbo].[DimDateCleaned];