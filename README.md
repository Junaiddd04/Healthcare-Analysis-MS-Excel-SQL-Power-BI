# Healthcare Readmission & Financial Burden Analysis

## 📌 Project Overview

This project is an end-to-end Healthcare Data Analytics solution built using **MS Excel (Power Query), MySQL, and Power BI**.

The goal of this project was to analyze:

* Patient readmission trends
* Financial burden on patients
* Subsidy effectiveness
* Hospital performance metrics

The project contains:
✅ Data Cleaning & Transformation
✅ SQL Data Management & Views
✅ Power BI Data Modeling
✅ Interactive Dashboards
✅ Business Insights & KPI Analysis

---

# Tech Stack

| Tool                         | Purpose                               |
| ---------------------------- | ------------------------------------- |
| MS Excel (Power Query)       | Data Cleaning & Transformation        |
| MySQL                        | Data Storage & SQL Analysis           |
| Power BI                     | Dashboard Development & Visualization |
| DAX                          | KPI & Measure Calculations            |
| Python (Pandas + SQLAlchemy) | Fast Data Import into MySQL           |

---

# 📂 Dataset Information

The project uses multiple healthcare-related tables:

| Table      | Rows |
| ---------- | ---- |
| Admissions | 120K |
| Patients   | 86K  |
| Diagnoses  | 271K |
| Hospitals  | 33   |
| Billing    | 120K |

---

# 🔄 Project Workflow

## 1️⃣ Data Cleaning in Excel Power Query

Performed complete preprocessing and transformation of raw healthcare data.

### Cleaning Steps:

* Removed null values
* Removed duplicate records
* Standardized categorical values
* Handled inconsistent data
* Created age groups
* Converted data formats
* Validated relationships between tables

### Age Group Categories:

* Infant/Child → 0–5
* Children → 6–12
* Teenager → 13–18
* Adult → 19–45
* Senior Adult → 46–65
* Elderly → 65+

---

# 2️⃣ Data Storage in MySQL

After cleaning, datasets were imported into MySQL database.

### Import Process:

Initially, MySQL Workbench import wizard was very slow for large datasets.

Therefore, Python was used for faster importing using:

* Pandas
* SQLAlchemy
* PyMySQL

### Python Import Example

```python
from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://root:password@localhost/healthcare')

admissions.to_sql('admissions', con=engine, if_exists='replace', index=False)
patients.to_sql('patients', con=engine, if_exists='replace', index=False)
billings.to_sql('billings', con=engine, if_exists='replace', index=False)
diagnoses.to_sql('diagnoses', con=engine, if_exists='replace', index=False)
hospitals.to_sql('hospitals', con=engine, if_exists='replace', index=False)
```

---

# 3️⃣ SQL Data Preparation

Performed multiple SQL operations:

## SQL Tasks:

* Data type conversions
* Joins between tables
* Creating analytical views
* Query optimization
* Index creation

---

# 📊 SQL Views Created

## 1. patient_admissions

Combined:

* Admissions
* Patients
* Diagnoses
* Hospitals

### Purpose:

Used for:

* Readmission Analysis
* Demographic Analysis
* Ward & Diagnosis Analysis

---

## 2. financial_analysis

Combined:

* Billing
* Admissions
* Patients

### Purpose:

Used for:

* Cost Analysis
* Subsidy Analysis
* Insurance Analysis

---

## 3. hospital_performance

Aggregated hospital-level metrics.

### Purpose:

Used for:

* Hospital Benchmarking
* Readmission Performance
* Tier Analysis

---

# 📈 Power BI Dashboard

Created a fully interactive dashboard with:

* KPIs
* Slicers
* Drill-down analysis
* Cross filtering
* DAX measures

---

# 📄 Dashboard Pages

## 1️⃣ Readmission Drivers Analysis

### KPIs:

* Total Admissions
* Total Patients
* Readmission Rate (30 Days)
* Readmission Rate (7 Days)

### Analysis Included:

* Diagnosis-wise readmission
* Ward-wise readmission
* Age-group analysis
* State-wise readmission
* Admission type analysis
* Discharge type analysis

---

## 2️⃣ Financial Burden Analysis

### KPIs:

* Total Revenue
* Total Subsidy
* Avg Subsidy Reduction %
* Avg Total Cost
* Avg Bill Paid
* Subsidized Patients

### Analysis Included:

* Subsidy distribution
* BPL patient analysis
* Insurance-wise subsidy analysis
* Cost comparison
* Out-of-pocket burden analysis
* Readmission cost impact

---

## 3️⃣ Hospital Performance Analysis

### KPIs:

* Total Hospitals
* Avg Length of Stay
* Lowest Readmission Rate
* Avg Admissions per Hospital

### Analysis Included:

* Tier-wise performance
* Top hospitals by admissions
* Costliest hospitals
* Readmission vs Length of Stay
* Hospital readmission benchmarking

---

# 📌 Key Insights

# 🔷 Readmission Analysis

* Total Admissions = 120K
* Total Patients = 65K
* Readmission Rate (30 Days) = 11.84%
* Readmission Rate (7 Days) = 0.84%

### Major Findings:

* Perinatal diagnoses showed highest readmission rate (15.25%)
* ICU had highest readmission rate (23.76%)
* Elderly patients showed highest readmission rate (20.45%)
* Emergency admissions had highest readmission rate (14.8%)
* LAMA discharge cases showed highest readmission risk (17.80%)

---

# 🔷 Financial Analysis

* Total Revenue = 5.8bn
* Total Subsidy = 5.7bn
* Avg Subsidy Reduction = 68.62%

### Major Findings:

* 71.44% patients received subsidy
* Readmitted patients had significantly higher treatment cost
* ESI provided highest subsidy reduction %
* Tier 1 hospitals had highest treatment cost

---

# 🔷 Hospital Analysis

* Total Hospitals = 33
* Avg Length of Stay = 6.85 Days

### Major Findings:

* Apollo/Manipal Telangana had highest average cost
* Tier 1 hospitals had highest average treatment cost
* Readmission rate positively correlated with Length of Stay
* Hospital tier had minimal effect on readmission rates

---

# 📊 Skills Demonstrated

## Data Cleaning

* Power Query
* Data Validation
* Data Transformation

## SQL

* Joins
* Views
* Aggregations
* CTE Logic
* Indexing

## Power BI

* DAX Measures
* KPI Design
* Interactive Dashboards
* Data Modeling
* Visual Storytelling

## Analytics

* Business Insights
* Healthcare KPI Analysis
* Financial Analysis
* Operational Analysis

---

# 🚀 Project Outcomes

This project helped strengthen practical skills in:

* End-to-end data analytics workflow
* SQL-based data preparation
* Dashboard storytelling
* KPI development
* Business insight generation

---

# 📷 Dashboard Preview

<img width="1318" height="745" alt="Screenshot 2026-05-25 102650" src="https://github.com/user-attachments/assets/62853076-ecdf-4960-8a77-c3aff7944248" />
<img width="1327" height="745" alt="Screenshot 2026-05-25 102712" src="https://github.com/user-attachments/assets/65c343b9-9168-49ec-97c8-5339c17bf66f" />
<img width="1324" height="737" alt="Screenshot 2026-05-25 102738" src="https://github.com/user-attachments/assets/34081d11-1b6b-4987-906e-3c705127f760" />

---

# 📬 Contact

If you have any feedback or suggestions, feel free to connect with me on LinkedIn.
https://www.linkedin.com/in/mohd-junaiddd04/
---
