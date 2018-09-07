SELECT a.date_serv,a.VISIT_ID, a.HN , CONCAT (TRIM(c.FNAME),'     ',TRIM(c.LNAME)) as FULLNAME, c.SEX,
a.A1c,a.LAB_RESULT, 
c.HOME_ADR as 'HOME', d.TOWN_NAME as 'MOOBAN' , e.TOWN_NAME AS 'TUMBOL', f.TOWN_NAME AS 'AMPUR'
FROM mb_HbA1c a
INNER JOIN cid_hn b ON a.HN = b.HN
INNER JOIN population c ON b.CID = c.CID
INNER JOIN towns d ON a.TOWN_ID = d.TOWN_ID
INNER JOIN towns e ON CONCAT (left(a.TOWN_ID,6),'00') = e.town_id
INNER JOIN towns f ON CONCAT (LEFT(a.town_id,4),'0000') = f.town_id
WHERE  left(a.ICD10_TM,2) = 'E1'  
AND a.DATE_SERV >= '2017-10-01'
AND a.A1c BETWEEN '7' AND '8'
#AND a.A1c < 7
#AND a.A1c >8
GROUP BY a.HN