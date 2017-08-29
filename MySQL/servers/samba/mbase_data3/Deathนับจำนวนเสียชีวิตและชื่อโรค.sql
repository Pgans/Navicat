SELECT f.NICKNAME, COUNT(DISTINCT z.NICKNAME) FROM
(SELECT d.CID , d.DEATH_DATE, f.NICKNAME
FROM population a, cid_hn b, opd_visits c,deaths d, opd_diagnosis e
INNER JOIN icd10new f ON f.icd10 = e.icd10
WHERE a.CID = b.CID
AND d.DEATH_DATE BETWEEN '20150101' AND '20150330'
AND b.HN = c.HN 
AND c.VISIT_ID = e.VISIT_ID
AND a.CID = d.CID
GROUP BY d.CID) as z;