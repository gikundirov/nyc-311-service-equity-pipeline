-- ============================================
-- File: 05_resolution_time_analysis.sql
-- Project: NYC 311 Service Equity Pipeline
-- Purpose:
-- Analyze how long different complaints take to
-- resolve across boroughs, agencies, and complaint
-- types.
-- ============================================


-- ============================================
-- 1. Average resolution time by borough
-- ============================================

SELECT
    borough,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY borough
ORDER BY avg_resolution_hours DESC;


-- ============================================
-- 2. Top 10 slowest complaint types
-- ============================================

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


-- ============================================
-- 3. Average resolution time by agency
-- ============================================

SELECT
    agency,
    COUNT(*) AS total_requests,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours
FROM nyc_311_requests
GROUP BY agency
ORDER BY avg_resolution_hours DESC;


-- ============================================
-- 4. Fastest agencies
-- ============================================

SELECT
    agency,
    COUNT(*) AS total_requests,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours
FROM nyc_311_requests
GROUP BY agency
ORDER BY avg_resolution_hours ASC;


-- ============================================
-- 5. Complaint types with the largest workload
-- and longest resolution time
-- ============================================

SELECT
    complaint_type,
    COUNT(*) AS complaint_count,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY complaint_type
HAVING COUNT(*) >= 500
ORDER BY avg_resolution_days DESC;