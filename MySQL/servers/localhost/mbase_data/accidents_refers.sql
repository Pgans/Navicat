SELECT CURDATE()-5,
COUNT(CASE WHEN(a.visit_id) THEN '1' END) AS 'accidents',
COUNT(CASE WHEN (b.VISIT_ID) THEN '2' END) AS 'refer',
COUNT(CASE WHEN(c.VISIT_ID) THEN '3' END) AS 'admitt'
FROM accidents a
LEFT JOIN refers b ON a.visit_id = b.VISIT_ID AND b.IS_CANCEL =0
LEFT JOIN ipd_reg c ON  a.visit_id = c.VISIT_ID AND c.IS_CANCEL =0
WHERE a.datetime_ae > CURDATE()-5
AND a.is_cancel =0

