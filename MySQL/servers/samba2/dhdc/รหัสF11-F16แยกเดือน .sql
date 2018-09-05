SELECT  DISTINCT MONTH(a.DATE_SERV) as month , COUNT(a.seq) AS amount
FROM diagnosis_opd a
WHERE a.DATE_SERV > '2017-10-01' 
AND (a.DIAGCODE BETWEEN 'F11' AND 'F16' OR a.DIAGCODE in ('F18','F19'))
GROUP BY month