SELECT DISTINCT population.CID,DATE_FORMAT(population.BIRTHDATE,'%Y-%m-%d')AS BIRTHDATE,
DATE_FORMAT(opd_visits.REG_DATETIME,'%Y-%m-%d') AS REGISTER,
CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS 'คำนำหน้าชื่อ',population.FNAME AS 'ชื่อ',population.LNAME AS 'นามสกุล',
FLOOR(DATEDIFF(opd_visits.REG_DATETIME,population.BIRTHDATE)/365.25) AS AGE,
population.HOME_ADR AS 'บ้านเลขที่', a.TOWN_NAME AS 'หมู' , b.TOWN_NAME AS 'ตำบล', b.TOWN_NAME AS 'อำเภอ', d.TOWN_NAME AS 'จังหวัด' 
FROM  population , cid_hn , opd_visits ,towns a, towns b, towns c ,towns d
WHERE opd_visits.REG_DATETIME BETWEEN '20140101' AND '20140131'
AND FLOOR(DATEDIFF(opd_visits.REG_DATETIME,population.BIRTHDATE)/365.25) BETWEEN '0' AND '5'
AND opd_visits.IS_CANCEL = 0
AND population.cid = cid_hn.cid
AND cid_hn.HN = opd_visits.HN
AND population.TOWN_ID = a.TOWN_ID
AND CONCAT(LEFT(population.TOWN_ID,6),'00') = b.TOWN_ID
AND CONCAT(LEFT(population.TOWN_ID,4),'0000') = c.TOWN_ID
AND CONCAT(LEFT(population.TOWN_ID,2),'000000') = d.TOWN_ID
ORDER BY REGISTER;



 