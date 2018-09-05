SELECT  MONTH(a.reg_datetime) as month2562 ,
COUNT(CASE WHEN(b.ppspecial in ( '1B601','1B602', '1B603','1B604', '1B609', '1B6010', '1B611', '1B612')) THEN '1' END) AS 'รวมทั้งหมด' ,
COUNT(CASE WHEN (b.ppspecial= '1B600') THEN '2' END) AS  '1B600',
COUNT(CASE WHEN(b.ppspecial = '1B601') THEN '3' END) AS '1B601' ,
COUNT(CASE WHEN(b.ppspecial = '1B602') THEN '4' END) AS '1B602' ,
COUNT(CASE WHEN(b.ppspecial = '1B603') THEN '5' END) AS '1B603' ,
COUNT(CASE WHEN(b.ppspecial= '1B604') THEN '6' END) AS '1B604' ,
COUNT(CASE WHEN(b.ppspecial = '1B609') THEN '7' END) AS '1B609' ,
COUNT(CASE WHEN(b.ppspecial = '1B610') THEN '8' END) AS '1B610' ,
COUNT(CASE WHEN(b.ppspecial = '1B611') THEN '9' END) AS '1B611' ,
COUNT(CASE WHEN(b.ppspecial = '1B612') THEN '10' END) AS '1B612' 

FROM  opd_visits a
INNER JOIN specialpp b ON a.visit_id = b.visit_id and b.is_cancel = 0
WHERE a.reg_datetime  BETWEEN '2018.07.01 00:01' AND '2018.08.31 23:59'
AND a.is_cancel = 0
GROUP BY month2562

