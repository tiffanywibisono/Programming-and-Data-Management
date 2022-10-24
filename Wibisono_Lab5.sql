/*
SQL Lab #5
Tiffany Wibisono
*/

USE CapeCodd;

--1
/*
The result shows that we ordered a total of six small, clear colored dive
mask. With only limited information given, we have to use this information 
to locate to which warehouse this item is delivered.
*/
SELECT SUM(Quantity) AS AmtItems
FROM ORDER_ITEM
WHERE SKU IN 
	(SELECT SKU
	FROM INVENTORY
	WHERE SKU_Description = 'Dive Mask, Small Clear');

--2
/*
The query returns the WarehouseID (renamed as MidBookWarehouseID) from the
inventory table. The result tells us that warehouse 100, 200, 300, and 400 
are listed in 2014 catalog in between page 24 and 70. 
*/
SELECT DISTINCT WarehouseID AS MidBookWarehouseIDs
FROM INVENTORY
WHERE SKU_Description IN 
	(SELECT SKU_Description
	FROM CATALOG_SKU_2014
	WHERE CatalogPage BETWEEN 24 AND 70);

--3
/*
The query returns the name of manager, city, and state from the Warehouse
table. The result only returns result where there is camping department 
items in the warehouse. From the given result, we are able to distinguish 
that camping department items are only available in four of our warehouse
locations: Bangor, Seattle, Atlanta, and Chicago. If we would like to check
on the stock level of our camping department items, we could contact each of
the warehouse manager listed on the table. 
*/
SELECT Manager, WarehouseCity, WarehouseState
FROM WAREHOUSE
WHERE WarehouseID IN
	(SELECT WarehouseID
	FROM INVENTORY
	WHERE SKU_Description IN (
		SELECT SKU_Description
		FROM SKU_DATA
		WHERE Department = 'Camping'))
ORDER BY Manager, WarehouseCity, WarehouseState;

--4
/*
The table lists out the name of buyer, SKU, and total quantity on order. The 
Total QuantityOnOrder column enable us to determine the quantity we are 
expecting to recieve for each item. If we do not receive the item as expected,
we can refer to this table to track down who was incharged of ordering that 
particular item, and ask him/her to contact the seller to file a complain
or ask for clarification. 
*/
SELECT Buyer, SKU,
	(SELECT SUM(QuantityOnOrder)
	FROM INVENTORY
	WHERE INVENTORY.SKU = SKU_DATA.SKU) AS 'Total QuantityOnOrder'
FROM SKU_DATA
ORDER BY Buyer;