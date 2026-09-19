

COPY patients (patient_id, patient_name, age, gender, city)
FROM 'C:\Users\Acer\Desktop\My_Projects\Hospital-Emergency-Operations-Analytics\data'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    QUOTE '"'
);

COPY doctor(doctor_id, doctor_name, specialization, department)
FROM 'C:\Users\Acer\Desktop\My_Projects\Hospital-Emergency-Operations-Analytics'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    QUOTE '"'
);

COPY visits (
    visit_id,
    patient_id,
    doctor_id,
    arrival_datetime,
    triage_level,
    symptoms,
    diagnosis,
    treatment_start_datetime,
    discharge_datetime,
    visit_status
)
FROM 'C:\Users\Acer\Desktop\My_Projects\Hospital-Emergency-Operations-Analytics\data'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    QUOTE '"'
);



SELECT * FROM patients;

SELECT * FROM doctor;

SELECT * FROM visits;


