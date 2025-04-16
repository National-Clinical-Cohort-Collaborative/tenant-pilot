--Renal Phenotype
--Written in SparkSQL 

-- Step 1. Create "all_the_creatinine" (a) & "Renal disease" (b) table. --

-- Now filter the measurement table with the list_of_concepts (creatinine-only)
WITH 
all_the_creatinine AS (
    SELECT
    CASE
        WHEN measurement_concept_id IS NOT NULL THEN 'Creatinine, mg/dL'
        ELSE 'Creatinine, mg/dL'
        END AS measured_variable,
        measurement.*
    FROM measurement
    WHERE measurement.measurement_concept_id IN (3007760, 4195331, 37392176, 3016723, 3051825, 37208596, 4013964, 37208830, 2212294, 37392198, 37208831, 4197967, 4199025)
),

-- 1b. Renal disease

-- Now filter the measurement table with the list_of_concepts (creatinine-only)
all_the_renal_disease_occurrences AS (
    SELECT
    CASE
        WHEN condition_concept_id IS NOT NULL THEN 'Renal_disease'
        ELSE 'Renal_disease'
        END AS Alias, 
    condition_occurrence.*
    FROM condition_occurrence
    WHERE condition_occurrence.condition_concept_id IN (193782, 197253, 439694, 4095115, 4107071, 4139414, 4183557, 36679002, 36716183, 36716455, 36716945, 36716946, 36717349, 37016366, 37017217, 37017425, 37116430, 37395519, 37395520, 43020456, 43021835, 43530935, 43531559, 44782429, 44792229, 44808128, 44808338, 44808744, 45757120, 45757442, 45769906, 45773576, 46284566, 46284572, 46284597, 46284603, 439695, 443612, 765536, 3185897, 3189598, 4030520, 4128200, 4143190, 4183446, 4195297, 4267646, 4302298, 36716184, 37017104, 37018886, 37116834, 37395516, 37395517, 40481595, 43020455, 43531577, 43531653, 44782691, 44792250, 44792255, 44808821, 45757393, 45763854, 46284592, 46284599, 46284602, 195014, 443919, 443961, 762000, 4126426, 4150547, 4163982, 4215648, 4225572, 4322556, 36716182, 36717534, 37017813, 37019193, 42872405, 43021836, 43021864, 43531562, 44784637, 44792226, 44792231, 44792232, 45769904, 45770903, 45772751, 46270353, 46271022, 46284588, 46286992, 195600, 197329, 443601, 443614, 3169303, 3177485, 4126427, 4232873, 4311129, 36716312, 37399017, 43530912, 43530914, 43531566, 44784621, 44784639, 44792230, 44792251, 44792252, 44809063, 45757398, 45757466, 45769903, 45771075, 46270356, 46284567, 46284598, 195595, 196455, 4070939, 4119093, 4128029, 4170452, 4180769, 4308408, 42537766, 43021852, 44782689, 44782717, 44792228, 44792253, 44792254, 44808340, 44809062, 44813789, 45757356, 45757445, 45763855, 45771067, 46270355, 46273164, 46284587, 46287169, 198185, 762973, 765535, 760850, 3178768, 4030518, 4125970, 4126424, 4149888, 4159967, 4160274, 4180453, 4181114, 4228827, 4239804, 36717581, 37116399, 37116432, 37395518, 43530928, 44782690, 44782692, 44784638, 44808823, 44809286, 443597, 443611, 762034, 4033463, 4066005, 4153876, 4265212, 37018761, 37116431, 37312165, 37395521, 43020457, 44782703, 44792249, 44809061, 44809170, 44813790, 45757139, 45757444, 45757446, 45757447, 46284575, 46284593, 192359, 197320, 762033, 764011, 762001, 4030519, 4128067, 4149398, 4190190, 4306513, 37395514, 43021853, 43531578, 44784439, 44792227, 44808822, 45757137, 45769902, 45771064, 46273514, 46284591, 46284600, 3180540, 4066405, 4126305, 4151112, 4151214, 4200639, 4264681, 36716947, 40482857, 43020437, 43021854, 44784640, 44809173, 45757392, 45768813, 45769901, 45773688, 46270354, 46273636, 46284570)
),
--================================= End of "all_the_creatinine"; which will use for 2 a & b & c | "all_the_renal_disease_occurrences" will use in 2 d table ================================--


-- Step 2. Create "creatinine_biggest_date_gap"  & "creatinine_unique_days" & "pivot_by_measurement" & "persons_with_these_diseases" table. --
--================================= 2a. Create "creatinine_biggest_date_gap" from "all_the_creatinine" table ================================--
-- New table to compute the biggest date gap between two creatinine. 
-- Group by person_id and measured_variable, then calculate min and max measurement_date
grouped_df AS (
    SELECT 
        person_id, 
        measured_variable, 
        MIN(measurement_date) AS min_date, 
        MAX(measurement_date) AS max_date
    FROM all_the_creatinine
    GROUP BY person_id, measured_variable
),
-- Calculate the date difference and drop min_date and max_date
creatinine_biggest_date_gap AS (
    SELECT 
        person_id, 
        measured_variable, 
        DATEDIFF(max_date, min_date) AS max_span
    FROM grouped_df
),
--================================= End of "creatinine_biggest_date_gap" from "all_the_creatinine" table ================================--

--================================= 2b. Create "creatinine_unique_days" from "all_the_creatinine" table ================================--
-- Group by person_id and measured_variable, then count distinct measurement_date and cast to integer
creatinine_unique_days AS (
    SELECT 
        person_id, 
        measured_variable, 
        CAST(COUNT(DISTINCT measurement_date) AS INTEGER) AS unique_days
    FROM all_the_creatinine
    GROUP BY person_id, measured_variable
),

-- Truncate the measured_variable to the first 10 characters
truncated_df AS (
    SELECT 
        person_id, 
        SUBSTRING(measured_variable, 1, 10) AS measured_variable, 
        unique_days
    FROM creatinine_unique_days
),
--================================= End of "creatinine_unique_days" from "all_the_creatinine" table ================================--

--================================= 2c. Create "pivot_by_measurement" from "truncated_df" (2b) table ================================--
-- Group by person_id and pivot on measured_variable, calculating the mean of unique_days and filling nulls with 0
pivot_by_measurement AS (
    SELECT 
        person_id,
        COALESCE(AVG(CASE WHEN measured_variable = 'Creatinine' THEN unique_days END), 0) AS Creatinine
    FROM truncated_df
    GROUP BY person_id
),
--================================= End of "pivot_by_measurement" from "truncated_df" (2b) table ================================--

--================================= 2d. Create "persons_with_these_diseases" from "all_the_renal_disease_occurrences" table ================================--
-- Group by person_id and pivot on Alias, counting the occurrences
persons_with_these_diseases AS (
    SELECT 
    person_id,
    COALESCE(COUNT(CASE WHEN Alias = 'Renal_disease' THEN 1 END), 0) AS Renal_disease
FROM all_the_renal_disease_occurrences
GROUP BY person_id
),
--================================= End of "persons_with_these_diseases" from "all_the_renal_disease_occurrences" table ================================--

-- Step 3. Create "combined_criteria_s1" (a) & "combined_criteria_s2" (b) table. --
--================================= 3a. Create "combined_criteria_s1" from "persons_with_these_diseases (2c)" & "pivot_by_measurement" (2c) tables ================================--
combined_criteria_s1 AS (
    SELECT 
        COALESCE(pivot_by_measurement.person_id, persons_with_these_diseases.person_id) AS person_id,
        pivot_by_measurement.Creatinine,
        persons_with_these_diseases.Renal_disease
    FROM pivot_by_measurement 
    FULL JOIN persons_with_these_diseases
    ON persons_with_these_diseases.person_id = pivot_by_measurement.person_id
),
--================================= End of "combined_criteria_s1" from "persons_with_these_diseases (2c)" & "pivot_by_measurement" (2c) tables ================================--

--================================= 3b. Create "combined_criteria_s2" from "combined_criteria_s1" (3a) & "creatinine_biggest_date_gap" (2a) & person_tbl tables ================================--
-- Create a new column "Born_after_1960" in the person_tbl table
person_with_born_after_1960 AS (
    SELECT 
        person_id,
        CASE 
            WHEN year_of_birth IS NULL THEN 'No year'
            WHEN year_of_birth > 1960 THEN 'After 1960'
            ELSE 'Before 1960'
        END AS Born_after_1960
    FROM person_tbl
),
-- Perform a full outer join between combined_criteria_s1 and creatinine_biggest_date_gap on person_id
joined_df1 AS (
    SELECT 
        COALESCE(df1.person_id, df2.person_id) AS person_id,
        df1.Creatinine,
        df1.Renal_disease,
        df2.max_span
    FROM 
        combined_criteria_s1 df1
    FULL OUTER JOIN 
        (SELECT person_id, max_span FROM creatinine_biggest_date_gap) df2
    ON 
        df1.person_id = df2.person_id
),
-- Perform a left join with the person_with_born_after_1960 table
combined_criteria_s2 AS (
    SELECT 
        COALESCE(joined_df1.person_id, person_with_born_after_1960.person_id) AS person_id,
        joined_df1.Creatinine,
        joined_df1.Renal_disease,
        joined_df1.max_span,
        person_with_born_after_1960.Born_after_1960
    FROM 
        joined_df1
    LEFT JOIN 
        person_with_born_after_1960
    ON 
        joined_df1.person_id = person_with_born_after_1960.person_id
)
--================================= End of "combined_criteria_s2" from  "combined_criteria_s1" (3a) & "creatinine_biggest_date_gap" (2a) & person_tbl tables ================================--

-- Select the final columns from "combined_criteria_s2" table. 
SELECT 
    person_id
FROM 
    combined_criteria_s2
WHERE
    combined_criteria_s2.Creatinine >= 3 
    OR
    combined_criteria_s2.Renal_disease IS NOT NULL
