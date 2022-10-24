/*
SQL Lab #2
Tiffany Wibisono
*/

USE master;

--1
/*
This query returns the SKU descriptions from the 2014 catalog that 
are listed in the Water Sports department.The result shows a list of 
products and their colors that are sold in the Water Sports department. 
From this, we are able to identify our existing products in the department, 
and also able to consider adding new items that are not listed there. 
*/
SELECT SKU_Description
FROM CATALOG_SKU_2014
WHERE Department = 'Water Sports';

--2 
/*
The result of this query returns the SKU and SKU description from catalog 
SKU 2015, specifically for items listed on the website on April 1, 2015. 
*/
SELECT DISTINCT SKU, SKU_Description
FROM CATALOG_SKU_2015
WHERE DateOnWebSite = '04/01/2015';

--3
/*
The result of this query only returns the name of cities of our warehouse 
location whose size is greater than 150,000 squarefeet.
*/
SELECT WarehouseCity
FROM WAREHOUSE
WHERE SquareFeet > 150000;

--4
/*
The table lists out all the details from the inventory table with a 
specification of  warehouseID of 300 and with at least 301 items on 
our hand. With the given result, we are able to determine that the 
Dive Mask in clear color (medium size) and Locking Carabiner in oval 
shape have the most number of quantity on hand at Bangor warehouse. 
*/
SELECT *
FROM INVENTORY
WHERE WarehouseID = 300 AND QuantityOnHand > 300;

--5
/*
The result of this query returns all the data from the 2013 catalog 
only for items listed between page 31 and 78, and items that are not 
listed in the catalog. From the given result, one-third of the items 
were not in the catalog, so we should try to reach out the person in 
charge of creating the catalog as soon as possible to include items 
that have not been listed; otherwise, with data in catalog differ from
items listed on the website, it may lead to confusion and serious error
in our inventory in the future. 
*/
SELECT *
FROM CATALOG_SKU_2013
WHERE CatalogPage > 30 OR CatalogPage IS NULL
ORDER BY Department;

--6
/*
The result only lists out the data from the Order Item table where 
each order number has only one item and the value is not 300. 
*/
SELECT *
FROM ORDER_ITEM
WHERE Quantity = 1 AND Price <> 300;

--7
/*
The table shows Std. Scuba Tank in yellow and Half-dome Tent Vestibule
are the only items in the Intentory Table that has no pending orders 
and the quantity on hand is below 200. These items are located in Bangor,
our second largest warehouse in the country.
*/
SELECT *
FROM INVENTORY
WHERE QuantityOnHand < 200 AND QuantityOnOrder = 0;

--8
/*
The table shows the a detailed list of our top two largest warehouses. 
The result tells us that the current warehouse manager at Bangor and 
San Francisco are Bart Evans and Grace Jefferson, respectively. If there
is an emergency, we can refer to this table quickly to determine who 
is the person we can reach out to.
*/
SELECT *
FROM WAREHOUSE
WHERE WarehouseCity NOT IN ('Atlanta', 'Chicago', 'Seattle');

--9
/*
The result shows a detailed list of data from 2013 SKU Catalog between 
page 20 and 45. The table tells us that the all of these items were 
published on the wbesite on January 1, 2013, and they are items in the 
Water Sports and Camping department.
*/
SELECT *
FROM CATALOG_SKU_2013
WHERE CatalogPage BETWEEN 20 AND 45
ORDER BY CatalogPage;

--10
/*
The table shows a result from the 2014 SKU Catalog telling us that one of 
our items in 2014 was not listed in the catalog. To specify this item, it
is the Std. Scuba Tank in dark blue (SKU 100400).
*/
SELECT DISTINCT SKU, SKU_DESCRIPTION
FROM CATALOG_SKU_2014
WHERE CatalogPage IS NULL;
