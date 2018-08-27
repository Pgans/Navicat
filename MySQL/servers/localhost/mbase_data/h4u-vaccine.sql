SELECT
a.VISIT_ID as seq,
DATE(a.REG_DATETIME) date_serv,
TIME(a.REG_DATETIME)  time_serv,
 c.DRUG_THO as  vaccine_code,
   c.DRUG_NAME as vaccine_name
FROM  opd_visits a
INNER JOIN prescriptions b ON a.VISIT_ID = b.VISIT_ID  AND b.IS_CANCEL = 0
INNER JOIN drugs_tho  c  ON b.DRUG_ID  = c.DRUG_ID
WHERE a.IS_CANCEL = 0
LIMIT 500