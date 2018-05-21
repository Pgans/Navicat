SELECT DISTINCT  gcoffice.offid AS HOSPCODE,cid AS PID, UPD_DT AS DATERECORD, b.DIDSTD AS DRUGALLERGY, 
b.DRUG_NAME AS DNAME, a.ADRTYPE AS TYPEDX, a.level AS ALEVEL,a.allergy_note AS SYMPTOM, '1' AS INFORMANT,
 '10953' AS INFORMHOSP, DATE_FORMAT(NOW(),
 '%Y%m%d%H%i%s') AS D_UPDATE,  a.STAFF_ID AS PROVIDER, a.CID
FROM  mbase_data.gcoffice, mbase_data.cid_drug_allergy a, mbase_data.drugs b 
WHERE a.DRUG_ID= b.DRUG_ID
AND a.IS_CANCEL = 0