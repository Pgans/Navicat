SELECT a.VISIT_ID , b.HN , a.HOSP_ID AS 'HOSPID',f.HOSP_NAME, b.REG_DATETIME ,a.RF_DT, a.STAFF_ID,RF_TYPE,a.UNIT_ID, c.UNIT_NAME,e.ICD10_TM,e.ICD_NAME
FROM refers a, opd_visits b, service_units c, opd_diagnosis d, icd10new e, hosp_nhso f
WHERE a.RF_DT >'20170101'
AND a.IS_CANCEL = 0
AND a.VISIT_ID = b.VISIT_ID
AND a.RF_TYPE = '2'
AND a.UNIT_ID = c.UNIT_ID
AND a.VISIT_ID = d.VISIT_ID
AND d.ICD10 = e.ICD10
AND a.HOSP_ID = f.HOSP_ID
GROUP BY a.VISIT_ID 