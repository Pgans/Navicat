SELECT a.OP_DT,a.VISIT_ID ,c.HN, b.ICD9_CODE,b.NICKNAME, d.INSCL, d.INSCL_NAME, a.STAFF_ID,a.SURGEON_ID
FROM opd_operations a 
INNER JOIN icd9cm b ON a.icd9 = b.icd9
LEFT JOIN opd_visits c ON a.visit_id = c.visit_id AND c.is_cancel = 0
INNER JOIN main_inscls d ON c.inscl = d.inscl
WHERE a.OP_DT BETWEEN '2018-05-01' AND '2018-05-31'
AND b.NICKNAME BETWEEN 'PT00' AND 'PT75'