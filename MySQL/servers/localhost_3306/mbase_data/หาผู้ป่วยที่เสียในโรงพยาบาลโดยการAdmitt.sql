SELECT cid_hn.HN, ipd_reg.ADM_ID AS AN, DATE_FORMAT(ipd_reg.ADM_DT,'%Y-%m-%d') AS 'ADMIT' ,DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS 'DSC',
deaths.DEATH_DATE AS "DEATHDATE",population.BIRTHDATE,population.FNAME , population.LNAME ,population.SEX,
CASE 
WHEN ipd_reg.DSC_STATUS = "8" THEN "Dead Stillbirth"
WHEN ipd_reg.DSC_STATUS = "9" THEN "Dead"
END AS "DEAD"
FROM population, opd_visits, ipd_reg,cid_hn
INNER JOIN deaths ON deaths.CID = cid_hn.CID AND deaths.IS_HOSP = 1
WHERE cid_hn.hn = opd_visits.HN
AND population.CID = deaths.CID
AND opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT BETWEEN "2014.01.01" AND "2014.12.31" 
AND (ipd_reg.DSC_TYPE IN ("6","7") OR  ipd_reg.DSC_STATUS >7)
AND deaths.DEATH_DATE BETWEEN "2014.01.01" and "2014.12.31"
GROUP BY opd_visits.HN
ORDER BY deaths.DEATH_DATE