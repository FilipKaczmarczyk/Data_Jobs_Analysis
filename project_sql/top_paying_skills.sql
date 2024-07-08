/*
Question: What are the top-paying skills in data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        job_location,
        job_schedule_type,
        salary_year_avg, 
        job_posted_date
    FROM    
        job_postings_fact
    LEFT JOIN
        company_dim
    ON
        job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    ORDER BY    
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    skills,
    COUNT(*) AS number_of_occurrences
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills IS NOT NULL
GROUP BY skills
ORDER BY number_of_occurrences DESC

/*
Conclusions:
- The most desired skills in the best paid job offers are SQL(8), python(7), tableau(6) and R(4).
- For data visualization in these job offers tableau(6) is more common than powerbi(2).
- Skills such as snowflake, pandas or excel were present in 3 out of 10 offers.

Results:

[
  {
    "skills": "sql",
    "number_of_occurrences": "8"
  },
  {
    "skills": "python",
    "number_of_occurrences": "7"
  },
  {
    "skills": "tableau",
    "number_of_occurrences": "6"
  },
  {
    "skills": "r",
    "number_of_occurrences": "4"
  },
  {
    "skills": "snowflake",
    "number_of_occurrences": "3"
  },
  {
    "skills": "pandas",
    "number_of_occurrences": "3"
  },
  {
    "skills": "excel",
    "number_of_occurrences": "3"
  },
  {
    "skills": "atlassian",
    "number_of_occurrences": "2"
  },
  {
    "skills": "jira",
    "number_of_occurrences": "2"
  },
  {
    "skills": "aws",
    "number_of_occurrences": "2"
  },
  {
    "skills": "azure",
    "number_of_occurrences": "2"
  },
  {
    "skills": "bitbucket",
    "number_of_occurrences": "2"
  },
  {
    "skills": "confluence",
    "number_of_occurrences": "2"
  },
  {
    "skills": "gitlab",
    "number_of_occurrences": "2"
  },
  {
    "skills": "go",
    "number_of_occurrences": "2"
  },
  {
    "skills": "numpy",
    "number_of_occurrences": "2"
  },
  {
    "skills": "oracle",
    "number_of_occurrences": "2"
  },
  {
    "skills": "power bi",
    "number_of_occurrences": "2"
  },
  {
    "skills": "jenkins",
    "number_of_occurrences": "1"
  },
  {
    "skills": "crystal",
    "number_of_occurrences": "1"
  },
  {
    "skills": "powerpoint",
    "number_of_occurrences": "1"
  },
  {
    "skills": "pyspark",
    "number_of_occurrences": "1"
  },
  {
    "skills": "hadoop",
    "number_of_occurrences": "1"
  },
  {
    "skills": "git",
    "number_of_occurrences": "1"
  },
  {
    "skills": "sap",
    "number_of_occurrences": "1"
  },
  {
    "skills": "jupyter",
    "number_of_occurrences": "1"
  },
  {
    "skills": "flow",
    "number_of_occurrences": "1"
  },
  {
    "skills": "databricks",
    "number_of_occurrences": "1"
  }
]
*/