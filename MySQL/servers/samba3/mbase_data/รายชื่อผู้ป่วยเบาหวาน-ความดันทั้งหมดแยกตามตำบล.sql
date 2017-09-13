SELECT chronic_reg.CID,cid_hn.HN,
CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS 'Pname',population.FNAME,population.LNAME,FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS AGE,
DATE_FORMAT(chronic_reg.REG_DATE,'%Y%m%d')AS REG_DATE,chronic_reg.ICD10,
population.HOME_ADR AS 'บ้านเลขที่', a.TOWN_NAME AS 'หมู่บ้าน', b.TOWN_NAME AS 'ตำบล', c.TOWN_NAME AS 'อำเภอ' , d.TOWN_NAME AS 'จังหวัด'
FROM population , cid_hn ,chronic_reg,towns a,towns b, towns c ,towns d
WHERE population.CID = cid_hn.CID 
AND chronic_reg.IS_CANCEL = 0
AND population.TOWN_ID = a.TOWN_ID
AND CONCAT(left(population.TOWN_ID,6),'00') = b.TOWN_ID
AND CONCAT(left(population.TOWN_ID,4),'0000') = c.TOWN_ID
AND CONCAT(left(population.TOWN_ID,2),'000000') = d.TOWN_ID
AND cid_hn.CID = chronic_reg.CID
GROUP BY chronic_reg.cid ORDER BY b.TOWN_NAME,a.TOWN_NAME,chronic_reg.REG_DATE,chronic_reg.ICD10
