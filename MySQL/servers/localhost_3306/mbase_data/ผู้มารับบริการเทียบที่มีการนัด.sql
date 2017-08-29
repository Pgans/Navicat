SELECT a.UNIT_ID, COUNT(a.HN)AS Amount
FROM  apoints a,opd_visits o, service_units s
WHERE a.AP_DATE BETWEEN '2014.10.01' AND '2014.10.02'
AND a.HN= o.HN
AND s.UNIT_ID = a.unit_id
AND a.AP_DATE = DATE(o.REG_DATETIME)
GROUP BY a.UNIT_ID ORDER BY a.UNIT_ID;