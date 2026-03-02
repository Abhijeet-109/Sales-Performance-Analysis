# 📊 Sales Performance Analysis

## 📌 Project Overview

This project presents an end-to-end Sales Performance Analysis conducted
using PostgreSQL and Power BI.\
The objective was to simulate a real-world Data Analyst workflow by
transforming raw transactional data into structured business insights
and an executive dashboard.

The analysis focuses on identifying revenue drivers, profitability gaps,
regional performance differences, and time-based growth trends.

------------------------------------------------------------------------

## 🛠 Tools & Technologies

-   **PostgreSQL** -- Database design, schema creation, analytical SQL
    queries
-   **SQL** -- Aggregations, Views, Window Functions, Profit Margin
    Modeling
-   **Power BI** -- Executive dashboard visualization
-   **Data Modeling** -- Structured analytical layer using SQL views

------------------------------------------------------------------------

## 📂 Dataset Information

-   Sample Superstore Sales Dataset\
-   \~9,000+ transaction records\
-   Multi-year sales data (2014--2017)\
-   Key fields include:
    -   Order Date
    -   Region
    -   Category & Sub-Category
    -   Sales
    -   Discount
    -   Profit
    -   Customer Details

------------------------------------------------------------------------

## 🧱 Project Workflow

### 1️⃣ Database & Schema Design

-   Created a structured PostgreSQL database
-   Defined appropriate data types for numeric precision and date
    handling
-   Imported transactional CSV data using controlled schema design

### 2️⃣ SQL Analysis & View Engineering

Developed reusable SQL views to create a clean analytical layer:

-   KPI Summary View
-   Regional Performance View
-   Category & Sub-Category Performance View
-   Monthly Revenue & Profit Trend View

Computed core KPIs: - **Total Revenue:** 2.30M - **Total Profit:**
286K - **Profit Margin:** 12.47% - **Total Orders:** 5,009

### 3️⃣ Business Diagnostics

-   Identified **Central region** as lowest-margin region (7.92%)
-   Detected structural weakness in **Furniture category (2.49%
    margin)**
-   Isolated loss-driving sub-categories such as Tables and Bookcases
-   Quantified impact of higher discounting on profitability
-   Observed strong growth acceleration from 2016--2017

### 4️⃣ Dashboard Development

Built an executive-level Power BI dashboard including:

-   KPI summary section
-   Revenue & Margin by Region
-   Category profitability comparison
-   Monthly revenue & profit trend (2014--2017)
-   Key business insights summary

------------------------------------------------------------------------

## 📈 Key Business Insights

-   Business operates at moderate profitability (12.47% margin)
-   Central region underperforms due to higher discount rates
-   Furniture category significantly drags overall profitability
-   Revenue growth strengthened post-2016
-   Q4 consistently demonstrates peak sales performance

------------------------------------------------------------------------

## 🎯 Business Recommendations

-   Reevaluate discount strategy in Central region
-   Review pricing and cost structure of Furniture products
-   Focus expansion efforts on high-margin categories (Technology,
    Office Supplies)
-   Optimize inventory and marketing efforts around Q4 seasonal spikes

------------------------------------------------------------------------

## 📊 Dashboard Preview

(See /screenshots directory for dashboard image)

------------------------------------------------------------------------

## 🚀 Project Outcomes

This project demonstrates:

-   Strong SQL analytical capability
-   Business performance diagnosis
-   KPI modeling & margin analysis
-   Data storytelling through visualization
-   Executive dashboard design for decision-making

------------------------------------------------------------------------

## 👨‍💻 Author

Abhijeet Lahade\
Data Analyst \| SQL \| Power BI \| Data Analytics
