/**
N3C Clinical Phenotype 1.0 - OMOP MSSQL
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
FROM measurement  
WHERE measurement_concept_id IN (
4154790, --DBP, SNOMED
4236281, --DBP, lying down, SNOMED
4248524, --DBP, sitting down, SNOMED
3034703, --DBP, sitting down, LOINC
4268883, --DBP, standing up, SNOMED
3019962, --DBP, standing up, LOINC
3012888, --DBP, LOINC
36304130, --DBP, lateral position, LOINC
4099154, --body weight, SNOMED
3025315 --body weight, LOINC
) AND measurement_date >= '1/1/2018'
GROUP BY person_id
HAVING datediff(day, min(measurement_date), max(measurement_date)) >= 30;
