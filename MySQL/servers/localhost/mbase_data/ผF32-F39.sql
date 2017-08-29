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

DATE_FORMAT(population.BIRTHDATE,'%Y%m%d')AS วันเดือนปีเกิด,FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS'อายุ',

CASE population.SEX

WHEN  1 THEN 'ชาย'

WHEN  2 THEN 'หญิง'

END AS 'เพศ',DATE_format(opd_visits.REG_DATETIME,'%Y%m%d') AS 'วันที่มารพ.',icd10new.ICD10_TM AS 'การวินิจฉัย',

population.HOME_ADR AS'บ้านเลขที่'

FROM population,cid_hn,opd_visits,opd_diagnosis,icd10new

WHERE population.CID = cid_hn.cid 

AND icd10new.ICD10_ID = opd_diagnosis.ICD10_ID AND icd10new.ICD10_TM IN ('F32','F33','F34','F38','F39','A20')

AND opd_visits.HN = cid_hn.HN

AND opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID

AND opd_visits.REG_DATETIME BETWEEN '2008.10.01 00:00' AND '2015.01.30 23:59'

AND opd_visits.is_cancel = 0

GROUP BY population.CID

ORDER BY opd_visits.REG_DATETIME,icd10new.ICD10_TM ;



