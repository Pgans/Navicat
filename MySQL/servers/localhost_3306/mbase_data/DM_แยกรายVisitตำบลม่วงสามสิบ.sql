SELECT DISTINCT DATE_FORMAT(opd_visits.REG_DATETIME,'%Y-%m-%d') AS 'วันมารับบริการ', opd_visits.HN,icd10new.ICD10_TM,lab_requests.LAB_RESULT,
population.FNAME AS 'ชื่อ', population.LNAME AS 'สกุล',population.RL_PHONE AS 'เบอร์โทร', if (population.sex=1,'ชาย','หญิง') AS 'เพศ',
FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ',
a.TOWN_NAME AS 'หมู่บ้าน'
FROM population, cid_hn, opd_diagnosis, icd10new,towns a, towns b ,opd_visits
INNER JOIN lab_requests ON lab_requests.VISIT_ID = opd_visits.VISIT_ID
INNER JOIN lab_lists ON lab_lists.LAB_ID = lab_requests.LAB_ID
AND lab_lists.LAB_ID = '123'
WHERE opd_visits.REG_DATETIME BETWEEN '20150101' AND '20150731'
AND opd_visits.HN= cid_hn.HN
AND population.CID = cid_hn.CID
AND opd_visits.VISIT_ID = opd_diagnosis.VISIT_ID
AND opd_visits.IS_CANCEL = 0
AND icd10new.ICD10 = opd_diagnosis.ICD10
AND icd10new.ICD10_TM BETWEEN 'e11' AND 'e14'
AND population.TOWN_ID = a.TOWN_ID
AND CONCAT(left(population.TOWN_ID,6),'00') = b.TOWN_ID
AND population.TOWN_ID BETWEEN '34100000' AND '34140112'
ORDER BY opd_visits.REG_DATETIME, population.TOWN_ID;
