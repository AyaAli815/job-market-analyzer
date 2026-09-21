# 🤖 AI Job Market Analyzer

An end-to-end **Data Analytics project** that analyzes job-market data to identify trends in job demand, required skills, salaries, experience levels, remote-work opportunities, companies, and hiring platforms.

The project combines **SQL, Data Modeling, DAX, and Power BI** to transform structured job-posting data into meaningful and interactive insights.

---

## 📌 Project Overview

The **AI Job Market Analyzer** analyzes job-posting data to answer important questions about the job market:

* What are the most demanded job roles?
* Which skills are most frequently requested?
* What is the average salary?
* How does salary differ across experience levels?
* Which countries have higher average salaries?
* What percentage of jobs are Remote, Hybrid, or Onsite?
* Which companies have the most job postings?
* Which platforms have the highest number of job postings?
* How are skills distributed across different job roles?

### Project Workflow

```text
Job Market Data
      ↓
Data Preparation
      ↓
Data Modeling
      ↓
SQL Analysis
      ↓
Power BI Dashboard
      ↓
Job Market Insights
```

---

# 🎯 Project Objectives

The main objectives of this project are to:

1. Analyze job-market trends using structured job-posting data.
2. Identify the most demanded job roles and skills.
3. Analyze salary ranges and average salaries.
4. Compare salaries across countries and experience levels.
5. Analyze Remote, Hybrid, and Onsite opportunities.
6. Analyze job-posting platforms and companies.
7. Build an interactive Power BI dashboard.
8. Demonstrate practical SQL and data-modeling skills.

---

# 🗂️ Dataset Structure

The project uses a relational data model consisting of a fact table, dimension tables, and a bridge table.

## Fact Table

### `fact_job_postings.csv`

Contains the main information about job postings:

* `job_id`
* `job_title`
* `company_id`
* `country_id`
* `platform_id`
* `experience_level`
* `employment_type`
* `salary_min_usd`
* `salary_max_usd`
* `remote_option`
* `applicants_estimate`
* `average_salary_usd`

---

## Bridge Table

### `bridge_job_skills.csv`

Connects job postings with their required skills.

* `job_id`
* `skill_id`

This table handles the **many-to-many relationship** between jobs and skills.

---

## Dimension Tables

### `dim_company.csv`

Contains company information.

### `dim_country.csv`

Contains country information.

### `dim_platform.csv`

Contains job-platform information.

### `dim_skill.csv`

Contains the skills associated with job postings.

---

# 🏗️ Data Model

The project follows a **Star Schema** approach with a bridge table for job skills.

```text
                    dim_company
                         │
                         │
                         ▼
dim_country ─────► fact_job_postings ◄───── dim_platform
                         │
                         │
                         ▼
                 bridge_job_skills
                         │
                         ▼
                     dim_skill
```
<p align="center">
  <img src="dashboard\Screenshot 2026-09-21 160305.png" alt="AI Job Market Analyzer Dashboard" width="100%">
</p>

This structure makes the data easier to query, analyze, and visualize.

---

# 🧹 Data Preparation

The data preparation stage included:

* Reviewing the dataset structure.
* Checking data consistency.
* Preparing relationships between tables.
* Separating fact and dimension data.
* Creating a bridge table between jobs and skills.
* Preparing the data for SQL analysis and Power BI.

---

# 🗄️ SQL Analysis

SQL was used to analyze the job market and answer business questions.

The analysis includes:

## 💰 Salary Analysis

Analyzing:

* Minimum salary
* Maximum salary
* Average salary
* Salary by country
* Salary by experience level

Example:

```sql
SELECT 
    c.country_name,
    MAX(f.salary_max_usd) AS max_salary,
    MIN(f.salary_min_usd) AS min_salary,
    ROUND(AVG(f.average_salary_usd), 2) AS average_salary
FROM fact_job_postings AS f
JOIN dim_country AS c
    ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_salary DESC;
```

---

## 💼 Job Platform Analysis

Analyzing the number of job postings by platform.

```sql
SELECT 
    p.platform_name,
    COUNT(*) AS count_jobs
FROM fact_job_postings AS f
JOIN dim_platform AS p
    ON f.platform_id = p.platform_id
GROUP BY p.platform_name
ORDER BY count_jobs DESC;
```

---

## 🛠️ Skill Analysis

Analyzing:

* Most demanded skills
* Skills by job title
* Skills by experience level
* Number of jobs requiring each skill

---

## 🌍 Country Analysis

Analyzing job-market activity and salary differences across countries.

---

## 🏠 Remote Work Analysis

Analyzing the distribution of:

* Remote
* Hybrid
* Onsite

---

## 👩‍💻 Experience-Level Analysis

Comparing different experience levels based on:

* Salary
* Job demand
* Required skills

---

# 📊 Power BI Dashboard

The project includes an interactive **Power BI Dashboard** designed to analyze job-market trends.

## 📸 Dashboard Preview

<p align="center">
  <img src="dashboard\dark_dashboard.png" alt="AI Job Market Analyzer Dashboard" width="100%">
</p>
<p align="center">
  <img src="dashboard\light_dashboard.png" alt="AI Job Market Analyzer Dashboard" width="100%">
</p>
---

## 📌 Dashboard Includes

### KPI Cards

* Total Jobs
* Average Salary
* Average Applicants
* % Remote Jobs


### Visualizations

* Top 5 in-demand skills
* Jobs by region
* Job distribution by experience level
* Job distribution by employment type

The dashboard allows users to explore the data through interactive **filters and slicers**.

---

# 🔍 Key Business Questions

| Area           | Business Question                                     |
| -------------- | ----------------------------------------------------- |
| Job Demand     | What are the most common job titles?                  |
| Skills         | Which skills are most demanded?                       |
| Salary         | What is the average salary?                           |
| Experience     | How does salary differ by experience level?           |
| Location       | How does salary vary across countries?                |
| Remote Work    | How common are remote jobs?                           |
| Platforms      | Which platforms have the most job postings?           |
| Companies      | Which companies have the most job postings?           |
| Skills by Role | Which skills are associated with different job roles? |

---

# 📁 Project Structure

```text
AI-Job-Market-Analyzer
│
├── data
│   ├── fact_job_postings.csv
│   ├── bridge_job_skills.csv
│   ├── dim_company.csv
│   ├── dim_country.csv
│   ├── dim_platform.csv
│   └── dim_skill.csv
│
├── database
│   └── job_market_analyzer.sql
│
├── sql_queries
│   └── analysis_queries.sql
│
├── powerbi
│   └── AI_Job_Market_Analyzer.pbix
│
├── dashboard
    └── dark_dashboard.png
│   └── light_dashboard.png
│
└── README.md
```

---

# 🛠️ Tools & Technologies

* **SQL**
* **SQLite**
* **DB Browser for SQLite**
* **Microsoft Power BI**
* **DAX**
* **CSV**
* **Data Modeling**
* **Data Analysis**
* **Data Visualization**

---

# 📈 Skills Demonstrated

## Data Analytics

* Data Preparation
* Exploratory Data Analysis
* Business Questions
* KPI Development
* Trend Analysis
* Comparative Analysis

## SQL

* `SELECT`
* `JOIN`
* `GROUP BY`
* `ORDER BY`
* Aggregate Functions
* Subqueries
* Window Functions
* Filtering
* Ranking
* Many-to-Many Relationships

## Data Modeling

* Fact Tables
* Dimension Tables
* Bridge Tables
* Star Schema
* Relational Data Modeling

## Power BI

* Data Modeling
* DAX Measures
* Interactive Dashboards
* KPI Cards
* Data Visualization
* Filters & Slicers
* Interactive Analysis

---

# 🚀 Future Improvements

The project can be extended in the future with AI-based features such as:

* Automated skill extraction from job descriptions.
* AI-powered skill-gap analysis.
* Comparing candidate skills with market requirements.
* Personalized career recommendations.
* CV/Resume analysis.
* Natural Language Processing (NLP).
* Automated job-market trend analysis.
* Connecting the project to live job-posting APIs.
* Automating data collection and updates.

> **Note:** These AI features are planned future improvements and are **not currently implemented** in this version of the project.

---

# 💡 Project Outcome

This project demonstrates an end-to-end **Data Analytics workflow**, starting from structured job-market data and ending with an interactive Power BI dashboard.

```text
Raw Data
   ↓
Data Preparation
   ↓
Data Modeling
   ↓
SQL Analysis
   ↓
Power BI Dashboard
   ↓
Job Market Insights
```

The current version focuses on **Data Analysis, SQL, Data Modeling, DAX, and Power BI**, providing a practical example of how job-market data can be transformed into an interactive analytics solution.

---

# 👩‍💻 Author

**Aya Ali**

Computer Science Graduate — Faculty of Science, Cairo University

### Focus Areas

* Data Analysis
* SQL
* Power BI
* Data Visualization
* Artificial Intelligence
* Machine Learning

---

⭐ If you find this project interesting, feel free to explore the dataset, SQL queries, data model, and Power BI dashboard.
