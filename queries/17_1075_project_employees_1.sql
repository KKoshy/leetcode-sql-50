SELECT project_id, AVG(experience_years) AS average_years
FROM Project
LEFT JOIN Employee
ON Project.employee_id = Employee.employee_id
GROUP BY project_id;