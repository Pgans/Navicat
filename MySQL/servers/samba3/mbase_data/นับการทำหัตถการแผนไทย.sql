SELECT  c.STAFF_ID, a.FNAME, a.LNAME , COUNT(c.VISIT_ID) AS amount
FROM population a, staff b ,mb_thaimedoper c
WHERE   c.REG_DATE  BETWEEN  '2017-10-01' AND '2017-12-31'
AND a.CID = b.CID
AND b.STAFF_ID = c.STAFF_ID 
GROUP BY c.STAFF_ID ORDER BY amount DESC