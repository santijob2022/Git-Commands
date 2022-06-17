WITH T1 AS
(SELECT
strftime("%m",started_at) AS MonthT1,
COUNT(*) AS total
FROM bigDatasetCSV
GROUP BY strftime("%m",started_at)
)
SELECT
member_casual,
strftime("%m",started_at) AS Month,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>="00:00:00" AND 
       STRFTIME("%H:%M:%S",start_time)<="04:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_0_to_4,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>"04:00:00" AND STRFTIME("%H:%M:%S",start_time)<="08:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_4_to_8,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>"08:00:00" AND STRFTIME("%H:%M:%S",start_time)<="12:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_8_to_12,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>"12:00:00" AND STRFTIME("%H:%M:%S",start_time)<="16:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_12_to_16,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>"16:00:00" AND STRFTIME("%H:%M:%S",start_time)<="20:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_16_to_20,
ROUND((SUM(CASE WHEN STRFTIME("%H:%M:%S",start_time)>"20:00:00" AND STRFTIME("%H:%M:%S",start_time)<="24:00:00" THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS Hours_20_to_24,
total

FROM bigDatasetCSV
JOIN T1 ON MonthT1 = Month
GROUP BY strftime("%m",started_at), member_casual

LIMIT 200