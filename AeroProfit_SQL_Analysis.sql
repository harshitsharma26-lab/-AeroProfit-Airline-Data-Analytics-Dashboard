CREATE DATABASE aeroprofit;

USE aeroprofit;

USE aeroprofit;

SELECT COUNT(*) AS total_records
FROM flight_profitability;

select * from flight_profitability limit 10;

select 
min(flight_date) as Start_date,
max(flight_date) as End_date
from flight_profitability;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(Ancillary_Revenue IS NULL) AS Missing_Ancillary,
    SUM(Catering_Cost IS NULL) AS Missing_Catering,
    SUM(Handling_Cost IS NULL) AS Missing_Handling
FROM flight_profitability;

SELECT COUNT(DISTINCT Destination) AS Total_Destinations
FROM flight_profitability;


SELECT 
    Aircraft_Type,
    COUNT(*) AS Number_of_Flights
FROM flight_profitability
GROUP BY Aircraft_Type
ORDER BY Number_of_Flights DESC;

SELECT 
    Route_Category,
    COUNT(*) AS Number_of_Flights
FROM flight_profitability
GROUP BY Route_Category
ORDER BY Number_of_Flights DESC;

SELECT 
    Season,
    COUNT(*) AS Number_of_Flights
FROM flight_profitability
GROUP BY Season
ORDER BY Number_of_Flights DESC;


SELECT
    CASE
        WHEN Profit > 0 THEN 'Profitable'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break Even'
    END AS Profitability_Status,
    COUNT(*) AS Number_of_Flights
FROM flight_profitability
GROUP BY Profitability_Status;

SELECT
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    AVG(Profit_Margin) AS Average_Profit_Margin
FROM flight_profitability;

SELECT
    Destination,
    COUNT(*) AS Number_of_Flights,
    SUM(Passengers) AS Total_Passengers,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    AVG(Profit_Margin) AS Average_Profit_Margin
FROM flight_profitability
GROUP BY Destination
ORDER BY Total_Profit DESC;

SELECT
    COUNT(*) AS Total_Flights,
    SUM(Passengers) AS Total_Passengers,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Total_Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin), 2) AS Average_Profit_Margin,
    ROUND(AVG(Load_Factor) * 100, 2) AS Average_Load_Factor
FROM flight_profitability;

SELECT
    Destination,
    COUNT(*) AS Total_Flights,
    SUM(Passengers) AS Total_Passengers,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Total_Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin), 2) AS Avg_Profit_Margin
FROM flight_profitability
GROUP BY Destination
ORDER BY Total_Profit asc;

SELECT
    Aircraft_Type,
    COUNT(*) AS Total_Flights,
    SUM(Passengers) AS Total_Passengers,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Total_Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Load_Factor) * 100, 2) AS Avg_Load_Factor,
    ROUND(AVG(Profit_Margin), 2) AS Avg_Profit_Margin
FROM flight_profitability
GROUP BY Aircraft_Type
ORDER BY Total_Profit DESC;

SELECT
    MONTH(Flight_Date) AS Month_Number,
    MONTHNAME(Flight_Date) AS Month_Name,
    COUNT(*) AS Total_Flights,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Total_Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM flight_profitability
GROUP BY MONTH(Flight_Date), MONTHNAME(Flight_Date)
ORDER BY Month_Number;