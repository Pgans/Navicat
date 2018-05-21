SELECT CURDATE() AS regdate,CURTIME() AS time, 
offid AS hcode , b.UNIT_ID AS ward_code, b.UNIT_NAME AS ward_name, 
CASE 
WHEN a.WARD_NO = '22' THEN 9
WHEN a.WARD_NO = '38' THEN 25
WHEN a.WARD_NO = '39' THEN 25
END AS ward_bed, COUNT(a.ADM_ID) AS ward_pt
FROM mbase_data1.gcoffice c, mbase_data1.ipd_reg a 
LEFT OUTER  JOIN mbase_data1.service_units b ON a.WARD_NO = b.UNIT_ID AND b.UNIT_ID IN ('22', '38', '39')
WHERE a.DSC_DT = '0000-00-00 00:00:00' 
AND a.IS_CANCEL = 0
AND (a.DSC_TYPE = 0 AND a.DSC_STATUS = 0)
AND a.BED_NO <> ''
GROUP BY b.UNIT_ID