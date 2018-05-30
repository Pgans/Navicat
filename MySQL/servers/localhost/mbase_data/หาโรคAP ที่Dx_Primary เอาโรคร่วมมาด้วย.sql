CREATE TABLE mb_AP
SET @vn = ('SELECT visit_id FROM ipd_reg');
SELECT DISTINCT a.reg_datetime,a.visit_id, a.hn, c.icd10_tm ,
 c.nickname, b.dxt_id
FROM   opd_visits a
INNER JOIN opd_diagnosis b ON a.visit_id = b.visit_id AND b.is_cancel = 0  
RIGHT OUTER  JOIN icd10new c ON b.icd10 = c.icd10 
AND c.icd10_tm = 'b24' 
WHERE a.REG_DATETIME > '2018.03.01'
AND a.is_cancel = 0
AND a.visit_id not in (@vn)

