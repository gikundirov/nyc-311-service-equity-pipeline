-- ============================================
-- File: 06_monthly_trends.sql
-- Project: NYC 311 Service Equity Pipeline
-- Purpose:
-- Analyze monthly complaint trends and resolution
-- times throughout 2024.
-- ============================================


-- ============================================
-- 1. Number of complaints each month
-- ============================================

SELECT
    created_month_name,
    COUNT(*) AS total_complaints
FROM nyc_311_requests
GROUP BY created_month_name
ORDER BY created_month;


-- ============================================
-- 2. Average resolution time by month
-- ============================================

SELECT
    created_month_name,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY created_month_name
ORDER BY created_month;


-- ============================================
-- 3. Median resolution time by month
-- ============================================
-- SQLite does not have a built-in MEDIAN() function.
-- Median analysis is calculated in Python for this project.


-- ============================================
-- 4. Top complaint type each month
-- ============================================

SELECT
    created_month_name,
    complaint_type,
    complaint_count
FROM (

    SELECT
        created_month_name,
        complaint_type,
        COUNT(*) AS complaint_count,

        ROW_NUMBER() OVER (
            PARTITION BY created_month_name
            ORDER BY COUNT(*) DESC
        ) AS rank_number

    FROM nyc_311_requests

    GROUP BY
        created_month_name,
        complaint_type

)

WHERE rank_number = 1

ORDER BY created_month_name;