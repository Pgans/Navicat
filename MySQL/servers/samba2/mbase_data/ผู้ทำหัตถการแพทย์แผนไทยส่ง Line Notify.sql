SELECT DATE(a.REG_DATETIME) as REDATE,a.STAFF_ID, b.SURGEON_ID ,
e.FNAME AS Provider, COUNT(CASE WHEN SUBSTR(tname,1,3) ='ฝัง' THEN '1' END) AS 'ฝังเข็ม',
COUNT(CASE WHEN SUBSTR(tname,4,6) ='บริบาล' THEN '1' END) AS 'บริบาล', 
COUNT(case WHEN left(TNAME,6) = 'การนวด' THEN '2'END) AS 'การนวด',
COUNT(CASE WHEN SUBSTR(tname,4,2) = 'อบ' THEN '4' END) AS 'อบ', 
COUNT(CASE WHEN SUBSTR(tname,4,5) = 'ประคบ' THEN '5' END) AS 'ประคบ', 
COUNT(CASE WHEN SUBSTR(tname,4,8) = 'ส่งเสริม' THEN '5' END) AS 'ส่งเสริม', 
COUNT(CODE) AS Total 
FROM opd_visits a
INNER JOIN opd_operations b ON a.VISIT_ID = b.VISIT_ID AND b.is_cancel =0 
INNER JOIN icd9cm c ON b.icd9 = c.ICD9 AND c.CGD_ID = '15'
INNER JOIN staff d ON b.SURGEON_ID = d.STAFF_ID
INNER JOIN population e ON d.CID = e.CID
WHERE a.REG_DATETIME > CURDATE()-2
AND a.is_cancel = 0
GROUP BY b.SURGEON_ID