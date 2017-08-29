SELECT 
CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 < '20' AND f.sex='1' AND f.MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 >= '20' AND f.sex='1' AND f.MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 < '15'  AND f.sex='1' THEN 'เด็กชาย'
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 >= '15' AND f.sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 < '15'  AND f.sex='2' THEN 'เด็กหญิง'
	WHEN DATEDIFF(now(),f.BIRTHDATE)/365.25 >= '15' AND f.sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS 'คำนำหน้า',f.FNAME AS 'ชื่อ',f.LNAME AS 'นามสกุล',f.cid AS 'เลขประจำตัวประชาชน',
a.AGE AS 'อายุ', a.ICD10_TM,a.HOME_ADR AS 'บ้านเลขที่',
b.TOWN_NAME AS 'MOOBAN', c.TOWN_NAME AS 'TUMBOL', d.TOWN_NAME AS 'AUMPUR', e.TOWN_NAME AS 'JUNGWAT',f.TELEPHONE, g.INSCL_NAME AS 'สิทธิ์การรักษา'
FROM mb_dxopd a, towns b, towns c, towns d,towns e, population f,main_inscls g
WHERE a.REGDATE BETWEEN '2016-10-01' AND '2017-09-30'
AND LOCATE('J44',a.ICD10_TM)>0
AND a.UNIT_REG = '12'
AND a.CID = f.CID
AND f.INSCL = g.INSCL
AND a.TOWN_ID = b.TOWN_ID
AND CONCAT(LEFT(a.TOWN_ID,6),'00')= c.TOWN_ID
AND CONCAT(LEFT(a.TOWN_ID,4),'0000') = d.TOWN_ID
AND CONCAT(LEFT(a.TOWN_ID,2),'000000') = e.TOWN_ID
GROUP BY a.HN ORDER BY REGDATE ; 
