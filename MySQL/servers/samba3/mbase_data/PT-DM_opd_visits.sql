SELECT DISTINCT opd_visits.VISIT_ID, opd_visits.HN,icd10new.ICD10_TM
FROM population, cid_hn, opd_visits
INNER JOIN opd_diagnosis ON opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID
INNER JOIN icd10new ON icd10new.ICD10_ID = opd_diagnosis.ICD10_ID
WHERE opd_visits.REG_DATETIME BETWEEN '20150101' AND '20150228'
AND icd10new.ICD10_TM BETWEEN 'E11' AND 'E14'
AND opd_visits.IS_CANCEL = 0
LIMIT 10;

