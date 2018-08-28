SELECT DISTINCT MONTH(a.REG_DATETIME) as month , COUNT(a.VISIT_ID) AS amount
FROM opd_visits a
INNER JOIN opd_diagnosis b ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND (c.ICD10_TM BETWEEN 'F11' AND 'F16' OR c.icd10 in ('F18','F19'))
WHERE  a.REG_DATETIME > '2017-10-01'
AND a.is_cancel = 0
GROUP BY month