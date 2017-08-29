SELECT b.CID , c.HN ,a.ADM_ID AS AN ,a.ADM_DT,a.DSC_DT ,f.DEATH_DATE,h.ICD_NAME AS DIAG,g.UNIT_NAME,a.DSC_STATUS, a.DSC_TYPE
FROM ipd_reg a, population b, cid_hn c,opd_visits e,deaths f,service_units g,icd10new h
WHERE a.DSC_DT BETWEEN '20151001' AND '20160930'
AND a.IS_CANCEL = 0
AND (a.DSC_STATUS > 6 OR a.DSC_STATUS =9)
AND b.CID = c.CID
AND a.VISIT_ID = e.VISIT_ID
AND e.HN = c.HN
AND f.CID = c.CID
AND a.WARD_NO = g.UNIT_ID
AND f.CDEATH = h.ICD10_TM
GROUP BY a.ADM_ID 