SELECT
	a.visit_id AS vn,
	DATE(b.reg_datetime) AS rxdate,
	TIME(b.reg_datetime) AS rxtime,
	'' AS item_no,
	c.drug_name,
	a.rx_amount AS qty,
	CONCAT(
		d.route_name,
		'',
		a.rx_dose,
		'',
		e.uunit_name,
		'',
		f.frq_name
	) AS shortlist,
	CONCAT(
		d.route_thai,
		'',
		a.rx_dose,
		'',
		e.uunit_thai,
		'',
		f.frq_thai
	) AS drugusage_text,
	'' AS doctor_name
FROM
	prescriptions a,
	opd_visits b,
	drugs c,
	routes d,
	usage_units e,
	frequency f
WHERE
	a.visit_id = '0001000000'
AND a.is_cancel = 0
AND a.visit_id = b.visit_id
AND a.drug_id = c.drug_id
AND a.route_id = d.route_id
AND a.frq_id = f.frq_id
AND c.uunit_id = e.uunit_id
ORDER BY
	a.visit_id
LIMIT 30