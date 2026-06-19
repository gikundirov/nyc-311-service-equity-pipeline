-- ============================================
-- File: 03_borough_analysis.sql
-- Project: NYC 311 Service Equity Pipeline
-- Purpose:
-- Compare complaint volume and resolution time
-- across NYC boroughs.
-- ============================================


-- 1. Complaint volume by borough
SELECT
    borough,
    COUNT(*) AS complaint_count
FROM nyc_311_requests
GROUP BY borough
ORDER BY complaint_count DESC;


-- 2. Average resolution time by borough
SELECT
    borough,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours
FROM nyc_311_requests
GROUP BY borough
ORDER BY avg_resolution_hours DESC;


-- 3. Average resolution time in days by borough
SELECT
    borough,
    ROUND(AVG(resolution_time_days), 2) AS avg_resolution_days
FROM nyc_311_requests
GROUP BY borough
ORDER BY avg_resolution_days DESC;


-- 4. Complaint share by borough
SELECT
    borough,
    COUNT(*) AS complaint_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM nyc_311_requests), 2) AS complaint_share_percent
FROM nyc_311_requests
GROUP BY borough
ORDER BY complaint_share_percent DESC;