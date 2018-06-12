SELECT DISTINCT c.visit_id , c.hn , a.ICD10 , e.icd10_tm 
FROM  chronic_reg a
INNER JOIN cid_hn b ON a.cid = b.cid 
INNER JOIN  opd_visits c ON  b.hn = c.hn  AND c.is_cancel = 0
left JOIN opd_diagnosis d ON c.visit_id = d.visit_id AND d.is_cancel = 0
left JOIN icd10new e ON d.icd10 = d.icd10  
WHERE c.REG_DATETIME > '2018.01.01'
AND a.DSC_DATE = 0
AND a.ICD10 IN ('E10', 'E11', 'E12','E13', 'E14')
AND e.icd10_tm BETWEEN 'N181' AND 'N184'


LIMIT 11
