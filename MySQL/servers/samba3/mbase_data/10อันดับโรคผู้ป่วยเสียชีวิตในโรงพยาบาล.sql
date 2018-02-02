SELECT  a.icdname, COUNT(a.icdname) FROM 
(SELECT deaths.CID, cid_hn.HN, ipd_reg.ADM_ID AS AN, DATE_FORMAT( ipd_reg.ADM_DT,'%Y-%m-%d') AS 'วันที่นอน',DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS 'วันจำหน่าย', 
deaths.DEATH_DATE AS "วันที่เสียชีวิต", population.FNAME AS "ชื่อ", population.LNAME AS "สกุล",
CASE
WHEN population.SEX = 1 THEN "ชาย"
WHEN population.SEX = 2 THEN "หญิง"
END AS "เพศ", FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS "อายุ",
CASE 
WHEN ipd_reg.DSC_STATUS = "8" THEN "Dead Stillbirth"
WHEN ipd_reg.DSC_STATUS = "9" THEN "Dead"
END AS "สาเหตุ", icd10new.ICD_NAME AS 'icdname'
FROM icd10new, opd_diagnosis, population, opd_visits, ipd_reg, cid_hn
INNER JOIN deaths ON deaths.CID = cid_hn.CID AND deaths.IS_HOSP = 1
WHERE cid_hn.hn = opd_visits.HN
AND population.CID = deaths.CID
AND opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND opd_diagnosis.ICD10 =  icd10new.ICD10
#AND opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID
AND ipd_reg.VISIT_ID = opd_diagnosis.VISIT_ID
AND (ipd_reg.DSC_TYPE IN ("6","7") OR  ipd_reg.DSC_STATUS = "9")
AND deaths.DEATH_DATE BETWEEN "20161001" and "20170930" GROUP BY opd_visits.VISIT_ID) AS a  GROUP BY a.icdname ORDER BY COUNT(icdname) DESC
