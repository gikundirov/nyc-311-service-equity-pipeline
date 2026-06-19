-- ============================================
-- File: 04_complaint_analysis.sql
-- Project: NYC 311 Service Equity Pipeline
-- Purpose:
-- Analyze which complaint types are most common
-- and which ones create the highest workload.
-- ============================================


-- 1. Top 10 complaint types by volume
SELECT
    complaint_type,
    COUNT(*) AS complaint_count
FROM nyc_311_requests
GROUP BY complaint_type
ORDER BY complaint_count DESC
LIMIT 10;


-- 2. Complaint type share of total complaints
SELECT
    complaint_type,
    COUNT(*) AS complaint_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM nyc_311_requests), 2) AS complaint_share_percent
FROM nyc_311_requests
GROUP BY complaint_type
ORDER BY complaint_count DESC
LIMIT 10;


--- 3. Number 1 complaint type in each borough
SELECT
    borough,
    complaint_type,
    complaint_count
FROM (
    SELECT
        borough,
        complaint_type,
        COUNT(*) AS complaint_count,
        ROW_NUMBER() OVER (
            PARTITION BY borough
            ORDER BY COUNT(*) DESC
        ) AS rank_number
    FROM nyc_311_requests
    GROUP BY borough, complaint_type
)
WHERE rank_number = 1
ORDER BY complaint_count DESC;


-- 4. Top 10 complaint types with highest average resolution time
SELECT
    complaint_type,
    COUNT(*) AS complaint_count,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY complaint_type
ORDER BY avg_resolution_hours DESC
LIMIT 10;


-- 5. Common complaint types that are also slow
SELECT
    complaint_type,
    COUNT(*) AS complaint_count,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY complaint_type
HAVING COUNT(*) >= 100
ORDER BY avg_resolution_hours DESC
LIMIT 10;