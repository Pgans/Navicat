SELECT DISTINCT COUNT(k.VISIT_ID) AS VisitsPT
FROM 
(SELECT DISTINCT a.VISIT_ID , a.HN , c.FNAME, c.LNAME , h.ICD10, p.DRUG_ID
FROM opd_visits a
INNER JOIN cid_hn b ON a.HN = b.HN
INNER JOIN population c ON b.CID = c.CID 
INNER  JOIN chronic_reg h ON h.CID = b.CID AND h.ICD10 = 'I10'
RIGHT  JOIN prescriptions p ON p.VISIT_ID = a.VISIT_ID AND p.DRUG_ID IN ('0441' , '0078' , '1729')
WHERE  a.REG_DATETIME BETWEEN '20141001' AND '20141031'
AND a.IS_CANCEL = 0) as k


SELECT DISTINCT COUNT(k.VISIT_ID) AS VisitsPT
FROM 
(SELECT DISTINCT a.VISIT_ID , a.HN , c.FNAME, c.LNAME , h.ICD10, p.DRUG_ID
FROM opd_visits a
INNER JOIN cid_hn b ON a.HN = b.HN
INNER JOIN population c ON b.CID = c.CID 
INNER  JOIN chronic_reg h ON h.CID = b.CID AND h.ICD10 = 'I10'
RIGHT  JOIN prescriptions p ON p.VISIT_ID = a.VISIT_ID AND p.DRUG_ID IN ('0441' , '0078' , '1729')
WHERE  a.REG_DATETIME BETWEEN '20141001' AND '20141031'
AND a.IS_CANCEL = 0
GROUP BY a.VISIT_ID) as k