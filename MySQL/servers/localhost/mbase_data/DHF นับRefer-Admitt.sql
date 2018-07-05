SELECT CURDATE()
 AS regdate ,
COUNT(CASE WHEN(a.visit_id) THEN '1' END) AS 'home',
COUNT(CASE WHEN (e.VISIT_ID) THEN '2' END) AS 'refer',
COUNT(CASE WHEN (d.VISIT_ID) THEN '3' END) AS 'admitt'
FROM opd_visits a
INNER JOIN opd_diagnosis b  ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND c.icd10_tm  BETWEEN 'A90' AND 'A99'
LEFT JOIN ipd_reg d ON a.visit_id = d.visit_id  AND d.is_cancel =0
LEFT JOIN refers e ON a.visit_id = e.visit_id AND e.is_cancel = 0
WHERE a.REG_DATETIME >CURDATE()
AND a.is_cancel = 0
GROUP BY regdate 