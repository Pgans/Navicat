SELECT DISTINCT gcoffice.offid AS HOSPCODE,
 a.hn AS PID,  
a.VISIT_ID AS SEQ,  
DATE_FORMAT(a.REG_DATETIME,'%Y-%m-%d') AS DATE_SERV,
concat('0', a.UNIT_REG, f.DXG_ID) AS CLINIC,
replace(replace(e.code, '.', ''), '-', '') AS PROCEDCODE,
e.cost AS SERVICEPRICE,
d.STAFF_ID AS PROVIDER,
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE,
c.cid AS CID

FROM 
	mbase_data.gcoffice, mbase_data.opd_visits a
	INNER JOIN mbase_data.cid_hn b ON a.hn = b.hn 
	INNER JOIN  mbase_data.population c ON c.cid = b.cid
	INNER JOIN mbase_data.opd_operations d ON d.VISIT_ID = a.VISIT_ID 
	LEFT  JOIN mbase_data.icd9cm e ON d.ICD9_ID = e.ICD9_ID
	INNER JOIN mbase_data.opd_diagnosis f on a.visit_id = f.VISIT_ID and f.DXT_ID='1' 
WHERE 
1 = 1	
	AND LEFT( c.cid, 8 ) <> '00000000'
  AND a.reg_datetime > '2020.02.01 00:00' 
	#AND a.visit_id = ('0002099838')
	AND a.is_cancel = 0 
	AND a.visit_id NOT IN( SELECT visit_id FROM mbase_data.ipd_reg )
ORDER BY a.hn ,DATE_FORMAT(a.REG_DATETIME,'%Y-%m-%d');
