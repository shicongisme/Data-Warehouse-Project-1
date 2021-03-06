/****** Script for SelectTopNRows command from SSMS  ******/
use  [Data_Warehouse_Project]

SELECT s.[store_num] as 'Store Number',
w.warehouse_ID 'Warehouse ID',
t.retail_order_ID 'Retail Order ID',
q.product_num as 'Product Number',
o.Shipping_ID 'Shipping ID',
q.quantity 'Quantity Ordered',
DATEDIFF(day,t.product_order_date,o.product_ship_date) as 'Days to Ship Product' into [retail order fact table]
  FROM retail_store s inner join retail_product_order t
  on s.store_num = t.store_num
  inner join warehouse w
  on w.warehouse_ID = t.warehouse_ID
  inner join retail_order_quantity q
  on q.retail_order_ID = t.retail_order_ID
  inner join retail_order_shipping o
  on o.retail_order_ID = t.retail_order_ID
  inner join product_table p
  on p.product_num = q.product_num
  inner join retail_Inventory f
  on f.prod_num = p.product_num
  order by s.store_num

  alter table [retail order fact table]
  add primary key([Store Number],[Warehouse ID],[Retail Order ID],[Product Number],[Shipping ID])

  
  
 
