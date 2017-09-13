
#CREATE OR REPLACE VIEW `thaicancerbase_his` AS

SELECT
'' AS PatienID,
b.HN AS hn_code,
CASE 

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 4

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 1

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 5

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 3
	
  WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='2' THEN 2
ELSE '6'
END AS title_code,a.FNAME ,a.LNAME,a.CID,
CASE 
	WHEN a.SEX = 1 THEN 1
	WHEN a.SEX = 2 THEN 2
ELSE 9
END AS sex_code,DATE_FORMAT(a.BIRTHDATE,'%Y%m%d') AS birthdate ,a.MARRIAGE AS marry_status,
CASE 
	WHEN a.NATN_ID = '99' THEN '1'
	WHEN a.NATN_ID = '44' THEN '2'
	WHEN a.NATN_ID = '56' THEN '3'
ELSE '8'
END AS nationality,
CASE 
	WHEN a.NATN_ID = '99' THEN '1'
	WHEN a.NATN_ID = '44' THEN '2'
	WHEN a.NATN_ID = '56' THEN '3'
ELSE '8'
END AS citizenship,a.RELIGION AS religion,a.HOME_ADR AS Addr, '' AS Vill, left(a.TOWN_ID,6) AS AddCode,
a.RL_PHONE AS Tel, DATE_FORMAT(a.MOD_DATE,'%Y%m%d%H%i%S') AS last_update		
FROM
population a , cid_hn b
WHERE a.CID = b.CID
;

