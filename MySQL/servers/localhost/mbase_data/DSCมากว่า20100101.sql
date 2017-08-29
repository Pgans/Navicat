SELECT  DISTINCT ipd_reg.VISIT_ID,service_units.UNIT_ID as 'UNIT_ID', cid_hn.CID , ADM_ID,
cid_hn.HN ,FNAME, LNAME ,SEX , FLOOR(datediff(NOW(),population.BIRTHDATE)/365.25) AS 'AGE',
DATE_FORMAT(ipd_reg.ADM_DT,'%Y-%m-%d') AS ADM_DATE,
DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS DSC_DATE,ipd_reg.DSC_TYPE,ipd_reg.DSC_STATUS,ipd_reg.P_DIAG,ipd_reg.DSC_DR,ipd_reg.ADM_DR
FROM population, cid_hn,opd_visits
INNER JOIN ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT >'20100101'
AND ipd_reg.IS_CANCEL = 0
INNER JOIN service_units ON service_units.UNIT_ID = ipd_reg.WARD_NO
WHERE opd_visits.HN = cid_hn.HN
AND population.CID = cid_hn.CID
#AND service_units.UNIT_ID = $unit_id
GROUP BY ipd_reg.VISIT_ID ORDER BY ipd_reg.ADM_DT, ipd_reg.DSC_DT