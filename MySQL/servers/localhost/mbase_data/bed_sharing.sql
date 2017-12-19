SELECT DATE_FORMAT(a.ADM_DT,'%Y-%m-%d') AS regdate,DATE_FORMAT(a.ADM_DT,'%H:%m:%s') AS time, 
offid AS hcode , a.WARD_NO AS ward_code, b.UNIT_NAME AS ward_name, 
CASE 
WHEN a.WARD_NO = '22' THEN 4
WHEN a.WARD_NO = '38' THEN 15
WHEN a.WARD_NO = '39' THEN 16
END AS ward_bed, COUNT(a.BED_NO)  AS ward_pt
FROM ipd_reg a, service_units b, gcoffice c
WHERE a.WARD_NO = b.UNIT_ID
AND a.WARD_NO IN (22,38,39)
GROUP BY regdate,ward_code

SELECT * FROM ipd_reg WHERE ADM_DT BETWEEN ' 2017.07.25 00:01' AND '2017.07.25 23:59' ORDER BY WARD_NO

