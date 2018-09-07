SELECT count(a.VISIT_ID)
FROM opd_diagnosis a
LEFT JOIN opd_visits b ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON a.icd10 = c.ICD10 AND c.ICD10_TM = 'U778'
WHERE  b.REG_DATETIME > '2017.10.01'
AND a.is_cancel = 0
