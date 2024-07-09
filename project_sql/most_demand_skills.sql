/*
Question: What are the most desirable skills for a remote data analyst position?
- Identify your top 5 most desirable skills  for a data analyst.
- Focus only on remote job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers.
*/

WITH skill_remote_job_count AS (
    SELECT 
        skill_id,
        COUNT(skills_job_dim.job_id) as job_count
    FROM
        skills_job_dim
    LEFT JOIN
        job_postings_fact
    ON
        skills_job_dim.job_id = job_postings_fact.job_id
    WHERE
        job_postings_fact.job_work_from_home = TRUE
        AND job_postings_fact.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT 
    skills,
    job_count
FROM 
    skills_dim
LEFT JOIN skill_remote_job_count
    ON skills_dim.skill_id = skill_remote_job_count.skill_id
WHERE
    job_count IS NOT NULL
ORDER BY
    job_count DESC
LIMIT 5

/* 
Conclusions:
- SQL is the most desired skill, along with Excel, which is second on the list, 
emphasizing the need for strong data processing and spreadsheet skills.
- Programming and Visualization Tools like Python, Tableau, and Power BI are essential, 
pointing towards the increasing importance of technical skills in data storytelling and decision support.

Results:

[
  {
    "skills": "sql",
    "job_count": "7291"
  },
  {
    "skills": "excel",
    "job_count": "4611"
  },
  {
    "skills": "python",
    "job_count": "4330"
  },
  {
    "skills": "tableau",
    "job_count": "3745"
  },
  {
    "skills": "power bi",
    "job_count": "2609"
  }
]
*/