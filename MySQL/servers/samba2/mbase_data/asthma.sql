SELECT  DISTINCT a.VISIT_ID , a.HN , c.FNAME , c.LNAME , e.ICD10_TM , c.TOWN_ID
FROM opd_visits a
INNER JOIN cid_hn b ON a.HN = b.HN
INNER JOIN population c ON b.CID = c.CID 
INNER JOIN opd_diagnosis d ON a.VISIT_ID = d.VISIT_ID AND d.IS_CANCEL = 0
INNER JOIN icd10new e ON d.icd10 = e.icd10 AND e.icd10_tm BETWEEN 'J45' AND 'J46'
WHERE a.REG_DATETIME > '2017.10.01'
AND a.is_cancel = 0
LIMIT 10 ;