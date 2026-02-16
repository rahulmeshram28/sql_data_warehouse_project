# End-to-End Retail Sales Data Warehouse, Analytics & Visualization (PostgreSQL)

## 📌 Project Overview

This project implements a complete data pipeline using PostgreSQL, starting from raw retail CSV data to structured data warehouse modeling, analytical query development, and business visualization.

The objective is to transform raw transactional data into structured, analytics-ready datasets for business insights and reporting.

---

## 🏗 Data Warehouse Architecture

The project follows a Medallion Architecture approach with three layers:

### Bronze Layer (Raw Data)
- Raw CSV files loaded into PostgreSQL
- No transformations applied
- Serves as source data storage

### Silver Layer (Cleaned & Transformed Data)
- Data cleansing and validation
- Standardized formats and data types
- Null handling and business rule application

### Gold Layer (Analytics-Ready Data)
- Star Schema implementation
- Fact and Dimension tables
- Optimized for analytical queries and reporting

---

## ⭐ Data Model

### Fact Table
- Sales transactions (order details, quantity, sales amount, dates)

### Dimension Tables
- Customers
- Products
- Product Categories
- Date Dimension

The Star Schema design ensures scalability and efficient query performance.

---

## 📊 Data Analytics

SQL queries were developed on the Gold layer to generate business insights, including:

- Total revenue and sales trends
- Product performance analysis
- Customer purchase behavior
- Sales by country
- Order lifecycle analysis

These queries enable structured business reporting and KPI tracking.

---

## 📈 Visualization

The cleaned and structured Gold layer data is used for dashboard development and reporting.

Visualization enables:
- KPI monitoring
- Sales trend analysis
- Customer and product performance tracking
- Business decision support

(Visualization tool used: Power BI )

---

## 🛠 Technologies Used

- PostgreSQL
- SQL
- CSV Data Sources
- Star Schema Modeling
- Medallion Architecture
- Business Intelligence Tool (for visualization)

---

## 🚀 Project Workflow

1. Load raw CSV files into Bronze schema
2. Clean and transform data in Silver schema
3. Build Fact and Dimension tables in Gold schema
4. Perform analytical SQL queries
5. Connect BI tool for dashboard creation

---

## 📌 Project Type

End-to-End Data Warehouse, Analytics & Business Intelligence Implementation
