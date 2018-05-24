SELECT DISTINCT gcoffice.offid AS HOSPCODE, cid_hn.HN AS PID,
CASE deaths.IS_HOSP
	WHEN 0 THEN '10953'
	WHEN 1 THEN '00000'
END AS HOSPDEATH,deaths.AN , opd_visits.VISIT_ID  AS SEQ,  deaths.DEATH_DATE AS DDEATH, deaths.CDEATH_A, deaths.CDEATH_B,
deaths.CDEATH_C, deaths.CDEATH_D, deaths.ODISEASE, deaths.CDEATH, deaths.PREGDEATH, 
CASE 
 WHEN  deaths.IS_HOSP = 1 THEN  '1'
 WHEN  deaths.IS_HOSP = 0 THEN  '2'
 END AS  PDEATH, deaths.STAFF_ID AS PROVIDER, DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE, deaths.CID

FROM mbase_data.gcoffice, mbase_data.cid_hn, mbase_data.deaths, mbase_data.opd_visits
INNER JOIN mbase_data.ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID
WHERE  deaths.DEATH_DATE > '2018.01.01'
AND opd_visits.HN = cid_hn.HN AND deaths.CID = cid_hn.CID
AND opd_visits.IS_CANCEL = 0
LIMIT 50 ;