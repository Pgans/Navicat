SELECT z.NICKNAME, COUNT(DISTINCT z.NICKNAME) FROM
(SELECT d.CID , d.DEATH_DATE, f.NICKNAME
FROM population a, cid_hn b, opd_visits c,deaths d, opd_diagnosis e
INNER JOIN icd10new f ON f.icd10 = e.icd10
WHERE a.CID = b.CID
AND d.DEATH_DATE BETWEEN '20151001' AND '20160930'
AND b.HN = c.HN 
AND c.VISIT_ID = e.VISIT_ID
AND a.CID = d.CID
GROUP BY d.CID) as z;


SELECT d.CID ,a.FNAME, a.LNAME, d.DEATH_DATE, f.NICKNAME
FROM population a, cid_hn b, opd_visits c,deaths d, opd_diagnosis e
INNER JOIN icd10new f ON f.icd10 = e.icd10
WHERE a.CID = b.CID
AND d.DEATH_DATE BETWEEN '20151001' AND '20160930'
AND b.HN = c.HN 
AND c.VISIT_ID = e.VISIT_ID
AND a.CID = d.CID
GROUP BY d.CID


