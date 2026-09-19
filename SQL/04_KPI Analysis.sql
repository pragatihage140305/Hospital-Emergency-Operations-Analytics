-- 16. Average waiting time in minutes

SELECT 
    ROUND(
      AVG(
         EXTRACT(EPOCH FROM
		       (treatment_start_datetime  - arrival_datetime)
			   ) / 60
	  ),
	  2
	) AS average_waiting_time_minutes

FROM visits;


-- 17. Average treatment time in minutes

SELECT 
    ROUND(
      AVG(
         EXTRACT(EPOCH FROM
		       (discharge_datetime  - treatment_start_datetime)
			   ) / 60
	  ),
	  2
	) AS average_treatment_time_minutes

FROM visits;

-- 18. Minimum and maximum waiting time

SELECT
    ROUND(
        MIN(
            EXTRACT(EPOCH FROM
                (treatment_start_datetime - arrival_datetime)
            ) / 60
        ),
        2
    ) AS minimum_waiting_time_minutes,

    ROUND(
        MAX(
            EXTRACT(EPOCH FROM
                (treatment_start_datetime - arrival_datetime)
            ) / 60
        ),
        2
    ) AS maximum_waiting_time_minutes
FROM visits;



-- 19. Minimum and maximum waiting time with patient details

SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    p.city,
    v.arrival_datetime,
    v.treatment_start_datetime,
    ROUND(
        EXTRACT(EPOCH FROM
            (v.treatment_start_datetime - v.arrival_datetime)
        ) / 60,
        2
    ) AS waiting_time_minutes
FROM patients p
JOIN visits v
    ON p.patient_id = v.patient_id
ORDER BY waiting_time_minutes;




-- 19. Doctor-wise total visits and workload
SELECT 
   d.doctor_id,
   d.doctor_name,
   d.department,
   COUNT(v.visit_id) AS total_visits
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY 
   d.doctor_id,
   d.doctor_name,
   d.department
ORDER BY total_visits DESC;




-- 20. Department-wise total visits
SELECT 
d.department,
COUNT(v.visit_id) AS total_visits
FROM doctor d
JOIN visits v
ON d.doctor_id = v.doctor_id
GROUP BY d.department
ORDER BY total_visits DESC;


-- 21. Doctor-wise average waiting time
SELECT
    d.doctor_id,
    d.doctor_name,
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM
                (v.treatment_start_datetime - v.arrival_datetime)
            ) / 60
        ),
        2
    ) AS average_waiting_time_minutes
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY d.doctor_id, d.doctor_name
ORDER BY average_waiting_time_minutes DESC;


-- 22. Triage-level-wise average waiting time
SELECT
    triage_level,
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM
                (treatment_start_datetime - arrival_datetime)
            ) / 60
        ),
        2
    ) AS average_waiting_time_minutes
FROM visits
GROUP BY triage_level
ORDER BY average_waiting_time_minutes DESC;


-- 23. Average treatment time by department

SELECT
    d.department,
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM
                (v.discharge_datetime - v.treatment_start_datetime)
            ) / 60
        ),
        2
    ) AS average_treatment_time_minutes
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY d.department
ORDER BY average_treatment_time_minutes DESC;


-- 24. Patients with the longest treatment time
SELECT
    p.patient_id,
    p.patient_name,
    v.visit_id,
    d.department,
    ROUND(
        EXTRACT(EPOCH FROM
            (v.discharge_datetime - v.treatment_start_datetime)
        ) / 60,
        2
    ) AS treatment_time_minutes
FROM patients p
JOIN visits v
    ON p.patient_id = v.patient_id
JOIN doctor d
    ON v.doctor_id = d.doctor_id
ORDER BY treatment_time_minutes DESC
LIMIT 5;

-- 25. Daily visit count

SELECT
    DATE(arrival_datetime) AS visit_date,
    COUNT(*) AS total_visits
FROM visits
GROUP BY DATE(arrival_datetime)
ORDER BY visit_date;

-- 26. Visit status percentage
SELECT 
visit_status,
COUNT(*) AS total_visits,
ROUND(
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM visits),
2
) AS percentage
FROM visits
GROUP BY visit_status
ORDER BY percentage DESC;



-- 27. Diagnosis-wise patient count
SELECT 
diagnosis,
COUNT(DISTINCT patient_id) AS patient_count
FROM visits
GROUP BY diagnosis
ORDER BY patient_count DESC;


-- 28. Top 3 busiest doctors
SELECT
    d.doctor_id,
    d.doctor_name,
    d.department,
    COUNT(v.visit_id) AS total_visits
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY
    d.doctor_id,
    d.doctor_name,
    d.department
ORDER BY total_visits DESC
LIMIT 3;


-- 29. Department-wise doctor workload ranking
SELECT
    d.department,
    d.doctor_id,
    d.doctor_name,
    COUNT(v.visit_id) AS total_visits,
    RANK() OVER (
        PARTITION BY d.department
        ORDER BY COUNT(v.visit_id) DESC
    ) AS workload_rank
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY
    d.department,
    d.doctor_id,
    d.doctor_name
ORDER BY
    d.department,
    workload_rank;
	
-- 30. Hospital overall performance summary
SELECT
    COUNT(*) AS total_visits,

    COUNT(DISTINCT patient_id) AS total_patients,

    COUNT(DISTINCT doctor_id) AS active_doctors,

    ROUND(
        AVG(
            EXTRACT(EPOCH FROM
                (treatment_start_datetime - arrival_datetime)
            ) / 60
        ),
        2
    ) AS average_waiting_time_minutes,

    ROUND(
        AVG(
            EXTRACT(EPOCH FROM
                (discharge_datetime - treatment_start_datetime)
            ) / 60
        ),
        2
    ) AS average_treatment_time_minutes
FROM visits;


