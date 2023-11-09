DROP DATABASE IF EXISTS medical_system;

CREATE DATABASE medical_system;

\c medical_system;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    doctor_specialty TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    disease_description TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    patient_insurance TEXT NOT NULL,
    patient_birthday DATE NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    visit_date DATE NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    notes TEXT NOT NULL
);