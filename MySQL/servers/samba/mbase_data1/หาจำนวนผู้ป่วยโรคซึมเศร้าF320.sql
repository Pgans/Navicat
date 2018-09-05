SELECT   c.icd10_tm , COUNT(DISTINCT a.HN ) as amount
FROM  opd_visits a
INNER JOIN opd_diagnosis b ON a.visit_id = b.visit_id AND b.is_cancel = 0
INNER JOIN icd10new c ON b.icd10 = c.icd10 AND c.icd10_tm BETWEEN 'F320' AND 'F329'
WHERE a.REG_DATETIME > '2017.10.01'
AND a.is_cancel = 0
GROUP BY c.icd10_tm