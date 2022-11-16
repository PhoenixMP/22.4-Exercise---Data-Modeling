DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db 

CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    specialty VARCHAR(20),
    sex VARCHAR(10)
);
CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    sex VARCHAR(10),
    age INTEGER,
    phone_number VARCHAR(10),
    home_address TEXT
);
CREATE TABLE Medical_conditions (
    id SERIAL PRIMARY KEY,
    condition_name TEXT UNIQUE NOT NULL,
    condition_description TEXT NOT NULL,
    prognosis TEXT NOT NULL
);
CREATE TABLE Medical_history (
    id SERIAL PRIMARY KEY,
    appt_date TEXT,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    diagnosis_1 INTEGER REFERENCES medical_conditions,
    diagnosis_2 INTEGER REFERENCES medical_conditions,
    visit_notes text
);
INSERT INTO doctors (
        title,
        last_name,
        first_name,
        phone_number,
        specialty,
        sex
    )
VALUES (
        'nurse',
        'Bob',
        'Jim',
        '1111111111',
        'pcp',
        'male'
    ),
    (
        'Dr',
        'Jones',
        'Sally',
        '2222222222',
        'family medicine',
        'female'
    );
INSERT INTO patients (
        last_name,
        first_name,
        sex,
        age,
        phone_number,
        home_address
    )
VALUES (
        'James',
        'Jason',
        'male',
        29,
        '1234567890',
        '123 street'
    );
INSERT INTO patients(last_name, first_name, age)
VALUES ('frog', 'little', 7);
INSERT INTO medical_conditions (
        condition_name,
        condition_description,
        prognosis
    )
VALUES (
        'cute',
        'way too cute',
        'nothing can be done'
    ),
    (
        'big heart',
        'person is very kind',
        'needs to self-advocate'
    );
INSERT INTO medical_history (
        appt_date,
        patient_id,
        doctor_id,
        diagnosis_1,
        visit_notes
    )
VALUES ('2022-08-22', 1, 1, 1, 'a good lad'),
    ('2022-10-23', 2, 2, 2, 'was a frog');

Select 
