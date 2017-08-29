SELECT a.VISIT_ID, a.HN ,FLOOR(DATEDIFF(NOW(),e.BIRTHDATE)/365.25) AS AGE, a.REG_DATETIME,d.CODE, c.STAFF_ID AS PROVIDER
FROM opd_visits a, cid_hn b, opd_operations c, icd9cm d ,population e
WHERE a.REG_DATETIME > '20170101'
AND a.IS_CANCEL = 0
AND a.HN = b.HN
AND b.CID = e.CID
AND c.VISIT_ID = a.VISIT_ID
AND c.icd9 = d.ICD9
AND d.CODE = '2338610'

