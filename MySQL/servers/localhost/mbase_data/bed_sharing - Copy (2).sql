SELECT  CURDATE() AS regdate, CURTIME() AS regtime , offid AS hcode,
b.UNIT_ID AS ward_code, b.UNIT_NAME AS ward_name, 
CASE 
WHEN b.UNIT_ID = '22' THEN 9
WHEN b.UNIT_ID = '38' THEN 25
WHEN b.UNIT_ID = '39' THEN 25
END AS ward_bed, COUNT(i.ADM_ID) AS ward_pt
FROM gcoffice a, service_units b
LEFT JOIN ipd_reg i ON b.UNIT_ID = i.WARD_NO AND i.IS_CANCEL = 0 AND i.DSC_DT = 0  AND i.DSC_STATUS = 0 AND i.DSC_TYPE = 0
AND i.BED_NO <> ''
WHERE b.UNIT_ID IN (22,38,39)
GROUP BY WARD_NO