/**
N3C Clinical Phenotype 2.0 - OMOP MSSQL
Authors: Marshall Clark, Sofia Dard, Emily Pfaff

HOW TO RUN:
If you are not using the R or Python exporters, you will need to find and replace @cdmDatabaseSchema and @resultsDatabaseSchema, @cdmDatabaseSchema with your local OMOP schema details. This is the only modification you should make to this script.

USER NOTES:
In OHDSI conventions, we do not usually write tables to the main database schema.
OHDSI uses @resultsDatabaseSchema as a results schema build cohort tables for specific analysis.
We will build one tables in this script (N3C_CLINICAL_COHORT).
Each table is assembled in the results schema as we know some OMOP analysts do not have write access to their @cdmDatabaseSchema.
If you have read/write to your cdmDatabaseSchema, you would use the same schema name for both.
**/

IF OBJECT_ID('@resultsDatabaseSchema.N3C_CLINICAL_COHORT', 'U') IS NULL
	CREATE TABLE @resultsDatabaseSchema.n3c_clinical_cohort (person_id INT NOT NULL);

TRUNCATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT;

INSERT INTO @resultsDatabaseSchema.N3C_CLINICAL_COHORT
SELECT person_id
FROM @cdmDatabaseSchema.measurement  
WHERE measurement_date >= CAST('2018-01-01' as datetime)
GROUP BY person_id
HAVING datediff(day, min(measurement_date), max(measurement_date)) >= 30

UNION

SELECT person_id
FROM @cdmDatabaseSchema.condition_occurrence 
WHERE condition_start_date >= CAST('2018-01-01' as datetime)
GROUP BY person_id
HAVING datediff(day, min(condition_start_date), max(condition_start_date)) >= 30;
