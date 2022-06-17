WITH T1 AS
(SELECT
COUNT(*) AS total
FROM bigDatasetCSV
)

SELECT 
weekday_start,
member_casual,
COUNT(*) AS total_by_weekday,
ROUND((COUNT(*)*(100+0.0))/(total+0.0), 3) AS percentage
FROM bigDatasetCSV JOIN T1 
GROUP BY weekday_start,member_casual

LIMIT 200

