SELECT DISTINCT  cid_hn.CID AS 'CID', ADM_ID AS 'AN',
cid_hn.HN AS 'HN' ,FNAME AS 'ชื่อ', LNAME AS 'สกุล',
IF(population.SEX=1,'ชาย','หญิง') AS 'เพศ', FLOOR(datediff(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ',
DATE_FORMAT(ipd_reg.ADM_DT,'%Y-%m-%d') AS 'Add_date',
DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS 'Dsc_date',service_units.UNIT_ID,
service_units.UNIT_NAME as 'Dapartments'
FROM population, cid_hn,opd_visits
INNER JOIN ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT BETWEEN '20151001' AND '20160930'
AND ipd_reg.IS_CANCEL = 0
INNER JOIN service_units ON service_units.UNIT_ID = ipd_reg.WARD_NO
WHERE opd_visits.HN = cid_hn.HN
AND population.CID = cid_hn.CID
#AND service_units.UNIT_ID = 
ORDER BY ipd_reg.ADM_DT, ipd_reg.DSC_DT;