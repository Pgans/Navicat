SELECT CURDATE()-1 , c.ICD10_TM, COUNT(DISTINCT a.HN) AS AMOUNT
FROM mbase_data.opd_visits a
INNER JOIN mbase_data.opd_diagnosis b ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN mbase_data.icd10new c ON b.icd10 = c.icd10 AND c.ICD10_TM = 'F320'
WHERE a.REG_DATETIME > CURDATE()-1
GROUP BY c.ICD10_TM