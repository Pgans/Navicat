SELECT icd10new.ICD10_TM,icd10new.ICD_NAME, icd10new.NICKNAME, COUNT(icd10new.ICD10_TM)
FROM opd_visits, opd_diagnosis,icd10new
#AND icd10new.ICD10_TM != BETWEEN 'z00' AND 'z99'
WHERE opd_visits.REG_DATETIME BETWEEN'20131001' AND '20140930'
AND opd_visits.IS_CANCEL = 0
AND icd10new.ICD10_TM NOT BETWEEN 'z00' AND 'z99'
AND opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID
AND icd10new.ICD10 = opd_diagnosis.ICD10
AND opd_diagnosis.DXT_ID = 1
AND opd_visits.VISIT_ID NOT IN (SELECT VISIT_ID FROM ipd_reg)
GROUP BY icd10new.ICD10_TM ORDER BY COUNT(icd10new.ICD10_TM)DESC ;