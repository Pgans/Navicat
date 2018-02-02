SELECT DATE_FORMAT(d.REG_DATETIME,'%Y-%m-%d') AS regdate, DATE_FORMAT(d.REG_DATETIME,'%H:%m:%s') AS time, 
offid AS hcode , a.WARD_NO AS ward_code, b.UNIT_NAME AS ward_name, 
CASE 
WHEN a.WARD_NO = '22' THEN 4
WHEN a.WARD_NO = '38' THEN 16
WHEN a.WARD_NO = '39' THEN 19
END AS ward_bed, COUNT(a.BED_NO)  AS ward_pt
FROM ipd_reg a, service_units b, gcoffice c, opd_visits d
WHERE a.WARD_NO = b.UNIT_ID
AND a.WARD_NO IN (22,38,39)
AND a.VISIT_ID = d.VISIT_ID 
AND d.IS_CANCEL = 0
AND a.IS_CANCEL = 0
GROUP BY  regdate, ward_code


#SELECT * FROM ipd_reg WHERE ADM_DT BETWEEN ' 2017.12.17 00:01' AND '2017.12.17 23:59' ORDER BY WARD_NO
