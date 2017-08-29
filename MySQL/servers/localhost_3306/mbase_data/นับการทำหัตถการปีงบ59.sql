SELECT c.ICD9_CODE,c.NICKNAME, COUNT(b.ICD9_ID) AS Total
FROM opd_visits a, opd_operations b, icd9cm c
WHERE  a.REG_DATETIME BETWEEN '20151001' AND '20160930'
AND a.IS_CANCEL = 0
AND a.VISIT_ID = b.VISIT_ID
AND b.icd9 = c.ICD9
GROUP BY c.ICD9_CODE   ORDER BY Total DESC;