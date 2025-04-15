--OMOP cancer phenotype
--Not identical to enclave phenotype, which includes NAACCR and SEER data
--Written in SparkSQL

--create a cancer concept set
with cancer_codes as (
SELECT distinct con2.*
FROM concept con JOIN concept_relationship cr ON con.concept_id = cr.concept_id_1 and cr.relationship_id = 'Maps to'
    JOIN concept con2 ON cr.concept_id_2 = con2.concept_id
WHERE con.vocabulary_id = 'ICD10CM' and con.domain_id = 'Condition' and 
  (con.concept_code LIKE 'C%' or con.concept_code LIKE 'D0%' or con.concept_code LIKE 'D1%' 
  or con.concept_code LIKE 'D2%' or con.concept_code LIKE 'D3%' or con.concept_code LIKE 'D4%')
  
UNION
  
select distinct *
from concept con
where con.vocabulary_id = 'ICDO3' and con.standard_concept = 'S')

--get patients with those codes
SELECT distinct p.person_id
FROM condition_occurrence co JOIN person p ON co.person_id = p.person_id
    JOIN cancer_codes cx ON co.condition_concept_id = cx.concept_id
WHERE co.condition_start_date > '2018-01-01' 
