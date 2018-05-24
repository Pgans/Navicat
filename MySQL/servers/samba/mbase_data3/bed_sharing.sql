SELECT CURDATE() AS regdate,CURTIME() AS time, 
offid AS hcode , a.WARD_NO AS ward_code, b.UNIT_NAME AS ward_name, 
CASE 
WHEN a.WARD_NO = '22' THEN 9
WHEN a.WARD_NO = '38' THEN 21
WHEN a.WARD_NO = '39' THEN 23
END AS ward_bed, COUNT(a.BED_NO) AS ward_pt
FROM mbase_data1.ipd_reg a, mbase_data1.service_units b, mbase_data1.gcoffice c
WHERE a.WARD_NO = b.UNIT_ID
AND a.WARD_NO IN ('22','38','39')
AND a.DSC_DT = '0000-00-00 00:00:00'
AND a.DSC_TYPE = 0
GROUP BY ward_code