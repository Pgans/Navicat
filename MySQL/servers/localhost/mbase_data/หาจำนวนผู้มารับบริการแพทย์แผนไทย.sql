SELECT ov.VISIT_ID AS SEQ,ch.HN, pp.FNAME,pp.LNAME,
CASE
	WHEN pp.SEX = 1 THEN 'ชาย'
	WHEN pp.SEX = 2 THEN 'หญิง'
END AS SEX,DATE_FORMAT(ov.REG_DATETIME,'%Y%m%d')AS REG_DATETIME,ov.STAFF_ID,m.NHSO_CODE,icd10new.ICD10_TM,ov.UNIT_REG
FROM population pp, cid_hn ch, opd_visits ov
INNER JOIN cost_units c ON c.UNIT_ID = ov.UNIT_ID
INNER JOIN main_inscls m ON m.INSCL = ov.INSCL
INNER JOIN opd_operations oper ON oper.VISIT_ID = ov.VISIT_ID
INNER JOIN icd9cm ON icd9cm.ICD9_ID = oper.ICD9_ID
INNER JOIN opd_diagnosis odx ON odx.VISIT_ID = ov.VISIT_ID
INNER JOIN icd10new ON icd10new.ICD10_ID = odx.ICD10_ID 
WHERE ov.hn = ch.hn AND pp.cid = ch.cid 
AND ov.REG_DATETIME BETWEEN '20160601' AND '20160630'
AND (left(icd10new.ICD10_TM,1)= 'u' OR ov.UNIT_REG = '26')
AND ov.IS_CANCEL = 0 GROUP BY ov.VISIT_ID;

