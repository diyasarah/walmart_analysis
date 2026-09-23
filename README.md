# walmart_analysis
# 🛒 Walmart Sales Analysis — 2010 to 2012

## 📌 Project Overview

This project analyzes Walmart's historical weekly sales data from **2010 to 2012** to understand sales performance, identify trends and seasonal patterns, compare store-level performance, and examine the relationship between weekly sales and external factors.

The project follows an end-to-end data analytics workflow using **Python, PostgreSQL, and Power BI**, transforming raw retail data into meaningful business insights through data cleaning, exploratory analysis, SQL analysis, and interactive visualization.

---

## 🎯 Business Problem

Walmart operates across multiple stores and generates large volumes of weekly sales data. Understanding how sales performance changes over time and across stores can help identify important business patterns.

The primary objective of this project is to analyze Walmart's sales performance across **2010, 2011, and 2012** and answer key business questions such as:

* How did Walmart's total sales change from 2010 to 2012?
* Which year recorded the highest total sales?
* Which months showed stronger sales performance?
* How did holiday weeks compare with non-holiday weeks?
* Which stores generated the highest total sales?
* What relationship exists between weekly sales and temperature, fuel price, CPI, and unemployment?
* What insights can be derived from historical sales data to support business planning?

---

## 📊 Dataset

**Source:** [Walmart Dataset — Kaggle](https://www.kaggle.com/datasets/yasserh/walmart-dataset)

The dataset contains **6,435 weekly sales records** across **45 Walmart stores**, covering the period from **2010 to 2012**.

### Original Variables

| Column       | Description                                  |
| ------------ | -------------------------------------------- |
| Store        | Store identification number                  |
| Date         | Week/date of the sales record                |
| Weekly_Sales | Weekly sales amount                          |
| Holiday_Flag | Indicates whether the week is a holiday week |
| Temperature  | Temperature during the week                  |
| Fuel_Price   | Fuel price during the week                   |
| CPI          | Consumer Price Index                         |
| Unemployment | Unemployment rate                            |

### Dataset Summary

* **Records:** 6,435
* **Stores:** 45
* **Analysis Period:** 2010–2012
* **Original Variables:** 8

Additional date features such as **Year, Month, Day, and Month_Name** were created during the data preparation stage.

---

## 🛠️ Tools & Technologies

### Python

Used for:

* Data loading
* Data cleaning
* Data exploration
* Feature engineering
* Statistical analysis
* Correlation analysis

### PostgreSQL / SQL

Used for:

* Querying the cleaned dataset
* Calculating business KPIs
* Yearly sales analysis
* Monthly sales analysis
* Store-level analysis
* Holiday vs non-holiday comparison

### Power BI

Used for:

* KPI development
* Interactive visualizations
* Sales trend analysis
* Store performance analysis
* Holiday comparison
* Dashboard development

---

## 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning & Preparation
     ↓
Feature Engineering
     ↓
Exploratory Data Analysis using Python
     ↓
Business Analysis using PostgreSQL
     ↓
Interactive Dashboard using Power BI
     ↓
Business Insights
```

---

## 📈 Key Business Insights

### 1. Yearly Sales Performance

Total sales across the three years were:

| Year | Total Sales |
| ---- | ----------: |
| 2010 |     $2.289B |
| 2011 |     $2.448B |
| 2012 |     $2.000B |

**2011 recorded the highest total sales** among the three years, while 2012 recorded the lowest.

---

### 2. Monthly Sales Performance

The analysis of average monthly sales showed stronger sales activity toward the end of the year.

* **December:** $1.282M average monthly sales
* **November:** $1.147M average monthly sales

This highlights the importance of seasonal periods when analyzing Walmart's sales performance.

---

### 3. Holiday vs Non-Holiday Sales

| Category    | Average Weekly Sales |
| ----------- | -------------------: |
| Holiday     |              $1.123M |
| Non-Holiday |              $1.041M |

The historical dataset shows that **average weekly sales were higher during holiday weeks than during non-holiday weeks**.

This observation represents an association in the dataset and does not establish that holidays alone caused the difference.

---

### 4. Store-Level Performance

The dataset contains **45 Walmart stores**.

A Top 10 store analysis was performed to identify stores with the highest total sales. This helps highlight differences in store-level performance and provides a basis for further investigation into factors affecting individual store performance.

---

### 5. External Factors

The relationship between weekly sales and selected external variables was examined using correlation analysis.

| Variable     | Correlation with Weekly Sales |
| ------------ | ----------------------------: |
| Temperature  |                        -0.064 |
| Fuel Price   |                         0.009 |
| CPI          |                        -0.073 |
| Unemployment |                        -0.106 |

The correlations are relatively weak, indicating that none of these individual variables has a strong **linear relationship** with weekly sales in this dataset.

These results should not be interpreted as proof that the variables have no effect on sales, since correlation does not establish causation and other factors may influence sales.

---

## 📊 Power BI Dashboard

The final Power BI dashboard provides an interactive view of Walmart's sales performance.

### Key KPIs

* **Total Sales:** $6.74B
* **Average Weekly Sales:** $1.05M
* **Number of Stores:** 45
* **Holiday Average Sales:** $1.12M
* **Non-Holiday Average Sales:** $1.04M

### Dashboard Analysis

The dashboard includes visualizations for:

* Sales performance by year
* Average sales by month
* Holiday vs non-holiday sales
* Sales by store
* Top 10 stores by total sales
* Sales trend over time
* Temperature vs sales
* Key performance indicators

---

## 💡 Business Value

The analysis demonstrates how historical retail sales data can be converted into business insights.

The findings can support areas such as:

* Sales performance monitoring
* Seasonal planning
* Inventory planning
* Store performance evaluation
* Holiday-period planning
* Resource allocation
* Data-driven decision-making

---

## 📁 Project Structure

```text
Walmart Analysis/
│
├── Data/
│   ├── Raw Data/
│   └── Cleaned Data/
│
├── Notebook/
│   └── Walmart Analysis.ipynb
│
├── SQL/
│   └── Walmart Analysis.sql
│
├── Power BI/
│   └── Walmart Sales Analysis Dashboard.pbix
│
├── Images/
│   └── Dashboard screenshots
│
├── Documentation/
│   └── Project documentation
│
└── README.md
```

---

## 🔍 Key Takeaway

The analysis provides a structured view of Walmart's sales performance across **2010, 2011, and 2012**, highlighting yearly trends, seasonal patterns, holiday performance, store-level differences, and relationships with selected external factors.

This project demonstrates an end-to-end approach to data analytics, from **data preparation and SQL analysis to interactive Power BI reporting**, with a focus on turning historical data into clear and meaningful business insights.

---

## 👩‍💻 Author

**Diya Sarah James**

Aspiring Data Analyst | Python | SQL | Power BI | Excel

---

## 📚 Dataset Source

Kaggle — Walmart Dataset
https://www.kaggle.com/datasets/yasserh/walmart-dataset
