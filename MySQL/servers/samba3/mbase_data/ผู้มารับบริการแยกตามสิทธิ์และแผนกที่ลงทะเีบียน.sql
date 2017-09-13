SELECT opd_visits.VISIT_ID AS SEQ,opd_visits.HN,DATE_FORMAT(opd_visits.REG_DATETIME,'%Y%m%d')AS REG_DATETIME,
 population.LNAME ,population.LNAME ,
CASE 
WHEN population.SEX = 1 THEN 'ชาย' 
WHEN population.SEX = 2 THEN 'หญิง'
END AS SEX,FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS AGE,s.UNIT_NAME
FROM population,cid_hn , opd_visits 
INNER JOIN service_units s ON  s.UNIT_ID = opd_visits.UNIT_ID
WHERE population.CID = cid_hn.CID AND cid_hn.HN = opd_visits.HN
AND opd_visits.REG_DATETIME BETWEEN '2015.03.01 00:00' AND '2015.03.01 23:59'
AND opd_visits.IS_CANCEL = 0
GROUP BY opd_visits.VISIT_ID