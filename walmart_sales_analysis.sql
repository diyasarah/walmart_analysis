WALMART SALES ANALYSIS
Data Analyst Portfolio Project
Database: walmart_sales_db

 1. DATA VALIDATION

Check total number of records
SELECT COUNT(*) AS total_rows
FROM public.walmart_sales;

 Check for missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(store) AS missing_store,
    COUNT(*) - COUNT(date) AS missing_date,
    COUNT(*) - COUNT(weekly_sales) AS missing_sales,
    COUNT(*) - COUNT(holiday_flag) AS missing_holiday_flag,
    COUNT(*) - COUNT(temperature) AS missing_temperature,
    COUNT(*) - COUNT(fuel_price) AS missing_fuel_price,
    COUNT(*) - COUNT(cpi) AS missing_cpi,
    COUNT(*) - COUNT(unemployment) AS missing_unemployment
FROM public.walmart_sales;

2. OVERALL SALES ANALYSIS
Total sales
SELECT ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales;

Average weekly sales
SELECT ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales;

 3. STORE PERFORMANCE

Total sales by store
SELECT store, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY total_sales DESC;


 Average weekly sales by store
SELECT store, ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY avg_weekly_sales DESC;


Top 10 stores by total sales
SELECT store, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY total_sales DESC
LIMIT 10;


Lowest 10 stores by total sales
SELECT store, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY total_sales ASC
LIMIT 10;


Store sales ranking
SELECT RANK() OVER (ORDER BY SUM(weekly_sales) DESC) AS sales_rank, store, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY sales_rank;


Sales contribution by store
SELECT store,ROUND(SUM(weekly_sales), 2) AS total_sales,ROUND(SUM(weekly_sales) * 100.0/ SUM(SUM(weekly_sales)) OVER (),2
AS sales_contribution_percent
FROM public.walmart_sales
GROUP BY store
ORDER BY total_sales DESC;

 4. TIME-BASED ANALYSIS

Total sales by year
SELECT year, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY year
ORDER BY year;


Average weekly sales by year
SELECT year, ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY year
ORDER BY year;


Average monthly sales
SELECT
    month,
    month_name,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY month, month_name
ORDER BY month;


 Monthly total sales
SELECT
    month,
    month_name,
    ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY month, month_name
ORDER BY month;


Highest-sales month
SELECT
    month,
    month_name,
    ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY month, month_name
ORDER BY total_sales DESC
LIMIT 1;


Lowest-sales month
SELECT
    month,
    month_name,
    ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY month, month_name
ORDER BY total_sales ASC
LIMIT 1;


Monthly sales by year
SELECT
    year,
    month,
    month_name,
    ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY year, month, month_name
ORDER BY year, month;


Year-over-year sales growth
SELECT
    year,
    ROUND(SUM(weekly_sales), 2) AS total_sales,
    ROUND(
        (
            SUM(weekly_sales)
            - LAG(SUM(weekly_sales)) OVER (ORDER BY year)
        )
        / LAG(SUM(weekly_sales)) OVER (ORDER BY year) * 100,
        2
    ) AS yoy_growth_percent
FROM public.walmart_sales
GROUP BY year
ORDER BY year;


 5. HOLIDAY ANALYSIS

Holiday vs non-holiday average sales
SELECT
    holiday_flag,
    CASE
        WHEN holiday_flag = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS period_type,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY holiday_flag
ORDER BY holiday_flag;

Holiday vs non-holiday sales by store
SELECT
    store,
    CASE
        WHEN holiday_flag = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS period_type,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY store, holiday_flag
ORDER BY store, holiday_flag;

Holiday vs non-holiday sales by store
(Holiday and non-holiday values in separate columns)
SELECT
    store,
    ROUND(
        AVG(CASE WHEN holiday_flag = 1 THEN weekly_sales END),
        2
    ) AS holiday_avg_sales,
    ROUND(
        AVG(CASE WHEN holiday_flag = 0 THEN weekly_sales END),
        2
    ) AS non_holiday_avg_sales
FROM public.walmart_sales
GROUP BY store
ORDER BY store;


Holiday vs non-holiday average sales by year
SELECT
    year,
    CASE
        WHEN holiday_flag = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS period_type,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY year, holiday_flag
ORDER BY year, holiday_flag;


6. STORE PERFORMANCE BY YEAR
Sales by store and year
SELECT
    store,
    year,
    ROUND(SUM(weekly_sales), 2) AS total_sales
FROM public.walmart_sales
GROUP BY store, year
ORDER BY store, year;

 Average sales by store and year
SELECT
    store,
    year,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM public.walmart_sales
GROUP BY store, year
ORDER BY store, year;

Best-performing store in each year
WITH store_year_sales AS (
    SELECT
        year,
        store,
        ROUND(SUM(weekly_sales), 2) AS total_sales
    FROM public.walmart_sales
    GROUP BY year, store
),
ranked_stores AS (
    SELECT
        year,
        store,
        total_sales,
        RANK() OVER (
            PARTITION BY year
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM store_year_sales
)
SELECT
    year,
    store,
    total_sales
FROM ranked_stores
WHERE sales_rank = 1
ORDER BY year;



 7. WEEKLY SALES ANALYSIS
Top 10 highest-selling weeks
SELECT
    store,
    date,
    weekly_sales
FROM public.walmart_sales
ORDER BY weekly_sales DESC
LIMIT 10;


Top 10 lowest-selling weeks
SELECT
    store,
    date,
    weekly_sales
FROM public.walmart_sales
ORDER BY weekly_sales ASC
LIMIT 10;


Highest-selling week for each store
SELECT
    store,
    date,
    weekly_sales
FROM (
    SELECT
        store,
        date,
        weekly_sales,
        RANK() OVER (
            PARTITION BY store
            ORDER BY weekly_sales DESC
        ) AS sales_rank
    FROM public.walmart_sales
) ranked_sales
WHERE sales_rank = 1
ORDER BY store;


8. SALES VARIABILITY


Average sales and sales volatility by store
SELECT
    store,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales,
    ROUND(STDDEV(weekly_sales), 2) AS sales_stddev
FROM public.walmart_sales
GROUP BY store
ORDER BY sales_stddev DESC;

 9. EXTERNAL FACTORS
 Average external factors across the dataset
SELECT
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales,
    ROUND(AVG(temperature), 2) AS avg_temperature,
    ROUND(AVG(fuel_price), 2) AS avg_fuel_price,
    ROUND(AVG(cpi), 2) AS avg_cpi,
    ROUND(AVG(unemployment), 2) AS avg_unemployment
FROM public.walmart_sales;

