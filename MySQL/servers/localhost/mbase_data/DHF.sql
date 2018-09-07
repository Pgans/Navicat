SELECT a.REG_DATETIME  ,a.VISIT_ID, .a.HN , c.ICD10_TM, c.ICD_NAME
FROM opd_visits a
INNER JOIN opd_diagnosis b  ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND c.icd10_tm  BETWEEN 'A90' AND 'A99'
WHERE a.REG_DATETIME BETWEEN '2018-06-01' AND '2018-06-30'
AND a.is_cancel = 0
GROUP BY a.VISIT_ID 
