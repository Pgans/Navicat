SELECT a.VISIT_ID, a.HN , CONCAT (TRIM(c.FNAME),'     ',TRIM(c.LNAME)) as FULLNAME, 
FROM mb_HbA1c a
INNER JOIN cid_hn b ON a.HN = b.HN
INNER JOIN population c ON b.CID = c.CID
WHERE  left(a.ICD10_TM,2) = 'E1' 
AND a.DATE_SERV >= '2017-10-01'
 