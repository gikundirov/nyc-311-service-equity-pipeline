-- ============================================
-- File: 02_kpi_queries.sql
-- Project: NYC 311 Service Equity Pipeline
-- Purpose:
-- Calculate key project metrics for the cleaned
-- NYC 311 service request data.
-- ============================================


-- 1. Total number of complaints
SELECT
    COUNT(*) AS total_complaints
FROM nyc_311_requests;


-- 2. Average resolution time in hours
SELECT
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours
FROM nyc_311_requests;


-- 3. Median-style check using average of middle values is more advanced,
-- so for now we use the cleaned Python output for median analysis.


-- 4. Number of complaint types
SELECT
    COUNT(DISTINCT complaint_type) AS number_of_complaint_types
FROM nyc_311_requests;


-- 5. Number of agencies
SELECT
    COUNT(DISTINCT agency) AS number_of_agencies
FROM nyc_311_requests;


-- 6. Top complaint type
SELECT
    complaint_type,
    COUNT(*) AS complaint_count
FROM nyc_311_requests
GROUP BY complaint_type
ORDER BY complaint_count DESC
LIMIT 1;


-- 7. Borough with the most complaints
SELECT
    borough,
    COUNT(*) AS complaint_count
FROM nyc_311_requests
GROUP BY borough
ORDER BY complaint_count DESC
LIMIT 1;