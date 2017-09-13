SELECT DISTINCT hosp_nhso.HOSP_ID,population.CID, cid_hn.HN ,refers.RF_DT, hosp_nhso.HOSP_NAME, population.FNAME, population.LNAME,
CASE 
WHEN population.SEX = 1 then 'ชาย'
WHEN population.SEX = 2 then 'หญิง'
END AS 'SEX',FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS 'AGE'
FROM population, cid_hn, opd_visits
INNER JOIN refers ON refers.VISIT_ID = opd_visits.VISIT_ID 
#INNER JOIN ipd_reg ON ipd_reg.VISIT_ID = refers.VISIT_ID
INNER JOIN hosp_nhso ON hosp_nhso.HOSP_ID = refers.HOSP_ID
WHERE population.CID = cid_hn.CID
AND cid_hn.HN = opd_visits.HN
AND refers.RF_DT BETWEEN '20131001' AND '20140930'
AND refers.IS_CANCEL = 0
AND refers.RF_TYPE = 2  ORDER BY refers.RF_DT;