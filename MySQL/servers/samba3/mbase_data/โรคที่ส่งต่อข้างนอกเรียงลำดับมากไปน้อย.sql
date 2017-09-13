SELECT
	a.hosp_id,b.icd10_tm,b.icd_name,count(icd10_tm) AS amount
FROM
	icd10new b,opd_diagnosis c, refers a
WHERE a.visit_id = c.VISIT_ID
AND b.icd10 = c.icd10
AND a.rf_type = "2"
AND a.visit_id NOT IN (SELECT visit_id FROM ipd_reg)
AND a.rf_dt BETWEEN '2014.10.01 00:00' AND '2015.09.30 23:59'
GROUP BY a.hosp_id, b.icd10_tm
ORDER BY amount DESC;