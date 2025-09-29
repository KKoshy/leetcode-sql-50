SELECT
    Info.student_id AS student_id,
    Info.student_name AS student_name,
    Info.subject_name AS subject_name,
    COUNT(Examinations.subject_name) AS attended_exams
FROM (
    SELECT *
    FROM Students
    CROSS JOIN Subjects
    ) AS INFO
LEFT JOIN Examinations
ON 
    Info.student_id=Examinations.student_id AND
    Info.subject_name=Examinations.subject_name
GROUP BY 
    Info.student_id, 
    Info.student_name, 
    Info.subject_name;