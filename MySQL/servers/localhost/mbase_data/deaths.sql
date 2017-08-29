SELECT a.CID,b.HN, a.DEATH_DATE, a.DEATH_DT,a.STAFF_ID , a.AN, a.CDEATH,a.CDEATH_A,a.CDEATH_B,a.CDEATH_C,a.CDEATH_D
FROM deaths a, cid_hn b
WHERE  a.cid = b.cid
AND a.is_cancel = 0
AND a.CID = b.CID
AND a.IS_HOSP = 1
AND a.CDEATH_A != ' '
AND a.DEATH_DATE BETWEEN '' AND  ''