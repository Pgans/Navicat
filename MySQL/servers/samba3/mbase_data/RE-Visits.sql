SELECT DISTINCT opd_visits.REG_DATETIME, opd_visits.VISIT_ID, population.CID, cid_hn.HN,population.FNAME, population.LNAME, icd10new.ICD10_TM
FROM  population, cid_hn, opd_visits
INNER JOIN opd_diagnosis ON opd_visits.VISIT_ID =opd_diagnosis.VISIT_ID 
INNER JOIN icd10new ON icd10new.ICD10_ID = opd_diagnosis.ICD10_ID  
WHERE population.cid=cid_hn.CID
AND cid_hn.HN = opd_visits.HN
AND opd_visits.REG_DATETIME  BETWEEN '20140101' AND '20140630' 
AND icd10new.ICD10_TM  BETWEEN 'J440' AND 'J449'
AND opd_visits.IS_CANCEL = 0
ORDER BY  opd_visits.VISIT_ID 

