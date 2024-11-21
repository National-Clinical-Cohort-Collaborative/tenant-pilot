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

BEGIN
    -- Check if the table exists and create it if not
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT (PERSON_ID NUMBER NOT NULL)';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -955 THEN -- -955 = ORA-00955: name is already used by an existing object
                RAISE;
            END IF;
    END;

    -- Truncate the table
    EXECUTE IMMEDIATE 'TRUNCATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT';
END;
/

-- Insert data into the table
INSERT INTO @resultsDatabaseSchema.N3C_CLINICAL_COHORT
SELECT person_id
FROM @cdmDatabaseSchema.measurement  
WHERE measurement_date >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
GROUP BY person_id
HAVING (MAX(measurement_date) - MIN(measurement_date)) >= 30

UNION

SELECT person_id
FROM @cdmDatabaseSchema.condition_occurrence 
WHERE condition_start_date >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
GROUP BY person_id
HAVING (MAX(condition_start_date) - MIN(condition_start_date)) >= 30;
