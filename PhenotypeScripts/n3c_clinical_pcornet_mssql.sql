/**
N3C Clinical Phenotype 1.0 - PCORnet MSSQL
Authors: Marshall Clark, Sofia Dard, Emily Pfaff

HOW TO RUN:
If you are not using the R or Python exporters, you will need to find and replace @cdmDatabaseSchema and @resultsDatabaseSchema, @cdmDatabaseSchema with your local CDM schema details. This is the only modification you should make to this script.
**/

IF OBJECT_ID('@resultsDatabaseSchema.N3C_CLINICAL_COHORT', 'U') IS NULL
	CREATE TABLE @resultsDatabaseSchema.N3C_CLINICAL_COHORT (PATID VARCHAR(50) NOT NULL);

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
	and measure_date >= CAST('2018-01-01' as datetime)
group by
	patid
having
	datediff(day, min(measure_date), max(measure_date)) >= 730;
