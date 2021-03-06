SELECT COUNT(DISTINCT (a.HN)) AS CountPT
FROM
(
SELECT  ov.HN, i.ICD10_TM
FROM  opd_visits ov
LEFT JOIN opd_diagnosis dx  ON dx.VISIT_ID = ov.VISIT_ID
INNER  JOIN icd10new i ON  i.ICD10_ID = dx.ICD10_ID AND LEFT(i.ICD10_TM, 3) = 'E11'
WHERE ov.REG_DATETIME BETWEEN '20140101' AND '20140631'
AND ov.IS_CANCEL = 0
AND ov.VISIT_ID = dx.VISIT_ID
AND EXISTS ( SELECT * FROM prescriptions p WHERE p.visit_id = ov.VISIT_ID )
#AND p.drug_id = '0132')
AND NOT EXISTS (SELECT * FROM opd_diagnosis d 
LEFT JOIN icd10new ic1 ON ic1.ICD10_ID = d.ICD10_ID
WHERE  d.VISIT_ID = ov.VISIT_ID 
AND  ic1.`CODE` IN ('n184','n186')) ) AS a


