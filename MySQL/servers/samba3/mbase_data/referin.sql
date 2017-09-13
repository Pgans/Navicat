SELECT  hosp_nhso.HOSP_ID as 'hospid', HOSP_NAME as 'hospname' ,
COUNT(hosp_nhso.HOSP_NAME)as 'TOTAL'
FROM  opd_visits, refers
INNER JOIN hosp_nhso ON hosp_nhso.HOSP_ID = refers.HOSP_ID
WHERE refers.RF_DT BETWEEN '20151001' AND '20160930'
AND refers.VISIT_ID = opd_visits.VISIT_ID
AND refers.IS_CANCEL = '0'
AND refers.RF_TYPE = '1'
GROUP BY HOSP_NAME ORDER BY total DESC;