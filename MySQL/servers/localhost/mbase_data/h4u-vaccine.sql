<<<<<<< HEAD
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
=======
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
>>>>>>> 37961524e922a0d776d0b123b6e7b1d5d337148f
LIMIT 500