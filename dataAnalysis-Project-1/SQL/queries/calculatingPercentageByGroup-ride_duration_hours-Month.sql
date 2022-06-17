WITH T1 AS
(SELECT
strftime("%m",started_at) AS MonthT1,
COUNT(*) AS total
FROM bigDatasetCSV
GROUP by strftime("%m",started_at)
)

SELECT
strftime("%m",started_at) AS Month,
member_casual,
ROUND((SUM(CASE WHEN ride_duration_hours =0 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0",
ROUND((SUM(CASE WHEN ride_duration_hours >0 AND ride_duration_hours <= 0.1 
                THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0_0.1",
ROUND((SUM(CASE WHEN ride_duration_hours >0.1 AND ride_duration_hours <= 0.2  THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.1_0.2", 
ROUND((SUM(CASE WHEN ride_duration_hours >0.2 AND ride_duration_hours <=0.3 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.2_0.3",
ROUND((SUM(CASE WHEN ride_duration_hours >0.3 AND ride_duration_hours <=0.4 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.3_0.4",
ROUND((SUM(CASE WHEN ride_duration_hours >0.4 AND ride_duration_hours <=0.5 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.4_0.5",
ROUND((SUM(CASE WHEN ride_duration_hours >0.5 AND ride_duration_hours <=0.6 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.5_0.6",
ROUND((SUM(CASE WHEN ride_duration_hours >0.6 AND ride_duration_hours <=0.7 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.6_0.7",
ROUND((SUM(CASE WHEN ride_duration_hours >0.7 AND ride_duration_hours <=0.8 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.7_0.8", 
ROUND((SUM(CASE WHEN ride_duration_hours >0.8 AND ride_duration_hours <=0.9 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.8_0.9",
ROUND((SUM(CASE WHEN ride_duration_hours >0.9 AND ride_duration_hours <=1 THEN 1 ELSE 0 END)*(100+0.0))/total,3) AS "ride_0.9_1",
total

FROM bigDatasetCSV
JOIN T1
ON Month = MonthT1
GROUP BY Month, member_casual

LIMIT 200