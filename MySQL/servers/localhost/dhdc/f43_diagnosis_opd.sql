SELECT DISTINCT gcoffice.offid AS HOSPCODE,cid_hn.HN AS PID,  opd_visits.VISIT_ID AS SEQ, 
DATE_FORMAT(opd_visits.REG_DATETIME,'%Y-%m-%d') AS DATE_SERV,
CASE 
WHEN opd_diagnosis.DXT_ID = 1 THEN 1
 WHEN opd_diagnosis.DXT_ID = 2 THEN 4
 WHEN opd_diagnosis.DXT_ID = 3 THEN 4
 WHEN opd_diagnosis.DXT_ID = 4 THEN 4
 WHEN opd_diagnosis.DXT_ID= 5 THEN 5
 WHEN opd_diagnosis.DXT_ID = 6 THEN 6
 WHEN opd_diagnosis.DXT_ID = 7 THEN 7
ELSE 4
END AS DIAGTYPE,
icd10new.ICD10_TM AS DIAGCODE,  
CONCAT('01', opd_visits.unit_reg, opd_diagnosis.dxg_id) AS CLINIC,
opd_diagnosis.STAFF_ID AS PROVIDER,
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE, population.CID
FROM mbase_data.gcoffice, mbase_data.population, mbase_data.cid_hn
INNER JOIN  mbase_data.opd_visits ON opd_visits.HN = cid_hn.HN AND opd_visits.IS_CANCEL = 0
INNER JOIN mbase_data.opd_diagnosis ON opd_diagnosis.VISIT_ID = opd_visits.VISIT_ID  AND opd_diagnosis.IS_CANCEL= 0
INNER JOIN mbase_data.icd10new ON opd_diagnosis.ICD10 = icd10new.ICD10
WHERE opd_visits.REG_DATETIME > '2018.01.01 00:00' 
AND cid_hn.CID = population.CID 
AND population.CID = cid_hn.CID