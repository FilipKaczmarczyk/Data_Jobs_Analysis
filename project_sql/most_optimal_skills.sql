/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for data analyst.
- Focus only on remote job postings.
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis.
*/

SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as job_count,
    ROUND(AVG(salary_year_avg)) as avg_year_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_work_from_home = TRUE
    AND job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_year_salary DESC,
    job_count DESC
LIMIT 25

/* 
Conclusions:
- Programming and Scripting Languages like Python (job count: 236, avg. salary: $101,397) 
and R (job count: 148, avg. salary: $100,499) are crucial, reflecting their importance in data analysis tasks.
- Expertise in Snowflake (job count: 37, avg. salary: $112,948), Azure (job count: 34, avg. salary: $111,225),
AWS (job count: 32, avg. salary: $108,317) is in high demand, underscoring the need for cloud and big data skills.
- Proficiency in tools like Tableau (job count: 230, avg. salary: $99,288) and Looker (job count: 49, avg. salary: $103,795) 
highlights the significance of effective data visualization and integration in the data analyst role.

Results: 

[
  {
    "skills": "go",
    "job_count": "27",
    "avg_year_salary": "115320"
  },
  {
    "skills": "confluence",
    "job_count": "11",
    "avg_year_salary": "114210"
  },
  {
    "skills": "hadoop",
    "job_count": "22",
    "avg_year_salary": "113193"
  },
  {
    "skills": "snowflake",
    "job_count": "37",
    "avg_year_salary": "112948"
  },
  {
    "skills": "azure",
    "job_count": "34",
    "avg_year_salary": "111225"
  },
  {
    "skills": "bigquery",
    "job_count": "13",
    "avg_year_salary": "109654"
  },
  {
    "skills": "aws",
    "job_count": "32",
    "avg_year_salary": "108317"
  },
  {
    "skills": "java",
    "job_count": "17",
    "avg_year_salary": "106906"
  },
  {
    "skills": "ssis",
    "job_count": "12",
    "avg_year_salary": "106683"
  },
  {
    "skills": "jira",
    "job_count": "20",
    "avg_year_salary": "104918"
  },
  {
    "skills": "oracle",
    "job_count": "37",
    "avg_year_salary": "104534"
  },
  {
    "skills": "looker",
    "job_count": "49",
    "avg_year_salary": "103795"
  },
  {
    "skills": "nosql",
    "job_count": "13",
    "avg_year_salary": "101414"
  },
  {
    "skills": "python",
    "job_count": "236",
    "avg_year_salary": "101397"
  },
  {
    "skills": "r",
    "job_count": "148",
    "avg_year_salary": "100499"
  },
  {
    "skills": "redshift",
    "job_count": "16",
    "avg_year_salary": "99936"
  },
  {
    "skills": "qlik",
    "job_count": "13",
    "avg_year_salary": "99631"
  },
  {
    "skills": "tableau",
    "job_count": "230",
    "avg_year_salary": "99288"
  },
  {
    "skills": "ssrs",
    "job_count": "14",
    "avg_year_salary": "99171"
  },
  {
    "skills": "spark",
    "job_count": "13",
    "avg_year_salary": "99077"
  },
  {
    "skills": "c++",
    "job_count": "11",
    "avg_year_salary": "98958"
  },
  {
    "skills": "sas",
    "job_count": "63",
    "avg_year_salary": "98902"
  },
  {
    "skills": "sas",
    "job_count": "63",
    "avg_year_salary": "98902"
  },
  {
    "skills": "sql server",
    "job_count": "35",
    "avg_year_salary": "97786"
  },
  {
    "skills": "javascript",
    "job_count": "20",
    "avg_year_salary": "97587"
  }
]
*/