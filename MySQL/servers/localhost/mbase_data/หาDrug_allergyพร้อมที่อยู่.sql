SELECT DISTINCT a.CID,c.FNAME , c.LNAME ,a.UPD_DT AS ALLERGY_DATE,
CASE 
WHEN c.SEX = 1 THEN 'ชาย'
WHEN c.SEX = 2 THEN 'หญิง'
END AS SEX ,c.BIRTHDATE,FLOOR(DATEDIFF(NOW(),c.BIRTHDATE)/365.25)AS AGE
,c.TOWN_ID, b.DRUG_NAME, 
CASE
WHEN a.level = 1 THEN 'Unlikely'
WHEN a.level = 2 THEN 'Possible'
WHEN a.level = 3 THEN 'Probable'
WHEN a.level = 4 THEN 'Certain'
END AS LEVEL, a.ALLERGY_NOTE, c.HOME_ADR, d.TOWN_NAME AS 'MOOBAN', e.TOWN_NAME AS 'TUMBON', f.TOWN_NAME AS 'AMPOR'
FROM cid_drug_allergy a, drugs b, population c
INNER JOIN towns d ON d.town_id = c.town_id
INNER JOIN towns e ON CONCAT(left(c.town_id,6),'00') = e.town_id
INNER JOIN towns f ON CONCAT (left(c.town_id,4),'0000') = f.town_id
WHERE a.DRUG_ID = b.DRUG_ID
AND a.IS_CANCEL = 0
AND a.CID = c.CID
