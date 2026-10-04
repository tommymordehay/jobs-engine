-- 1. Job count by work type (full-time, part-time, contract...)
SELECT formatted_work_type, count(*) FROM postings GROUP BY 1 ORDER BY 2 DESC;

-- 2. Top 10 companies by number of open postings
SELECT company_name, count(*) AS c FROM postings GROUP BY 1 ORDER BY c DESC LIMIT 10;

-- 3. Median yearly salary by experience level
SELECT formatted_experience_level, percentile_cont(0.5) WITHIN GROUP (ORDER BY normalized_salary) AS median_salary
FROM postings WHERE normalized_salary IS NOT NULL GROUP BY 1;

-- 4. How many postings allow remote work
SELECT count(*) AS remote_jobs FROM postings WHERE remote_allowed;

-- 5. Sample of entry-level postings
SELECT title, company_name, location FROM postings WHERE formatted_experience_level = 'Entry level' LIMIT 10;

-- 6. Top 10 postings by number of applications
SELECT title, company_name, applies FROM postings ORDER BY applies DESC NULLS LAST LIMIT 10;

-- 7. Postings published per month
SELECT date_trunc('month', listed_at) AS month, count(*) FROM postings GROUP BY month ORDER BY month;

-- 8. How many postings require Python
SELECT count(*) AS python_jobs FROM postings WHERE skills_desc ILIKE '%python%';

-- 9. Average salary by work type
SELECT formatted_work_type, avg(normalized_salary)::int AS avg_salary FROM postings GROUP BY 1;

-- 10. Top 10 locations by number of postings
SELECT location, count(*) AS c FROM postings GROUP BY 1 ORDER BY c DESC LIMIT 10;