SELECT a.REG_DATETIME  ,a.VISIT_ID,  a.HN , e.FNAME, e.LNAME, f.UNIT_NAME,c.ICD10_TM, c.ICD_NAME
FROM opd_visits a
INNER JOIN opd_diagnosis b  ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND c.icd10_tm  BETWEEN 'A90' AND 'A99'
INNER JOIN cid_hn d ON a.hn = d.hn 
LEFT JOIN population e ON d.cid = e.cid 
LEFT JOIN service_units f ON a.unit_reg = f.unit_id
WHERE a.REG_DATETIME > '2018.07.01'
AND a.is_cancel = 0
GROUP BY a.VISIT_ID 
