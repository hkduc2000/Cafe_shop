--select * from OrderStepTable
--drop table OrderStepTable
--drop table [Order]
--drop table ProductInOrder


--use cafe_shop_db
--select * from [order]
--select * from ProductInOrder
--select * from sizetable
--delete from product where 1=1
--select * from SizeOfProduct 
--select * from Product
--select * from [User]
--drop table Image
--use master
--ALTER DATABASE [cafe_shop_db] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--drop database cafe_shop_db

update  [order] set createddate = '2021-3-4' where orderid = 51

select * 
into [BACKUP]
from product
drop table [BACKUP]

drop table Sales;
with t as(
SELECT ProductID ,SUM(Quantity) AS Quantity, SUM(Quantity*Price) as Revenue
FROM ProductInOrder
GROUP BY (ProductID))
SELECT a.*, Quantity, Revenue
INTO [Sales]
FROM Product a left join t on a.ProductID = t.ProductID
select * from [Sales];

select CategoryName, SUM(Revenue) as Revenue 
from Sales a join Category b on a.CategoryID = b.CategoryID 
GROUP BY (CategoryName)

select sum(Quantity*Price) as revenue,  CONVERT(date, CreatedDate) as day
from [order] a join [ProductInOrder] b on a.orderid = b.orderid
where  a.CreatedDate is not null
group by CONVERT(date, CreatedDate)

select sum(Quantity*Price) as revenue, month(CreatedDate) as month, 
year(CreatedDate) as year
from [order] a join [ProductInOrder] b on a.orderid = b.orderid
group by month(CreatedDate), year(CreatedDate)

select sum(Quantity*Price) as revenue, year(CreatedDate) as year
from [order] a join [ProductInOrder] b on a.orderid = b.orderid
group by year(CreatedDate)

SELECT * FROM Category