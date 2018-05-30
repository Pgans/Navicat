SELECT DISTINCT a.regdate, a.cid, a.fullname, a.hn,a.visit_id , c.icd10_tm ,c.NICKNAME as nickname ,b.DXT_ID as dxt
FROM  mb_diagAP a
LEFT JOIN opd_diagnosis b ON a.visit_id = b.visit_id 
INNER JOIN icd10new c ON b.ICD10 = c.ICD10 