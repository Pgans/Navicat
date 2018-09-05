SELECT
	a.VISIT_ID AS seq,
	DATE(a.REG_DATETIME) AS date_serv,
	TIME(a.REG_DATETIME) AS time_serv,
	c. CODE AS procedure_code,
	c.TNAME AS procedure_name,
	DATE(b.OP_BEGIN) AS start_date,
	DATE(b.OP_END) AS end_date
FROM
	opd_visits a
INNER JOIN opd_operations b ON a.VISIT_ID = b.VISIT_ID
AND b.IS_CANCEL = 0
INNER JOIN icd9cm c ON b.icd9 = c.ICD9
LIMIT 100;