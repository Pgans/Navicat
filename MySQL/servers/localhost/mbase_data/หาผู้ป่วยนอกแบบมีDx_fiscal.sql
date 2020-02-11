SELECT a.REG_DATETIME,a.VISIT_ID , a.HN ,a.UNIT_REG ,c.ICD10_TM, b.DXT_ID, b.STAFF_ID,
 IF(MONTH(a.REG_DATETIME) >9, YEAR(a.REG_DATETIME) +544, YEAR(a.REG_DATETIME) + 543 ) AS fiscal
FROM opd_visits a
LEFT  JOIN opd_diagnosis b ON a.VISIT_ID = b.VISIT_ID AND b.IS_CANCEL = 0 AND b.DXT_ID = 1 AND b.ICD10 <> ' '
LEFT JOIN icd10new c ON b.ICD10 = c.icd10
WHERE a.REG_DATETIME BETWEEN '2017.10.01 00:01' AND '2018.09.30 23:59'
AND a.IS_CANCEL = 0
AND a.VISIT_ID not in (SELECT i.VISIT_ID FROM ipd_reg i)
AND a.VISIT_ID not in (SELECT m.VISIT_ID FROM mobile_visits m)
GROUP BY a.VISIT_ID
