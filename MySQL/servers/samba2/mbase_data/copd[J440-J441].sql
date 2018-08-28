SELECT DISTINCT a.REG_DATETIME, a.HN ,CONCAT(trim(c.fname),'  ',trim(c.LNAME)) as FULLNAME,d.DXT_ID, e.ICD10_TM
FROM opd_visits a 
INNER JOIN cid_hn b ON a.hn = b.hn
LEFT JOIN population c ON b.cid = c.cid
INNER JOIN opd_diagnosis d ON a.visit_id = d.visit_id and d.is_cancel = 0 AND d.DXT_ID = 1
INNER JOIN icd10new e ON d.icd10 = e.icd10 and e.icd10_tm in ('J440','J441') 

WHERE a.REG_DATETIME > '2018.07.09'
AND a.is_cancel = 0
