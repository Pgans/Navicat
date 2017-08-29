CREATE TABLE
SELECT DISTINCT cost_units.UNIT_ID , cid_hn.CID, ADM_ID,cid_hn.HN,FNAME, LNAME ,
IF(population.SEX=1,'ชาย','หญิง') AS 'SEX', FLOOR(datediff(NOW(),population.BIRTHDATE)/365.25) AS 'AGE', 
DATE_FORMAT(ipd_reg.ADM_DT,'%Y-%m-%d') AS 'amd_date',
DATE_FORMAT(ipd_reg.DSC_DT,'%Y-%m-%d') AS 'dsc_date'
 FROM population, cid_hn,opd_visits
INNER JOIN ipd_reg ON opd_visits.VISIT_ID = ipd_reg.VISIT_ID
AND ipd_reg.DSC_DT >'20100101'
AND ipd_reg.IS_CANCEL = 0
INNER JOIN cost_units ON cost_units.UNIT_ID = ipd_reg.WARD_NO
WHERE opd_visits.HN = cid_hn.HN
AND population.CID = cid_hn.CID
ORDER BY ipd_reg.ADM_DT, ipd_reg.DSC_DT;

