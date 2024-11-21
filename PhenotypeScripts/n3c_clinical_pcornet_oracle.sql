/**
N3C Clinical Phenotype 2.0 - PCORnet Oracle
Authors: Marshall Clark, Sofia Dard, Emily Pfaff

HOW TO RUN:
If you are not using the R or Python exporters, you will need to find and replace @cdmDatabaseSchema and @resultsDatabaseSchema, @cdmDatabaseSchema with your local CDM schema details. This is the only modification you should make to this script.
**/

BEGIN
    -- Check if the table exists and create it if not
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT (PATID VARCHAR2(50) NOT NULL)';
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
SELECT
    patid
FROM
    @cdmDatabaseSchema.vital
WHERE
    (diastolic IS NOT NULL OR wt IS NOT NULL)
    AND measure_date >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
GROUP BY
    patid
HAVING
    (MAX(measure_date) - MIN(measure_date)) >= 30

UNION

SELECT
    patid
FROM
    @cdmDatabaseSchema.diagnosis
WHERE
    COALESCE(dx_date, admit_date) >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
GROUP BY
    patid
HAVING
    (MAX(COALESCE(dx_date, admit_date)) - MIN(COALESCE(dx_date, admit_date))) >= 30

UNION

SELECT
    patid
FROM
    @cdmDatabaseSchema.lab_result_cm
WHERE
    result_date >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
GROUP BY
    patid
HAVING
    (MAX(result_date) - MIN(result_date)) >= 30;