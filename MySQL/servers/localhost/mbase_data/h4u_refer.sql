SELECT
	a.VISIT_ID AS seq,
	DATE(a.REG_DATETIME) date_serv,
	TIME(a.REG_DATETIME) time_serv,
	b.HOSP_ID AS to_provider_code,
	c.HOSP_NAME AS to_provider_name,
	b.RF_REASON AS reason,
	DATE(b.RF_DT) start_date
FROM
	opd_visits a
INNER JOIN refers b ON a.VISIT_ID = b.VISIT_ID
AND b.IS_CANCEL = 0
AND b.RF_TYPE = 2
INNER JOIN hospitals c ON b.HOSP_ID = c.HOSP_ID
WHERE
	a.IS_CANCEL = 0
LIMIT 500