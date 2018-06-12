SELECT  DISTINCT a.REG_DATETIME as regdate , a.HN as hn , a.visit_id as visit_id ,e.cid ,concat(trim(e.FNAME), '   ' ,trim(e.LNAME)) as fullname 
 ,c.icd10_tm , c.nickname, b.DXT_ID as dxt
FROM opd_visits a
INNER JOIN opd_diagnosis b ON a.visit_id = b.visit_id  AND b.IS_CANCEL = 0 AND b.DXT_ID = 1
INNER JOIN icd10new c ON b.icd10 = c.icd10  AND c.icd10_tm ='B24'
INNER JOIN cid_hn d ON d.hn = a.hn 
INNER JOIN population e ON d.cid = e.cid 
WHERE a.reg_datetime > '2018.03.01'
AND a.is_cancel =0
GROUP BY e.cid 