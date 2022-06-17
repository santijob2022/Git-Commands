WITH T1 AS
(SELECT 
 COUNT(*) AS Total_riders
 FROM bigDatasetCSV
)

SELECT 
member_casual,
Total_riders,
COUNT(*) AS by_type,
ROUND((COUNT(*)*100)/(total_riders+0.0), 3) AS percentage

FROM bigDatasetCSV 
JOIN T1

GROUP BY member_casual

LIMIT 10

