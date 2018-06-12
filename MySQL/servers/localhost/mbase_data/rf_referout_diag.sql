SET @vn = '0001907378'; 
SELECT DISTINCT gcoffice.offid as hcode , '' rec_no ,concat(gcoffice.offid, '-3-', a.refer_id ) refer_no ,c.icd10_tm as icd10 ,
CASE WHEN b.dxt_id = 01 THEN '1' 
WHEN b.dxt_id = 02 THEN '5' 
WHEN b.dxt_id = 03 THEN '3' WHEN b.dxt_id = 04 THEN '4' 
WHEN b.dxt_id = 05 THEN '5' WHEN b.dxt_id = 06 THEN '6' 
WHEN b.dxt_id = 07 THEN '7' WHEN b.dxt_id = 08 THEN '8' 
WHEN b.dxt_id = 09 THEN '9' ELSE '5' END as diagtype_id FROM gcoffice , refers a 
INNER JOIN opd_diagnosis b ON a.visit_id = b.visit_id AND b.is_cancel = 0 
INNER JOIN icd10new c ON b.icd10 = c.icd10 
WHERE a.visit_id = @vn
AND a.is_cancel = 0 
