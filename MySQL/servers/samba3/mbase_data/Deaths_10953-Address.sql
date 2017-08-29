SELECT a.CID,b.HN,CONCAT(p.fname,' ' ,p.lname)AS Fullname, a.DEATH_DATE,a.STAFF_ID , a.AN, a.CDEATH,c.INSCL_NAME,
p.HOME_ADR, d.TOWN_NAME AS 'Mooban', e.TOWN_NAME AS 'Tumbol', f.TOWN_NAME AS 'Aumpur', g.TOWN_NAME AS 'Jungwat'
FROM deaths a, cid_hn b,main_inscls c, opd_visits o, population p, towns d, towns e, towns f,towns g
WHERE  a.cid = b.cid
AND a.DEATH_DT BETWEEN '2016.10.01' AND  '2017.07.18'
AND a.is_cancel = 0
AND a.CID = b.CID
AND a.IS_HOSP = 1
AND o.HN = b.HN
AND p.CID = b.CID
AND o.INSCL = c.INSCL
AND p.TOWN_ID = d.TOWN_ID
AND CONCAT(LEFT(p.TOWN_ID,6),'00')= e.TOWN_ID
 AND CONCAT(LEFT(p.TOWN_ID,4),'0000') = f.TOWN_ID
 AND CONCAT(LEFT(p.TOWN_ID,2),'000000') = g.TOWN_ID
 GROUP BY a.CID ORDER BY a.DEATH_DT