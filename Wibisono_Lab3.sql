/*
SQL Lab #3
Tiffany Wibisono
*/

USE master;

--1
/*
The result lists out all the details from the inventory table related 
to Scuba. From the table, we can tell that there are Std Scuba Tank in 
yellow and magenta color at every warehouse except for the one located 
in San Francisco. 
*/
SELECT *
FROM INVENTORY
WHERE SKU_Description LIKE '%Scuba%';

--2
/*
The result shows the items sold to customers based on the order
number. However, the tables only specified items that have an SKU that 
begins with 10. Since SKU that begins with 10 are items from the Water 
Sports department, we are able to determine which client (based on the 
order number) ordered the most from this department. 
*/
SELECT OrderNumber, SKU
FROM ORDER_ITEM
WHERE SKU LIKE '10%';

--3
/*
The table only shows the location of our warehouse where the name 
of the cities ended with E and O. The result tells that these cities
are Chicago, Seattle, and San Francsico. Each of this warehouse has
a manager to be incharge of. Thus, if anything happens, it will 
be easy for us to contact these managers by referring back to the table.
Moreover, the table also specify us the information of the size of 
each warehouse.
*/
SELECT *
FROM WAREHOUSE
WHERE WarehouseCity LIKE '%[EO]'; 

--4
/*
The table shows a list of items that are listed in the 2015 SKU Catalog. 
There are six items listed in the catalog that year which include Dive 
Mask in clear color (small and medium size), Light Fly Climbing Harness, 
Looking Carabiner in oval shape, and Std. Scuba Tank in magenta and yellow
color. From this, we are able to identify what products were sold during the 
year of 2015. 
*/
SELECT DISTINCT SKU_Description AS Item
FROM CATALOG_SKU_2015
WHERE Department <> 'Camping';

--5
/*
The query returns the the SKU, Quantity On Hand (In Stock), and Quantity On
Order (Forthcoming) from the Inventory table. The result shows the number of 
in stock and forthcoming items based on items that has '12' somewhere in the
SKU. The items listed on the table are items based on our four warehouses. 
From the given data, there is one location that have a total of 475 quantity 
in stock for this item, and there is no pending order. With a large number 
of quantity in stock, there might be two possibilites: the first may be because
they just recently stocked up the item, or second, this item is not popular in the
area, which means that the inventory turnover for this specific item is slow.
*/
SELECT SKU, QuantityOnHand AS 'In Stock', QuantityOnOrder AS Forthcoming
FROM INVENTORY
WHERE SKU LIKE '%12%';

--6
/*
The result lists out all the items listed in the Inventory table. From the given 
table, there are eight items available in our inventory which include Dive Mask in
clear color (small and medium size), Half-dome Tent, Half-dome Tent Vestibule, 
Light Fly Climbing Hanress, Locking Carabiner in oval shape, and Std. Scuba Tank in 
magenta and yellow color. With this table, we are able to identify the list of items
we have in our inventory, and might as well think of some items that may be considered 
to be added to the inventory.
*/
SELECT SKU_Description
FROM INVENTORY
GROUP BY SKU_Description;

--7
/*
The result shows the the data from the Retail Order table. From the given data, we
are able to identify that the retail order in 2014 happened in Deceember and the 
retail order in 2015 happened in January. 
*/
SELECT OrderYear AS Year, OrderMonth AS Month
FROM RETAIL_ORDER
GROUP BY OrderYear, OrderMonth;

--8
/*
The table shows the result from the 2014 SKU Catalog. The result tells that 
the items in the Camping and Water Sports department in 2014 was published on 
the webiste on Janaury 1, 2014. 
*/
SELECT Department, DateOnWebSite AS PubDate
FROM CATALOG_SKU_2014
GROUP BY Department, DateOnWebSite;

--9
/*
 The table shows the result from the Order Item table. From the given data, we are
 able to identify the list of clients based on order number that ordered more than
 one SKU from us. With this result, it helps us to keep track of our loyal customers, 
 and we may give them a special offer on their next purchase if they qualify for one. 
*/
SELECT OrderNumber, COUNT (SKU) AS NumberOfSingleItems
FROM ORDER_ITEM
GROUP BY OrderNumber
HAVING COUNT(SKU) > 1;

--10
/*
The table shows the result from the Order Item. In the given result, it 
only specifies order number that has more than one order quantity and has more
than one SKU count. Thus, the result tells us that only order number 2000 
qualifies this specification, and their total order value is 300.00.
*/
SELECT OrderNumber, SUM (ExtendedPrice) AS TotalCost
FROM ORDER_ITEM
WHERE Quantity > 1
GROUP BY OrderNumber
HAVING COUNT (SKU) > 1
