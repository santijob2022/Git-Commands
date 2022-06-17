WITH T1 AS
(SELECT
strftime("%m",start_date) AS Month1,
COUNT(*) AS total_by_Month
FROM bigDatasetCSV
GROUP BY strftime("%m",start_date)
)

SELECT 
strftime("%m",start_date) AS Month,
total_by_Month,
member_casual,
weekday_start,
COUNT(*) AS by_month_and_type,
ROUND((COUNT(*)*(100+0.0))/(total_by_Month+0.0), 3) AS percentage
FROM bigDatasetCSV JOIN T1 ON Month1 = Month
GROUP BY strftime("%m",start_date), member_casual, weekday_start

LIMIT 200

