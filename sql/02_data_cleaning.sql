/*=========================================================
 02_data_cleaning.sql
 Air Traffic Passenger Analysis
=========================================================*/

USE AirTrafficAnalysis;
GO

/*---------------------------------------------------------
 Check for NULL Values
---------------------------------------------------------*/

SELECT
    SUM(CASE WHEN Activity_Period IS NULL THEN 1 ELSE 0 END) AS Null_ActivityPeriod,
    SUM(CASE WHEN Operating_Airline IS NULL THEN 1 ELSE 0 END) AS Null_OperatingAirline,
    SUM(CASE WHEN GEO_Region IS NULL THEN 1 ELSE 0 END) AS Null_GEORegion,
    SUM(CASE WHEN Passenger_Count IS NULL THEN 1 ELSE 0 END) AS Null_PassengerCount,
    SUM(CASE WHEN Terminal IS NULL THEN 1 ELSE 0 END) AS Null_Terminal
FROM dbo.Air_Traffic_Passenger_Statistics;
GO

/*---------------------------------------------------------
 Check Duplicate Records
---------------------------------------------------------*/

SELECT
    Activity_Period,
    Operating_Airline,
    GEO_Summary,
    Activity_Type_Code,
    Passenger_Count,
    COUNT(*) AS DuplicateCount
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY
    Activity_Period,
    Operating_Airline,
    GEO_Summary,
    Activity_Type_Code,
    Passenger_Count
HAVING COUNT(*) > 1;
GO

/*---------------------------------------------------------
 Check Negative Passenger Counts
---------------------------------------------------------*/

SELECT *
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE Passenger_Count < 0;
GO

/*---------------------------------------------------------
 Distinct GEO Categories
---------------------------------------------------------*/

SELECT DISTINCT GEO_Summary
FROM dbo.Air_Traffic_Passenger_Statistics
ORDER BY GEO_Summary;
GO

/*---------------------------------------------------------
 Distinct Regions
---------------------------------------------------------*/

SELECT DISTINCT GEO_Region
FROM dbo.Air_Traffic_Passenger_Statistics
ORDER BY GEO_Region;
GO

/*---------------------------------------------------------
 Distinct Activity Types
---------------------------------------------------------*/

SELECT DISTINCT Activity_Type_Code
FROM dbo.Air_Traffic_Passenger_Statistics
ORDER BY Activity_Type_Code;
GO

/*---------------------------------------------------------
 Distinct Price Categories
---------------------------------------------------------*/

SELECT DISTINCT Price_Category_Code
FROM dbo.Air_Traffic_Passenger_Statistics
ORDER BY Price_Category_Code;
GO

/*---------------------------------------------------------
 Check Missing Airline Codes
---------------------------------------------------------*/

SELECT *
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE Operating_Airline_IATA_Code IS NULL
   OR Published_Airline_IATA_Code IS NULL;
GO

/*---------------------------------------------------------
 Data Quality Summary
---------------------------------------------------------*/

SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT Operating_Airline) AS TotalAirlines,
    COUNT(DISTINCT GEO_Region) AS TotalRegions,
    MIN(Activity_Period_Start_Date) AS FirstDate,
    MAX(Activity_Period_Start_Date) AS LastDate
FROM dbo.Air_Traffic_Passenger_Statistics;
GO