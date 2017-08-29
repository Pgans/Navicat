SELECT icd10new.ICD10_TM AS 'รหัสโรค', icd10new.ICD_NAME AS 'ชื่อโรค', COUNT(icd10new.ICD10_TM)AS 'จำนวน'
FROM ipd_reg,opd_diagnosis, icd10new
WHERE ipd_reg.ADM_DT BETWEEN '20131001' AND '20140930'
AND ipd_reg.IS_CANCEL = 0
AND ipd_reg.VISIT_ID = opd_diagnosis.VISIT_ID
AND icd10new.ICD10 = opd_diagnosis.ICD10
AND icd10new.ICD10_TM NOT BETWEEN 'z00' AND 'z99'
AND icd10new.ICD10_TM NOT BETWEEN 'o00' AND 'o99'
AND opd_diagnosis.DXT_ID = 1
GROUP BY icd10new.ICD10_TM ORDER BY COUNT(icd10new.ICD10_TM)DESC
LIMIT 10;
 

