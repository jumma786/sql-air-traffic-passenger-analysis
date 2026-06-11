/*=========================================================
 03_business_analysis.sql
 Air Traffic Passenger Analysis
=========================================================*/

USE AirTrafficAnalysis;
GO

/*---------------------------------------------------------
 Total Passenger Traffic
---------------------------------------------------------*/

SELECT
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics;
GO

/*---------------------------------------------------------
 Top 10 Airlines by Passenger Traffic
---------------------------------------------------------*/

SELECT TOP 10
    Operating_Airline,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Operating_Airline
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Top GEO Regions
---------------------------------------------------------*/

SELECT
    GEO_Region,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY GEO_Region
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Domestic vs International Traffic
---------------------------------------------------------*/

SELECT
    GEO_Summary,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY GEO_Summary
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Passenger Traffic by Terminal
---------------------------------------------------------*/

SELECT
    Terminal,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Terminal
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Passenger Traffic by Boarding Area
---------------------------------------------------------*/

SELECT
    Boarding_Area,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Boarding_Area
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Passenger Traffic by Activity Type
---------------------------------------------------------*/

SELECT
    Activity_Type_Code,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Activity_Type_Code
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Passenger Traffic by Price Category
---------------------------------------------------------*/

SELECT
    Price_Category_Code,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Price_Category_Code
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Top 10 Published Airlines
---------------------------------------------------------*/

SELECT TOP 10
    Published_Airline,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Published_Airline
ORDER BY TotalPassengers DESC;
GO

/*---------------------------------------------------------
 Top 10 Airline + Region Combinations
---------------------------------------------------------*/

SELECT TOP 10
    Operating_Airline,
    GEO_Region,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY
    Operating_Airline,
    GEO_Region
ORDER BY TotalPassengers DESC;
GO