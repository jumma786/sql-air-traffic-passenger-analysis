/*=========================================================
 01_setup.sql
 Air Traffic Passenger Analysis
=========================================================*/

USE AirTrafficAnalysis;
GO

/*---------------------------------------------------------
 Verify Dataset Table
---------------------------------------------------------*/

SELECT TABLE_SCHEMA,
       TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Air_Traffic_Passenger_Statistics';
GO

/*---------------------------------------------------------
 Total Records
---------------------------------------------------------*/

SELECT COUNT(*) AS TotalRows
FROM dbo.Air_Traffic_Passenger_Statistics;
GO

/*---------------------------------------------------------
 Preview Dataset
---------------------------------------------------------*/

SELECT TOP 20 *
FROM dbo.Air_Traffic_Passenger_Statistics;
GO

/*---------------------------------------------------------
 View Table Structure
---------------------------------------------------------*/

EXEC sp_help 'dbo.Air_Traffic_Passenger_Statistics';
GO

/*---------------------------------------------------------
 Column List
---------------------------------------------------------*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Air_Traffic_Passenger_Statistics'
ORDER BY ORDINAL_POSITION;
GO