
SELECT DISTINCT c.REG_DATETIME, c.VISIT_ID AS total,  f.visit_id AS accident, g.VISIT_ID AS refer, i.VISIT_ID AS adm, j.INSCL AS inscl
FROM population a, cid_hn b, opd_visits c 
INNER JOIN opd_diagnosis d ON d.VISIT_ID = c.VISIT_ID AND d.IS_CANCEL =0
INNER JOIN icd10new e ON d.ICD10 = e.ICD10 AND e.ICD10_TM BETWEEN 'S00' AND 'T98'
LEFT JOIN accidents f ON c.VISIT_ID = f.visit_id AND f.is_cancel = 0
LEFT JOIN refers g ON g.VISIT_ID = c.VISIT_ID AND g.IS_CANCEL = 0
LEFT JOIN ipd_reg i ON i.VISIT_ID = c.VISIT_ID AND i.IS_CANCEL = 0
LEFT JOIN main_inscls j ON j.INSCL = c.INSCL AND j.INSCL IN (18,19)
WHERE c.is_cancel = 0
AND c.REG_DATETIME > CURDATE()-1
AND a.CID = b.CID
AND b.HN = c.HN
