<<<<<<< HEAD
SELECT
	a.AP_ID as seq,
	b.UNIT_NAME clinic,
	DATE(c.REG_DATETIME) date_serv,
	TIME(c.REG_DATETIME)  time_serv,
	a.AP_DATE  appoint_date,
	 DATE(a.AP_DT)  appoint_time,
	a.AP_MEMO detail
FROM
	appoints a
LEFT  JOIN service_units b ON a.APP_UNIT = b.UNIT_ID
INNER JOIN opd_visits c ON a.HN = c.HN AND c.IS_CANCEL = 0
WHERE  c.REG_DATETIME > '2018-04-01'  AND a.AP_DATE > c.REG_DATETIME
=======
SELECT
	a.AP_ID as seq,
	b.UNIT_NAME clinic,
	DATE(c.REG_DATETIME) date_serv,
	TIME(c.REG_DATETIME)  time_serv,
	a.AP_DATE  appoint_date,
	 DATE(a.AP_DT)  appoint_time,
	a.AP_MEMO detail
FROM
	appoints a
LEFT  JOIN service_units b ON a.APP_UNIT = b.UNIT_ID
INNER JOIN opd_visits c ON a.HN = c.HN AND c.IS_CANCEL = 0
WHERE  c.REG_DATETIME > '2018-04-01'  AND a.AP_DATE > c.REG_DATETIME
>>>>>>> 37961524e922a0d776d0b123b6e7b1d5d337148f
LIMIT 500