DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS visits;


CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    city VARCHAR(100)
);

CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    arrival_datetime TIMESTAMP NOT NULL,
    triage_level VARCHAR(20),
    symptoms VARCHAR(255),
    diagnosis VARCHAR(100),
    treatment_start_datetime TIMESTAMP,
    discharge_datetime TIMESTAMP,
    visit_status VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);



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


