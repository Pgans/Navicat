SET @vn = '0001907388';
SET @vn_ipd = (select visit_id FROM ipd_reg limit 1);
SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID)refer_no
,a.VISIT_ID vn
,b.HN hn
,DATE_FORMAT(b.REG_DATETIME,'%Y%m%d') date_serv
,DATE_FORMAT(b.REG_DATETIME,'%H%i') time_serv
,CONCAT('0',b.UNIT_REG,f.DXG_ID) clinic
, b.UNIT_REG clinic_code
, d.UNIT_NAME clinic_name
, e.ICD9_CODE procedcode
,e.COST serviceprice
,a.STAFF_ID provider
,CONCAT(trim(p.fname),'  ',trim(p.lname)) provider_name
,g.LICENCE provider_licenseno
,g.CID provider_cid
,e.NICKNAME proced_name
,'' type
FROM gcoffice , refers a
INNER JOIN opd_visits b ON a.VISIT_ID = b.VISIT_ID AND b.IS_CANCEL = 0
INNER JOIN opd_operations c ON a.VISIT_ID = c.VISIT_ID AND c.IS_CANCEL = 0
INNER JOIN service_units d ON d.UNIT_ID = b.UNIT_REG
INNER JOIN icd9cm e ON e.ICD9 = c.icd9 
INNER JOIN opd_diagnosis f ON f.VISIT_ID = b.VISIT_ID AND f.IS_CANCEL = 0
INNER JOIN staff g ON g.STAFF_ID = a.STAFF_ID 
LEFT JOIN population p ON p.CID = g.CID
WHERE a.VISIT_ID = @vn
AND a.IS_CANCEL =0
AND b.VISIT_ID NOT IN (@vn_ipd)
