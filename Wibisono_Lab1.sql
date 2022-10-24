/*
SQL Lab #1
Tiffany Wibisono
*/

USE master;

--1
/*
The result returns all data from the SKU_Data table. The table provides detailed 
information on the SKU, descpription of SKU, department of product, as well as the 
name of the customer.
*/
SELECT *
FROM SKU_DATA;

--2 
/*
The result lists out all the locations of our warehouse based on the city and state.
The result has shown that we have five warehouses in five different locations: 
Atlanta (GA), Chicago (IL), Bangor (ME), Seattle (WA), and San Francisco (CA). 
*/
SELECT WarehouseCity, WarehouseState
FROM WAREHOUSE;

--3
/*
The result lists out the name of customers along with information of the SKU 
and the department of the product purchased. Based on the result, we 
have four customers: Pete Hansen, Nancy Meyers, Cindy Lo, and Jerry Martin.
The data enables us to identify which our recurring customers. By being our
loyal customer, we can offer them special price or bonus on their next 
purchase. 
*/
SELECT SKU, Department, Buyer
FROM SKU_DATA; 

--4 
/*
The result lists out the unique products and their details based on our inventory.
From the given result, there are five products in our inventory: dive mask,
half-dome, light fly climibing, locking carabiner, and std. scuba tank. From 
here, we can identify the current products we are selling, and 
be able to figure out what other new products may be introduced to customers. 
*/
SELECT DISTINCT SKU_Description
FROM INVENTORY;

--5 
/*
The result determines the department for each unique product from 2013 catalog. The 
result shows that majority of the unique products in 2013 comes from the water sports 
department.The unique products from the water sports department are dive mask in small
and medium (clear colour) and std. scuba tank in yellow, dark green, light green, and 
yellow color. Aside from water sports department, we also have unique products from 
camping and climbing department. In the camping department, we have half-dome tent 
vestibule, while in the climbing department, we have light fly climbing harness and 
locking carabiner in oval shape.  
*/
SELECT DISTINCT Department, SKU_Description
FROM CATALOG_SKU_2013;

--6
/*
The table shows the top 10 rows in the inventory table. Based on the given 
result, we currently ran out of SKU 101100 item. We should consider restocking 
the item as soon as possible before customers begin to be dissapointed because 
of the long delay. On the other hand, SKU 302000 has 1000 Quantity on hand, which
has the most stocked item among the other nine SKU. 
*/
SELECT TOP 10 QuantityOnHand, SKU
FROM INVENTORY;

--7 
/*
The table shows all the data from Catalog SKU 2014. For items posted on the website 
on August 2014, they were not listed in the catalog. All of these items were from the 
water sport department. We should consider updating the catalog for these missing items. 
However, for items posted on the website on January 2014, the data was arranged according 
to the department. In other words, for water sports department, it is placed between page 
23 and 26; for camping department, it is placed on page 46; for climbing department, it is 
placed between page 77 and 79.
*/
SELECT *
FROM CATALOG_SKU_2014
ORDER BY CatalogPage;

--8
/*
The table result shows the price of each SKU arranged from the cheapest to the most 
expensive. The price range for these SKU is between 50.00 and 300.00. This result enable 
us to identify our company's most and least affordable product. If we find out that the
price is too high or too low, we may consider adjusting the price. To do so, we need to 
set up a meeting with people from departments (such as production and purchasing team) to 
ensure profitibaility. 
*/
SELECT Price, SKU
FROM ORDER_ITEM
ORDER BY Price ASC;

--9 
/*
The result tells the name of each manager in each warehouse of every city along 
with the size of warehouse measured in squarefeet. From the given size of the warehouse, 
it can be said that San Francsisco has the most items stocked in the warehouse and Chicago 
has the least one because the bigger the size of the warehouse, the more items we can stock. 
Having the name of managers listed on the table allow us to easily contact them whenever is 
needed.
*/
SELECT WarehouseCity, Manager, SquareFeet
FROM WAREHOUSE
ORDER BY SquareFeet DESC;

--10
/*
The result shows a table with a list of quanitity on hand and quantity on order and SKU from the 
Inventory table. The quantity on hand is arranged in ascending order while the quantity on
order is arranged in descending order. Here, we are able to determine the number of products for each 
SKU that are ready and are still on order process. 
*/
SELECT QuantityOnHand, QuantityOnOrder, SKU
FROM INVENTORY
ORDER BY QuantityOnHand ASC, QuantityOnOrder DESC;



