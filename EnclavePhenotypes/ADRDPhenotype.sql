--ADRD Phenotype
--Written for OMOP data model, SQL Server

with adrdconcepts as (
select 37204495 as concept_id, 'Alzheimers' as dementia_type
UNION select 37204554 as concept_id, 'Alzheimers' as dementia_type
UNION select 44784643 as concept_id, 'Alzheimers' as dementia_type
UNION select 3170377 as concept_id, 'Alzheimers' as dementia_type
UNION select 378419 as concept_id, 'Alzheimers' as dementia_type
UNION select 37395572 as concept_id, 'Alzheimers' as dementia_type
UNION select 608051 as concept_id, 'Alzheimers' as dementia_type
UNION select 603149 as concept_id, 'Alzheimers' as dementia_type
UNION select 608060 as concept_id, 'Alzheimers' as dementia_type
UNION select 37117145 as concept_id, 'Alzheimers' as dementia_type
UNION select 44782726 as concept_id, 'Alzheimers' as dementia_type
UNION select 43530664 as concept_id, 'Alzheimers' as dementia_type
UNION select 44782727 as concept_id, 'Alzheimers' as dementia_type
UNION select 3179057 as concept_id, 'Alzheimers' as dementia_type
UNION select 44782432 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043241 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043243 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043377 as concept_id, 'Alzheimers' as dementia_type
UNION select 3184947 as concept_id, 'Alzheimers' as dementia_type
UNION select 3176418 as concept_id, 'Alzheimers' as dementia_type
UNION select 37396532 as concept_id, 'Alzheimers' as dementia_type
UNION select 3177168 as concept_id, 'Alzheimers' as dementia_type
UNION select 36716558 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043242 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043244 as concept_id, 'Alzheimers' as dementia_type
UNION select 4218017 as concept_id, 'Alzheimers' as dementia_type
UNION select 44782941 as concept_id, 'Alzheimers' as dementia_type
UNION select 4277444 as concept_id, 'Alzheimers' as dementia_type
UNION select 4277746 as concept_id, 'Alzheimers' as dementia_type
UNION select 4182539 as concept_id, 'Alzheimers' as dementia_type
UNION select 4019705 as concept_id, 'Alzheimers' as dementia_type
UNION select 4220313 as concept_id, 'Alzheimers' as dementia_type
UNION select 44782940 as concept_id, 'Alzheimers' as dementia_type
UNION select 4278830 as concept_id, 'Alzheimers' as dementia_type
UNION select 762578 as concept_id, 'Alzheimers' as dementia_type
UNION select 4167839 as concept_id, 'Alzheimers' as dementia_type
UNION select 4204688 as concept_id, 'Alzheimers' as dementia_type
UNION select 4097384 as concept_id, 'Alzheimers' as dementia_type
UNION select 1340510 as concept_id, 'Alzheimers' as dementia_type
UNION select 4043379 as concept_id, 'Alzheimers' as dementia_type
UNION select 4046095 as concept_id, 'Other dementia' as dementia_type
UNION select 37397762 as concept_id, 'Other dementia' as dementia_type
UNION select 44784620 as concept_id, 'Other dementia' as dementia_type
UNION select 3654598 as concept_id, 'Other dementia' as dementia_type
UNION select 376094 as concept_id, 'Other dementia' as dementia_type
UNION select 374326 as concept_id, 'Other dementia' as dementia_type
UNION select 4100252 as concept_id, 'Other dementia' as dementia_type
UNION select 37399020 as concept_id, 'Other dementia' as dementia_type
UNION select 45771254 as concept_id, 'Other dementia' as dementia_type
UNION select 3654434 as concept_id, 'Other dementia' as dementia_type
UNION select 37111242 as concept_id, 'Other dementia' as dementia_type
UNION select 4182210 as concept_id, 'Other dementia' as dementia_type
UNION select 4228133 as concept_id, 'Other dementia' as dementia_type
UNION select 378726 as concept_id, 'Other dementia' as dementia_type
UNION select 374888 as concept_id, 'Other dementia' as dementia_type
UNION select 44784607 as concept_id, 'Other dementia' as dementia_type
UNION select 44784472 as concept_id, 'Other dementia' as dementia_type
UNION select 44784474 as concept_id, 'Other dementia' as dementia_type
UNION select 44784559 as concept_id, 'Other dementia' as dementia_type
UNION select 44784473 as concept_id, 'Other dementia' as dementia_type
UNION select 4314734 as concept_id, 'Other dementia' as dementia_type
UNION select 44784560 as concept_id, 'Other dementia' as dementia_type
UNION select 37116464 as concept_id, 'Other dementia' as dementia_type
UNION select 36717598 as concept_id, 'Other dementia' as dementia_type
UNION select 37311999 as concept_id, 'Other dementia' as dementia_type
UNION select 36716795 as concept_id, 'Other dementia' as dementia_type
UNION select 37017549 as concept_id, 'Other dementia' as dementia_type
UNION select 42538610 as concept_id, 'Other dementia' as dementia_type
UNION select 3654920 as concept_id, 'Other dementia' as dementia_type
UNION select 36716797 as concept_id, 'Other dementia' as dementia_type
UNION select 37116466 as concept_id, 'Other dementia' as dementia_type
UNION select 4180284 as concept_id, 'Other dementia' as dementia_type
UNION select 606974 as concept_id, 'Other dementia' as dementia_type
UNION select 37110513 as concept_id, 'Other dementia' as dementia_type
UNION select 37116467 as concept_id, 'Other dementia' as dementia_type
UNION select 40483103 as concept_id, 'Other dementia' as dementia_type
UNION select 37119154 as concept_id, 'Other dementia' as dementia_type
UNION select 3654921 as concept_id, 'Other dementia' as dementia_type
UNION select 36716796 as concept_id, 'Other dementia' as dementia_type
UNION select 44782559 as concept_id, 'Other dementia' as dementia_type
UNION select 44782422 as concept_id, 'Other dementia' as dementia_type
UNION select 37311998 as concept_id, 'Other dementia' as dementia_type
UNION select 44782710 as concept_id, 'Other dementia' as dementia_type
UNION select 37116465 as concept_id, 'Other dementia' as dementia_type
UNION select 42538609 as concept_id, 'Other dementia' as dementia_type
UNION select 43020422 as concept_id, 'Other dementia' as dementia_type
UNION select 42535731 as concept_id, 'Other dementia' as dementia_type
UNION select 44782935 as concept_id, 'Other dementia' as dementia_type
UNION select 441002 as concept_id, 'Other dementia' as dementia_type
UNION select 4307791 as concept_id, 'Other dementia' as dementia_type
UNION select 3188986 as concept_id, 'Other dementia' as dementia_type
UNION select 43530666 as concept_id, 'Other dementia' as dementia_type
UNION select 37116469 as concept_id, 'Other dementia' as dementia_type
UNION select 37116468 as concept_id, 'Other dementia' as dementia_type
UNION select 4244346 as concept_id, 'Other dementia' as dementia_type
UNION select 37311665 as concept_id, 'Other dementia' as dementia_type
UNION select 376095 as concept_id, 'Other dementia' as dementia_type
UNION select 37110677 as concept_id, 'Other dementia' as dementia_type
UNION select 37018608 as concept_id, 'Other dementia' as dementia_type
UNION select 1340302 as concept_id, 'Other dementia' as dementia_type
UNION select 1340358 as concept_id, 'Other dementia' as dementia_type
UNION select 4044051 as concept_id, 'Other dementia' as dementia_type
UNION select 4044050 as concept_id, 'Other dementia' as dementia_type
UNION select 4043378 as concept_id, 'Other dementia' as dementia_type
UNION select 377788 as concept_id, 'Other dementia' as dementia_type
UNION select 37109222 as concept_id, 'Other dementia' as dementia_type
UNION select 374341 as concept_id, 'Other dementia' as dementia_type
UNION select 4139421 as concept_id, 'Other dementia' as dementia_type
UNION select 36717248 as concept_id, 'Other dementia' as dementia_type
UNION select 4043381 as concept_id, 'Other dementia' as dementia_type
UNION select 4047752 as concept_id, 'Other dementia' as dementia_type
UNION select 762497 as concept_id, 'Other dementia' as dementia_type
UNION select 439795 as concept_id, 'Other dementia' as dementia_type
UNION select 4046090 as concept_id, 'Other dementia' as dementia_type
UNION select 43021816 as concept_id, 'Other dementia' as dementia_type
UNION select 762704 as concept_id, 'Other dementia' as dementia_type
UNION select 379778 as concept_id, 'Other dementia' as dementia_type
UNION select 37395562 as concept_id, 'Other dementia' as dementia_type
UNION select 377254 as concept_id, 'Other dementia' as dementia_type
UNION select 444091 as concept_id, 'Other dementia' as dementia_type
UNION select 443790 as concept_id, 'Other dementia' as dementia_type
UNION select 443864 as concept_id, 'Other dementia' as dementia_type
UNION select 4046085 as concept_id, 'Other dementia' as dementia_type
UNION select 4224860 as concept_id, 'Other dementia' as dementia_type
UNION select 37396063 as concept_id, 'Other dementia' as dementia_type
UNION select 4047748 as concept_id, 'Other dementia' as dementia_type
UNION select 4047744 as concept_id, 'Other dementia' as dementia_type
UNION select 4044049 as concept_id, 'Other dementia' as dementia_type
UNION select 372610 as concept_id, 'Other dementia' as dementia_type
UNION select 44784521 as concept_id, 'Other dementia' as dementia_type
UNION select 35610098 as concept_id, 'Other dementia' as dementia_type
UNION select 35610099 as concept_id, 'Other dementia' as dementia_type
UNION select 378125 as concept_id, 'Other dementia' as dementia_type
UNION select 4224240 as concept_id, 'Other dementia' as dementia_type
UNION select 37017247 as concept_id, 'Other dementia' as dementia_type
UNION select 381832 as concept_id, 'Other dementia' as dementia_type
UNION select 44782771 as concept_id, 'Other dementia' as dementia_type
UNION select 377527 as concept_id, 'Other dementia' as dementia_type
UNION select 4098163 as concept_id, 'Other dementia' as dementia_type
UNION select 35610096 as concept_id, 'Other dementia' as dementia_type
UNION select 43020444 as concept_id, 'Other dementia' as dementia_type
UNION select 37396465 as concept_id, 'Other dementia' as dementia_type
UNION select 36674472 as concept_id, 'Other dementia' as dementia_type
UNION select 4046084 as concept_id, 'Other dementia' as dementia_type
UNION select 4009647 as concept_id, 'Other dementia' as dementia_type
UNION select 4046088 as concept_id, 'Other dementia' as dementia_type
UNION select 37109635 as concept_id, 'Other dementia' as dementia_type
UNION select 4245766 as concept_id, 'Other dementia' as dementia_type
UNION select 4046091 as concept_id, 'Other dementia' as dementia_type
UNION select 4048875 as concept_id, 'Other dementia' as dementia_type
UNION select 4196433 as concept_id, 'Other dementia' as dementia_type
UNION select 376946 as concept_id, 'Other dementia' as dementia_type
UNION select 380986 as concept_id, 'Other dementia' as dementia_type
UNION select 379784 as concept_id, 'Other dementia' as dementia_type
UNION select 4101137 as concept_id, 'Other dementia' as dementia_type
UNION select 4100250 as concept_id, 'Other dementia' as dementia_type
UNION select 4159643 as concept_id, 'Other dementia' as dementia_type
UNION select 765653 as concept_id, 'Other dementia' as dementia_type
UNION select 42538857 as concept_id, 'Other dementia' as dementia_type
UNION select 4234089 as concept_id, 'Other dementia' as dementia_type
UNION select 4047747 as concept_id, 'Other dementia' as dementia_type
UNION select 439276 as concept_id, 'Other dementia' as dementia_type
UNION select 376085 as concept_id, 'Other dementia' as dementia_type
UNION select 375791 as concept_id, 'Other dementia' as dementia_type
UNION select 443605 as concept_id, 'Other dementia' as dementia_type
UNION select 44782934 as concept_id, 'Other dementia' as dementia_type
UNION select 4046089 as concept_id, 'Other dementia' as dementia_type
UNION select 37018688 as concept_id, 'Other dementia' as dementia_type
UNION select 37109056 as concept_id, 'Other dementia' as dementia_type
)

SELECT distinct co.person_id, a.dementia_type
FROM condition_occurrence co JOIN adrdconcepts a ON co.condition_concept_id = a.concept_id