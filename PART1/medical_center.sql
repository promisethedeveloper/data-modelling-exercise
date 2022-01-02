DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

DROP TABLE IF EXISTS doctors CASCADE;
DROP TABLE IF EXISTS patients CASCADE;
DROP TABLE IF EXISTS diseases CASCADE;
DROP TABLE IF EXISTS visits CASCADE;
DROP TABLE IF EXISTS diagnosis CASCADE;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    address TEXT NOT NULL,
    insurance TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    patient_id INTEGER NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    disease_id INTEGER NOT NULL REFERENCES diseases,
    visit_id INTEGER NOT NULL REFERENCES visits
);

INSERT INTO doctors (first_name, last_name, specialty) VALUES ('John', 'Greg', 'Pediatrician');
INSERT INTO doctors (first_name, last_name, specialty) VALUES ('Matthew', 'Edwards', 'Optometrist');

INSERT INTO patients (first_name, last_name, address, insurance) VALUES ('Jack', 'Phillips', 'abc uptown road', 'carefirst');
INSERT INTO patients (first_name, last_name, address, insurance) VALUES ('Bob', 'Lewis', 'xyz downtown road', 'patients first');

INSERT INTO diseases (name, description) VALUES ('Covid-19', 'COVID-19 is a disease caused by SARS-CoV-2 that can trigger what doctors call a respiratory tract infection. It can affect your upper respiratory tract (sinuses, nose, and throat) or lower respiratory tract (windpipe and lungs).');
INSERT INTO diseases (name, description) VALUES ('Diabetes', 'Diabetes mellitus refers to a group of diseases that affect how your body uses blood sugar (glucose).');

INSERT INTO visits (doctor_id, patient_id) VALUES (1, 1);
INSERT INTO visits (doctor_id, patient_id) VALUES (1, 2);
INSERT INTO visits (doctor_id, patient_id) VALUES (2, 1);
INSERT INTO visits (doctor_id, patient_id) VALUES (2, 1);

INSERT INTO diagnosis (disease_id, visit_id) VALUES (1, 1);
INSERT INTO diagnosis (disease_id, visit_id) VALUES (2, 2);