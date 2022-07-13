-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lAnXhv
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "doctor" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_doctor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patient" (
    "id" int   NOT NULL,
    "fisrt_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    "descriptions" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" int   NOT NULL,
    "doctor_ID" int   NOT NULL,
    "patient_ID" int   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" int   NOT NULL,
    "visit_ID" int   NOT NULL,
    "disease_ID" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "doctor" ADD CONSTRAINT "fk_doctor_id" FOREIGN KEY("id")
REFERENCES "Visits" ("doctor_ID");

ALTER TABLE "patient" ADD CONSTRAINT "fk_patient_id" FOREIGN KEY("id")
REFERENCES "Visits" ("patient_ID");

ALTER TABLE "Diseases" ADD CONSTRAINT "fk_Diseases_id" FOREIGN KEY("id")
REFERENCES "Diagnoses" ("disease_ID");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_id" FOREIGN KEY("id")
REFERENCES "Diagnoses" ("id");

