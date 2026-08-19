create database dataco_supply
use dataco_supply
select * from data_co 
RENAME TABLE data_co TO supply_chain;
-- ==========================
-- BASIC QUERIES
-- ==========================

SELECT * FROM supply_chain LIMIT 10;

SELECT COUNT(*) AS Total_Orders
FROM supply_chain;

SELECT COUNT(DISTINCT `Customer Id`) AS Total_Customers
FROM supply_chain;

SELECT DISTINCT `Order Country`
FROM supply_chain;

SELECT SUM(Sales) AS Total_Sales
FROM supply_chain;

SELECT AVG(Sales) AS Average_Sales
FROM supply_chain;

SELECT MAX(Sales) AS Highest_Sale,
MIN(Sales) AS Lowest_Sale
FROM supply_chain;

SELECT *
FROM supply_chain
WHERE `Delivery Status`='Late delivery';

SELECT *
FROM supply_chain
ORDER BY Sales DESC
LIMIT 10;

SELECT `Customer Segment`,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY Orders DESC;


-- ==========================
-- INTERMEDIATE QUERIES
-- ==========================

SELECT `Order Country`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Order Country`
ORDER BY Revenue DESC;

SELECT `Category Name`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Category Name`
ORDER BY Revenue DESC;

SELECT `Department Name`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Department Name`
ORDER BY Revenue DESC;

SELECT `Market`,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY `Market`
ORDER BY Orders DESC;

SELECT `Shipping Mode`,
AVG(`Days for shipping (real)`) AS Avg_Delivery_Days
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY Avg_Delivery_Days DESC;

SELECT `Customer Segment`,
AVG(Sales) AS Avg_Sales
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY Avg_Sales DESC;

SELECT `Order Region`,
SUM(`Order Profit Per Order`) AS Total_Profit
FROM supply_chain
GROUP BY `Order Region`
ORDER BY Total_Profit DESC;

SELECT `Product Name`,
SUM(`Order Item Quantity`) AS Total_Quantity
FROM supply_chain
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC
LIMIT 10;

SELECT `Delivery Status`,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY `Delivery Status`
ORDER BY Orders DESC;

SELECT YEAR(`order date (DateOrders)`) AS Year,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY Year
ORDER BY Year;


-- ==========================
-- ADVANCED QUERIES
-- ==========================

SELECT `Product Name`,
SUM(`Order Profit Per Order`) AS Profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

SELECT `Category Name`,
AVG(`Order Item Discount`) AS Avg_Discount
FROM supply_chain
GROUP BY `Category Name`
ORDER BY Avg_Discount DESC;

SELECT ROUND(
100*SUM(CASE WHEN Late_delivery_risk=1 THEN 1 ELSE 0 END)/COUNT(*),2
) AS Late_Delivery_Percentage
FROM supply_chain;

SELECT MONTH(`order date (DateOrders)`) AS Month_No,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY Month_No
ORDER BY Month_No;

SELECT `Customer Id`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Customer Id`
ORDER BY Revenue DESC
LIMIT 5;

SELECT `Order Country`,
SUM(`Order Profit Per Order`) AS Profit
FROM supply_chain
GROUP BY `Order Country`
ORDER BY Profit DESC;

SELECT `Category Name`,
SUM(`Order Item Discount`) AS Total_Discount
FROM supply_chain
GROUP BY `Category Name`
ORDER BY Total_Discount DESC;

SELECT `Shipping Mode`,
COUNT(*) AS Total_Orders,
AVG(`Days for shipping (real)`) AS Avg_Days
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY Avg_Days DESC;

SELECT `Order Region`,
SUM(Sales) AS Revenue,
SUM(`Order Profit Per Order`) AS Profit
FROM supply_chain
GROUP BY `Order Region`
ORDER BY Profit DESC;

SELECT `Customer Segment`,
SUM(`Order Profit Per Order`) AS Profit
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY Profit DESC;


-- ==========================
-- BUSINESS PROBLEMS
-- ==========================

-- 1. Top Revenue Countries
SELECT `Order Country`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Order Country`
ORDER BY Revenue DESC;

-- 2. Top Profitable Products
SELECT `Product Name`,
SUM(`Order Profit Per Order`) AS Profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

-- 3. Slowest Shipping Mode
SELECT `Shipping Mode`,
AVG(`Days for shipping (real)`) AS Avg_Days
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY Avg_Days DESC;

-- 4. Highest Spending Customer Segment
SELECT `Customer Segment`,
SUM(Sales) AS Revenue
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY Revenue DESC;

-- 5. Categories with Maximum Late Deliveries
SELECT `Category Name`,
SUM(Late_delivery_risk) AS Late_Orders
FROM supply_chain
GROUP BY `Category Name`
ORDER BY Late_Orders DESC;

