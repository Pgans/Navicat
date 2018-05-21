
SELECT gcoffice.offid AS HOSPCODE,cid_hn.HN AS PID,'1' AS ADDRESSTYPE,'' AS HOUSE_ID,'1'AS HOUSETYPE,''AS ROOMNO,'' AS CONDO, HOME_ADR AS HOUSENO,	

	'' AS SOISUB, '' AS ROAD, towns.TOWN_NAME AS VILLANAME, right(population.TOWN_ID, 2) AS VILLAGE, substr(population.TOWN_ID, 5, 2) AS TAMBON, 

	substr(population.TOWN_ID, 3, 2) AS AMPUR, left(population.TOWN_ID, 2) AS CHANGWAT, 

DATE_FORMAT(NOW(),'%Y%m%d%H%i%s') AS D_UPDATE, population.CID 

FROM  mbase_data.gcoffice , mbase_data.opd_visits , mbase_data.population, mbase_data.cid_hn, mbase_data.towns 

WHERE  population.CID = cid_hn.CID AND opd_visits.HN = cid_hn.hn

AND opd_visits.reg_datetime > '2018-01-01'
AND opd_visits.is_cancel = 0 and population.town_id = towns.town_id

ORDER BY opd_visits.REG_DATETIME;

	