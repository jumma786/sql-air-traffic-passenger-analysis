# ✈️ Air Traffic Passenger Analysis Using SQL Server

## 📌 Project Overview

This project analyzes historical airport passenger traffic data using Microsoft SQL Server and T-SQL. The objective is to uncover business insights related to airline performance, passenger growth, regional traffic distribution, terminal utilization, and the impact of major events such as COVID-19 on air travel demand.

The project demonstrates real-world SQL skills including data cleaning, exploratory analysis, aggregations, window functions, ranking, trend analysis, and business reporting.

---

## 🎯 Business Objectives

* Analyze passenger traffic trends over time.
* Identify the top-performing airlines.
* Compare domestic and international passenger traffic.
* Understand geographic passenger distribution.
* Evaluate terminal and boarding area utilization.
* Measure year-over-year passenger growth.
* Assess the impact of COVID-19 on airport traffic.

---

## 🛠️ Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL
* Git & GitHub

---

## 📂 Project Structure

```text
sql-air-traffic-passenger-analysis
│
├── dataset
│   └── Air_Traffic_Passenger_Statistics.csv
│
├── results
│   └── Air Traffic Passenger Analysis Report.pdf
│
├── screenshots
│
└── sql
    ├── 01_setup.sql
    ├── 02_data_cleaning.sql
    ├── 03_business_analysis.sql
    └── 04_advanced_analytics.sql
```

---

## 📊 Dataset Information

| Metric           |        Value |
| ---------------- | -----------: |
| Records          |       39,926 |
| Airlines         |          139 |
| Regions          |            9 |
| Date Range       |  1999 – 2026 |
| Total Passengers | 1.1+ Billion |

### Key Fields

* Operating Airline
* Published Airline
* GEO Summary
* GEO Region
* Activity Type
* Price Category
* Terminal
* Boarding Area
* Passenger Count
* Activity Period

---

## 🧹 Data Cleaning Performed

* Verified dataset integrity
* Checked for NULL values
* Identified duplicate records
* Validated passenger counts
* Reviewed categorical fields
* Performed data quality assessment

---

## 📈 Business Analysis

### Top Airlines by Passenger Volume

| Airline                    | Passengers |
| -------------------------- | ---------: |
| United Airlines            |     260.0M |
| United Airlines (Pre-2013) |     199.6M |
| American Airlines          |      83.5M |
| SkyWest Airlines           |      82.7M |
| Delta Air Lines            |      71.8M |

### Passenger Traffic by Region

| Region | Passengers |
| ------ | ---------: |
| US     |     842.8M |
| Asia   |     108.9M |
| Europe |      73.0M |
| Canada |      35.0M |
| Mexico |      23.4M |

### Domestic vs International

| Category      | Passengers |
| ------------- | ---------: |
| Domestic      |     842.8M |
| International |     265.1M |

### Terminal Utilization

| Terminal      | Passengers |
| ------------- | ---------: |
| Terminal 3    |     454.0M |
| International |     282.0M |
| Terminal 1    |     261.1M |
| Terminal 2    |     110.8M |

---

## 📉 COVID-19 Impact Analysis

| Year | Passengers |  Growth |
| ---- | ---------: | ------: |
| 2019 |      57.4M |  -0.57% |
| 2020 |      16.4M | -71.41% |
| 2021 |      24.3M | +48.21% |
| 2022 |      42.2M | +73.45% |
| 2023 |      50.1M | +18.79% |

### Key Observation

Passenger traffic dropped by over 71% during the COVID-19 pandemic in 2020 before recovering strongly from 2021 onward.

---

## 🔍 Advanced SQL Techniques Used

* Aggregate Functions
* GROUP BY
* ORDER BY
* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* LAG()
* Running Totals
* Year-over-Year Growth Analysis
* Business KPI Reporting

---

## 💡 Key Business Insights

* United Airlines dominates passenger traffic across most regions and terminals.
* Domestic traffic accounts for approximately 76% of total passenger volume.
* Asia is the largest international passenger market.
* Terminal 3 serves as the airport's primary operational hub.
* Passenger traffic nearly tripled between 1999 and 2019.
* The airport experienced a significant decline during COVID-19 followed by a strong recovery.

---

## 🚀 How to Run

1. Import the CSV dataset into SQL Server.
2. Create the database `AirTrafficAnalysis`.
3. Execute scripts in the following order:

```sql
01_setup.sql
02_data_cleaning.sql
03_business_analysis.sql
04_advanced_analytics.sql
```

4. Review query outputs and compare findings with the project report.

---

## 👨‍💻 Author

**Jumma Mohammad**

GitHub: https://github.com/jumma786

LinkedIn: https://www.linkedin.com/in/jumma-mohammad/

Email: [jummamohammad477@gmail.com](mailto:jummamohammad477@gmail.com)

---

## ⭐ Portfolio Value

This project demonstrates practical SQL skills used by Data Analysts, Business Analysts, and Business Intelligence professionals for transforming raw operational data into actionable business insights.
