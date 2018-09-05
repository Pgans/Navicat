SELECT c.REG_DATETIME, a.CID, e.ICD10_TM , 
FROM population a
INNER JOIN cid_hn b ON a.cid = b.cid 
INNER JOIN opd_visits c ON b.hn = c.hn 
INNER JOIN opd_diagnosis d ON c.visit_id = d.visit_id AND d.IS_CANCEL = 0
INNER JOIN icd10new e ON d.ICD10 = e.ICD10 
WHERE  c.is_cancel =0
AND  a.CID IN (1349900821292,2349900041686)