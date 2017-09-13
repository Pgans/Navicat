SELECT DISTINCT cost_units.UNIT_ID AS 'รหัสแผนก', cid_hn.CID AS 'เลขประชาชน', ADM_ID AS 'เลขภายใน',
cid_hn.HN AS 'เลขรพ,' ,FNAME AS 'ชื่อ', LNAME AS 'สกุล',
IF(population.SEX=1,'ชาย','หญิง') AS 'เพศ', FLOOR(datediff(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ', 
DATE_FORMAT(ipd_reg.ADM_DT,'%Y-%m-%d') AS 'วันที่รับ',
DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS 'วันจำหน่าย'
 FROM population, cid_hn,opd_visits
INNER JOIN ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT BETWEEN '20141001' AND '20150930'
AND ipd_reg.IS_CANCEL = 0
INNER JOIN cost_units ON cost_units.UNIT_ID = ipd_reg.WARD_NO
WHERE opd_visits.HN = cid_hn.HN
AND population.CID = cid_hn.CID
ORDER BY ipd_reg.ADM_DT, ipd_reg.DSC_DT;

