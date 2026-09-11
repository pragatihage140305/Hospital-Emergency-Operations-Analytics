CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0),
    gender VARCHAR(20),
    city VARCHAR(50)
);

CREATE TABLE doctor (
    doctor_id SERIAL PRIMARY KEY,
	doctor_name VARCHAR(100) NOT NULL,
	specialization VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    arrival_datetime TIMESTAMP NOT NULL,
    triage_level VARCHAR(20),
    symptoms VARCHAR(255),
    diagnosis VARCHAR(100),
    treatment_start_datetime TIMESTAMP,
    discharge_datetime TIMESTAMP,
    visit_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctor(doctor_id)
);

SELECT * FROM patients;
SELECT * FROM doctor;
SELECT * FROM visits;
