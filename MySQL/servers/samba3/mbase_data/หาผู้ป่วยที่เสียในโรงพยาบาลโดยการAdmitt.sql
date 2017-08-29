SELECT deaths.CID, cid_hn.HN, ipd_reg.ADM_ID AS AN, ipd_reg.ADM_DT ,ipd_reg.DSC_DT, deaths.DEATH_DATE AS "วันที่เสียชีวิติ",
population.FNAME AS "ชื่อ", population.LNAME AS "สกุล",
CASE
WHEN population.SEX = 1 THEN "ชาย"
WHEN population.SEX = 2 THEN "หญิง"
END AS "เพศ", FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS "อายุ",
CASE 
WHEN ipd_reg.DSC_STATUS = "8" THEN "Dead Stillbirth"
WHEN ipd_reg.DSC_STATUS = "9" THEN "Dead"
END AS "สาเหตุ"
FROM population, opd_visits, ipd_reg, cid_hn
INNER JOIN deaths ON deaths.CID = cid_hn.CID AND deaths.IS_HOSP = 1
WHERE cid_hn.hn = opd_visits.HN
AND population.CID = deaths.CID
AND opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT BETWEEN "2014.01.01" AND "2014.12.31" 
AND (ipd_reg.DSC_TYPE IN ("6","7") OR  ipd_reg.DSC_STATUS = "9")
AND deaths.DEATH_DATE BETWEEN "2014.01.01" and "2014.12.31"
GROUP BY opd_visits.HN
ORDER BY deaths.DEATH_DATE