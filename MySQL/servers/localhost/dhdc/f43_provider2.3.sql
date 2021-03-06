SELECT DISTINCT  gcoffice.offid AS HOSPCODE, staff.STAFF_ID AS PROVIDER, LICENCE AS REGISTERNO, '' AS COUNCIL,staff.CID,
CASE 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25>= '20' and sex='1' and MARRIAGE = '4'then '831' 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25< '20' and sex='1' and MARRIAGE = '4'then '832' 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25>= '15' and sex='1' then '003' 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25< '15' and sex='1' then '001' 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25< '15' and sex='2' then '002' 
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25>= '15' and sex='2' and MARRIAGE ='1'then '004' 
ELSE '005'
END AS PRENAME,FNAME,LNAME, population.SEX,DATE_FORMAT(BIRTHDATE,'%Y-%m-%d')AS BIRTH,
CASE
	WHEN staff.POS_ID = 001 THEN  '01'
	WHEN staff.POS_ID = 009 THEN  '02'
	WHEN staff.POS_ID = 002 THEN  '03'
	WHEN staff.POS_ID = 033 THEN  '04'
	WHEN staff.POS_ID = 023 THEN  '05'
	WHEN staff.POS_ID = 013 THEN  '06'
  WHEN staff.POS_ID = 007 THEN  '11'
  WHEN staff.POS_ID = 041 THEN  '081'
  WHEN staff.POS_ID = 047 THEN  '084' 
	WHEN staff.POS_ID IN (041,047,048) THEN  '085'
ELSE '09'
END AS PROVIDERTYPE,DATE_FORMAT(staff.START_DATE,'%Y-%m-%d') AS START_DATE,DATE_FORMAT(staff.STOP_DATE,'%Y-%m-%d') AS OUTDATE,
'' AS MOVEFORM, '' AS MOVETO, DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE
FROM mbase_data.gcoffice, mbase_data.population , mbase_data.staff 
INNER JOIN mbase_data.positions  ON staff.POS_ID = positions.POS_ID 
WHERE staff.CID = population.CID  AND  staff.STOP_DATE = 0 
;