/*=========================================================
 04_advanced_analytics.sql
 Air Traffic Passenger Analysis
=========================================================*/

USE AirTrafficAnalysis;
/*---------------------------------------------------------
 Airline Ranking by Passenger Traffic
---------------------------------------------------------*/

SELECT
    Operating_Airline,
    SUM(Passenger_Count) AS TotalPassengers,
    RANK() OVER (
        ORDER BY SUM(Passenger_Count) DESC
    ) AS AirlineRank
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Operating_Airline
ORDER BY AirlineRank;


/*---------------------------------------------------------
 Top 10 International Airlines
---------------------------------------------------------*/

SELECT TOP 10
    Operating_Airline,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE GEO_Summary = 'International'
GROUP BY Operating_Airline
ORDER BY TotalPassengers DESC;


/*---------------------------------------------------------
 Top 10 Domestic Airlines
---------------------------------------------------------*/

SELECT TOP 10
    Operating_Airline,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE GEO_Summary = 'Domestic'
GROUP BY Operating_Airline
ORDER BY TotalPassengers DESC;


/*---------------------------------------------------------
 Monthly Passenger Trend
---------------------------------------------------------*/

SELECT
    YEAR(Activity_Period_Start_Date) AS Year_,
    MONTH(Activity_Period_Start_Date) AS Month_,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY
    YEAR(Activity_Period_Start_Date),
    MONTH(Activity_Period_Start_Date)
ORDER BY Year_, Month_;


/*---------------------------------------------------------
 Yearly Passenger Trend
---------------------------------------------------------*/

SELECT
    YEAR(Activity_Period_Start_Date) AS Year_,
    SUM(Passenger_Count) AS TotalPassengers
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY YEAR(Activity_Period_Start_Date)
ORDER BY Year_;


/*---------------------------------------------------------
 Running Total Passengers
---------------------------------------------------------*/

SELECT
    Activity_Period_Start_Date,
    SUM(Passenger_Count) AS DailyPassengers,
    SUM(SUM(Passenger_Count))
        OVER (
            ORDER BY Activity_Period_Start_Date
        ) AS RunningTotal
FROM dbo.Air_Traffic_Passenger_Statistics
GROUP BY Activity_Period_Start_Date
ORDER BY Activity_Period_Start_Date;


/*---------------------------------------------------------
 Year-over-Year Growth
---------------------------------------------------------*/

WITH YearlyTraffic AS
(
    SELECT
        YEAR(Activity_Period_Start_Date) AS Year_,
        SUM(Passenger_Count) AS TotalPassengers
    FROM dbo.Air_Traffic_Passenger_Statistics
    GROUP BY YEAR(Activity_Period_Start_Date)
)

SELECT
    Year_,
    TotalPassengers,
    LAG(TotalPassengers)
        OVER (ORDER BY Year_) AS PreviousYear,
    ROUND(
        (
            TotalPassengers -
            LAG(TotalPassengers)
                OVER (ORDER BY Year_)
        ) * 100.0
        /
        NULLIF(
            LAG(TotalPassengers)
                OVER (ORDER BY Year_),
            0
        ),
        2
    ) AS GrowthPercent
FROM YearlyTraffic
ORDER BY Year_;


/*---------------------------------------------------------
 Most Active Airline in Each Region
---------------------------------------------------------*/

WITH RegionRanking AS
(
    SELECT
        GEO_Region,
        Operating_Airline,
        SUM(Passenger_Count) AS TotalPassengers,
        RANK() OVER
        (
            PARTITION BY GEO_Region
            ORDER BY SUM(Passenger_Count) DESC
        ) AS RegionRank
    FROM dbo.Air_Traffic_Passenger_Statistics
    GROUP BY
        GEO_Region,
        Operating_Airline
)

SELECT *
FROM RegionRanking
WHERE RegionRank = 1
ORDER BY GEO_Region;

/*---------------------------------------------------------
 Top Airline per Terminal
---------------------------------------------------------*/

WITH TerminalRanking AS
(
    SELECT
        Terminal,
        Operating_Airline,
        SUM(Passenger_Count) AS TotalPassengers,
        RANK() OVER
        (
            PARTITION BY Terminal
            ORDER BY SUM(Passenger_Count) DESC
        ) AS TerminalRank
    FROM dbo.Air_Traffic_Passenger_Statistics
    GROUP BY
        Terminal,
        Operating_Airline
)

SELECT *
FROM TerminalRanking
WHERE TerminalRank = 1
ORDER BY Terminal;
