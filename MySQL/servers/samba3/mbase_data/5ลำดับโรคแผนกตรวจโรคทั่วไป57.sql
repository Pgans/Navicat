SELECT icd10new.ICD10_TM,icd10new.ICD_NAME,COUNT(icd10new.ICD10_TM)
FROM opd_diagnosis,icd10new, opd_visits
INNER JOIN service_units ON opd_visits.UNIT_ID = service_units.UNIT_ID
AND service_units.UNIT_ID = '02'
WHERE opd_visits.REG_DATETIME BETWEEN'20141001' AND '20150930'
AND opd_visits.IS_CANCEL = 0
AND service_units.UNIT_ID = '02'
AND icd10new.ICD10_TM NOT BETWEEN 'z00' AND 'z99'
AND opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID
AND icd10new.ICD10 = opd_diagnosis.ICD10
AND opd_visits.VISIT_ID NOT IN (SELECT VISIT_ID FROM ipd_reg)
GROUP BY icd10new.ICD10_TM ORDER BY COUNT(icd10new.ICD10_TM)DESC LIMIT 10;