
SELECT  DISTINCT CONCAT(b.HN,'  ',o.ICD10 ) AS ID, a.VISIT_ID, b.HN ,DATE_FORMAT(a.LREQ_DT,'%Y-%m-%d') AS DATE_SERV , LAB_RESULT,SUBSTR(a.lab_result,7,4) as A1c,
a.STAFF_ID, d.TOWN_ID,FLOOR(DATEDIFF(NOW() ,d.BIRTHDATE)/365.25)  AS AGE,
CASE 
WHEN  a.VISIT_ID NOT IN (SELECT VISIT_ID FROM mobile_visits) THEN  '1'
WHEN  a.VISIT_ID  IN (SELECT VISIT_ID FROM mobile_visits) THEN '2'
END AS 'SERVPLACE', f.ICD10_TM, f.ICD10 , o.DXT_ID
FROM  opd_visits b,population d, cid_hn c, lab_requests a
INNER JOIN opd_diagnosis o ON  a.VISIT_ID = o.VISIT_ID AND o.IS_CANCEL = 0  
INNER JOIN icd10new f ON o.ICD10 = f.ICD10
WHERE a.LREQ_DT BETWEEN '2017.10.01 00:01' AND '2018.09.30 23:59'
AND a.IS_CANCEL = 0
AND b.IS_CANCEL = 0
AND a.LAB_ID = '123'
AND  a.LAB_RESULT !=  '   '   
AND a.visit_id =b.visit_id
AND b.hn = c.hn
AND c.cid = d.cid

 