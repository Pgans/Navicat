SELECT DISTINCT a.reg_datetime, a.visit_id, a.hn , p.cid , p.fname ,p.lname ,floor(datediff(a.REG_DATETIME, p.BIRTHDATE)/365.25) AS age , i.icd10_tm
FROM opd_visits a
INNER JOIN cid_hn b ON a.hn = b.hn 
INNER JOIN population p ON b.cid = p.cid 
RIGHT  JOIN opd_diagnosis c ON a.visit_id = c.visit_id AND c.is_cancel =0
INNER JOIN icd10new i ON c.icd10 = i.icd10 and i.icd10_tm IN ('Z33','Z340','Z348')
WHERE a.REG_DATETIME > '2018.01.01'
AND a.is_cancel = 0