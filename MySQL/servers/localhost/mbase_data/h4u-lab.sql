SELECT
 a.VISIT_ID seq,
  DATE(a.REG_DATETIME) date_serv,
  TIME(a.REG_DATETIME) time_serv,
     c.LAB_SNAME  as lab_name,
CASE 

	WHEN CAST(b.LAB_RESULT AS DECIMAL(10,2)) > 0 THEN CAST(b.LAB_RESULT AS DECIMAL(10,2)) 

	WHEN LOCATE('=', b.LAB_RESULT) > 0 THEN CAST(SUBSTR(b.LAB_RESULT, LOCATE('=', b.LAB_RESULT)+1, 12) AS DECIMAL(10, 2))
   END as lab_result,
    c.normal_val  standard_result

FROM  opd_visits a
RIGHT JOIN lab_requests  b ON a.VISIT_ID = b.VISIT_ID 
INNER JOIN lab_lists c ON b.LAB_ID = c.LAB_ID  
WHERE a.REG_DATETIME > '2018.04.01'
LIMIT  5000