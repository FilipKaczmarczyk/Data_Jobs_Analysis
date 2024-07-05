-- Load data from csv files to tables

COPY company_dim 
FROM 'C:\Projects\SQL\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim 
FROM 'C:\Projects\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact 
FROM 'C:\Projects\SQL\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim 
FROM 'C:\Projects\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
