BEGIN
	CREATE TABLE mb_referin57
	#REPLACE INTO mb_referin570
SELECT * FROM (
	SELECT  opd_visits.VISIT_ID, hosp_nhso.HOSP_ID AS 'hospid', hosp_nhso.hosp_name ,date_format(refers.RF_DT,'%Y-%m-%d')as 'วันที่ส่งต่อ'
            ,population.CID, cid_hn.HN ,population.FNAME as 'ชื่อ', population.LNAME as 'สกุล',
CASE
WHEN population.SEX = 1 then 'ชาย'
WHEN population.SEX = 2 then 'หญิง'
END AS 'เพศ',FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ'
FROM population, cid_hn, opd_visits
INNER JOIN refers ON refers.VISIT_ID = opd_visits.VISIT_ID
INNER JOIN hosp_nhso ON hosp_nhso.HOSP_ID = refers.HOSP_ID
WHERE population.CID = cid_hn.CID
AND cid_hn.HN = opd_visits.HN
#AND hosp_nhso.HOSP_ID = $hospid
AND refers.RF_DT BETWEEN '20131001' AND '20141030'
AND refers.IS_CANCEL = '0'
AND refers.RF_TYPE = '1'
ORDER BY refers.RF_DT) t;

END