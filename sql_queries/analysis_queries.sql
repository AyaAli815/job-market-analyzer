-- =====================================================
-- AI Job Market Analyzer
-- SQL Analysis Queries
-- =====================================================

-- Q1: Salary Statistics by Country
-- Question: What are the minimum, maximum, and average salaries in each country?
SELECT c.country_name,
       MAX(salary_max_usd) AS max_salary,
       MIN(salary_min_usd) AS min_salary,
       ROUND(AVG(average_salary_usd), 2) AS average_salary
FROM fact_job_postings AS f
JOIN dim_country AS c ON f.country_id = c.country_id
GROUP BY country_name
ORDER BY average_salary DESC;


-- Q2: Jobs by Platform
-- Question: How many jobs are posted on each platform?
SELECT d.platform_name,
       COUNT(*) AS count_jobs
FROM fact_job_postings AS f
JOIN dim_platform AS d ON f.platform_id = d.platform_id
GROUP BY platform_name
ORDER BY count_jobs DESC;


-- Q3: Remote / Onsite / Hybrid Distribution
-- Question: What percentage of jobs belongs to each remote option?
SELECT remote_option,
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_job_postings)) AS percentage
FROM fact_job_postings
GROUP BY remote_option;


-- Q4: Average Salary by Experience Level
-- Question: What is the average salary for each experience level?
SELECT experience_level,
       ROUND(AVG(average_salary_usd), 2) AS avg_salary
FROM fact_job_postings
GROUP BY experience_level
ORDER BY avg_salary DESC;


-- Q5: Top 10 Companies by Number of Job Postings
-- Question: Which companies have the most job postings?
SELECT c.company_name AS company,
       COUNT(*) AS number_jobs
FROM fact_job_postings AS f
JOIN dim_company AS c ON f.company_id = c.company_id
GROUP BY company_name
ORDER BY number_jobs DESC
LIMIT 10;


-- Q6: Top 10 In-Demand Skills
-- Question: Which skills are required by the largest number of jobs?
SELECT s.skill_name AS skill,
       COUNT(*) AS job_required
FROM bridge_job_skills AS b
JOIN dim_skill AS s ON s.skill_id = b.skill_id
GROUP BY skill
ORDER BY job_required DESC
LIMIT 10;


-- Q7: Average Salary at Selected Companies
-- Question: What is the average salary at Google, Amazon, and Meta?
SELECT c.company_name AS company,
       ROUND(AVG(average_salary_usd), 0) AS avg_salary
FROM fact_job_postings AS f
JOIN dim_company AS c ON f.company_id = c.company_id
WHERE c.company_name IN ("Google", "Amazon", "Meta")
GROUP BY company
ORDER BY avg_salary DESC;


-- Q8: Remote Jobs by Country
-- Question: Which countries have the highest number of remote jobs?
SELECT c.country_name,
       COUNT(*) AS count_remote
FROM fact_job_postings AS f
JOIN dim_country AS c ON c.country_id = f.country_id
WHERE remote_option = "Remote"
GROUP BY country_name
ORDER BY count_remote DESC;


-- Q9: Average Salary by Skill
-- Question: What is the average salary for jobs requiring each skill?
SELECT s.skill_name AS skill,
       ROUND(AVG(average_salary_usd), 0) AS avg_salary
FROM fact_job_postings AS f
JOIN bridge_job_skills AS b ON f.job_id = b.job_id
JOIN dim_skill AS s ON s.skill_id = b.skill_id
GROUP BY s.skill_name
ORDER BY avg_salary DESC;


-- Q10: Applicants and Salary by Country
-- Question: How do average applicants compare with average salary across countries?
SELECT country_name,
       ROUND(AVG(applicants_estimate)) AS avg_applicants_estimate,
       ROUND(AVG(average_salary_usd), 0) AS avg_salary
FROM fact_job_postings AS f
JOIN dim_country AS c ON c.country_id = f.country_id
GROUP BY country_name
ORDER BY avg_salary DESC;
