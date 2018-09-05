      
SELECT 
a.VISIT_ID as seq,
date(a.REG_DATETIME) as date_serv,
 time(a.REG_DATETIME) as time_serv,
 c.ICD10_TM as   icd_code,
   c.ICD_NAME as  icd_name,
CASE 
WHEN b.DXT_ID  = 1  THEN 'primary'
WHEN b.DXT_ID  = 2  THEN 'comorbildity'
WHEN b.DXT_ID  = 3  THEN 'complication'
WHEN b.DXT_ID  = 4  THEN 'orther'
WHEN b.DXT_ID  = 5  THEN 'external cause'
    END as  diag_type
FROM  opd_visits a
INNER JOIN opd_diagnosis b  ON a.VISIT_ID  = b.VISIT_ID  AND b.IS_CANCEL =0
INNER JOIN  icd10new  c  ON  b.ICD10  = c.ICD10 
WHERE a.is_cancel = 0
LIMIT  500 
