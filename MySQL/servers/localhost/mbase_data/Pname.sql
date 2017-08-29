SELECT 
CASE 
	WHEN PRENAME not in('') THEN PRENAME

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'

	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS 'คำนำหน้าชื่อ',population.FNAME AS 'ชื่อ',population.LNAME AS 'นามสกุล',population.cid AS 'เลขประจำตัวประชาชน',
