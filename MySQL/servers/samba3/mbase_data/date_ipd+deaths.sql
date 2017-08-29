

SELECT deaths.CID, cid_hn.HN, ipd_reg.ADM_ID AS AN, DATE_FORMAT( ipd_reg.ADM_DT,"%Y-%m-%d") AS "add_date",DATE_FORMAT(ipd_reg.DSC_DT,"%Y-%m-%d") AS "dsc_date", 
deaths.DEATH_DATE AS "deathdate", population.FNAME AS "ชื่อ", population.LNAME AS "สกุล",
CASE
WHEN population.SEX = 1 THEN "ชาย"
WHEN population.SEX = 2 THEN "หญิง"
END AS "เพศ", FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS "อายุ", service_units.UNIT_NAME, service_units.UNIT_ID,
CASE 
WHEN ipd_reg.DSC_STATUS = "8" THEN "Dead Stillbirth"
WHEN ipd_reg.DSC_STATUS = "9" THEN "Dead"
END AS "สาเหตุ"
FROM service_units, population, opd_visits, ipd_reg, cid_hn
INNER JOIN deaths ON deaths.CID = cid_hn.CID AND deaths.IS_HOSP = 1
WHERE cid_hn.hn = opd_visits.HN
AND population.CID = deaths.CID
AND opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.WARD_NO = service_units.UNIT_ID
AND (ipd_reg.DSC_TYPE IN ("6","7") OR  ipd_reg.DSC_STATUS = "9")
AND deaths.DEATH_DATE BETWEEN '20151001' AND '20160930'
GROUP BY opd_visits.HN
ORDER BY deaths.DEATH_DATE;