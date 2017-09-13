BEGIN
	CREATE TABLE mb_referout_list58 
	#REPLACE INTO mb_referout_list
SELECT * FROM (
SELECT DISTINCT refers.VISIT_ID, hosp_nhso.HOSP_ID AS 'hosp_id', hosp_nhso.HOSP_NAME AS 'hosp_name', 
date_format(refers.RF_DT,'%Y-%m-%d')as 'วันที่ส่งต่อ'
,population.CID, cid_hn.HN ,population.FNAME as 'ชื่อ', population.LNAME as 'สกุล',
CASE
WHEN population.SEX = 1 then 'ชาย'
WHEN population.SEX = 2 then 'หญิง'
END AS 'เพศ',FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ'
FROM population, cid_hn, opd_visits
INNER JOIN refers ON refers.VISIT_ID = opd_visits.VISIT_ID
INNER JOIN hosp_nhso ON hosp_nhso.HOSP_ID = refers.HOSP_ID
INNER JOIN hosp3400 ON refers.HOSP_ID = hosp3400.HOSP_ID
WHERE population.CID = cid_hn.CID
AND cid_hn.HN = opd_visits.HN
#AND hosp3400.HOSP_ID = $hospid
AND refers.RF_DT BETWEEN '20141001' AND '20151030'
AND refers.IS_CANCEL = '0'
AND refers.RF_TYPE = '2'
GROUP BY refers.VISIT_ID ORDER BY refers.RF_DT) t;

END