SELECT DISTINCT hosp_nhso.HOSP_ID, HOSP_NAME ,COUNT(hosp_nhso.HOSP_NAME)AS 'TOTAL' 
FROM  opd_visits, refers
INNER JOIN hosp_nhso ON hosp_nhso.HOSP_ID = refers.HOSP_ID
WHERE refers.RF_DT BETWEEN '20131001' AND '20140131'
AND refers.VISIT_ID = opd_visits.VISIT_ID
AND refers.IS_CANCEL = 0
AND refers.RF_TYPE = '2'
AND refers.VISIT_ID not IN (SELECT VISIT_ID FROM ipd_reg)
GROUP BY hosp_nhso.HOSP_ID  ORDER BY 'TOTAL' DESC;