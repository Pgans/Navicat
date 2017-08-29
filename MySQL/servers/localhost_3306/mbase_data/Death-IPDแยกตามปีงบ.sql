SELECT c.HN , a.ADM_ID AS AN, DATE_FORMAT(a.ADM_DT,'%Y-%m-%d') AS 'ADMIT', DATE_FORMAT(a.DSC_DT,'%Y-%m-%d') AS 'DSC' ,f.DEATH_DATE, b.BIRTHDATE,
b.FNAME, b.LNAME,b.SEX,a.DSC_STATUS,a.DSC_TYPE,a.WARD_NO,g.UNIT_NAME,i.ICD10_TM, i.ICD_NAME
FROM ipd_reg a, population b, cid_hn c,opd_visits e,deaths f,service_units g,opd_diagnosis h, icd10new i
WHERE a.DSC_DT BETWEEN '20151001' AND '20160930'
AND a.IS_CANCEL = 0
AND a.DSC_STATUS > 7
AND b.CID = c.CID
AND a.VISIT_ID = e.VISIT_ID
AND e.HN = c.HN
AND f.CID = c.CID
AND a.WARD_NO = g.UNIT_ID
AND e.VISIT_ID = h.VISIT_ID
AND h.ICD10 = i.ICD10
GROUP BY a.ADM_ID 