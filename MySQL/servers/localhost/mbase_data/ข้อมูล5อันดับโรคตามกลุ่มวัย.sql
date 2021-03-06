SELECT ICD10_TM,ICD_NAME, COUNT(ICD_NAME) AS AMOUNT
FROM mb_adrevisitdx1
WHERE REG_DATETIME BETWEEN '20151001' AND '20160930'
AND TOWN_ID BETWEEN '34140000' AND '34140112'
#AND AGE BETWEEN '15' AND '59'
AND AGE >= 60
GROUP BY ICD10_TM ORDER BY AMOUNT DESC
LIMIT 20;