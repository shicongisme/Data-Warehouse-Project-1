 /****** Script for SelectTopNRows command from SSMS  ******/
use [Data Marts]

SELECT distinct s.[store_num] as 'Store number'
,p.shopper_num as 'Shopper number',
t.[product_num] as 'Product number',
q.order_num as 'Order number',
q.quantity_bought as 'Quantity bought',
i.prod_quantity as 'Product quantity',
i.min_order_quantity as 'Minimum order quantity' 
into [retail inventory fact table]
  FROM [Data_Warehouse_Project].[dbo].[retail_store] s
  inner join [Data_Warehouse_Project].[dbo].retail_Inventory i
  on s.store_num = i.store_num
  inner join [Data_Warehouse_Project].[dbo].[product_table] t
  on t.product_num = i.prod_num
  inner join [Data_Warehouse_Project].[dbo].shop_order o
  on o.store_num = s.store_num
  inner join [Data_Warehouse_Project].[dbo].shoppers p
  on p.shopper_num = o.shopper_num
  inner join [Data_Warehouse_Project].[dbo].shopper_product_quantity q
  on q.order_num = o.order_num

  alter table [retail inventory fact table]
  add primary key([Store number],[Shopper number],[Product number],[Order number])
 
  