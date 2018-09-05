SELECT DISTINCT a.REG_DATETIME  ,a.VISIT_ID,  a.HN , e.FNAME, e.LNAME, f.UNIT_NAME,c.ICD10_TM, 
CASE 
WHEN i.WARD_NO = 38 THEN 'ward2'
WHEN i.WARD_NO = 39 THEN 'ward1'
END as WARD_NO, j.HOSP_ID ,g.TOWN_NAME as 'MOOBAN', h.TOWN_NAME as 'TUMBON'
FROM opd_visits a
INNER JOIN opd_diagnosis b  ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND c.icd10_tm  BETWEEN 'A90' AND 'A99'
INNER JOIN cid_hn d ON a.hn = d.hn 
LEFT JOIN population e ON d.cid = e.cid 
LEFT JOIN service_units f ON a.unit_reg = f.unit_id
INNER JOIN towns g ON e.town_id = g.town_id
INNER JOIN towns h  ON CONCAT (left(e.town_id,6),'00') = h.town_id
LEFT JOIN ipd_reg i ON a.visit_id = i.visit_id AND i.is_cancel = 0
LEFT JOIN refers j ON a.visit_id = j.visit_id AND j.is_cancel =0
WHERE a.REG_DATETIME > '2018.04.01'
AND a.is_cancel = 0
GROUP BY  a.VISIT_ID