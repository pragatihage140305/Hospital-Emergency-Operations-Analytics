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

INSERT INTO patients
(patient_id, patient_name, age, gender, city)
VALUES 
1,Aarav Sharma,25,Male,Nagpur
2,Ananya Patil,32,Female,Pune
3,Rohan Deshmukh,45,Male,Nagpur
4,Priya Joshi,28,Female,Amravati
5,Vivek Kulkarni,56,Male,Nagpur
6,Neha Singh,39,Female,Pune
7,Aditya More,19,Male,Akola
8,Sneha Shah,63,Female,Nagpur
9,Rahul Pawar,41,Male,Amravati
10,Pooja Verma,35,Female,Akola
11,Omkar Jadhav,52,Male,Nagpur
12,Isha Gupta,24,Female,Pune
13,Sameer Khan,47,Male,Nagpur
14,Kavya Nair,31,Female,Akola
15,Abhishek Yadav,68,Male,Amravati
16,Meera Joshi,22,Female,Nagpur
17,Harsh Tiwari,37,Male,Pune
18,Simran Kaur,29,Female,Nagpur
19,Manish Shinde,58,Male,Akola
20,Riya Pawar,43,Female,Amravati


doctor_id,doctor_name,specialization,department
1,Dr. Amit Sharma,Emergency Medicine,Emergency
2,Dr. Priya Patil,Cardiology,Cardiology
3,Dr. Rahul Deshmukh,Orthopedics,Orthopedics
4,Dr. Neha Joshi,Neurology,Neurology
5,Dr. Vikram Kulkarni,General Medicine,General Medicine
6,Dr. Sneha Singh,Pediatrics,Pediatrics
7,Dr. Arjun More,Emergency Medicine,Emergency
8,Dr. Pooja Shah,General Surgery,Surgery
9,Dr. Sameer Khan,Pulmonology,Pulmonology
10,Dr. Kavita Nair,Gynecology,Gynecology



visit_id,patient_id,doctor_id,arrival_datetime,triage_level,symptoms,diagnosis,treatment_start_datetime,discharge_datetime,visit_status
1,1,1,2026-01-05 08:15:00,Medium,Fever and weakness,Viral Fever,2026-01-05 08:35:00,2026-01-05 10:00:00,Discharged
2,2,2,2026-01-05 09:30:00,High,Chest pain,Cardiac Issue,2026-01-05 09:42:00,2026-01-05 12:30:00,Admitted
3,3,3,2026-01-05 10:10:00,Medium,Leg pain,Fracture,2026-01-05 10:45:00,2026-01-05 14:00:00,Discharged
4,4,5,2026-01-05 11:20:00,Low,Stomach pain,Gastritis,2026-01-05 12:05:00,2026-01-05 13:30:00,Discharged
5,5,2,2026-01-05 13:15:00,Critical,Breathing difficulty,Heart Failure,2026-01-05 13:22:00,2026-01-05 18:00:00,Admitted
6,6,6,2026-01-05 14:40:00,Medium,High fever,Infection,2026-01-05 15:10:00,2026-01-05 17:00:00,Discharged
7,7,1,2026-01-05 16:25:00,High,Severe headache,Migraine,2026-01-05 16:40:00,2026-01-05 19:00:00,Discharged
8,8,4,2026-01-05 18:10:00,High,Dizziness,Neurological Disorder,2026-01-05 18:30:00,2026-01-05 21:00:00,Discharged
9,9,9,2026-01-05 19:45:00,Medium,Cough,Bronchitis,2026-01-05 20:20:00,2026-01-05 22:00:00,Discharged
10,10,7,2026-01-05 21:10:00,Critical,Severe injury,Trauma,2026-01-05 21:18:00,2026-01-06 02:00:00,Admitted
11,11,5,2026-01-06 08:40:00,Low,Cold and cough,Common Cold,2026-01-06 09:25:00,2026-01-06 10:30:00,Discharged
12,12,10,2026-01-06 09:15:00,Medium,Abdominal pain,Infection,2026-01-06 09:45:00,2026-01-06 12:00:00,Discharged
13,13,1,2026-01-06 10:30:00,High,High fever,Severe Infection,2026-01-06 10:48:00,2026-01-06 15:00:00,Admitted
14,14,8,2026-01-06 12:20:00,Medium,Arm injury,Fracture,2026-01-06 12:55:00,2026-01-06 15:30:00,Discharged
15,15,4,2026-01-06 14:05:00,Critical,Loss of consciousness,Neurological Emergency,2026-01-06 14:12:00,2026-01-06 20:00:00,Admitted
16,16,6,2026-01-06 15:30:00,Low,Sore throat,Throat Infection,2026-01-06 16:15:00,2026-01-06 17:30:00,Discharged
17,17,9,2026-01-06 17:45:00,Medium,Shortness of breath,Asthma,2026-01-06 18:10:00,2026-01-06 20:00:00,Discharged
18,18,7,2026-01-06 19:20:00,High,Accident injury,Trauma,2026-01-06 19:30:00,2026-01-06 23:00:00,Admitted
19,19,3,2026-01-06 20:40:00,Medium,Back pain,Spinal Injury,2026-01-06 21:15:00,2026-01-06 23:30:00,Discharged
20,20,5,2026-01-06 22:15:00,Low,Headache,Tension Headache,2026-01-06 23:00:00,2026-01-07 00:30:00,Discharged
21,1,1,2026-01-07 08:50:00,Medium,Fever,Viral Fever,2026-01-07 09:20:00,2026-01-07 11:00:00,Discharged
22,3,3,2026-01-07 10:15:00,High,Knee pain,Joint Injury,2026-01-07 10:35:00,2026-01-07 13:00:00,Discharged
23,5,2,2026-01-07 12:40:00,Critical,Chest pain,Heart Attack,2026-01-07 12:47:00,2026-01-07 18:30:00,Admitted
24,8,4,2026-01-07 15:20:00,High,Severe headache,Migraine,2026-01-07 15:45:00,2026-01-07 18:00:00,Discharged
25,10,7,2026-01-07 18:30:00,High,Accident injury,Trauma,2026-01-07 18:42:00,2026-01-07 23:30:00,Admitted



SELECT * FROM patients;
SELECT * FROM doctor;
SELECT * FROM visits;
