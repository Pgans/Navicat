SELECT a.VISIT_ID, a.HN, a.REG_DATETIME,a.FINISH_DATETIME,a.UNIT_REG,a.STAFF_ID,a.INSCL,c.ICD10_TM,c.ICD_NAME
FROM opd_visits a,opd_diagnosis b,icd10new c
WHERE a.REG_DATETIME >'20160101'
AND a.VISIT_ID = b.VISIT_ID
AND a.IS_CANCEL = 0
AND b.DXG_ID = 1
AND b.ICD10 = c.ICD10
AND a.VISIT_ID NOT IN (SELECT VISIT_ID FROM ipd_reg)
GROUP BY a.VISIT_ID ;
