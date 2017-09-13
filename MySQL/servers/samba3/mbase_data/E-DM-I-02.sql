SELECT DISTINCT COUNT(k.hn) AS CountPT
FROM 
(SELECT  DISTINCT c.visit_id, c.hn, a.FNAME , a.LNAME, e.ICD10
FROM  opd_visits c
INNER JOIN cid_hn b ON c.HN = b.HN 
INNER JOIN population a ON a.CID = b.CID 
#LEFT JOIN opd_diagnosis d ON d.VISIT_ID = c.VISIT_ID 
RIGHT  JOIN chronic_reg  e ON e.CID = b.CID AND e.ICD10 = 'E11' 
WHERE  c.REG_DATETIME BETWEEN '20141001' AND '20150331'
AND c.IS_CANCEL = 0
AND EXISTS (SELECT * FROM prescriptions p WHERE p.drug_id = '0132' 
AND p.visit_id = c.VISIT_ID)  
AND NOT EXISTS (SELECT * FROM  opd_diagnosis d WHERE d.icd10 IN ('0000037425', '0000037426') 
AND d.VISIT_ID= c.VISIT_ID)
GROUP BY c.HN ) AS k



SELECT DISTINCT COUNT(k.hn) AS CountPT
FROM 
(SELECT  DISTINCT c.visit_id, c.hn, a.FNAME , a.LNAME, e.ICD10
FROM  opd_visits c
INNER JOIN cid_hn b ON c.HN = b.HN 
INNER JOIN population a ON a.CID = b.CID 
#LEFT JOIN opd_diagnosis d ON d.VISIT_ID = c.VISIT_ID 
RIGHT  JOIN chronic_reg  e ON e.CID = b.CID AND e.ICD10 = 'E11' 
WHERE  c.REG_DATETIME BETWEEN '20141001' AND '20150331'
AND c.IS_CANCEL = 0
AND EXISTS (SELECT * FROM prescriptions p WHERE p.drug_id = '0132' 
AND p.visit_id = c.VISIT_ID)
GROUP BY c.hn  ) AS k
