CREATE TABLE postings AS
SELECT
  NULLIF(job_id,'')::numeric::bigint AS job_id,
  company_name,
  title,
  description,
  NULLIF(max_salary,'')::numeric AS max_salary,
  pay_period,
  location,
  NULLIF(company_id,'')::numeric AS company_id,
  NULLIF(views,'')::numeric AS views,
  NULLIF(med_salary,'')::numeric AS med_salary,
  NULLIF(min_salary,'')::numeric AS min_salary,
  formatted_work_type,
  NULLIF(applies,'')::numeric AS applies,
  to_timestamp(NULLIF(original_listed_time,'')::numeric::bigint/1000) AS listed_at,
  CASE WHEN lower(remote_allowed) IN ('1','1.0','true','t') THEN true
       WHEN lower(remote_allowed) IN ('0','0.0','false','f') THEN false
  END AS remote_allowed,
  job_posting_url,
  application_url,
  application_type,
  formatted_experience_level,
  skills_desc,
  sponsored,
  work_type,
  currency,
  compensation_type,
  NULLIF(normalized_salary,'')::numeric AS normalized_salary,
  zip_code,
  fips
FROM postings_raw;

ALTER TABLE postings ADD PRIMARY KEY (job_id);