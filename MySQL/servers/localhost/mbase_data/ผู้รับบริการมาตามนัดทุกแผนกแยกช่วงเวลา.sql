SELECT appoints.UNIT_ID,service_units.UNIT_NAME,COUNT(appoints.HN) AS Amount 
FROM appoints,service_units
WHERE AP_DATE BETWEEN '2014.10.01' AND '2015.04.30'
AND appoints.UNIT_ID = service_units.UNIT_ID
GROUP BY appoints.UNIT_ID ORDER BY appoints.UNIT_ID

