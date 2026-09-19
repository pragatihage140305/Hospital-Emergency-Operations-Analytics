-- =========================================================
-- HOSPITAL EMERGENCY OPERATIONS ANALYTICS
-- 03 - ANALYSIS QUERIES
-- =========================================================

-- =========================================================
-- SECTION 1: PATIENT ANALYSIS
-- =========================================================

-- 01. View all patients

SELECT * FROM patients; 

-- 02. Gender-wise patient count

SELECT gender,
COUNT(*) AS total_patients
FROM patients
GROUP BY gender;



-- 03. City-wise patient count

SELECT city,
COUNT(*) AS total_city
FROM patients
GROUP BY city
ORDER BY total_city DESC;


-- 04. Age group-wise patient count

SELECT 
CASE
WHEN age < 18 THEN 'child'
WHEN age BETWEEN 18 AND 59 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY total_patients DESC;

-- =========================================================
-- SECTION 2: DOCTOR & VISIT ANALYSIS
-- =========================================================


-- 05. Department-wise doctor count


-- 06. Total visits

-- 07. Visit status-wise count

-- 08. Triage-level-wise count



-- 09. Doctor-wise visits

-- 10. Patient-wise visits


-- =========================================================
-- SECTION 3: JOIN ANALYSIS
-- =========================================================

Haan 👍 Tum 03_analysis_queries.sql ka updated version chahti ho, jisme ab tak ki queries proper sequence me saved ho.

Abhi tak humne 1–15 queries cover ki hain. 03_analysis_queries.sql me ye rakho:

-- =========================================================
-- HOSPITAL EMERGENCY OPERATIONS ANALYTICS
-- 03 - ANALYSIS QUERIES
-- =========================================================


-- =========================================================
-- SECTION 1: PATIENT ANALYSIS
-- =========================================================

-- 01. View all patients

SELECT *
FROM patients;


-- 02. Gender-wise patient count

SELECT
    gender,
    COUNT(*) AS total_patients
FROM patients
GROUP BY gender;


-- 03. City-wise patient count

SELECT
    city,
    COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC;


-- 04. Age group-wise patient count

SELECT
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY total_patients DESC;


-- =========================================================
-- SECTION 2: DOCTOR & VISIT ANALYSIS
-- =========================================================

-- 05. Department-wise doctor count

SELECT
    department,
    COUNT(*) AS total_doctors
FROM doctor
GROUP BY department
ORDER BY total_doctors DESC;


-- 06. Total visits

SELECT
    COUNT(*) AS total_visits
FROM visits;


-- 07. Visit status-wise count

SELECT
    visit_status,
    COUNT(*) AS visit_count
FROM visits
GROUP BY visit_status
ORDER BY visit_count DESC;


-- 08. Triage-level-wise count

SELECT
    triage_level,
    COUNT(*) AS triage_count
FROM visits
GROUP BY triage_level
ORDER BY triage_count DESC;


-- 09. Doctor-wise visits

SELECT
    doctor_id,
    COUNT(*) AS doctor_visit_count
FROM visits
GROUP BY doctor_id
ORDER BY doctor_visit_count DESC;


-- 10. Patient-wise visits

SELECT
    patient_id,
    COUNT(*) AS patient_visit_count
FROM visits
GROUP BY patient_id
ORDER BY patient_visit_count DESC;


-- =========================================================
-- SECTION 3: JOIN ANALYSIS
-- =========================================================

-- 11. Patient + visit details

SELECT 
p.patient_id,
p.patient_name,
p.age,
p.gender,
v.arrival_datetime,
    v.triage_level,
    v.symptoms,
    v.diagnosis,
    v.visit_status
FROM patients p
JOIN visits v
  ON p.patient_id = v.patient_id;


-- 12. Patient + doctor details

SELECT 
    p.patient_id,
    p.patient_name,
    p.age,
	d.doctor_id,
	d.specialization,
    d.department
FROM patients p
JOIN visits v
  ON p.patient_id = v.patient_id
 JOIN doctor d
   ON v.doctor_id = d.doctor_id;


-- 13. Doctor + department + visits
SELECT
    d.doctor_id,
    d.doctor_name,
    d.specialization,
    d.department,
    v.visit_id,
    v.patient_id,
    v.arrival_datetime,
    v.triage_level,
    v.visit_status
FROM doctor d
JOIN visits v
    ON d.doctor_id = v.doctor_id;



-- 14. Complete hospital visit information
SELECT
    v.visit_id,
    p.patient_id,
    p.patient_name,
    p.age,
    p.gender,
    p.city,
    d.doctor_id,
    d.doctor_name,
    d.specialization,
    d.department,
    v.arrival_datetime,
    v.triage_level,
    v.symptoms,
    v.diagnosis,
    v.treatment_start_datetime,
    v.discharge_datetime,
    v.visit_status
FROM visits v
JOIN patients p
    ON v.patient_id = p.patient_id
JOIN doctor d
    ON v.doctor_id = d.doctor_id;


-- 15. Patients with no visits

SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    p.gender,
    p.city
FROM patients p
LEFT JOIN visits v
    ON p.patient_id = v.patient_id
WHERE v.patient_id IS NULL;
