/*
Answer: What are highest paid skills?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, romote jobs only
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

WITH skill_remote_job_count AS (
    SELECT 
        skill_id,
        COUNT(skills_job_dim.job_id) as job_count,
        ROUND(AVG(salary_year_avg)) as avg_year_salary
    FROM
        skills_job_dim
    LEFT JOIN
        job_postings_fact
    ON
        skills_job_dim.job_id = job_postings_fact.job_id
    WHERE
        job_postings_fact.job_work_from_home = TRUE
        AND job_postings_fact.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skill_id
)

SELECT 
    skills,
    avg_year_salary
FROM 
    skills_dim
LEFT JOIN skill_remote_job_count
    ON skills_dim.skill_id = skill_remote_job_count.skill_id
WHERE
    job_count IS NOT NULL
ORDER BY
    avg_year_salary DESC
LIMIT 20

/* 
Conclusions:
- Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), 
machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), 
reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) 
indicates a lucrative crossover between data analysis and engineering, 
with a premium on skills that facilitate automation and efficient data pipeline management.
- Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) 
underscores the growing importance of cloud-based analytics environments, 
suggesting that cloud proficiency significantly boosts earning potential in data analytics.

Results:

[
  {
    "skills": "pyspark",
    "avg_year_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_year_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_year_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_year_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_year_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_year_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_year_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_year_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_year_salary": "151821"
  },
  {
    "skills": "golang",
    "avg_year_salary": "145000"
  },
  {
    "skills": "elasticsearch",
    "avg_year_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_year_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_year_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_year_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_year_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_year_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_year_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_year_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_year_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_year_salary": "125436"
  }
]
*/