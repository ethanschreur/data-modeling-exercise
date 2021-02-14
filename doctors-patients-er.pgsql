DROP DATABASE IF EXISTS doctors_patients_er;

CREATE DATABASE doctors_patients_er;

\c doctors_patients_er


CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients(id),
  doctor_id INTEGER REFERENCES doctors(id)
);

CREATE TABLE illnesses (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE diagnoses (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients(id),
  doctor_visit_id INTEGER REFERENCES visits(id),
  illness_id INTEGER REFERENCES illnesses(id)
);

