/*
SQL Lab #4
Tiffany Wibisono
*/

USE CapeCodd;

--1
/*
The table lists out all the months when retail orders were made. From the given result,
it shows that there were two orders placed in December and one in January. If we would
like to have retail orders placed every month, I suggest that we should consider to sell
to more retail stores, and also spend more on advertisement to increase brand awareness.
*/
SELECT LEFT(OrderMonth,3) AS 'Retail Order Months'
FROM RETAIL_ORDER;

--2
/*
The table shows our top two largest warehouse. With only limited information given, we 
have to use this information to get some results on the list of inventory we have from 
each of these locations. 
*/
SELECT UPPER(WarehouseCity) AS CapitalCity
FROM WAREHOUSE
WHERE SquareFeet > 130000;

--3
/*
The result shows that there are seven items listed in the 2013 SKU Catalog. The
table does not provide information on the number of items that are not listed in
the catalog. We should check whether there are items that are not listed there, and
if it is so, we need add them to the catalog as soon as possible. This will prevent 
any confusion when someone is referring back to the catalog in the future. 
*/
SELECT COUNT(*) AS 'No. of Rows'
FROM CATALOG_SKU_2013
WHERE CatalogPage IS NOT NULL; 

--4
/*
The result shows us the total extended price of the the items we ordered. From here, 
we can tell that our cost of goods sold is $1180. With only limited information given, 
we have to use this information to get some results on items that cost the most. 
*/
SELECT SUM(ExtendedPrice) AS 'Total Ext. Price'
FROM ORDER_ITEM;

--5
/*
The result shows the average extended price of our ordered items, specifically 
on price above $100. From this, we are able to tell that the items we ordered
have an average extended price of $243.33. 
*/
SELECT AVG(ExtendedPrice) AS 'Avg Ext. Price'
FROM ORDER_ITEM
WHERE Price > 100;

--6
/*
The table shows the cheapest and most expensive price from our order item
table is $50 and $300, respectively. With only limited information given, we 
have to use this information to get some results on the list of the items that
have the lowest and highest price.
*/
SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM ORDER_ITEM;

--7
/*
The table shows a list of of our warehouse location. It shows that our warehouses
are located in five different states: Georgia, Illinois, Maine, Washington, and 
California. These states are located in all the five different regions around the
United States. Thus, if we would like to add more warehouse location, we would want 
to consider adding another one around the Midwest region because our warehouse in 
Chicago is the smallest among all. I would recommend Detroit, MI because Detroit has 
a large network of transportation routes and is in the central of Midwest.
*/
SELECT WarehouseID, CONCAT(RTRIM(WarehouseCity), ', ', WarehouseState) AS Location
FROM WAREHOUSE
ORDER BY WarehouseID;

--8
/*
The result shows a list of inventory details telling us the quantity of every item
in each warehouse location.
*/
SELECT CONCAT(' We have ', QuantityOnHand, ' of the ', RTRIM(SKU_Description), 
' in warehouse ', WarehouseID) AS 'Inventory Details'
FROM INVENTORY;

--9
-- The result shows the current year.
SELECT DATEPART(YEAR, GETDATE()) AS 'Year';

--10
-- The result shows the the date and time a month from today.
SELECT DATEADD(MONTH, 1, GETDATE()) AS 'Future Date';
