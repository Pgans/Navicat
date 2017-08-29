SELECT  DISTINCT a.VISIT_ID ,a.HN, a.REG_DATETIME, c.`CODE`, c.NICKNAME,c.CGD_ID
FROM opd_visits a, opd_operations b, icd9cm c
WHERE  a.REG_DATETIME BETWEEN '20160901' AND '20161101'
AND a.IS_CANCEL = 0
AND a.VISIT_ID = b.VISIT_ID
AND b.ICD9 = c.ICD9
AND c.CGD_ID = 15

;