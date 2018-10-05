SELECT CURDATE() as regdate, a.INSCL , d.INSCL_NAME ,COUNT(a.VISIT_ID) as amount, c.CODE
FROM opd_visits a
INNER JOIN opd_operations b ON a.VISIT_ID = b.VISIT_ID AND b.is_cancel = 0
INNER JOIN icd9cm c ON b.icd9 = c.ICD9 AND c.CODE = '9007810'
INNER JOIN main_inscls d ON a.INSCL = d.INSCL
WHERE a.REG_DATETIME > CURDATE()-1
GROUP BY a.INSCL