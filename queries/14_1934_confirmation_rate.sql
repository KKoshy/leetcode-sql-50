ELECT Signups.user_id, IFNULL(rate, 0) AS confirmation_rate 
FROM Signups 
LEFT JOIN ( 
SELECT user_id, ROUND(COUNT(confirmed)/(COUNT(confirmed)+COUNT(timeout)), 2) AS rate  
FROM ( 
    SELECT user_id, 
    (CASE WHEN action = 'timeout' THEN 'timeout' END) AS 'timeout', 
    (CASE WHEN action = 'confirmed' THEN 'confirmed' END) AS 'confirmed' 
    FROM Confirmations 
) AS Info 
GROUP BY user_id 
) AS RateInfo 
ON Signups.user_id = RateInfo.user_id; 