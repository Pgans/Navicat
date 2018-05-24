SELECT DISTINCT gcoffice.offid AS HOSPCODE,
cid_hn.HN AS PID,  
ipd_reg.ADM_ID AS AN,
DATE_FORMAT(ipd_reg.ADM_DT,'%Y%m%d%H%i%s') AS DATETIME_ADMIT,
CONCAT('01',opd_visits.UNIT_REG,ipd_reg.WARD_NO) AS WARDDIAG,
opd_diagnosis.DXT_ID AS DIAGTYPE,
icd10new.ICD10_TM AS DIAGCODE, 
opd_diagnosis.STAFF_ID AS PROVIDER,
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE, cid_hn.CID
FROM 
mbase_data.gcoffice, mbase_data.population
INNER JOIN mbase_data.cid_hn ON population.CID = cid_hn.CID 
INNER JOIN mbase_data.opd_visits ON cid_hn.hn = opd_visits.HN AND opd_visits.IS_CANCEL = 0
INNER JOIN mbase_data.ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID AND ipd_reg.IS_CANCEL = 0
INNER JOIN mbase_data.opd_diagnosis ON opd_diagnosis.VISIT_ID = opd_visits.VISIT_ID  AND opd_diagnosis.IS_CANCEL = 0
INNER JOIN mbase_data.icd10new ON icd10new.ICD10 = opd_diagnosis.ICD10
WHERE  LEFT( population.cid, 5 ) > 00000 
	AND opd_visits.reg_datetime BETWEEN '2018.01.01 00:00' AND '2018.01.30 23:59' 
	AND opd_visits.is_cancel = 0 
ORDER BY 
	population.cid;
