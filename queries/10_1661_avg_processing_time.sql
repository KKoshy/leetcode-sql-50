--- Columns in select must be a part of group by, otherwise they should be aggregated
SELECT 
    machine_id,
    ROUND(AVG(end_time-start_time), 3) AS processing_time
FROM (
    --- Inner query
    SELECT 
        machine_id, 
        process_id,
        --- The aggregate function MIN/MAX has to be used here to support GROUP BY
        --- otherwise the CASE would apply values to all rows and would cause error
        MIN(CASE WHEN activity_type = "start" THEN timestamp END) AS start_time,
        MIN(CASE WHEN activity_type = "end" THEN timestamp END) AS end_time
    FROM Activity
    --- Grouping by multiple columns criteria
    GROUP BY machine_id, process_id
) AS ProcessingTimes
GROUP BY machine_id;