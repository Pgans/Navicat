SELECT DISTINCT  gcoffice.offid HOSPCODE, a.HN PID, a.VISIT_ID SEQ, DATE_FORMAT(a.REG_DATETIME,%%%)
FROM  mbase_data.gcoffice, mbase_data.cid_hn b , mbase_data.population c  , mbase_data.opd_visits a
RIGHT JOIN mbase_data.opd_diagnosis d ON  a.VISIT_ID = d.VISIT_ID AND d.IS_CANCEL =0 
INNER JOIN mbase_data.icd10new e ON d.ICD10 = e.ICD10 AND ICD10_TM  IN ('Z301')
WHERE a.REG_DATETIME > '2018-01-01 00:00'
AND a.IS_CANCEL = 0
AND a.HN = b.HN AND c.CID = c.CID