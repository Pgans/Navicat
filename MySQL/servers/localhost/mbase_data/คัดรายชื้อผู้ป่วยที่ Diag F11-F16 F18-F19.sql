SELECT  a.CID , a.FNAME, a.LNAME,
CASE 
WHEN a.SEX = 1 THEN 'ชาย'
WHEN a.SEX = 2 THEN 'หญิง'
END AS SEX, 
floor(DATEDIFF(NOW(),a.BIRTHDATE)/365.25) AS AGE,
e.ICD10_TM, e.ICD_NAME , a.HOME_ADR AS 'HOME', f.TOWN_NAME AS 'MOOBAN',g.town_name AS 'TUMBON', h.town_name AS 'AMPOR'
FROM population a 
INNER JOIN cid_hn b ON a.cid = b.cid
INNER JOIN opd_visits c  ON b.hn = c.hn
INNER JOIN opd_diagnosis d ON c.visit_id = d.visit_id AND d.is_cancel =0
INNER JOIN icd10new e ON d.icd10 = e.icd10 AND (e.icd10_tm BETWEEN 'F11' AND 'F16' OR e.icd10_tm BETWEEN 'F18' AND 'F19')
INNER JOIN towns f ON a.town_id = f.town_id 
INNER JOIN towns g ON CONCAT(LEFT(a.town_id,6),'00')= g.TOWN_ID
INNER JOIN towns h ON CONCAT(LEFT(a.town_id,4),'0000')= h.TOWN_ID
WHERE c.is_cancel = 0
AND a.cid NOT IN (SELECT cid FROM deaths)
GROUP BY c.HN ;