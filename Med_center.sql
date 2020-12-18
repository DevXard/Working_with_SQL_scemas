-- psql < Med_center.sql

DROP DATABASE IF EXISTS med_db;

CREATE DATABASE med_db;

\c med_db

CREATE TABLE "med_center" (
  "id" SERIAL PRIMARY KEY,
  "patients_id" int,
  "doctor_id" int
);

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "patients_deseases" (
  "id" SERIAL PRIMARY KEY,
  "patient_id" int,
  "deseases_id" int
);

CREATE TABLE "deseases" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "med_center" ADD FOREIGN KEY ("patients_id") REFERENCES "patients" ("id");

ALTER TABLE "med_center" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

ALTER TABLE "patients_deseases" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "patients_deseases" ADD FOREIGN KEY ("deseases_id") REFERENCES "deseases" ("id");


-- connecting all tables
-- SELECT * FROM med_center JOIN doctors ON med_center.doctor_id = doctors.id JOIN patients ON med_center.patients_id = patients.id JOIN patients_deseases AS pd ON pd.patient_id = patients.id JOIN deseases ON pd.deseases_id = deseases.id;
-- INSERT INTO doctors (first_name, last_name)                                                                                                                                                                          
--  VALUES       
--  ('John', 'Doctorian'),
--  ('Bob', 'Medguy');

-- INSERT INTO patients (first_name, last_name) VALUES
-- ('Mat', 'Brown'),
-- ('Billy', 'Brat'),
-- ('Jake', 'Chao'),
-- ('Nik', 'Tali');

-- INSERT INTO deseases (name)
-- VALUES
-- ('influenza'),
-- ('Hight bloodpreacure');
-- INSERT INTO med_center (patients_id, doctor_id)
-- VALUES
-- (1,2),
-- (4,2),
-- (2,1),
-- (3,1);

-- INSERT INTO patients_deseases (patient_id, deseases_id)
-- VALUES
-- (1,1),
-- (2,2),
-- (3,1),
-- (4,1);