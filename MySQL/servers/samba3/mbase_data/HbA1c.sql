SELECT CONCAT(b.VISIT_ID ,"" ,b.HN) AS ID, a.VISIT_ID, b.HN, a.LREQ_DT,LAB_RESULT,SUBSTR(a.lab_result,7,4) as A1c, a.STAFF_ID, d.TOWN_ID, FLOOR(DATEDIFF(NOW() ,d.BIRTHDATE)/365.25)  AS AGE,
CASE 
WHEN  a.VISIT_ID NOT IN (SELECT VISIT_ID FROM mobile_visits) THEN  '1'
WHEN  a.VISIT_ID  IN (SELECT VISIT_ID FROM mobile_visits) THEN '2'
END AS 'SERVPLACE'
FROM  opd_visits b,population d, cid_hn c, lab_requests a
WHERE a.LREQ_DT > '2015.10.01 00:01' 
AND a.IS_CANCEL = 0
AND b.IS_CANCEL = 0
AND a.LAB_ID = '123'
AND  a.LAB_RESULT !=  '   '   
AND a.visit_id =b.visit_id
AND b.hn = c.hn
AND c.cid = d.cid
#AND LEFT(d.town_id,6) = '341401'
;

