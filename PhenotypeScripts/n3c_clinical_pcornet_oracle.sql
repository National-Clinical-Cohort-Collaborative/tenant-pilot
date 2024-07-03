/**
N3C Clinical Phenotype 1.0 - PCORnet Oracle
Authors: Marshall Clark, Sofia Dard, Emily Pfaff

HOW TO RUN:
If you are not using the R or Python exporters, you will need to find and replace @cdmDatabaseSchema and @resultsDatabaseSchema, @cdmDatabaseSchema with your local CDM schema details. This is the only modification you should make to this script.
**/
BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT  (patid	VARCHAR2(50)  NOT NULL)';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -955 THEN
      RAISE;
    END IF;
END;

TRUNCATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT;

INSERT INTO @resultsDatabaseSchema.N3C_CLINICAL_COHORT
select
	patid
from
	@cdmDatabaseSchema.vital
where
	(
	diastolic is not null
	or
	wt is not null
	)
	and measure_date >= CAST(to_date('2018-01-01','YYYY-MM-DD') as TIMESTAMP)
group by
	patid
having
	max(measure_date) - min(measure_date) >= 90;
