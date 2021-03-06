with t as(
SELECT ProductID ,SUM(Quantity) AS Quantity 
FROM ProductInOrder
GROUP BY (ProductID))
SELECT a.*, Quantity
INTO [Sales]
FROM Product a left join t on a.ProductID = t.ProductID
ORDER BY Quantity DESC;