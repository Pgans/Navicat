SELECT a.VISIT_ID,b.HN, a.ADM_ID, a.ADM_DT,a.DSC_TYPE,a.DSC_STATUS
FROM ipd_reg  a,opd_visits b, cid_hn c, deaths d
WHERE a.DSC_DT BETWEEN '20151001' AND '20160930'
AND a.IS_CANCEL = 0
AND (a.DSC_TYPE >6  OR a.DSC_STATUS = 9)
AND a.VISIT_ID = b.VISIT_ID
AND b.HN = c.HN
AND c.CID = d.CID
GROUP BY a.ADM_ID 
;
 