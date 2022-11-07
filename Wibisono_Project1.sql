/*
Project 1: Excelsior Mobile Report
Tiffany Wibisono
*/

USE ExcelsiorMobile; 

-- The Report Questions (With Visualization):
-- 1 --
-- A 
-- The table shows the first and last names of our customers along with their minute usage, data usage,
-- text usage and total bill. The table is ordered by the customer's full name.
SELECT CONCAT(S.FirstName, ' ', LastName) AS 'Customer Name', B.Total AS 'Total Bill', LMU.Minutes 
AS 'Minutes Usage', DataInMB AS 'Data Usage', Texts AS 'Text Usage'
FROM Subscriber AS S
	JOIN Bill AS B
		ON S.MIN = B.MIN
	JOIN LastMonthUsage AS LMU 
		ON S.MIN = LMU.MIN
ORDER BY CONCAT(S.FirstName, LastName);

-- B 
-- The table shows the average of the minutes, data, texts, and total bills by city.
SELECT S.City, AVG(LMU.Minutes) AS 'Avg. Minutes Usage', AVG(DataInMB) AS 'Avg. Data Usage', 
AVG(Texts) AS 'Avg. Texts', AVG(B.Total) AS 'Avg. Total Bill'
FROM LastMonthUsage AS LMU
	JOIN Bill AS B
		ON LMU.MIN = B.MIN
	JOIN Subscriber AS S
		ON LMU.MIN = S.MIN
GROUP BY S.City;

-- C 
-- The table shows the sum of the minutes, data, texts, and total bills by city.
SELECT S.City, SUM(LMU.Minutes) AS 'Total Minutes Usage', SUM(DataInMB) AS 'Total Data Usage', 
SUM(Texts) AS 'Total Texts', SUM(B.Total) AS 'Sum of Total Bill'
FROM LastMonthUsage AS LMU
	JOIN Bill AS B
		ON LMU.MIN = B.MIN
	JOIN Subscriber AS S
		ON LMU.MIN = S.MIN
GROUP BY S.City;

-- D 
-- The table shows the average of the minutes, data, texts, and total bills by mobile plan.
SELECT S.PlanName, AVG(LMU.Minutes) AS 'Avg. Minutes Usage', AVG(DataInMB) AS 'Avg. Data Usage', 
AVG(Texts) AS 'Avg. Texts', AVG(B.Total) AS 'Avg. Total Bill'
FROM LastMonthUsage AS LMU
	JOIN Bill AS B
		ON LMU.MIN = B.MIN
	JOIN Subscriber AS S
		ON LMU.MIN = S.MIN
GROUP BY S.PlanName;

-- E 
-- The table shows the sum of the minutes, data, texts, and total bills by mobile plan.
SELECT S.PlanName, SUM(LMU.Minutes) AS 'Total Minutes Usage', SUM(DataInMB) AS 'Total Data Usage',
SUM(Texts) AS 'Total Texts', SUM(B.Total) AS 'Sum of Total Bill'
FROM LastMonthUsage AS LMU
	JOIN Bill AS B
		ON LMU.MIN = B.MIN
	JOIN Subscriber AS S
		ON LMU.MIN = S.MIN
GROUP BY S.PlanName;
	


-- The Report Questions (Without Visualization):
-- 1 --
-- A
-- The result lists the two cities that has has the most number of customers.
SELECT TOP 2 City
FROM Subscriber
GROUP BY City
ORDER BY COUNT(City) DESC;

-- B 
-- The result lists out the three cities that has the least number of customers. This data is beneficial
-- for the marekting department to determine which cities they should increase their marketing in.
SELECT TOP 3 City
FROM SUBSCRIBER
GROUP BY City
ORDER BY COUNT(CITY) ASC;

-- C 
-- The result returns the PlanName that is used by most of our customers. This data helps the marketing 
-- department to identify which PlanName should they offer to customers during their marketing.
SELECT Top 1 PlanName
FROM Subscriber
GROUP BY PlanName
ORDER BY COUNT(PlanName) DESC;

-- 2 --
-- A 
-- The table returns the types of cell phone along with the number customers using that cell phone.
SELECT Type, COUNT(Type) AS 'No. of Users'
FROM Device
GROUP BY Type;

-- B
-- The table lists the the full name of customers who use the phone type that is least used by our 
-- customers. The purpose of collecting this data is to help the marketing department to send 
-- them promotion for their friends and family.
SELECT CONCAT(FirstName, ' ', LastName) AS 'Apple Users'
FROM Subscriber
WHERE MDN IN
	(SELECT MDN
	FROM DirNums
	WHERE IMEI IN
		(SELECT IMEI
		FROM Device
		WHERE Type = 'Apple'))
ORDER BY FirstName;

-- C
-- The table returns the customers' full name and the year of their phone released, specifically for
-- phones released before 2017. The result is arranged by the Year Released in descending order.
SELECT CONCAT(S.FirstName, ' ', LastName) As 'Customer Name', D.YearReleased 
FROM Subscriber AS S
	JOIN DirNums AS DN
		ON S.MDN = DN.MDN
	JOIN Device AS D
		ON DN.IMEI = D.IMEI
WHERE YearReleased < 2018
ORDER BY YearReleased DESC;

-- 3 -- 
/*
Now we are trying to figure out if our customers are using our data plans efficiently. We have unlimited 
plans that throttle the data at specific limits and then there are plans for caps on data usage. We want 
to know ultimately if there is a city that uses a lot of data (within the top 3 data using cities) but 
none of our customers in that city are using the Unlimtied Plans. If there is a city like that, which one
is that? **You may use more than one query for this question.
*/
-- A
-- The query returns the top 3 cities that have the highest minutes usage.
SELECT TOP 3 S.City
FROM Subscriber AS S
	JOIN LastMonthUsage AS LMU
		ON S.MIN = LMU.MIN
GROUP BY S.City
ORDER BY SUM(LMU.DataInMB) DESC;

-- B
-- The table shows the Type of Data subscribed by customers in the top 3 cities listed in part A.
SELECT S.City, MP.Data
FROM Subscriber AS S
	JOIN MPlan AS MP
		ON S.PlanName = MP.PlanName
WHERE S.City = 'Olympia'
	OR S.City = 'Bellevue'
		OR S.City = 'Seattle'
ORDER BY S.City;

-- 4--
-- A
-- The result shows the full name of the customr who has the most expensive bill last month.
SELECT TOP 1 CONCAT(S.FirstName, ' ', LastName) AS 'Customer Name'
FROM Subscriber AS S
	JOIN Bill AS B
		ON S.MIN = B.MIN
ORDER BY B.TOTAL DESC;

-- B
-- The results shows the mobile plan used by the customer who paid the highest total bill last month.
SELECT TOP 1 PlanName
FROM Subscriber AS S
	JOIN Bill AS B
		ON S.MIN = B.MIN
ORDER BY B.TOTAL DESC;

-- 5 --
-- A 
-- The table shows the area code and minutes usage column. The result only shows area code that use the
-- most minutes.
SELECT TOP 1 LEFT(DN.MDN, 3) AS 'Area Code', LMU.Minutes AS 'Minutes Usage'
FROM LastMonthUsage AS LMU
	JOIN Subscriber AS S
		ON LMU.MIN = S.MIN
	JOIN DirNums AS DN
		ON S.MDN = DN.MDN
ORDER BY LMU.Minutes DESC;

-- B 
-- The result lists the two cities that have the biggest difference betwen the customers who use smallest 
-- amount of minutes to customers that use the largest. (Use the difference of customers who use less than
-- 200 and customers who use more than 700 minutes.)
SELECT TOP 1 S.CITY
FROM Subscriber AS S
	JOIN LastMonthUsage AS LMU 
		ON S.[MIN] = LMU.[MIN]
WHERE LMU.Minutes < 200
UNION 
SELECT TOP 1 S.CITY
FROM Subscriber AS S
	JOIN LastMonthUsage AS LMU 
		ON S.[MIN] = LMU.[MIN]
WHERE LMU.Minutes > 700;



 
