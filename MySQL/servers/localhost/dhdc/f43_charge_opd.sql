SELECT DISTINCT gcoffice.offid AS HOSPCODE,
 cid_hn.hn AS PID,  
opd_visits.VISIT_ID AS SEQ,  
DATE_FORMAT(opd_visits.REG_DATETIME,'%Y-%m-%d') AS DATE_SERV,
concat('1', opd_visits.UNIT_REG, opd_diagnosis.DXG_ID) AS CLINIC,
icd9cm.CGD_ID AS CHARGEITEM,
'000000' AS CHARGELIST,
'' AS QUANTITY,
main_inscls.STD_CODE AS INSTYPE,
'' AS COST,
'' AS PRICE,
'' AS PAYPRICE,
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE, population.CID
FROM 
	mbase_data.gcoffice, mbase_data.population 
	INNER JOIN mbase_data.cid_hn ON population.CID = cid_hn.CID 
	INNER JOIN mbase_data.opd_visits ON cid_hn.hn = opd_visits.HN AND opd_visits.IS_CANCEL = 0
	INNER JOIN mbase_data.opd_operations ON opd_operations.VISIT_ID = opd_visits.VISIT_ID 
	INNER JOIN mbase_data.opd_diagnosis ON opd_diagnosis.VISIT_ID = opd_visits.VISIT_ID AND opd_diagnosis.IS_CANCEL = 0
	INNER JOIN mbase_data.icd9cm ON icd9cm.ICD9_ID = opd_operations.ICD9_ID
  INNER JOIN mbase_data.main_inscls ON  main_inscls.INSCL = opd_visits.INSCL 
WHERE 
1 = 1	
	AND LEFT( population.cid, 5 ) > 00000 
  AND opd_visits.reg_datetime > '2018.01.01 00:00' 
	AND opd_visits.is_cancel = 0 
	AND opd_visits.visit_id NOT IN( SELECT visit_id FROM mbase_data.ipd_reg )
;
