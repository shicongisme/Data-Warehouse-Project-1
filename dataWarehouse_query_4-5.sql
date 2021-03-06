﻿/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Warehouse ID]
      ,[Order number]
      ,[Product number]
      ,[Quantity ordered]
      ,([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory]) as [Max time to inventory]
  FROM [Data Marts].[dbo].[warehouse fact table] s
  inner join (select max([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory])   
  as [max time to inventory]
  from [warehouse fact table]) dt
  on ([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory]) = dt.[max time to inventory]

  
  SELECT [Warehouse ID]
      ,[Order number]
      ,[Product number]
      ,[Quantity ordered]
      ,([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory]) as [Min time to inventory]
  FROM [Data Marts].[dbo].[warehouse fact table] s
  inner join (select min([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory])   
  as [minn time to inventory]
  from [warehouse fact table]) dt
  on ([Time to inspected]+[Time to passed]+[Time to authorized]+[Time to boxed]+[Time to inventory]) = dt.[minn time to inventory]
