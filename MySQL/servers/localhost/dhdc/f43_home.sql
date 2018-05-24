
SELECT DISTINCT gcoffice.offid AS HOSPCODE,cid_hn.HN AS HID, '' AS HOUSE_ID,'1' AS HOUSETYPE, '' AS ROOMNO, '' AS CONDO,
HOME_ADR AS HOUSE, '' AS SOISUB, '' AS SOIMAIN, '' AS ROAD,towns.TOWN_NAME AS VILLANAME, RIGHT(population.TOWN_ID, 2) AS VILAGE,
SUBSTR(population.TOWN_ID,5,2) AS TAMBON, substr(population.TOWN_ID, 3, 2) AS AMPUR, left(population.TOWN_ID, 2) AS CHANGWAT,
 CASE 
	WHEN instr(population.TELEPHONE, 'ม') > 0 THEN '' 
	ELSE population.TELEPHONE
END AS TELEPHONE, '' AS LATITUDE, '' AS LONGTITUDE, '' AS NFAMILY,'' AS LOCATYPE, 
'' AS VHVID, '' AS HEADID, '1' AS TOILET, '1' AS WATER, '9' AS WATERTYPE, '9' AS GARBAGE, '9' AS HOUSING,
'9' AS DURABILITY, '9' AS CLEANLINESS, '9' AS VENTILATION, '9' AS LIGHT, '9' AS WATERTM, '9' AS MFOOD, '9' AS BCONTROL,
'9' AS ACONTROL, '9' AS CHEMICAL, '' AS OUTDATE, 
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE
FROM
mbase_data.gcoffice, mbase_data.opd_visits, mbase_data.cid_hn, mbase_data.population
INNER JOIN mbase_data.towns ON population.TOWN_ID = towns.TOWN_ID
WHERE
opd_visits.REG_DATETIME > '2018.01.01 00:00' 
AND cid_hn.CID = population.CID AND opd_visits.HN = cid_hn.HN
AND opd_visits.is_cancel = 0 
AND opd_visits.visit_id NOT IN( SELECT visit_id FROM mbase_data.ipd_reg )ORDER BY opd_visits.REG_DATETIME
;