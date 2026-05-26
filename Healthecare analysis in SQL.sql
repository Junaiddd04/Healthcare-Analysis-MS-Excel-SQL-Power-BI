-- creating database for importing tables --
CREATE DATABASE healthcare;
USE healthcare;

-- Imported the tables using python --

SELECT 
    *
FROM
    admissions;
-- Converting data type of date columns in admissions table -- 
UPDATE admissions 
SET 
    admit_date = STR_TO_DATE(admit_date, '%d-%m-%Y');

ALTER TABLE admissions
MODIFY admit_date DATE;

UPDATE admissions 
SET 
    discharge_date = STR_TO_DATE(discharge_date, '%d-%m-%Y');

ALTER TABLE admissions
MODIFY discharge_date DATE;

-- Creating index for better sql query analysis brcause the dataset is very large --
-- for creating index first i have to convert datatypes of those columns to varchar because i uploaded this data using python so the datatype become text --

-- admission table --
alter table admissions
modify admission_id varchar(50);

create index idx_admissions_admission_id
on admissions(admission_id);

alter table admissions
modify patient_id varchar(50);

create index idx_admissions_patient_id
on admissions(patient_id);

alter table admissions
modify hospital_id varchar(50);

create index idx_admissions_hospital_id
on admissions(hospital_id);

-- billings table --
alter table billings
modify admission_id varchar(50);

create index idx_billings_admission_id
on billings(admission_id);

alter table billings
modify bill_id varchar(50);

create index idx_billings_bill_id
on billings(bill_id);

-- patients table --
alter table patients
modify patient_id varchar(50);


create index idx_patients_patient_id
on patients(patient_id);

-- hospitals table --
alter table hospitals
modify hospital_id varchar(50);

create index idx_hospitals_hospital_id
on hospitals(hospital_id);

-- diagnoses table --
alter table diagnoses
modify admission_id varchar(50);

create index idx_diagnoses_admission_id
on diagnoses(admission_id);

SELECT 
    *
FROM
    diagnoses
LIMIT 100;

-- There are many admission_id that contains more than one diagnoses, so i will keep only the primary diagnoses to keep dataset clean and avoid duplications in admission_id --

-- Creating views for Analysis --

CREATE VIEW diag_category AS
SELECT * FROM
(SELECT *, ROW_NUMBER() OVER(PARTITION BY admission_id) AS rn FROM diagnoses) AS derived
WHERE rn = 1;


-- view for patients admission analysis -- 


CREATE VIEW patient_admissions AS
    SELECT 
        a.admission_id,
        a.patient_id,
        a.hospital_id,
        a.admit_date,
        a.los_days,
        a.admit_type,
        a.ward_type,
        a.discharge_type,
        a.readmitted_30d,
        a.readmitted_7d,
        p.age_group,
        p.gender,
        p.state,
        d.diag_category,
        h.name AS hospital_name,
        h.tier
    FROM
        admissions AS a
            LEFT JOIN
        patients AS p ON a.patient_id = p.patient_id
            JOIN
        hospitals AS h ON a.hospital_id = h.hospital_id
			LEFT JOIN 
		diag_category d ON a.admission_id = d.admission_id;
   

-- view for patient financial analysis --  

CREATE VIEW financial_analysis AS
    SELECT 
        a.admission_id,
        p.patient_id,
        b.bill_id,
        b.total_cost_inr,
        b.govt_subsidy_inr,
        b.out_of_pocket_inr,
        a.readmitted_30d,
        a.readmitted_7d,
        p.bpl_card,
        p.insurance_type
    FROM
        admissions AS a
            JOIN
        billings AS b ON a.admission_id = b.admission_id
            LEFT JOIN
        patients AS p ON a.patient_id = p.patient_id;
  
  
-- View for hospital performance analysis --

CREATE VIEW hospital_performance AS
WITH hospital_performance AS(
SELECT h.hospital_id, h.name AS hospital_name,
COUNT(a.admission_id) AS total_admissions, 
SUM(CASE WHEN a.readmitted_30d = "Yes" THEN 1 ELSE 0 END) AS readmissions_30d,
SUM(CASE WHEN a.readmitted_7d = "Yes" THEN 1 ELSE 0 END) AS readmissions_7d
FROM hospitals AS h 
JOIN admissions AS a ON h.hospital_id = a.hospital_id
GROUP BY h.hospital_id, h.name)

SELECT hospital_id, hospital_name, total_admissions, readmissions_30d, readmissions_7d, 
ROUND(((readmissions_30d/total_admissions)*100),2) AS readmission_rate_30d, 
ROUND(((readmissions_7d/total_admissions)*100),2) AS readmission_rate_7d
FROM hospital_performance;

-- Created relational views and performed analytical SQL transformations to prepare healthcare data for visualization and dashboard analysis in Power BI. --