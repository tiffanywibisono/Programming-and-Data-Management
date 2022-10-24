/*
SQL Lab #6
Tiffany Wibisono
*/

USE CapeCodd;

-- 1
/*
The result shows all the columns from Inventory and Order Item table. From the given result, we are able 
to identify the item details in every warehouse location. In other words, the data provide us information
of the list of items, quantity on hand, and quantity on order from four of our warehouse locations. Moreover, 
we can also determine the items, order quantity, and total price each customer ordered.
*/
SELECT *
FROM INVENTORY AS I, ORDER_ITEM AS OI
WHERE I.SKU = OI.SKU;

-- 2 
/*
The result shows the total quantity ordered by Store 10 and 20. From the given data, we are able to identify
that both stores have the same order quantity, and that quantity is 6. With only limited information given, we
need to use this information to get further details on the list of items each store ordered. 
*/
SELECT RO.StoreNumber, SUM(OI.Quantity) AS 'Order Quantity'
	FROM RETAIL_ORDER AS RO
		JOIN ORDER_ITEM AS OI
			ON RO.OrderNumber = OI.OrderNumber
GROUP BY RO.StoreNumber
ORDER BY SUM(OI.Quantity) DESC;

-- 3 
/*
The result shows the quantity on order for each item in the four warehouse locations. The total cost of 
each order item is also listed in the table. From the given data, we can see that there are several items
in warehousue 300 and 400 that do not place another order. This means that these items still have enough 
quantity in the warehouse; thus no additional order is required. One of the reasons that the warehouse 
still have enough stocks for some items may be due to the unpopularity of product in the area, so the 
turnover for that particular product is slower than in the other locations. 
*/
SELECT DISTINCT I.WarehouseID, QuantityOnOrder, OI.SKU, PRICE, PRICE*I.QuantityOnOrder AS 'Total Cost'
	FROM INVENTORY AS I
		JOIN ORDER_ITEM AS OI
			ON I.SKU = OI.SKU
ORDER BY WarehouseID;

-- 4
/*
The result shows all the columns from Inventory and Order Item table. From the given result, we are able 
to identify the item details in every warehouse location. In other words, the data provide us information
of the list of items, quantity on hand, and quantity on order from four of our warehouse locations. Moreover, 
we can also determine the items, order quantity, and total price each customer ordered.
*/
SELECT *
	FROM Inventory AS I
		JOIN ORDER_ITEM AS OI
			ON I.SKU = OI.SKU;

-- 5
/*
The table shows the price and quantity on hand on items that are listed in 2014 SKU catalog. All of these items 
were listed on the website on January 1, 2014. From the given result, we are able to determine that the price
range for these items is between 50 and 300. Moreover, we can also identify that warehouse 300 and 400 has the 
most quantity on hand; thus, this tell us that some of these items are not popular in the area, which result in
slow inventory turnover. 
*/
SELECT I.WarehouseID, QuantityOnHand, CS2014.DateOnWebsite, OI.Price
	FROM CATALOG_SKU_2014 AS CS2014
		JOIN INVENTORY AS I
			ON CS2014.SKU = I.SKU
		JOIN ORDER_ITEM AS OI
			ON I.SKU = OI.SKU
GROUP BY I.WarehouseID, CS2014.DateOnWebsite, OI.Price, I.QuantityOnHand;

-- 6
/*
The table shows a list of items that are available in our four warehouse locations: Atlanta, Chicago,
Bangor, and Seattle. The NULL value in one of the SKU_Description column tells us that there is no 
inventory available in our warehouse in San Francisco. 

Using different types of joins give us different result. LEFT OUTER JOIN returns all the rows from table A,
even if there are no match in table B, while RIGHT OUTER JOIN returns all the rows from table B, even if 
there are no match in table A. As for INNER JOIN, it only returns the row when there is a match in both table. 
*/
SELECT W.WarehouseID, W.WarehouseCity, I.SKU_Description
FROM WAREHOUSE AS W
		LEFT OUTER JOIN INVENTORY AS I
			ON W.WarehouseID = I.WarehouseID
ORDER BY W.WarehouseID;









	 


